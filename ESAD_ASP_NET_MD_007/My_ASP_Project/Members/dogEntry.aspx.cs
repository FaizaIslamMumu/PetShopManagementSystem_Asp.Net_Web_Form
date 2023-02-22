using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_ASP_Project
{
    public partial class dogEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {

            FileUpload fu = (FileUpload)ListView1.InsertItem.FindControl("fuPicture");
            if (fu.HasFile)
            {
                string fileName = Guid.NewGuid() + "_" + Path.GetExtension(fu.FileName);
                fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                e.Values["DogImage"] = fileName;
            }
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            FileUpload fu = (FileUpload)ListView1.EditItem.FindControl("fuPicture");
            if (fu.HasFile)
            {
                string fileName = Guid.NewGuid() + "_" + Path.GetExtension(fu.FileName);
                fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                e.NewValues["DogImage"] = fileName;
            }
        }
    }
}