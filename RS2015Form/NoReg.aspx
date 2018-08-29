<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoReg.aspx.cs" Inherits="RS2015Form.NoReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="CSS/jquery.mobile-1.4.5.min.css"/>
    <link rel="stylesheet" href="CSS/custom.css"/>
    <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script src="Scripts/jquery.mobile-1.4.5.min.js"></script>
    
    <title>2015台灣微軟校園巡迴講座問卷</title>
    <script>
        $(document).ready(function () {
            $('#btnSave').click(function () {
                $("#btnSave").attr("disabled", true);
                var isValid = Page_ClientValidate('');
                if (!isValid) {
                    $("#btnSave").attr("disabled", false);
                    return;
                }

                var name = $('#<%=name.ClientID%>').val();
                var sex = $("input:radio[name='sex']:checked").val();
                var school = $('#<%=school.ClientID%>').val();
                var department = $('#<%=department.ClientID%>').val();
                var grade = $('#<%=grade.ClientID%>').val();
                var email = $('#<%=email.ClientID%>').val();
                var phone = $('#<%=phone.ClientID%>').val();
                var q1 = $("input:radio[name='question1']:checked").val();
                var q2 = $("input:radio[name='question2']:checked").val();
                var q3 = $("input:radio[name='question3']:checked").val();
                var q4 = 0;
                $("#<%=question4.ClientID %> input[type=checkbox]:checked").each(function () {
                    q4 = parseInt(q4) + parseInt($(this).val());
                });
                var q5 = $('#<%=question5.ClientID%>').val();
                var q6 = $('#<%=question6.ClientID%>').val();

                $('#loadingPanel').show();

                // here call server side function for save data using jquery ajax
                $.ajax({
                    url: "NoReg.aspx/SaveData",
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({
                        "name": name,
                        "sex": sex,
                        "school": school,
                        "department": department,
                        "grade": grade,
                        "email": email,
                        "phone": phone,
                        "q1": q1,
                        "q2": q2,
                        "q3": q3,
                        "q4": q4,
                        "q5": q5,
                        "q6": q6
                    }),
                    success: function (data) {
                        if (data.d == "success") {
                            alert("提交成功！\n前往微軟實習粉專...");
                            window.location = "https://www.facebook.com/Microsoft.Student.Program";
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError);
                    }
                }).done(function () {
                    // here hide loading panel as function complete
                    $('#loadingPanel').hide();
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page">
            <div data-role="header">
                <h1>2015台灣微軟校園巡迴講座問卷</h1>
            </div>
            <div data-role="main" class="ui-content" >
                <div hidden="hidden">
                    <asp:ValidationSummary ID="valSummary" runat="server" ShowSummary="true" ShowMessageBox="true" />
                </div>
                <h3>*星號為必填</h3>

                <label for="name">姓名<span>*</span></label>
                <asp:TextBox ID="name" runat="server" placeholder="姓名"></asp:TextBox>
                <asp:RequiredFieldValidator ID="nameValid" runat="server" ErrorMessage="請輸入姓名" ControlToValidate="name" Display="Dynamic" Font-Bold="True" />

                <fieldset data-role="controlgroup" data-type = "horizontal" >
                    <legend>性別<span>*</span></legend>
                    <div class="btn-group">
                      <button type="button" data-switch-toggle="state" class="btn btn-default">Toggle</button>
                      <button type="button" data-switch-set="state" data-switch-value="true" class="btn btn-default">Set true</button>
                      <button type="button" data-switch-set="state" data-switch-value="false" class="btn btn-default">Set false</button>
                      <button type="button" data-switch-get="state" class="btn btn-default">Get</button>
                    </div>
                    <asp:RadioButtonList ID="sex" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Text="男" Value="男"/>
                        <asp:ListItem  Text="女" Value="女"/>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="sexValid" runat="server" ErrorMessage="請選擇性別" ControlToValidate="sex" Display="Dynamic" Font-Bold="True" />
                </fieldset>

                <label for="school">學校<span>*</span></label>
                    <asp:TextBox ID="school" runat="server" placeholder="學校"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="schoolValid" runat="server" ErrorMessage="請輸入學校" ControlToValidate="school" Display="Dynamic" Font-Bold="True" />

                <label for="department">科系<span>*</span></label>
                    <asp:TextBox ID="department" runat="server" placeholder="科系"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="departmentValid" runat="server" ErrorMessage="請輸入科系" ControlToValidate="department" Display="Dynamic" Font-Bold="True" />

                <label for="grade">年級<span>*</span></label>
                <asp:DropDownList ID="grade" runat="server">
                    <asp:ListItem Text="高中以下" Value="高中以下"></asp:ListItem>
                    <asp:ListItem Text="大一" Value="大一"></asp:ListItem>
                    <asp:ListItem Text="大二" Value="大二"></asp:ListItem>
                    <asp:ListItem Text="大三" Value="大三" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="大四" Value="大四"></asp:ListItem>
                    <asp:ListItem Text="大五" Value="大五"></asp:ListItem>
                    <asp:ListItem Text="碩一" Value="碩一"></asp:ListItem>
                    <asp:ListItem Text="碩二" Value="碩二"></asp:ListItem>
                    <asp:ListItem Text="其他" Value="其他"></asp:ListItem>
                </asp:DropDownList>

                <label for="email">Email</label>
                    <asp:TextBox ID="email" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="emailValid1" runat="server" ErrorMessage="請輸入email" ControlToValidate="email" Display="Dynamic" Font-Bold="True" />
                    <asp:RegularExpressionValidator ID="emailValid2" runat="server" ErrorMessage="請輸入正確的Email格式" ControlToValidate="email" ValidationExpression="[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}" Display="Dynamic" Font-Bold="True" />

                <label for="phone">手機</label>
                    <asp:TextBox ID="phone" runat="server" placeholder="手機" Text="09"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="phoneValid1" runat="server" ErrorMessage="請輸入手機號碼" ControlToValidate="phone" Display="Dynamic" Font-Bold="True" />
                    <asp:RegularExpressionValidator ID="phoneValid2" runat="server" ErrorMessage="請輸入正確的手機格式" ControlToValidate="phone" ValidationExpression="[0]{1}[9]{1}[0-9]{8}" Display="Dynamic" Font-Bold="True" />

                <div data-role="fieldcontain">
                    <h2>以下是問題列表</h2>
                </div>

                <fieldset data-role="controlgroup" data-type = "horizontal">
                    <legend>Question 1<span>*</span><br/>請問您對於本講座的整體滿意度為何？<br/>(5最滿意)</legend>
                    <asp:RadioButtonList ID="question1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Text="1" Value="1"/>
                        <asp:ListItem  Text="2" Value="2"/>
                        <asp:ListItem  Text="3" Value="3"/>
                        <asp:ListItem  Text="4" Value="4"/>
                        <asp:ListItem  Text="5" Value="5" Selected="True" />
                    </asp:RadioButtonList>
                </fieldset>

                <fieldset data-role="controlgroup" data-type = "horizontal">
                    <legend>Question 2<span>*</span><br/>請問您對於高階主管分享的內容滿意度為何？<br/>(5最滿意)</legend>
                    <asp:RadioButtonList ID="question2" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Text="1" Value="1"/>
                        <asp:ListItem  Text="2" Value="2"/>
                        <asp:ListItem  Text="3" Value="3"/>
                        <asp:ListItem  Text="4" Value="4"/>
                        <asp:ListItem  Text="5" Value="5" Selected="True" />
                    </asp:RadioButtonList>
                </fieldset>

                <fieldset data-role="controlgroup" data-type = "horizontal">
                    <legend>Question 3<span>*</span><br/>請問您對於實習生分享的內容滿意度為何？<br/>(5最滿意)</legend>
                    <asp:RadioButtonList ID="question3" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem  Text="1" Value="1"/>
                        <asp:ListItem  Text="2" Value="2"/>
                        <asp:ListItem  Text="3" Value="3"/>
                        <asp:ListItem  Text="4" Value="4"/>
                        <asp:ListItem  Text="5" Value="5" Selected="True" />
                    </asp:RadioButtonList>
                </fieldset>

                <fieldset data-role="controlgroup" data-type = "horizontal">
                    <legend>Question 4<span>*</span><br/>聽完講座之後，請問您對哪幾個職位有興趣呢？(可複選)</legend>
                    <asp:CheckBoxList ID="question4" runat="server">
                        <asp:ListItem  Text="AA 行政助理" Value="1"/>
                        <asp:ListItem  Text="MAA 行銷助理" Value="2"/>
                        <asp:ListItem  Text="SAA 協銷助理" Value="4"/>
                        <asp:ListItem  Text="RDAA 技術助理" Value="8"/>
                    </asp:CheckBoxList>
                </fieldset>
                    
                <label for="question5">Question 5<br/>請問您對於實習計劃及今日講座的建議？</label>
                    <asp:TextBox ID="question5" runat="server" TextMode="MultiLine"></asp:TextBox>

                <label for="question6">Question 6<br/>請問您有什麼話想對今天的講師、實習生說呢？</label>
                    <asp:TextBox ID="question6" runat="server" TextMode="MultiLine"></asp:TextBox>

            </div>

            <div data-role="footer">
                <div id="loadingPanel" style="color:green; font-weight:bold;display:none;">處理中請稍等...</div>
                <input type="button" value="Submit" id="btnSave" />
            </div>
        </div>
    </form>
</body>
</html>
