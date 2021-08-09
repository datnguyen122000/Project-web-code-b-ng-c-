<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnlineQuiz.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/home.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div class="container">
            <div class="header"></div>
            <div class="menu">
                <img src="images/menu_bg.gif" alt="" />
                <div class="all_menu" style="left: 9px; top: 14px; width: 687px; height: 19px; margin-top: 0px">
                    <a href="#">Home</a>
                </div>
            </div>
            <div class="main">
                <h3 class="auto-style1">Login form</h3>
                <table>
                    <tr>
                        <td class="items">User Name:</td>
                        <td>
                            <input type="text" name="user" class="input_account"></td>
                    </tr>
                    <tr>
                        <td class="items">Password:</td>
                        <td>
                            <input type="password" name="pass"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button" class="sign_in" runat="server" Text="Sign in" OnClick="Button_Click"/>
                            <%--<button type="submit" class="sign_in">Sign in</button>--%>
                            <a href="RegisterPage.aspx">Register</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>

</body>
</html>
