<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultPage.aspx.cs" Inherits="OnlineQuiz.ResultPage" %>

<%@ Import Namespace="OnlineQuiz.entity" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
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
                <a href="HomePage.aspx">Home</a>
                <a href="StartQuizPage.aspx">Take Quiz</a>
                <a href="MakeQuizPage.aspx">Make Quiz</a>
                <a href="ManagerQuizControl.aspx">Manage Quiz</a>
                <a href="LogoutControl.aspx">Log out</a>
                <% 
                    }
                %>

                <% if (user.getRole() == 2)
                    {
                %>
                <a href="HomePage.aspx">Home</a>
                <a href="StartQuizPage.aspx">Take Quiz</a>
                <!--                        <a href="#">Make Quiz</a>
                                                <a href="#">Manage Quiz</a>-->
                <a href="LogoutControl.aspx">Log out</a>
                <% 
                    }
                %>
            </div>
        </div>
        <div class="main">
            <%double result = Convert.ToDouble(Request.QueryString["result"]); %>
            <% if (result >= 50)
                {
            %>
            <div class="title">Your score <span class="score"><%=result %>%-Passed</span></div>
            <% 
                }
            %>
            <% if (result < 50)
                {
            %>
            <div class="title">Your score <span style="color: red;"><%=result %>%-Failed</span></div>
            <% 
                }
            %>
            <div class="title">Take another test <a href="StartQuizPage.aspx" class="back">Start</a></div>

        </div>
    </div>
</body>
</html>

