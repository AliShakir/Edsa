using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDSA
{
    public partial class view_application : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    SqlDataReader sdr;
                    SqlParameter[] param1 = new SqlParameter[5];
                    param1[0] = new SqlParameter("@id", SqlDbType.NVarChar) { Value = id };
                    sdr = SqlHelper.ExecuteReader(DbConnection.DbConnection.GetDbConnection(), CommandType.Text, "Select * From EdsaIndividualUser Where id=@id", param1);
                    while (sdr.Read())
                    {
                        string FullNme = sdr["FirstName"].ToString() + " " + sdr["MiddleName"].ToString() + " " + sdr["LastName"].ToString();
                        FullName.Text = FullNme;
                        TelephoNo.Text = sdr["TelNo"].ToString();
                        IDNo.Text = sdr["IDNo"].ToString();
                        IdentificationType.Text = sdr["IdentificationType"].ToString();
                        TypeOfPremise.Text = sdr["TypeOfPremise"].ToString();
                        Address.Text = sdr["Address"].ToString();
                    }
                }
            }
        }
    }

}