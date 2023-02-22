using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_ASP_Project
{
    public partial class Category : System.Web.UI.Page
    {
        internal object categoryID;
        internal string categoryName;

        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.Sleep(2000);
        }
    }
}