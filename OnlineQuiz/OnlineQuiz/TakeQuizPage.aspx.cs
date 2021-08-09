using OnlineQuiz.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineQuiz
{
    public partial class TakeQuizPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //next button
            List<Quiz> list = (List<Quiz>)Session["list"];
            int indexQuiz = (int)Session["indexQuiz"];
            if (indexQuiz < list.Count()-1)
            {
                Session["item"] = list[indexQuiz+1];
                Session["indexQuiz"] = indexQuiz + 1;
            }

            Response.Redirect("TakeQuizPage.aspx");

            // tính điểm câu trước
            //double result = 0;
            //if (indexQuiz != 0)
            //{//first quiz not caculatate result yet ,if indexQuiz=0==>don't have result to get(not set attribute yet)
            //    result = Double.parseDouble(Request.Form["result"]);
            //    String [] choice = new string[0];
            //    double rsEveryQuiz = 0;//result of every quiz
            //    if (Request.Form["choice"] != null)
            //    {
            //        choice = Request.Form.Item("choice");
            //        String answer[] = list[indexQuiz].getAnswer().split(",");//caculate the quiz before current quiz
            //        for (int i = 0; i < choice.length; i++)
            //        {
            //            for (int j = 0; j < answer.length; j++)
            //            {
            //                if (choice[i].equals(answer[j]))
            //                {
            //                    rsEveryQuiz++;
            //                }
            //            }
            //        }
            //        result += (rsEveryQuiz / answer.length);
            //    }
            //}

        }
    }
}