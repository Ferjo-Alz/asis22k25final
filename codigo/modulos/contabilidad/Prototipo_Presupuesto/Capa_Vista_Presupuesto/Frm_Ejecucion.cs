using System;
using System.Data;
using System.Windows.Forms;
using Capa_Modelo_Presupuesto;

namespace Capa_Vista_Presupuesto
{
    public partial class Frm_Ejecucion : Form
    {
        private int anioActivo;
        private int mesActivo;
        private int idUsuarioActual;

        // Controles según tu diseño
        private ComboBox Cmb_Cuenta => Cmb_1;
        private TextBox Txt_Monto => Txt_1;
        private TextBox Txt_Descripcion => Txt_2;

        // ==========================================================
        // CONSTRUCTOR UNIFORME
        // ==========================================================
        public Frm_Ejecucion(int anio, int mes, int idUsuario)
        {
            InitializeComponent();
            this.anioActivo = anio;
            this.mesActivo = mes;
            this.idUsuarioActual = idUsuario;
            CargarCuentas();
        }

        // ==========================================================
        // CARGA DE CUENTAS CON SALDO DISPONIBLE
        // ==========================================================
        private void CargarCuentas()
        {
            try
            {
                string query = $@"
                    SELECT 
                        PP.Fk_Codigo_Cuenta,
                        CONCAT(PP.Fk_Codigo_Cuenta, ' - ', CC.Cmp_CtaNombre, ' (Disponible: ', PP.Cmp_MontoDisponible, ')') AS NombreCompleto
                    FROM Tbl_Presupuesto_Periodo PP
                    INNER JOIN Tbl_Catalogo_Cuentas CC ON PP.Fk_Codigo_Cuenta = CC.Pk_Codigo_Cuenta
                    WHERE PP.Cmp_Anio = {anioActivo} AND PP.Cmp_Mes = {mesActivo}
                          AND PP.Cmp_MontoDisponible > 0
                          AND (PP.Fk_Codigo_Cuenta LIKE '5.%' OR PP.Fk_Codigo_Cuenta LIKE '6.%')
                    ORDER BY PP.Fk_Codigo_Cuenta;";

                DataTable dt = Conexion.EjecutarConsulta(query);

                if (dt != null && dt.Rows.Count > 0)
                {
                    Cmb_Cuenta.DataSource = dt;
                    Cmb_Cuenta.DisplayMember = "NombreCompleto";
                    Cmb_Cuenta.ValueMember = "Fk_Codigo_Cuenta";
                    Cmb_Cuenta.SelectedIndex = -1;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar cuentas: {ex.Message}", "Error de Carga");
            }
        }

        // ==========================================================
        // BOTÓN CONFIRMAR EJECUCIÓN
        // ==========================================================
        private void Btn_1_Click(object sender, EventArgs e)
        {
            if (Cmb_Cuenta.SelectedValue == null)
            {
                MessageBox.Show("Seleccione una cuenta con saldo disponible.", "Advertencia");
                return;
            }

            if (string.IsNullOrWhiteSpace(Txt_Monto.Text))
            {
                MessageBox.Show("Complete el campo Monto.", "Advertencia");
                return;
            }

            if (!decimal.TryParse(Txt_Monto.Text, out decimal monto) || monto <= 0)
            {
                MessageBox.Show("Ingrese un monto válido y positivo.", "Advertencia");
                return;
            }

            string codigoCuenta = Cmb_Cuenta.SelectedValue.ToString();
            string descripcion = string.IsNullOrWhiteSpace(Txt_Descripcion.Text)
                ? $"Ejecución presupuestaria de Q{monto:N2}"
                : Txt_Descripcion.Text.Trim();

            bool ok = Conexion.RegistrarEjecucionPresupuestaria(
                codigoCuenta,
                anioActivo,
                mesActivo,
                monto,
                descripcion,
                idUsuarioActual);

            if (ok)
            {
                MessageBox.Show($"Gasto de Q{monto:N2} registrado con éxito.", "Registro Completo");
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            else
            {
                MessageBox.Show("ERROR: No se pudo registrar la ejecución. Revise el saldo disponible.", "Error de Registro");
            }
        }

        // ==========================================================
        // BOTÓN CANCELAR
        // ==========================================================
        private void Btn_2_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }
    }
}
