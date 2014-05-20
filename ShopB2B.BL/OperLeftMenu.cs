using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ShopB2B.BL
{
    public class OperLeftMenu
    {
       
        public static DataTable GetLeftMeun()
        {
            return ShopB2B.Data.LeftMenuData.GetLeftMeun();
        }

 
    }
}
