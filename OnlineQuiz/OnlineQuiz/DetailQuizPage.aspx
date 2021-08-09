<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailQuizPage.aspx.cs" Inherits="OnlineQuiz.DetailQuizPage" %>

<%@ Import Namespace="OnlineQuiz.entity" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>
    <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style2 {
            margin-left: 0px;
            margin-top: 15px;
        }
    </style>
    </head>
<body>
    <div class="container">
        <div class="header"></div>
        <div class="menu" style="left: 0px; top: 0px">
            <img src="images/menu_bg.gif" alt="" />
            <div class="all_menu">
                <%
                    User user = (User)Session["user"];
                %><% if (user.getRole() == 1)
                    {
                %>
                <a href="">Home</a>
                <a href="">Take Quiz</a>
                <a href="">Make Quiz</a>
                <a href="ManagerQuizControl.aspx">Manage Quiz</a>
                <a href="LogoutControl.aspx">Log out</a>
                <% 
                    }
                %>                <% if (user.getRole() == 2)
                    {
                %>
                <a href="">Home</a>
                <a href="">Take Quiz</a>
                <!--                        <a href="#">Make Quiz</a>
                                                <a href="#">Manage Quiz</a>-->
                <a href="LogoutControl.aspx">Log out</a>                <% 
                    }
                %>
            </div>
        </div>
        <div class="main main_makeQuiz">
            <form id="form1" runat="server">
                <br />
               
                 
                <asp:Label ID="Label1" runat="server" Text="Question"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="txtQues" TextMode="MultiLine" runat="server" Width="524px" CssClass="auto-style2" Height="54px"></asp:TextBox>

                

                <br />
               
                 
                <asp:Label ID="Label2" runat="server" Text="Option1"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" Width="524px" Height="56px"></asp:TextBox>

                

                <br />
               
                 
                <asp:Label ID="Label3" runat="server" Text="Option2"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox3" TextMode="MultiLine" runat="server" Width="524px" Height="54px"></asp:TextBox>

                

                <br />
               
                 
                <asp:Label ID="Label4" runat="server" Text="Option3"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox4" TextMode="MultiLine" runat="server" Width="524px" Height="43px"></asp:TextBox>

                

                <br />
               
                 
                <asp:Label ID="Label5" runat="server" Text="Option4"></asp:Label>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="TextBox5" TextMode="MultiLine" runat="server" Width="524px" CssClass="auto-style1" Height="42px"></asp:TextBox>

                

                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Answers"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" Width="68px" />
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click1" style="height: 26px" Text="Update" />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />

                

            </form>
        </div>
    </div>
</body>
</html>
