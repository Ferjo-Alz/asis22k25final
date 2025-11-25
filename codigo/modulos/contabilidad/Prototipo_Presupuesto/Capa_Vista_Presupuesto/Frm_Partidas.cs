using System;
using System.Data;
using System.Windows.Forms;
using Capa_Modelo_Presupuesto;

namespace Capa_Vista_Presupuesto
{
    public partial class Frm_Partidas : Form
    {
        // Variables para el período activo y usuario
        private int anioActivo;
        private int mesActivo;
        private int idUsuarioActual;

        // Mapeo de controles según tu diseño
        private ComboBox Cmb_Cuenta => Cmb_1;
        private TextBox Txt_Monto => Txt_1;
        private TextBox Txt_Descripcion => Txt_2;

        // ==========================================================
        // CONSTRUCTOR CORREGIDO
        // ==========================================================
        public Frm_Partidas(int anio, int mes, int idUsuario)
        {
            InitializeComponent();
            this.anioActivo = anio;
            this.mesActivo = mes;
            this.idUsuarioActual = idUsuario;
            CargarCuentas();
        }

        // ==========================================================
        // CARGA DE CUENTAS DEL CATÁLOGO
        // ==========================================================
        private void CargarCuentas()
        {
            try
            {
                Cmb_Cuenta.DataSource = null;
                Cmb_Cuenta.Items.Clear();

                string queryCuentas = @"
                    SELECT 
                        Pk_Codigo_Cuenta,
                        CONCAT(Pk_Codigo_Cuenta, ' - ', Cmp_CtaNombre) AS NombreCompleto
                    FROM Tbl_Catalogo_Cuentas
                    WHERE Pk_Codigo_Cuenta LIKE '5.%' OR Pk_Codigo_Cuenta LIKE '6.%' 
                    ORDER BY Pk_Codigo_Cuenta;";

                DataTable dtCuentas = Conexion.EjecutarConsulta(queryCuentas);

                if (dtCuentas != null && dtCuentas.Rows.Count > 0)
                {
                    Cmb_Cuenta.DisplayMember = "NombreCompleto";
                    Cmb_Cuenta.ValueMember = "Pk_Codigo_Cuenta";
                    Cmb_Cuenta.DataSource = dtCuentas;
                    Cmb_Cuenta.SelectedIndex = -1;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar cuentas contables: {ex.Message}");
            }
        }

        // ==========================================================
        // EVENTOS DE BOTONES
        // ==========================================================
        private void Btn_2_Click(object sender, EventArgs e) // Cancelar
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }

        private void Btn_1_Click(object sender, EventArgs e) // Confirmar
        {
            // Validaciones
            if (Cmb_Cuenta.SelectedValue == null)
            {
                MessageBox.Show("Seleccione una cuenta del catálogo.", "Advertencia");
                return;
            }

            if (string.IsNullOrWhiteSpace(Txt_Monto.Text))
            {
                MessageBox.Show("Complete el campo Monto.", "Advertencia");
                return;
            }

            if (!decimal.TryParse(Txt_Monto.Text, out decimal monto) || monto <= 0)
            {
                MessageBox.Show("Ingrese una cantidad válida y positiva.", "Advertencia");
                return;
            }

            string codigoCuenta = Cmb_Cuenta.SelectedValue.ToString();
            string descripcion = string.IsNullOrWhiteSpace(Txt_Descripcion.Text)
                                 ? "Asignación de partida inicial."
                                 : Txt_Descripcion.Text.Trim();

            // Registro en base de datos con usuario
            bool ok = Conexion.RegistrarPartidaInicial(codigoCuenta, anioActivo, mesActivo, monto, descripcion, idUsuarioActual);

            if (ok)
            {
                MessageBox.Show("Partida presupuestaria inicial registrada con éxito.", "Registro Completo");
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            else
            {
                MessageBox.Show("ERROR: No se pudo registrar la partida inicial. Verifique la conexión y el período.", "Error de Registro");
            }
        }
    }
}
