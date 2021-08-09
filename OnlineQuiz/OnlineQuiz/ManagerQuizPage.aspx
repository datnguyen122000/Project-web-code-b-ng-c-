<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerQuizPage.aspx.cs" Inherits="OnlineQuiz.ManagerQuizPage" %>

<%@ Import Namespace="OnlineQuiz.entity" %>
<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <div class="container manageContainer">
        <div class="header"></div>
        <div class="menu">
            <img src="images/menu_bg.gif" alt="" />
            <div class="all_menu">
                <%
                    User user = (User)Session["user"];
                %>
                <% if (user.getRole() == 1)
                    {
                %>
                <a href="">Home</a>
                <a href="StartQuizPage.aspx">Take Quiz</a>
                <a href="MakeQuizPage.aspx">Make Quiz</a>
                <a href="">Manage Quiz</a>
                <a href="LogoutControl.aspx">Log out</a>
                <% 
                    }
                %>

                <% if (user.getRole() == 2)
                    {
                %>
                <a href="">Home</a>
                <a href="">Take Quiz</a>
                <!--                        <a href="#">Make Quiz</a>
                                                <a href="#">Manage Quiz</a>-->
                <a href="LogoutControl.aspx">Log out</a>
                <% 
                    }
                %>
            </div>
        </div>
        <div class="main">
            <%
                List<Quiz> listQ = (List<Quiz>)Session["listQ"];
            %>
            <div class="title">Number of question <span class="user"><%=listQ.Count%></span></div>
            <table class="manage_quiz">
                <tr class="manage_row">
                    <td class="mange_d"><span class="user">
                        <c:if test="${numOfQuestion!=0}">Question</c:if>
                    </span></td>
                    <td><span class="user">
                        <c:if test="${numOfQuestion!=0}">
                                    DateCreated
                                </c:if>
                    </span></td>
                </tr>
                <%foreach (Quiz item in listQ)
                    {
                %>
                <tr>
                    <td>
                        <div class="text"><a href="DetailQuizPage.aspx?id=<%=Convert.ToInt32(item.getId()) %>" name="quiz" style=" text-decoration: none;color: #008080;"><%=item.getQuestion() %></a></div>
                    </td>
                    <td><%=item.getCreatedDate() %></td>
                </tr>
                <%
                } %>
            </table>
        </div>
    </div>
</body>
</html>
