using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuiz.dao;

namespace OnlineQuiz
{
    public partial class MakeQuizPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

            string question = Request.Form["question"];
            string option1 = Request.Form["option1"];
            string option2 = Request.Form["option2"];
            string option3 = Request.Form["option3"];
            string option4 = Request.Form["option4"];
            string [] answers = Request.Form.GetValues("answer");
            string myAnswer = "";
            foreach (var answer in answers)
            {
                myAnswer += answer + ",";
            }

            myAnswer = myAnswer.Substring(0, myAnswer.Length - 1);
            DateTime date = DateTime.Now;
           
            entity.User user = (entity.User)Session["user"];
            int uid = user.getId();

            loadDAO dao = new loadDAO();
            int checkSuccess=dao.makeQuiz(question, option1, option2, option3, option4, myAnswer,Convert.ToDateTime( date.ToString("yyyy-MM-dd")), uid);
            if (checkSuccess == 1)
            {
                Response.Write("<script>alert('Insert success')</script>");
            }
            //Response.Redirect("StartQuizPage.aspx");
        }
    }
}