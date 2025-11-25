using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using Capa_Modelo_Presupuesto;

namespace Capa_Vista_Presupuesto
{
    public partial class Frm_Principal : Form
    {
        private int anioActivo;
        private int mesActivo;
        private int idUsuarioActual = 1; // Ajustar según login real

        public Frm_Principal()
        {
            InitializeComponent();
        }

        // ==========================================================
        // BOTONES PRINCIPALES
        // ==========================================================
        private void Btn_Salir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Btn_Traslado_Click(object sender, EventArgs e)
        {
            if (!ValidarPeriodoActivo("No se puede realizar traslado.")) return;

            using (Frm_Traslado formularioTraslado = new Frm_Traslado(anioActivo, mesActivo, idUsuarioActual))
            {
                if (formularioTraslado.ShowDialog() == DialogResult.OK)
                {
                    ActualizarDataGrids();
                    ActualizarPresupuestoTotal();
                }
            }
        }

        private void Btn_Partidas_Click(object sender, EventArgs e)
        {
            if (!ValidarPeriodoActivo("No se puede registrar la partida inicial.")) return;

            using (Frm_Partidas formularioPartidas = new Frm_Partidas(anioActivo, mesActivo, idUsuarioActual))
            {
                if (formularioPartidas.ShowDialog() == DialogResult.OK)
                {
                    ActualizarDataGrids();
                    ActualizarPresupuestoTotal();
                }
            }
        }

        private void Btn_Presupuesto_Click(object sender, EventArgs e)
        {
            if (!ValidarPeriodoActivo("No se puede registrar la ejecución.")) return;

            using (Frm_Ejecucion formularioEjecucion = new Frm_Ejecucion(anioActivo, mesActivo, idUsuarioActual))
            {
                if (formularioEjecucion.ShowDialog() == DialogResult.OK)
                {
                    ActualizarDataGrids();
                    ActualizarPresupuestoTotal();
                }
            }
        }

