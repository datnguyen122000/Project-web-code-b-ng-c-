using OnlineQuiz.entity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OnlineQuiz.dao
{
    public class loadDAO
    {
        String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


        public List<Quiz> getAllQuiz()
        {
            List<Quiz> list = new List<Quiz>();
            String query = "select * from quiz";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader rs = command.ExecuteReader();
            while (rs.Read())
            {
                list.Add(new Quiz(rs.GetInt32(0),
                    rs.GetString(1),
                    rs.GetString(2),
                    rs.GetString(3),
                    rs.GetString(4),
                    rs.GetString(5),
                    rs.GetString(6),
                    rs.GetDateTime(7).ToString("dd-MM-yyyy"),
                    rs.GetInt32(8)));
            }
            return list;
        }
        public Boolean CheckExit(string user)
        {
            String query = "select * from [user] where [user_name]= N'" + user + "'";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader rs = command.ExecuteReader();
            while (rs.Read())
            {
                return true;
            }
            return false;
        }

        public void Register(String user, String pass, int role, String createdDate, String email)
        {
            String query = "insert into [user]\n"
                   + "values(N'" + user + "',N'" + pass + "'," + role + ",'" + createdDate + "',N'" + email + "')";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            command.ExecuteNonQuery();

        }
        public User getUser(String user, String pass)
        {
            String query = "select * from [user] where [user_name]=N'" + user + "' and [password]=N'" + pass + "'";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader rs = command.ExecuteReader();
            while (rs.Read())
            {
                return new User(rs.GetInt32(0), rs.GetString(1), rs.GetString(2), rs.GetInt32(3), rs.GetDateTime(4).ToString(), rs.GetString(5));
            }
            return null;
        }

        internal List<Quiz> GetListQuiz()
        {
            throw new NotImplementedException();
        }

        public List<Quiz> getListQuiz(int numOfQuiz)
        {
            List<Quiz> list = new List<Quiz>();
            String query = "Select top " + numOfQuiz + " * from quiz order by newid()";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader rs = command.ExecuteReader();
            while (rs.Read())
            {
                list.Add(new Quiz(rs.GetInt32(0),
                      rs.GetString(1),
                      rs.GetString(2),
                      rs.GetString(3),
                      rs.GetString(4),
                      rs.GetString(5),
                      rs.GetString(6),
                      rs.GetDateTime(7).ToString(),
                      rs.GetInt32(8)));
            }
            return list;
        }

        public int makeQuiz(String question, String option1, String option2, String option3, String option4, String answer, DateTime date, int userId)
        {
            String query = "insert into quiz \n"
                    + "values(N'" + question + "',N'" + option1 + "',N'" + option2 + "',N'" + option3 + "',N'" + option4 + "','" + answer + "','" + date.ToString("yyyy-MM-dd") + "'," + userId + ")";
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            int checkSuccess=command.ExecuteNonQuery();
            return checkSuccess;
        }

        public List<Quiz> GetListQuiz(int numOfQuiz)
        {
            String query = "Select top " + numOfQuiz + " * from quiz order by newid()";
            List<Quiz> list = new List<Quiz>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader rs = command.ExecuteReader();
            while (rs.Read())
            {
                list.Add(new Quiz(rs.GetInt32(0),
                            rs.GetString(1),
                            rs.GetString(2),
                            rs.GetString(3),
                            rs.GetString(4),
                            rs.GetString(5),
                            rs.GetString(6),
                            rs.GetDateTime(7).ToString(),
                            rs.GetInt32(8)));
            }
            return list;
        }



        public List<Quiz> GetListByUser(int userId)
        {
            String query = "select * from quiz where user_id=?";
            List<Quiz> list = new List<Quiz>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand command = new SqlCommand(query, conn);
            SqlDataReader rs = command.ExecuteReader();

            while (rs.Read())
            {
                list.Add(new Quiz(rs.GetInt32(0),
                             rs.GetString(1),
                             rs.GetString(2),
                             rs.GetString(3),
                             rs.GetString(4),
                             rs.GetString(5),
                             rs.GetString(6),
                             rs.GetDateTime(7).ToString(),
                             rs.GetInt32(8)));
            }
            return list;
        }


    }
}