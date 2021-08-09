<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TakeQuizPage.aspx.cs" Inherits="OnlineQuiz.TakeQuizPage" %>

<%@ Import Namespace="OnlineQuiz.entity" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header"></div>
            <div class="menu">
                <img src="images/menu_bg.gif" alt="" />
                <%-- <div class="all_menu">
                    <c:if test="${sessionScope.user.role==1&&sessionScope.list==null}">
                        <a href="home">Home</a>
                        <a href="StartQuizPage.jsp">Take Quiz</a>
                        <a href="MakeQuizPage.jsp">Make Quiz</a>
                        <a href="manage">Manage Quiz</a>
                        <a href="logout">Log out</a>
                    </c:if>
                    <c:if test="${sessionScope.user.role==2&&sessionScope.list==null}">
                        <a href="home">Home</a>
                        <a href="StartQuizPage.jsp">Take Quiz</a>
                        <!--                        <a href="#">Make Quiz</a>
                                                <a href="#">Manage Quiz</a>-->
                        <a href="logout">Log out</a>
                    </c:if>
                    <c:if test="${sessionScope.user.role==1&&sessionScope.list!=null}">
                        <a href="#">Home</a>
                        <a href="#">Take Quiz</a>
                        <a href="#">Make Quiz</a>
                        <a href="#">Manage Quiz</a>
                        <a href="#">Log out</a>
                    </c:if>
                    <c:if test="${sessionScope.user.role==2&&sessionScope.list!=null}">
                        <a href="#">Home</a>
                        <a href="#">Take Quiz</a>
                        <!--                        <a href="#">Make Quiz</a>
                                                <a href="#">Manage Quiz</a>-->
                        <a href="#">Log out</a>
                    </c:if>
                </div>--%>
                <div class="all_menu">
                    <%
                        User user = (User)Session["user"];
                    %>
                    <% if (user.getRole() == 1)
                        {
                    %>
                    <a href="">Home</a>
                    <a href="">Take Quiz</a>
                    <a href="">Make Quiz</a>
                    <a href="">Manage Quiz</a>
                    <a href="">Log out</a>
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
                    <a href="">Log out</a>
                    <% 
                        }
                    %>
                </div>
            </div>
            <div class="main">
                <%
                    Quiz item = (Quiz)Session["item"];
                %>
                <div class="title">Welcome <span class="user"><%=user.getName()%></span></div>
                <div class="title timer">Time Remaining <span></span></div>
                <br>
                <div class="questionx"><%=item.getQuestion()%></div>
                <form action="" method="">
                    <table>
                        <tr>
                            <td>
                                <input type="checkbox" name="choice" value="1"></td>
                            <td><%=item.getOption1() %></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="choice" value="2"></td>
                            <td><%=item.getOption2() %></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="choice" value="3"></td>
                            <td><%=item.getOption3() %></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" name="choice" value="4"></td>
                            <td><%=item.getOption4() %></td>
                        </tr>
                    </table>
                    <!--<a href="#" class="back">Back</a>-->
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%--<asp:Button ID="Button1" runat="server" Text="Result" OnClick="Button1_Click" />--%>
                    <% if (!Session["endQuiz"].Equals(Session["indexQuiz"]))
                        {


                    %>
                     <input type="button" value="Result" onclick="calResult();resultPage()">
                    <asp:Button ID="Button2" runat="server" Text="Next" OnClick="Button2_Click" OnClientClick="calResult()" />
                    <%
                        }
                        else
                        {
                    %>
                   <input type="button" value="Result" onclick="calResult();resultPage()">
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
        <script type="text/javascript">
            var endTime = '<%= Session["endTime"] %>';
            function timer() {
                var now = new Date().getTime();
                var distance = (endTime - now) / 1000;//second 
                var minute = Math.floor(distance / 60);
                var second = Math.floor(distance - minute * 60);
                var timeBox = document.getElementsByTagName("span")[1];
                timeBox.innerHTML = minute + ":" + second;
                if (minute == 0 && second == 0) {
                    calResult();
                    resultPage();
                }
            }
            timer();
            setInterval(function () {
                timer();
            }, 1000);
            function calResult() {

                var choice = document.getElementsByName("choice");// chỉ lấy element chưa lấy checked
                var choiceChecked = "";
                for (var i = 0; i < choice.length; i++) {
                    if (choice[i].checked) {
                        choiceChecked += choice[i].value + ",";
                    }
                }
                var userAnswer = choiceChecked.split(",");
                var answer = "<%=item.getAnswer()%>".split(",");//caculate the quiz before current quiz
                //for (var i = 0; i < answer.length; i++) {
                //    alert(answer[i]);
                //}
                //for (var i = 0; i < userAnswer.length; i++) {
                //    alert(userAnswer[i]);
                //}


                // tính điểm
                var result = 0;
                if (sessionStorage.getItem('result') != null) {
                    result = Number(sessionStorage.getItem('result'));
                }

                var rsEveryQuiz = 0;
                //alert(3);
                //alert(userAnswer[0]);
                //alert(answer[0]);
                //if (userAnswer[0] == answer[0]) {
                //    alert('yes');
                //} else {
                //    alert('No');
                //}
                if (userAnswer.length > 0) {//tức là k để trống
                    for (var i = 0; i < userAnswer.length; i++) {
                        for (var j = 0; j < answer.length; j++) {
                            if (userAnswer[i] === answer[j]) {
                                rsEveryQuiz++;
                            }
                        }
                    }
                    //gia su khoanh duoc 3 dap an dung trong 4 dap an result=3/4
                    result += (rsEveryQuiz / answer.length);
                }

                //alert(result);

                sessionStorage.setItem('result', result);

            }
            function resultPage() {
                var result = Number(sessionStorage.getItem('result'));
                //alert(result);
                var numOfQuestion = Number('<%= Session["endQuiz"]%>') + Number('1');
                //alert(numOfQuestion);
                result = (result / (numOfQuestion)) * 100;
                /*alert(result);*/
                //alert(result.toFixed(3));
                var url = "ResultPage.aspx?result=" + result.toFixed(2);
                sessionStorage.removeItem("result");
                window.location.assign(url);
            }
        </script>
    </form>
body>
</html>
