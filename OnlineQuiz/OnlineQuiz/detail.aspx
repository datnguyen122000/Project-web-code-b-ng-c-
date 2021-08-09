<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="OnlineQuiz.detail" %>

<%@ Import Namespace="OnlineQuiz.entity" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>
    <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 40px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header"></div>
        <div class="menu">
            <img src="images/menu_bg.gif" alt="" />
            <div class="all_menu">
                <%
                    User user = (User)Session["user"];
                %>                <% if (user.getRole() == 1)
                    {
                %>
                <a href="">Home</a>
                <a href="">Take Quiz</a>
                <a href="">Make Quiz</a>
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
        <div class="main main_makeQuiz">
            <form id="form1" runat="server">
                <table class="make_quiz" style="margin-left: -6%; height: 404px;">
                    <tr>
                        <td>Question:</td>
                        <td>
                            <textarea name="question" class="question"></textarea></td>
                    </tr>
                    <tr>
                        <td>Option 1: </td>
                        <td>
                            <textarea name="option1"></textarea></td>
                    </tr>
                    <tr>
                        <td>Option 2: </td>
                        <td>
                            <textarea name="option2"></textarea></td>
                    </tr>
                    <tr>
                        <td>Option 3: </td>
                        <td>
                            <textarea name="option3"></textarea></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Option 4: </td>
                        <td class="auto-style1">
                            <textarea name="option4"></textarea></td>
                    </tr>
                    <tr>
                        <td>Answers(s): </td>
                        <td>
                              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Update Answers(s)</td>
                        <td>
           
                             <input type="checkbox" value="1" name="answer">
                            Option 1                  
                                <input type="checkbox" value="2" name="answer">
                            Option 2
                                <input type="checkbox" value="3" name="answer">
                            Option 3
                                <input type="checkbox" value="4" name="answer">
                            Option 4
                        </td>
                        </tr>
                    <tr>
                        <td></td>
                        <td>
                                  
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="75px" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="71px" />

                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
