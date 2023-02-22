using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace My_ASP_Project.DAL
{
    public static class Connection
    {
        public static string GetConnectionString()
        {
            string conStr = "Data Source=.;Initial Catalog=petDB;Integrated Security=True";
            return conStr;
        }
    }
}