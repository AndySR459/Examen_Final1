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
    public class SystemUser
    {
        public int id_user { get; set; }
        public string usuario { get; set; }
        public string pass { get; set; }
        public int staff_id { get; set; }

    }
}