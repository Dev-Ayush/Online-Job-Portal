<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="RecruiterLogin.aspx.cs" Inherits="RecruiterLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #container{
            border: 2px solid red;
            border-radius: 5px;
            width:100%;
            margin-top:200px;
        }
        table{
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="container">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblRecruiterLoginUsername" runat="server" Text="Email: " Font-Size="Medium"></asp:Label>
            </td>
            <td></td>
            <td>
                 <asp:TextBox ID="txtRecruiterLoginUsername" Font-Size="Medium" Width="295px" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRecruiterLoginUsername" ErrorMessage="Please Enter Your Email" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="lblRecruiterLoginPassword" Text="Password: " runat="server" Font-Size="Medium"></asp:Label>
            </td>
            <td></td>
            <td>
                <asp:TextBox ID="txtRecruiterLoginPassword" Font-Size="Medium" Width="297px" runat="server" TextMode="Password" style="margin-right: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRecruiterLoginPassword" ErrorMessage="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnLoginSubmit" runat="server" Text="Log In" OnClick="btnLoginSubmit_Click"  />
            </td>
            <td>
                <asp:Label ID="lblLoginUserFailedMessage" Text="" runat="server" Font-Size="Small"></asp:Label>
            </td>
        </tr>

    </table>
        </div>
</asp:Content>

