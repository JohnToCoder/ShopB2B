using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ShopB2B.page
{
    public partial class leftMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtb = ShopB2B.BL.OperLeftMenu.GetLeftMeun();
                string strReturn = "";
                if (dtb.Rows.Count > 0)
                {
                    foreach(DataRow row in dtb.Rows)
                    {
                        strReturn = strReturn + "<li><span class=\"span\">"+row.ItemArray[0].ToString()+"</span></li>";
                    }
                }
                Response.Write(strReturn);
            }
        }
    }
}