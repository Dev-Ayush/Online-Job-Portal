<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="JobSeekerProfilePage.aspx.cs" Inherits="JobSeekerProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="Scripts/jquery.min.js"></script>
    <script type="text/javascript" src ="Scripts/JobSeekerProfilePage.js"></script>
    
    <link rel="stylesheet" href="css/MenuStyling.css" type="text/css" />

    <script type="text/javascript">
        function btnProfileEdit_Click()
        {
            alert("Hi");
            for (var i = 0; i < document.getElementsByTagName("input").length - 1; i++)
            {
                document.getElementsByTagName("input")[i].setAttribute('Enabled:True');
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="Scripts/JqueryUI/jquery-1.10.2.js"></script>
	<script src="Scripts/JqueryUI/jquery-ui.js"></script>
	<link rel="stylesheet" href="Scripts/JqueryUI/jquery-ui.css"></link>

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

    <script type="text/javascript">
        <%--$(document).ready(function () {
            $('#<%=btnProfileEdit.ClientID%>').click(function () {
                $('input[type=text]').removeAttr('readonly');
            });
        });--%>
    </script>
    <script type="text/javascript">
         $(function () {
            $('#<%=txtProfileDob.ClientID%>').datepicker({ changeMonth: true, changeYear: true });
        });
    </script>

    <style>
        td{
            width:50%;   
        }
        table{
            width:100%;
            border:ridge;
            /*margin-top: 160px;*/
        }
        
    </style>
    
    <asp:Panel ID="Panel1" runat="server">
        <h1>Update Your Profile</h1>
        <table>
            <div id="text-fields">
            <tr>
                <td>
                    <asp:Label ID="lblProfileName" runat="server" Text="Name: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileName" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileAddress" runat="server" Text="Address: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileAddress" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileEmail" runat="server" Text="Email: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileEmail" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfilePhone" runat="server" Text="Phone: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfilePhone" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileDob" runat="server" Text="DOB: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileDob" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileHighqualification" runat="server" Text="Highest Qualification: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileHighqualification" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileSpecialization" runat="server" Text="Specialization: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileSpecialization" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileMarks" runat="server" Text="Marks: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileMarks" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileUniversity" runat="server" Text="University: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileUniversity" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileCertificate" runat="server" Text="Certificate: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileCertificate" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileJobStatus" runat="server" Text="JobStatus: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileJobStatus" runat="server" Font-Size="Medium" Width="266px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblProfileDomain" runat="server" Text="Domain: " Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtProfileDomain" runat="server" Font-Size="Medium" Width="266px" ></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                </td>
                <td>
                    <asp:Label ID="lblProfileUpdateSuccess" Font-Size="Small" runat="server"></asp:Label>
                </td>
            </tr>
        </div>
            <tr>
                <td>
                    <asp:Button ID="btnProfileEdit"  runat="server" Text="Edit" OnClientClick="btnProfileEdit_Click();" />
                    <input id="Button1" type="button" value="EditMyStyle" onclick="btnProfileEdit_Click();" />
                </td>
                <td>
                    <asp:Button ID="btnProfileUpdate" runat="server" Text="Update" OnClick="btnProfileUpdate_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

