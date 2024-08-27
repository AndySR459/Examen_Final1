using ExamenFinal.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenFinal.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }

        // GET: Customer/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customer/Create
        [HttpPost]
        public ActionResult Create(Customer model)
        {
            if (ModelState.IsValid)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("spRegistrarCliente", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        // Asignación de parámetros
                        cmd.Parameters.AddWithValue("@first_name", model.first_name);
                        cmd.Parameters.AddWithValue("@last_name", model.last_name);
                        cmd.Parameters.AddWithValue("@phone", model.phone);
                        cmd.Parameters.AddWithValue("@email", model.email);
                        cmd.Parameters.AddWithValue("@street", model.street);
                        cmd.Parameters.AddWithValue("@city", model.city);
                        cmd.Parameters.AddWithValue("@state", model.state);
                        cmd.Parameters.AddWithValue("@zip_code", model.zip_code);

                        // Abrir la conexión y ejecutar el stored procedure
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                // Redirigir a la acción Index o mostrar un mensaje de éxito
                return RedirectToAction("Orden", "Orden");
            }

            // Si no es válido, retornar la vista de nuevo con los errores
            return View(model);
        }
    }
}