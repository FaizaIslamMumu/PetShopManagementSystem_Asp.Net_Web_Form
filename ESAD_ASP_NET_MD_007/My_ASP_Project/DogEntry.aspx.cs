using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using My_ASP_Project.Models;

namespace My_ASP_Project
{
    public partial class DogEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable ListView1_GetData()
        {
            petDBContext db = new petDBContext();
            return db.DogInfoes.AsQueryable();
        }

        public void ListView1_InsertItem()
        {
            
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_UpdateItem(int id)
        {

        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void ListView1_DeleteItem(int id)
        {

        }
        public IQueryable<Category> ddl_GetData()
        {
            petDBContext db = new petDBContext();
            return db.Categories.AsQueryable();
        }
    }
}