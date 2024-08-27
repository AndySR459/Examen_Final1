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
    public class SuperClase
    {
        public List<Store> Stores { get; set; }
        public List<Customer> Customers { get; set; }

        public Staff oStaff { get; set; }
        public SystemUser oSystemUser { get; set; }

    }
}