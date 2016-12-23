<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="JobSeekerPanelPage.aspx.cs" Inherits="JobSeekerPanelPage" %>
<%--MasterPage2.master--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Scripts/jquery.min.js"></script>

    <script src="Scripts/MasterPage2_Menu.js"></script>
    <link rel="stylesheet" href="css/MenuStyling.css" type="text/css" />
    <style>
        /*#Information_Panel{
            border:solid;
        }
        td{
            letter-spacing:5px;
        }
        #panel_menu{
            float:right;
            text-align:right;
            background-color:green;
        }
        #SignOutButton{
            float:right;
            margin-right:25px;
            margin-top:5px;
        }*/
    </style>
    <script>
        $(document).ready(function () {
            
        });
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
    <br />
    <div id="Information_Panel" style="text-align:left;">
         <table>
             <tr>
                 <td style="width:25%;">
                     <asp:Image ID="Image1" runat="server" Height="117px" Width="110px" />
                 </td>
                 <td>
                     <table>
                         <tr>
                             <td>
                                 <asp:Label ID="lblPanelName" runat="server" Text="Name: " Font-Size="Medium"></asp:Label>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtPanelName" runat="server" Font-Size="Medium" Width="162px" ReadOnly="True" Enabled="False"></asp:TextBox>
                             </td>
                         </tr>
                         
                         <tr>
                             <td></td>
                             <td></td>
                         </tr>

                         <tr>
                             <td>
                                 <asp:Label ID="lblPanelEmail" runat="server" Text="Email: " Font-Size="Medium"></asp:Label>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtPanelEmail" runat="server" Font-Size="Medium" Width="162px" ReadOnly="True" Enabled="False"></asp:TextBox>
                             </td>
                         </tr>

                         <tr>
                             <td></td>
                             <td></td>
                         </tr>

                         <tr>
                             <td>
                                 <asp:Label ID="lblPanelPhone" runat="server" Text="Phone: " Font-Size="Medium"></asp:Label>
                             </td>
                             <td>
                                 <asp:TextBox ID="txtPanelPhone" runat="server" Font-Size="Medium" Width="162px" ReadOnly="True" Enabled="False"></asp:TextBox>
                             </td>
                         </tr>
                     </table>
                 </td>
             </tr>
         </table>
    
    </div>
       
    
</asp:Content>

