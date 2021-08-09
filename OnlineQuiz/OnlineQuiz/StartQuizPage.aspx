<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartQuizPage.aspx.cs" Inherits="OnlineQuiz.StartQuizPage" %>

<%@ Import Namespace="OnlineQuiz.entity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/home.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
                    <a href="">Home</a>
                    <a href="">Take Quiz</a>
                    <a href="MakeQuizPage.aspx">Make Quiz</a>
                    <a href="ManagerQuizControl.aspx">Manage Quiz</a>
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
                <div class="title">Welcome <span class="user"><%=user.getName()%></span></div>
                <div class="title">Enter number of question:</div>
                <br>
                <div class="start-quiz">
                    <input type="text" name="numOfSen"><br>
                    <asp:Button ID="Button1" runat="server" Text="Start" OnClick="Button1_Click" style="height: 29px" />
                   <%-- <button type="submit">Start</button>--%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
