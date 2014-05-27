using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ShopB2B.Data
{
    public class UserData
    {
        public static DataTable GetUserList()
        {
            SqlParameter[] param ={
                                      new SqlParameter("@Name",""),
                                      new SqlParameter("@OrderNum","")
                                  };
            DataTable dtb = SqlHelper.GetDataTable("sp_LeftMenu", CommandType.StoredProcedure, param);
            return dtb;
        }
    }
}
