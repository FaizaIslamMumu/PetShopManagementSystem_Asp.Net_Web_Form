using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using My_ASP_Project.Models;


namespace My_ASP_Project.DAL
{
    public class CategoryGetWay
    {
        SqlConnection con = new SqlConnection(Connection.GetConnectionString());

       public IQueryable<categoryInfo> Get()
        {
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Category ", con);
            sda.Fill(dt);
            return dt.AsEnumerable()
                .Select(r => new categoryInfo
                {
                    id = r.Field<int>("categoryID"),
                    CategoryName = r.Field<string>("categoryName")
                })
                .AsQueryable();
        }
        public void Insert(categoryInfo c)
        {
            SqlCommand cmd = new SqlCommand(@"INSERT INTO Category VALUES(@n)", con);
            cmd.Parameters.AddWithValue("@n", c.CategoryName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    
}