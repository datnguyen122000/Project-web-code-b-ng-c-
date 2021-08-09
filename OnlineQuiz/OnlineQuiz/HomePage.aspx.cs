using OnlineQuiz.dao;
using OnlineQuiz.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineQuiz
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            String userName = Request.Form["user"];
            String pass = Request.Form["pass"];
            loadDAO ld = new loadDAO();
            User user = ld.getUser(userName, pass);
            if (user == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                // có tồn tại trở về trang home
                Session["user"] = user;
                Response.Redirect("StartQuizPage.aspx");
            }
        }
    }
}