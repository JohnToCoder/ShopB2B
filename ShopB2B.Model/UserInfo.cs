using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShopB2B.Model
{
    public class UserInfo
    {
        public int txtId;
        public string txtName = string.Empty;
        public string txtPass = string.Empty;
        public string txtEmail = string.Empty;
        public string txtPhone = string.Empty;
        public Int64 txtTelephone;
        public string txtAdress = string.Empty;
        public string txtIP = string.Empty;
        public bool txtVis;
        public UserInfo()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }
        public UserInfo(int nId, string nName, string nPass, string nEmail, string nPhone, Int64 nTelephone, string nAdress, string nIP, bool nVis)
        {

            this.txtId = nId;
            this.txtName = nName;
            this.txtPass = nPass;
            this.txtEmail = nEmail;
            this.txtPhone = nPhone;
            this.txtTelephone = nTelephone;
            this.txtAdress = nAdress;
            this.txtIP = nIP;
            this.txtVis = nVis;

        }
        public UserInfo(string nName, string nPass, string nEmail, string nPhone, Int64 nTelephone, string nAdress, string nIP)
        {

            this.txtName = nName;
            this.txtPass = nPass;
            this.txtEmail = nEmail;
            this.txtPhone = nPhone;
            this.txtTelephone = nTelephone;
            this.txtAdress = nAdress;
            this.txtIP = nIP;


        }
        public UserInfo(string nName, string nEmail, string nPhone, Int64 nTelephone, string nAdress)
        {
            this.txtName = nName;
            this.txtEmail = nEmail;
            this.txtPhone = nPhone;
            this.txtTelephone = nTelephone;
            this.txtAdress = nAdress;

        }
        public UserInfo(int nId, string nName, string nIP, bool nVis)
        {

            this.txtId = nId;
            this.txtName = nName;
            this.txtIP = nIP;
            this.txtVis = nVis;

        }
        public int UserId
        {

            get { return txtId; }
            set { txtId = value; }

        }
        public string UserName
        {

            get { return txtName; }
            set { txtName = value; }

        }
        public string UserPass
        {

            get { return txtPass; }
            set { txtPass = value; }

        }
        public string UserEmail
        {

            get { return txtEmail; }
            set { txtEmail = value; }

        }
        public string UserPhone
        {

            get { return txtPhone; }
            set { txtPhone = value; }

        }
        public Int64 UserTelephone
        {

            get { return txtTelephone; }
            set { txtTelephone = value; }

        }
        public string UserAdress
        {

            get { return txtAdress; }
            set { txtAdress = value; }

        }
        public string UserIP
        {

            get { return txtIP; }
            set { txtIP = value; }

        }
        public bool UserVis
        {

            get { return txtVis; }
            set { txtVis = value; }

        }
    }
}
