using OnlineQuiz.dao;
using OnlineQuiz.dataprovider;
using OnlineQuiz.entity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineQuiz
{
    public partial class DetailQuizPage : System.Web.UI.Page
    {

      
        public static DataTable GetData(int id)
        {
            return dataProvider.GetDataBySQL("select * from quiz where id='" + id + "'");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
                int id = Convert.ToInt32(Request["id"].ToString());
                txtQues.Text = GetData(id).Rows[0]["question"].ToString();
                TextBox2.Text = GetData(id).Rows[0]["option1"].ToString();
                TextBox3.Text = GetData(id).Rows[0]["option2"].ToString();
                TextBox4.Text = GetData(id).Rows[0]["option3"].ToString();
                TextBox5.Text = GetData(id).Rows[0]["option4"].ToString();
                TextBox6.Text = GetData(id).Rows[0]["answer"].ToString();

            }
        }
  
      
    

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            string question = txtQues.Text;
            int id = Convert.ToInt32(Request["id"].ToString());
            string option1 = TextBox2.Text;
            string option2 = TextBox3.Text;
            string option3 = TextBox4.Text;
            string option4 = TextBox5.Text;
            string answer = TextBox6.Text;
            ArrayList array = new ArrayList() { question, option1, option2, option3, option4, answer, id };
            if (dataProvider.UpdateQuiz(array)>0)
            {
                Response.Write("<script>alert('Update Sussessfull')</script>");
                //Response.Redirect("ManagerQuizControl.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request["id"].ToString());
          
            if (dataProvider.DeleteQuiz(id)>0 )
            {
                Response.Write("<script>alert('Delete Sussessful');\nwindow.location='managerquizcontrol.aspx'</script>");
                //Response.Redirect("ManagerQuizControl.aspx");
            }
        }
    }
}