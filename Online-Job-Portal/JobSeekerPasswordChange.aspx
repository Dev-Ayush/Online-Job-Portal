<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="JobSeekerPasswordChange.aspx.cs" Inherits="JobSeekerPasswordChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/MenuStyling.css" type="text/css" />
    <script type="text/javascript">
        function CompareNewPassword()
        {
           <%-- var first = document.getElementById('#<%=NewPassword.ClientID%>').value;
            var second = document.getElementById('#<%=ConfirmNewPassword.ClientID%>').value;
            if (first != second)
            {
                document.getElementById('#<%=lblpasswordresult.ClientID%>').innerHTML = "Password didn't matched";
            }--%>
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%--Menu Started--%>
    <div id="panel_menu">
    <ul class="nav" style="color:aqua;">
        <li>
            <a href="#">My Account</a>
            <ul>
                <li><a href="JobSeekerProfilePage.aspx">Profile</a></li>
                <li><a href="JobSeekerPasswordChange.aspx">Change Password</a></li>
                <li><a href="#">Notifications</a></li>
                <%--<li><a href="#" id="lg">LogOut</a></li>--%>
            </ul>
        </li>
    </ul>
        </div>
    <br />
    <div id="SignOutButton">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Sign Out</asp:LinkButton>
    </div>
    <%--Menu Ended--%>
    
        <h2>Change Your Password</h2>

        <div id="password_box">
            <table align="center">
                <tr>
                    <td>Old Password</td><td>: </td>
                    <td><asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>New Password</td><td>: </td>
                    <td><asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Confirm password</td><td>: </td>
                    <td><asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Type Same Password in New and Confirm Section" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" ForeColor="Red"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblpasswordresult" runat="server" Text="Label"></asp:Label></td><td></td>
                    <td>
                        <asp:Button ID="brnUpdatePassword" runat="server" Text="Update" OnClick="brnUpdatePassword_Click" OnClientClick="CompareNewPassword();" /></td>
                    <td>&nbsp;</td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </div>
    
</asp:Content>

