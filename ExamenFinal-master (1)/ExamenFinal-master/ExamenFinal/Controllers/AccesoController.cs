using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Mvc;

/// para poder conectarme al SQL
using System.Data;
using System.Data.SqlClient;

//otras librerias

using System.Text;
using System.Security.Cryptography;
using System.Web.UI.WebControls;
using ExamenFinal.Models;
using System.Configuration;

namespace ExamenFinal.Controllers
{
    public class AccesoController : Controller
    {
        public ActionResult Autenticar()
        {

            return View();
        }

        public ActionResult RegistroStaff ()
        {
            var viewModel = new SuperClase();

            // Llenar la lista de stores
            viewModel.Stores = ObtenerTiendas();

            return View(viewModel);
        }

        //POST

        [HttpPost]
        public ActionResult Autenticar( SystemUser model)
        {
            string mensaje = "";
            int idFlag = 0;
            try
            {
                using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_AuthenticateUser", cn);
                    cmd.Parameters.AddWithValue("usuario", model.usuario);
                    cmd.Parameters.AddWithValue("clave", model.pass);
                    cmd.Parameters.Add("idStaff", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("idFlag", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("mensaje", SqlDbType.VarChar, 255).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    model.staff_id = Convert.ToInt32(cmd.Parameters["idStaff"].Value);
                    mensaje = cmd.Parameters["mensaje"].Value.ToString();
                    idFlag = Convert.ToInt32(cmd.Parameters["idFlag"].Value);
                    cn.Close();
                }

                //TempData["Mensaje"] = mensaje;

                if (idFlag == 0)
                {
                    //
                    return RedirectToAction("Autenticar", "Acceso");
                }
                else if (idFlag == 1)
                {
                    return RedirectToAction("Orden", "Orden");
                }
                else if (idFlag == 2)
                {
                    return RedirectToAction("Autenticar", "Acceso");
                }
                else
                {
                    return View();

                }


            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return View();
            }
        }



        ///// Funciones
        private List<Store> ObtenerTiendas()
        {
            List<Store> stores = new List<Store>();

            // Conexión a la base de datos
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetStoreList", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();
                SqlDataReader drs = cmd.ExecuteReader();

                while (drs.Read())
                {
                    Store store = new Store
                    {
                        store_id = Convert.ToInt32(drs["store_id"]),
                        store_name = drs["store_name"].ToString()
                    };
                    stores.Add(store);
                }

                cn.Close();
            }


            // Asegúrate de retornar la lista a la vista
            return stores;
        }

    }
}