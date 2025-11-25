using System;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Modelo_Presupuesto
{
    public class Conexion
    {
        private static string connectionString = "Dsn=PresupuestosMySQL;Uid=root;Pwd=Acces0F3R;";

        public static OdbcConnection GetConnection()
        {
            return new OdbcConnection(connectionString);
        }

        public static bool ProbarConexion()
        {
            try
            {
                using (OdbcConnection conn = GetConnection())
                {
                    conn.Open();
                    OdbcCommand cmd = new OdbcCommand("SELECT 1", conn);
                    cmd.ExecuteScalar();
                    return true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"🚨 ERROR CONEXIÓN ODBC: {ex.Message}");
                return false;
            }
        }

        // ... (El resto de EjecutarComando, EjecutarConsulta, EjecutarEscalar, EjecutarTransaccion se mantiene igual) ...

        public static DataTable EjecutarConsulta(string query)
        {
            DataTable dt = new DataTable();
            using (OdbcConnection conn = GetConnection())
            {
                try
                {
                    conn.Open();
                    OdbcCommand cmd = new OdbcCommand(query, conn);
                    OdbcDataAdapter adapter = new OdbcDataAdapter(cmd);
                    adapter.Fill(dt);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"🚨 ERROR CONSULTA: {ex.Message}\nQuery: {query}");
                    return new DataTable();
                }
            }
            return dt;
        }

        public static object EjecutarEscalar(string query)
        {
            using (OdbcConnection conn = GetConnection())
            {
                try
                {
                    conn.Open();
                    OdbcCommand cmd = new OdbcCommand(query, conn);
                    object result = cmd.ExecuteScalar();
                    return result == DBNull.Value ? null : result;
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"🚨 ERROR ESCALAR: {ex.Message}\nQuery: {query}");
                    return null;
                }
            }
        }

        public static bool EjecutarTransaccion(List<string> queries)
        {
            using (OdbcConnection conn = GetConnection())
            {
                conn.Open();
                OdbcTransaction transaction = conn.BeginTransaction();
                OdbcCommand cmd = new OdbcCommand();
                cmd.Connection = conn;
                cmd.Transaction = transaction;
                string ultimaQuery = "";

                try
                {
                    foreach (string query in queries)
                    {
                        cmd.CommandText = query;
                        ultimaQuery = query;
                        cmd.ExecuteNonQuery();
                    }

                    transaction.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    System.Diagnostics.Debug.WriteLine($"\n\n=======================================================");
                    System.Diagnostics.Debug.WriteLine($"🚨 ERROR CRÍTICO DE TRANSACCIÓN (MySQL): {ex.Message}");
                    System.Diagnostics.Debug.WriteLine($"QUERY FALLIDA: {ultimaQuery}");
                    System.Diagnostics.Debug.WriteLine($"=======================================================\n");

                    return false;
                }
            }
        }

        // ==========================================================
        // MÉTODOS DE LÓGICA DE NEGOCIO (Presupuesto)
        // ==========================================================

        public static DataTable ObtenerCuentasPresupuestarias()
        {
            string query = @"
                SELECT 
                    Pk_Codigo_Cuenta, 
                    CONCAT(Pk_Codigo_Cuenta, ' - ', Cmp_CtaNombre) AS NombreCompleto
                FROM Tbl_Catalogo_Cuentas 
                WHERE Cmp_CtaTipo = 1 AND 
                    (Pk_Codigo_Cuenta LIKE '5.%' OR Pk_Codigo_Cuenta LIKE '6.%')
                ORDER BY Pk_Codigo_Cuenta";
            return EjecutarConsulta(query);
        }

        // MÉTODO 1: REGISTRAR PARTIDA INICIAL (6 parámetros)
        public static bool RegistrarPartidaInicial(
            string codigoCuenta, int anio, int mes, decimal monto, string descripcion, int idUsuario) // <-- ¡6 Parámetros!
        {
            List<string> queries = new List<string>();
            string montoFormateado = monto.ToString(CultureInfo.InvariantCulture);
            string fechaActual = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            string selectQuery = $@"
                SELECT Fk_Codigo_Cuenta 
                FROM Tbl_Presupuesto_Periodo 
                WHERE Fk_Codigo_Cuenta = '{codigoCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes}";

            object idExistente = EjecutarEscalar(selectQuery);

            if (idExistente != null)
            {
                string updateQuery = $@"
                    UPDATE Tbl_Presupuesto_Periodo 
                    SET Cmp_MontoInicial = Cmp_MontoInicial + {montoFormateado},
                        Cmp_MontoDisponible = Cmp_MontoDisponible + {montoFormateado}
                    WHERE Fk_Codigo_Cuenta = '{codigoCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes};";
                queries.Add(updateQuery);
            }
            else
            {
                string insertQuery = $@"
                    INSERT INTO Tbl_Presupuesto_Periodo 
                    (Fk_Codigo_Cuenta, Cmp_Anio, Cmp_Mes, Cmp_MontoInicial, Cmp_MontoEjecutado, Cmp_MontoDisponible) 
                    VALUES ('{codigoCuenta}', {anio}, {mes}, {montoFormateado}, 0.00, {montoFormateado});";
                queries.Add(insertQuery);
            }

            // Registrar el movimiento con Fk_IdUsuario
            string insertMovimientoQuery = $@"
                INSERT INTO Tbl_Presupuesto_Movimientos 
                (Cmp_TipoMovimiento, Fk_Codigo_Cuenta_Origen, Fk_Codigo_Cuenta_Destino, Cmp_Monto, Cmp_Descripcion, Cmp_Anio, Cmp_Mes, Cmp_FechaRegistro, Fk_IdUsuario) 
                VALUES ('Partida_Inicial', NULL, '{codigoCuenta}', {montoFormateado}, '{descripcion}', {anio}, {mes}, '{fechaActual}', {idUsuario});";
            queries.Add(insertMovimientoQuery);

            return EjecutarTransaccion(queries);
        }

        // MÉTODO 2: REGISTRAR EJECUCIÓN PRESUPUESTARIA (6 parámetros)
        public static bool RegistrarEjecucionPresupuestaria(
            string codigoCuenta, int anio, int mes, decimal monto, string descripcion, int idUsuario) // <-- ¡6 Parámetros!
        {
            List<string> queries = new List<string>();
            string montoFormateado = monto.ToString(CultureInfo.InvariantCulture);
            string fechaActual = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            // VALIDACIÓN: Verificar saldo (lógica en Capa Modelo)
            string selectSaldo = $@"
                SELECT Cmp_MontoDisponible 
                FROM Tbl_Presupuesto_Periodo 
                WHERE Fk_Codigo_Cuenta = '{codigoCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes}";

            object saldoObj = EjecutarEscalar(selectSaldo);

            if (saldoObj == null || Convert.ToDecimal(saldoObj) < monto)
            {
                return false;
            }

            // Actualiza Tbl_Presupuesto_Periodo (SUMA Ejecutado, RESTA Disponible)
            string sql_periodo = $@"
                UPDATE Tbl_Presupuesto_Periodo 
                SET Cmp_MontoEjecutado = Cmp_MontoEjecutado + {montoFormateado},
                    Cmp_MontoDisponible = Cmp_MontoDisponible - {montoFormateado}
                WHERE Fk_Codigo_Cuenta = '{codigoCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes};";
            queries.Add(sql_periodo);

            // Registrar el movimiento con Fk_IdUsuario
            string sql_movimiento = $@"
                INSERT INTO Tbl_Presupuesto_Movimientos 
                (Fk_Codigo_Cuenta_Origen, Fk_Codigo_Cuenta_Destino, Cmp_TipoMovimiento, Cmp_Monto, Cmp_Descripcion, Cmp_Anio, Cmp_Mes, Cmp_FechaRegistro, Fk_IdUsuario) 
                VALUES ('{codigoCuenta}', '{codigoCuenta}', 'Ejecucion', {montoFormateado}, '{descripcion}', {anio}, {mes}, '{fechaActual}', {idUsuario});";
            queries.Add(sql_movimiento);

            return EjecutarTransaccion(queries);
        }

        // MÉTODO 3: TRASLADAR MONTO PRESUPUESTARIO (7 parámetros)
        public static bool TrasladarMontoPresupuestario(
            string origenCuenta, string destinoCuenta, int anio, int mes, decimal monto, string descripcion, int idUsuario) // <-- ¡7 Parámetros!
        {
            List<string> queries = new List<string>();
            string montoFormateado = monto.ToString(CultureInfo.InvariantCulture);
            string fechaActual = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            // VALIDACIÓN: Verificar saldo de ORIGEN
            string selectSaldoOrigen = $@"
                SELECT Cmp_MontoDisponible 
                FROM Tbl_Presupuesto_Periodo 
                WHERE Fk_Codigo_Cuenta = '{origenCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes}";
            object saldoObj = EjecutarEscalar(selectSaldoOrigen);

            if (saldoObj == null || Convert.ToDecimal(saldoObj) < monto)
            {
                return false;
            }

            // RESTAR el monto del saldo DISPONIBLE de ORIGEN
            string queryRestar = $@"
                UPDATE Tbl_Presupuesto_Periodo 
                SET Cmp_MontoDisponible = Cmp_MontoDisponible - {montoFormateado}
                WHERE Fk_Codigo_Cuenta = '{origenCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes}";
            queries.Add(queryRestar);

            // SUMAR/INSERTAR en la cuenta de DESTINO
            string selectDestino = $@"
                SELECT Fk_Codigo_Cuenta 
                FROM Tbl_Presupuesto_Periodo 
                WHERE Fk_Codigo_Cuenta = '{destinoCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes}";
            object idDestinoExistente = EjecutarEscalar(selectDestino);

            if (idDestinoExistente != null)
            {
                string querySumar = $@"
                    UPDATE Tbl_Presupuesto_Periodo 
                    SET Cmp_MontoDisponible = Cmp_MontoDisponible + {montoFormateado} 
                    WHERE Fk_Codigo_Cuenta = '{destinoCuenta}' AND Cmp_Anio = {anio} AND Cmp_Mes = {mes}";
                queries.Add(querySumar);
            }
            else
            {
                string queryInsertar = $@"
                    INSERT INTO Tbl_Presupuesto_Periodo 
                    (Fk_Codigo_Cuenta, Cmp_Anio, Cmp_Mes, Cmp_MontoInicial, Cmp_MontoEjecutado, Cmp_MontoDisponible) 
                    VALUES ('{destinoCuenta}', {anio}, {mes}, 0.00, 0.00, {montoFormateado})";
                queries.Add(queryInsertar);
            }

            // Registrar el movimiento con Fk_IdUsuario
            string insertMovimientoQuery = $@"
                INSERT INTO Tbl_Presupuesto_Movimientos 
                (Fk_Codigo_Cuenta_Origen, Fk_Codigo_Cuenta_Destino, Cmp_TipoMovimiento, Cmp_Monto, Cmp_Descripcion, Cmp_Anio, Cmp_Mes, Cmp_FechaRegistro, Fk_IdUsuario) 
                VALUES ('{origenCuenta}', '{destinoCuenta}', 'Traslado', {montoFormateado}, '{descripcion}', {anio}, {mes}, '{fechaActual}', {idUsuario});";
            queries.Add(insertMovimientoQuery);

            return EjecutarTransaccion(queries);
        }
    }
}