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
    public partial class ManagerQuizControl : System.Web.UI.Page
    {
        String connectionString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            loadDAO ld = new loadDAO();
            List<Quiz> listQ = ld.getAllQuiz();
            Session["listQ"] = listQ;
            Response.Redirect("ManagerQuizPage.aspx");
        }
    }
}