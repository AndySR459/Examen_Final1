using System;
using System.Collections.Generic;
using System.Linq;

//Usar componentes delmodelo MVC dentro de la Web
using System.Web;
using System.Web.Mvc;

/// para poder conectarme al SQL
using System.Data;
using System.Data.SqlClient;

namespace ExamenFinal.Models
{
    public class Store
    {
        public int store_id { get; set; }
        public string store_name { get; set; }
    }
}