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
    public class OrdenController : Controller
    {
        public ActionResult Orden()
        {
            var viewModel = new SuperClase();

            // Llenar la lista de stores
            viewModel.Customers = ObtenerClientes();
            viewModel.Stores = ObtenerTiendas();

            return View(viewModel);

        }

        ///// Funciones
        ///
        private List<Customer> ObtenerClientes()
        {
            List<Customer> customers = new List<Customer>();

            // Conexión a la base de datos
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetCustomers", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();
                SqlDataReader drs = cmd.ExecuteReader();

                while (drs.Read())
                {
                    Customer customer = new Customer
                    {
                        customer_id = Convert.ToInt32(drs["customer_id"]),
                        first_name = drs["first_name"].ToString(),
                        last_name = drs["last_name"].ToString(),
                        phone = drs["phone"].ToString(),
                        email = drs["email"].ToString(),
                        street = drs["street"].ToString(),
                        city = drs["city"].ToString(),
                        state = drs["state"].ToString(),
                        zip_code = drs["zip_code"].ToString()
                    };
                    customers.Add(customer);
                }

                cn.Close();
            }

            // Retornar la lista de clientes
            return customers;
        }
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

        public JsonResult GetStaffByStore(int storeId)
        {
            List<Staff> staffMembers = new List<Staff>();

            string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spGetStaffByStore", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@store_id", storeId);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        Staff staff = new Staff
                        {
                            staff_id = Convert.ToInt32(dr["staff_id"]),
                            first_name = dr["first_name"].ToString(),
                            last_name = dr["last_name"].ToString(),
                            email = dr["email"].ToString(),
                            phone = dr["phone"].ToString(),
                            active = Convert.ToBoolean(dr["active"]),
                            store_id = Convert.ToInt32(dr["store_id"]),
                            manager_id = dr["manager_id"] != DBNull.Value ? Convert.ToInt32(dr["manager_id"]) : (int?)null
                        };
                        staffMembers.Add(staff);
                    }

                    con.Close();
                }
            }

            return Json(staffMembers, JsonRequestBehavior.AllowGet);
        }


        public ActionResult GetProductById(int id)
        {
            Product product = null;
            string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("spGetProductById", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@product_id", id);

                    cn.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            product = new Product
                            {
                                ProductId = Convert.ToInt32(dr["product_id"]),
                                ProductName = dr["product_name"].ToString(),
                                BrandId = Convert.ToInt32(dr["brand_id"]),
                                CategoryId = Convert.ToInt32(dr["category_id"]),
                                ModelYear = Convert.ToInt16(dr["model_year"]),
                                ListPrice = Convert.ToDecimal(dr["list_price"])
                            };
                        }
                    }
                }
            }

            if (product == null)
            {
                return HttpNotFound();
            }

            return View(product);
        }

    }
}