        // ==========================================================
        // VALIDACIONES Y CARGA INICIAL
        // ==========================================================
        private bool ValidarPeriodoActivo(string contexto)
        {
            if (anioActivo == 0 || mesActivo == 0)
            {
                MessageBox.Show($"No hay un período contable activo configurado. {contexto}",
                                "Error de Configuración", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }

        private void Frm_Principal_Load_1(object sender, EventArgs e)
        {
            if (Conexion.ProbarConexion())
            {
                CargarPeriodoActivo();
                ActualizarDataGrids();
                ActualizarPresupuestoTotal();

                Dgv_1.CellFormatting += Dgv_1_CellFormatting;
                Dgv_2.CellFormatting += Dgv_2_CellFormatting;
                Dgv_3.CellFormatting += Dgv_3_CellFormatting;
            }
            else
            {
                MessageBox.Show("Error de conexión a la base de datos");
            }
        }

        private void CargarPeriodoActivo()
        {
            try
            {
                // MySQL usa LIMIT, SQL Server usa TOP 1
                string queryPeriodo = "SELECT Cmp_Anio, Cmp_Mes FROM Tbl_PeriodosContables WHERE Cmp_Estado = 1 LIMIT 1";
                DataTable dtPeriodo = Conexion.EjecutarConsulta(queryPeriodo);

                if (dtPeriodo != null && dtPeriodo.Rows.Count > 0)
                {
                    anioActivo = Convert.ToInt32(dtPeriodo.Rows[0]["Cmp_Anio"]);
                    mesActivo = Convert.ToInt32(dtPeriodo.Rows[0]["Cmp_Mes"]);
                }
                else
                {
                    anioActivo = DateTime.Now.Year;
                    mesActivo = DateTime.Now.Month;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar el período activo: {ex.Message}");
            }
        }

        // ==========================================================
        // ACTUALIZACIÓN DE GRIDS Y KPI
        // ==========================================================
        private void ActualizarDataGrids()
        {
            CargarMovimientos();
            CargarResumenAreas();
            CargarEstadisticas();
        }

        private void TabControl_Principal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (sender is TabControl tbc && tbc.SelectedIndex != -1)
            {
                switch (tbc.SelectedIndex)
                {
                    case 0: CargarMovimientos(); break;
                    case 1: CargarResumenAreas(); break;
                    case 2: CargarEstadisticas(); break;
                }
            }
        }

        private void ActualizarPresupuestoTotal()
        {
            if (anioActivo == 0) return;
            try
            {
                string queryKPI = $@"
                    SELECT
                        COALESCE(SUM(PP.Cmp_MontoInicial), 0) AS Presupuestado, 
                        COALESCE(SUM(PP.Cmp_MontoEjecutado), 0) AS Ejecutado,
                        COALESCE(SUM(PP.Cmp_MontoDisponible), 0) AS Disponible
                    FROM Tbl_Presupuesto_Periodo PP
                    WHERE PP.Cmp_Anio = {anioActivo} AND PP.Cmp_Mes = {mesActivo};";

                DataTable dtKPI = Conexion.EjecutarConsulta(queryKPI);

                if (dtKPI != null && dtKPI.Rows.Count > 0)
                {
                    decimal presupuestado = Convert.ToDecimal(dtKPI.Rows[0]["Presupuestado"]);
                    decimal ejecutado = Convert.ToDecimal(dtKPI.Rows[0]["Ejecutado"]);
                    decimal disponible = Convert.ToDecimal(dtKPI.Rows[0]["Disponible"]);

                    Lbl_TotalPresupuestado.Text = "Q" + presupuestado.ToString("N2");
                    Lbl_TotalEjecutado.Text = "Q" + ejecutado.ToString("N2");
                    Lbl_TotalDisponible.Text = "Q" + disponible.ToString("N2");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al calcular KPIs de presupuesto: {ex.Message}", "Error de Base de Datos");
            }
        }

        // ==========================================================
        // CARGA DE DATOS
        // ==========================================================
        private void CargarMovimientos()
        {
            if (anioActivo == 0) return;
            try
            {
                string queryEjecucion = $@"
                    SELECT
                        PP.Fk_Codigo_Cuenta AS 'Código',
                        CC.Cmp_CtaNombre AS 'Cuenta Contable',
                        PP.Cmp_MontoInicial AS 'Presupuestado', 
                        PP.Cmp_MontoEjecutado AS 'Ejecutado',
                        PP.Cmp_MontoDisponible AS 'Disponible', 
                        (PP.Cmp_MontoEjecutado / NULLIF(PP.Cmp_MontoInicial, 0)) * 100 AS 'Porc_Ejecucion' 
                    FROM Tbl_Presupuesto_Periodo PP
                    INNER JOIN Tbl_Catalogo_Cuentas CC ON PP.Fk_Codigo_Cuenta = CC.Pk_Codigo_Cuenta
                    WHERE
                        PP.Cmp_Anio = {anioActivo} AND PP.Cmp_Mes = {mesActivo}
                        AND (PP.Fk_Codigo_Cuenta LIKE '5.%' OR PP.Fk_Codigo_Cuenta LIKE '6.%') 
                    ORDER BY PP.Fk_Codigo_Cuenta;";

                DataTable dt = Conexion.EjecutarConsulta(queryEjecucion);
                Dgv_1.DataSource = dt;
                if (Dgv_1.Columns.Contains("Porc_Ejecucion")) Dgv_1.Columns["Porc_Ejecucion"].Visible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar ejecución presupuestaria: {ex.Message}", "Error de Datos");
            }
        }

        private void CargarResumenAreas()
        {
            if (anioActivo == 0) return;
            try
            {
                string queryResumen = $@"
                    SELECT
                        SUBSTRING_INDEX(PP.Fk_Codigo_Cuenta, '.', 1) AS 'Cód. Mayor',
                        MAX(CC_Mayor.Cmp_CtaNombre) AS 'Cuenta Mayor',
                        COALESCE(SUM(PP.Cmp_MontoInicial), 0) AS 'Presupuestado',
                        COALESCE(SUM(PP.Cmp_MontoEjecutado), 0) AS 'Ejecutado',
                        COALESCE(SUM(PP.Cmp_MontoDisponible), 0) AS 'Saldo Disponible'
                    FROM Tbl_Presupuesto_Periodo PP
                    INNER JOIN Tbl_Catalogo_Cuentas CC_Mayor 
                        ON SUBSTRING_INDEX(PP.Fk_Codigo_Cuenta, '.', 1) = CC_Mayor.Pk_Codigo_Cuenta
                    WHERE
                        PP.Cmp_Anio = {anioActivo} AND PP.Cmp_Mes = {mesActivo}
                        AND CC_Mayor.Pk_Codigo_Cuenta IN ('5', '6')
                    GROUP BY SUBSTRING_INDEX(PP.Fk_Codigo_Cuenta, '.', 1)
                    ORDER BY `Cód. Mayor`;";

                DataTable dt = Conexion.EjecutarConsulta(queryResumen);
                Dgv_2.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar resumen de cuentas: {ex.Message}");
            }
        }

        private void CargarEstadisticas()
        {
            if (anioActivo == 0) return;
            try
            {
                string queryEstadisticas = $@"
                    SELECT
                        CC_Mayor.Cmp_CtaNombre AS 'Concepto',
                        SUM(PP.Cmp_MontoInicial) AS 'Presupuesto Total',
                        COALESCE(SUM(PP.Cmp_MontoEjecutado), 0) AS 'Ejecución Total'
                    FROM Tbl_Presupuesto_Periodo PP
                    INNER JOIN Tbl_Catalogo_Cuentas CC_Mayor 
                        ON SUBSTRING_INDEX(PP.Fk_Codigo_Cuenta, '.', 1) = CC_Mayor.Pk_Codigo_Cuenta
                    WHERE
                        PP.Cmp_Anio = {anioActivo} AND PP.Cmp_Mes = {mesActivo}
                        AND CC_Mayor.Pk_Codigo_Cuenta IN ('5', '6')
                    GROUP BY CC_Mayor.Cmp_CtaNombre;";

                DataTable dt = Conexion.EjecutarConsulta(queryEstadisticas);
                Dgv_3.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar estadísticas: {ex.Message}");
            }
        }

        // ==========================================================
        // FORMATO VISUAL DE GRIDS
        // ==========================================================
        private void Dgv_1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (Dgv_1.Columns[e.ColumnIndex].Name == "Disponible" && e.Value != null)
            {
                decimal disponible = Convert.ToDecimal(e.Value);
                if (disponible < 0)
                {
                    e.CellStyle.ForeColor = Color.Red;
                    e.CellStyle.Font = new Font(e.CellStyle.Font, FontStyle.Bold);
                }
            }
        }

        private void Dgv_2_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (Dgv_2.Columns[e.ColumnIndex].Name == "Saldo Disponible" && e.Value != null)
            {
                decimal saldo = Convert.ToDecimal(e.Value);
                if (saldo < 0)
                {
                    e.CellStyle.ForeColor = Color.Red;
                    e.CellStyle.Font = new Font(e.CellStyle.Font, FontStyle.Bold);
                }
            }
        }

        private void Dgv_3_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (Dgv_3.Columns[e.ColumnIndex].Name == "Ejecución Total" && e.Value != null)
            {
                decimal ejecucion = Convert.ToDecimal(e.Value);
                if (ejecucion > 0)
                {
                    e.CellStyle.ForeColor = Color.Green;
                }
            }
        }
    }
}
