using OnlineQuiz.dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineQuiz
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String userName = Request.Form["user"];
            String pass = Request.Form["pass"];
            int role = Convert.ToInt32(Request.Form["role"]);
            String email = Request.Form["email"];
            DateTime now = DateTime.Now;
            //SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            //String date = df.format(now);
            //now.ToString("yyyy-MM-dd");
            loadDAO ld = new loadDAO();
            if (ld.CheckExit(userName))
            {
                Response.Write("<script>alert('Duplicate user')</script>");

            }
            else
            {
                ld.Register(userName, pass, role, now.ToString("yyyy-MM-dd"), email);
                Response.Write("<script>alert('Create account successful');\nwindow.location='HomePage.aspx'</script>'");
                //Response.Redirect("HomePage.aspx");
            }

        }
    }
}