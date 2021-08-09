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
    public partial class StartQuizPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int indexQuiz = 0;
            //tạo câu hỏi
            int numOfQuiz = Convert.ToInt32(Request.Form["numOfSen"]);
            Session["endQuiz"] = numOfQuiz-1;// set numOfDate để khi indexQuiz==endQuiz thì đổi nút next thành nút result
            List<Quiz> list = new List<Quiz>();
            loadDAO ld = new loadDAO();
            list = ld.getListQuiz(numOfQuiz);
            Session["list"] = list;

            // câu hỏi hiện tại
            Session["item"] = list[0];
            Session["indexQuiz"] = 0;

            //count time remaining
            long endTime = 0;
            DateTime Jan1970 = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            TimeSpan javaSpan = DateTime.UtcNow - Jan1970;
            endTime = (long)javaSpan.TotalMilliseconds + list.Count() * 60 * 1000;
            Session["endTime"] = endTime;
            //set result
            Session["result"] = 0;
            Response.Redirect("TakeQuizPage.aspx");
        }
    }
}