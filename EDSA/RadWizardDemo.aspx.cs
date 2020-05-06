using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDSA
{
    public partial class RadWizardDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void NewRegistrationButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DefaultCS.aspx");

        }
    }
}