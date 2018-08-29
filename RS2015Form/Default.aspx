<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RS2015Form.Default" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="header">
            <h1>2015台灣微軟校園巡迴講座問卷</h1>
        </div>
        <div data-role="main" class="ui-content" >
            <asp:Label ID="Label1" runat="server" Text="請問您是否有線上報名本場次校園巡迴講座?" Font-Size="Medium"></asp:Label>
            <a href="Reg.aspx" data-role="button" data-icon="check" data-iconpos="top" rel="external">有，報名過了</a>
            <a href="NoReg.aspx" data-role="button" data-icon="delete" data-iconpos="top" rel="external">無，現場報名</a>
        </div>
    </form>
</body>
</html>
