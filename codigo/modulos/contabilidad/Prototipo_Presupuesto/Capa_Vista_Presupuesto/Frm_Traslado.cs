using System;
using System.Data;
using System.Windows.Forms;
using Capa_Modelo_Presupuesto;

namespace Capa_Vista_Presupuesto
{
    public partial class Frm_Traslado : Form
    {
        private int anioActivo;
        private int mesActivo;
        private int idUsuarioActual;

        // Controles según tu diseño
        private ComboBox Cmb_Origen => Cmb_1;
        private ComboBox Cmb_Destino => Cmb_2;
        private TextBox Txt_Monto => Txt_1;
        private TextBox Txt_Descripcion => Txt_2;

        // ==========================================================
        // CONSTRUCTOR UNIFORME
        // ==========================================================
        public Frm_Traslado(int anio, int mes, int idUsuario)
        {
            InitializeComponent();
            this.anioActivo = anio;
            this.mesActivo = mes;
            this.idUsuarioActual = idUsuario;
            CargarCuentas();
        }

        // ==========================================================
        // CARGA DE CUENTAS DISPONIBLES
        // ==========================================================
        private void CargarCuentas()
        {
            try
            {
                DataTable dtCuentas = Conexion.ObtenerCuentasPresupuestarias();

                if (dtCuentas != null && dtCuentas.Rows.Count > 0)
                {
                    // Usamos copias para que los dos ComboBox sean independientes
                    Cmb_Origen.DataSource = dtCuentas.Copy();
                    Cmb_Origen.DisplayMember = "NombreCompleto";
                    Cmb_Origen.ValueMember = "Pk_Codigo_Cuenta";
                    Cmb_Origen.SelectedIndex = -1;

                    Cmb_Destino.DataSource = dtCuentas.Copy();
                    Cmb_Destino.DisplayMember = "NombreCompleto";
                    Cmb_Destino.ValueMember = "Pk_Codigo_Cuenta";
                    Cmb_Destino.SelectedIndex = -1;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar cuentas para traslado: {ex.Message}", "Error de Carga");
            }
        }

        // ==========================================================
        // BOTÓN CONFIRMAR TRASLADO
        // ==========================================================
        private void Btn_1_Click(object sender, EventArgs e)
        {
            if (Cmb_Origen.SelectedValue == null || Cmb_Destino.SelectedValue == null)
            {
                MessageBox.Show("Seleccione cuenta origen y destino.", "Advertencia");
                return;
            }

            if (Cmb_Origen.SelectedValue.ToString() == Cmb_Destino.SelectedValue.ToString())
            {
                MessageBox.Show("La cuenta origen y destino no pueden ser la misma.", "Advertencia");
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

            string codigoOrigen = Cmb_Origen.SelectedValue.ToString();
            string codigoDestino = Cmb_Destino.SelectedValue.ToString();
            string descripcion = string.IsNullOrWhiteSpace(Txt_Descripcion.Text)
                ? $"Traslado presupuestario de Q{monto:N2} de {codigoOrigen} a {codigoDestino}"
                : Txt_Descripcion.Text.Trim();

            bool ok = Conexion.TrasladarMontoPresupuestario(
                codigoOrigen,
                codigoDestino,
                anioActivo,
                mesActivo,
                monto,
                descripcion,
                idUsuarioActual);

            if (ok)
            {
                MessageBox.Show($"Traslado de Q{monto:N2} realizado con éxito.", "Registro Completo");
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            else
            {
                MessageBox.Show("ERROR: No se pudo realizar el traslado. Verifique saldo en la cuenta origen.", "Error de Registro");
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
