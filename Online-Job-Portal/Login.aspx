<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .login_panel{
            border-style:inset;
            width:100%;
            
            /*border-bottom: 1px solid ;*/
            margin-top: 200px;
        }
        td{
            width:75%;
            height:50%;
            white-space:nowrap;
        }
        .auto-style1 {
            width: 50%;
        }
    </style>
    <div class="login_panel">
        <table style="width: 100%">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblLoginUserEmail" runat="server" Text="Email: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLoginEmail" Font-Size="Medium" Width="295px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblLoginUserPassword" Text="Password: " runat="server" Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLoginPassword" Font-Size="Medium" Width="297px" runat="server" TextMode="Password" style="margin-right: 0px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblLoginUserFailedMessage" Text="" runat="server" Font-Size="Small"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnLoginSubmit" runat="server" Text="Log In" OnClick="btnLoginSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

