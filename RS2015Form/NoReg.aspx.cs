using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RS2015Form
{
    public partial class NoReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string SaveData(string name, string sex, string school, string department, string grade, string email, string phone, string q1, string q2, string q3, string q4, string q5, string q6)
        {
            string status = "";
            // apply validation here
            int q4_int = Convert.ToInt32(q4);
            bool q4_AA = false, q4_MAA = false, q4_SAA = false, q4_RDAA = false;

            if (q4_int >= 8) { q4_RDAA = true; q4_int -= 8; }
            if (q4_int >= 4) { q4_SAA = true; q4_int -= 4; }
            if (q4_int >= 2) { q4_MAA = true; q4_int -= 2; }
            if (q4_int >= 1) { q4_AA = true; q4_int -= 1; }

            FormReply c = new FormReply { Name = name, Sex = sex, School = school, Department = department, Grade = grade, Email = email, Phone = phone, Q1 = Convert.ToInt32(q1), Q2 = Convert.ToInt32(q2), Q3 = Convert.ToInt32(q3), Q4_AA = q4_AA, Q4_MAA = q4_MAA, Q4_SAA = q4_SAA, Q4_RDAA = q4_RDAA, Q5 = q5, Q6 = q6, REG = false };

            // here MyDatabaseEntities  is our dbContext
            using (RS2015DBEntities dc = new RS2015DBEntities())
            {
                dc.FormReplies.Add(c);
                dc.SaveChanges();
                status = "success";
            }

            return status;
        }
    }
}