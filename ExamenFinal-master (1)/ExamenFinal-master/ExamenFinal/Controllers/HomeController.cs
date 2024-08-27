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
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}