using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OnlineQuiz.dataprovider
{
    public class dataProvider
    {

        public static DataTable GetDataBySQL(string sql)
        {
            string strCon = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();

            try
            {
                SqlCommand cmd = new SqlCommand(sql, new SqlConnection(strCon));
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static int ExecuteSQL(string sql, params SqlParameter[] sqlParameters)
        {
            string strCon = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();

            try
            {
                SqlCommand cmd = new SqlCommand(sql, new SqlConnection(strCon));
                cmd.Parameters.AddRange(sqlParameters);
                cmd.Connection.Open();
                int result = cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                return result;
            }
            catch (Exception)
            {

            }
            return 0;
        }

        public static int UpdateQuiz(ArrayList arrayList)
        {
            string sql = "update quiz \n"
                    + "set [question] = @q,\n"
                    + "[option1] = @o1,\n"
                    + "[option2] = @o2,\n"
                    + "[option3] = @o3,\n"
                    + "[option4] = @o4,\n"
                    + "[answer] = @a \n"
                    + "where [id] = @i";
            SqlParameter[] parma = new SqlParameter[]
            {
                new SqlParameter("@q", SqlDbType.NVarChar),
                 new SqlParameter("@o1", SqlDbType.NVarChar),
                  new SqlParameter("@o2", SqlDbType.NVarChar),
                   new SqlParameter("@o3", SqlDbType.NVarChar),
                    new SqlParameter("@o4", SqlDbType.NVarChar),
                 new SqlParameter("@a", SqlDbType.VarChar),
                  new SqlParameter("@i", SqlDbType.Int)
            };
            for (int i = 0; i < arrayList.Count; i++)
            {
                parma[i].Value = arrayList[i];
            }
            return ExecuteSQL(sql, parma);

        }

        public static int DeleteQuiz(int id)
        {
            string sql = "delete from quiz where id = @i";
            ArrayList arrayList = new ArrayList() { id };
            SqlParameter[] parma = new SqlParameter[]
            {
        new SqlParameter("@i", SqlDbType.Int)
            };
            for (int i = 0; i < arrayList.Count; i++)
            {
                parma[i].Value = arrayList[i];
            }
            return ExecuteSQL(sql, parma);
        }

    }
}