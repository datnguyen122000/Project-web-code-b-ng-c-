<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="OnlineQuiz.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/home.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="header"></div>
                <div class="menu">
                    <img src="images/menu_bg.gif" alt="" />
                    <div class="all_menu">
                        <a href="home">Home</a>
                    </div>
                </div>
                <div class="main"  style="padding-top:1px">
                    <h3>Register form</h3>
                    <form action="register">
                        <table>
                            <tr>
                                <td class="items">User Name:</td>
                                <td>
                                    <input type="text" name="user" class="input_account"></td>
                            </tr>
                            <tr>
                                <td class="items">Passwork:</td>
                                <td>
                                    <input type="password" name="pass"></td>
                            </tr>
                            <tr>
                                <td class="items">User Type:</td>
                                <td>
                                    <select class="selectItem" name="role">
                                        <option value="1">Teacher</option>
                                        <option value="2">Student</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="items">Email:</td>
                                <td>
                                    <input type="text" name="email"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" style="height: 26px" />
                                    <%-- <button type="submit" class="sign_in">Register</button>--%>
                                </td>
                            </tr>
                        </table>
                    </form>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
