<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="New_Recruiter_Register.aspx.cs" Inherits="New_Recruiter_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    #File1 {
        margin-left: 150px;
    }
    .auto-style1 {
        width: 335px;
    }
    .auto-style2 {
        width: 511px;
        height: 540px;
    }
    #container_panel{
        margin-top:50px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="container_panel">
        <table class="auto-style2">
            <center><h2>Add New Recruiter Information</h2></center>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_RecruiterName" Text="Name: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1"><asp:TextBox ID="txtRecruiterRegister_RecruiterName" runat="server" Height="34px" Width="164px" Font-Size="Medium"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_Password" Text="Password: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1"><asp:TextBox ID="txtRecruiterRegister_Password" runat="server" Height="34px" Width="164px" Font-Size="Medium"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_Designation" Text="Designation: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1"><asp:TextBox ID="txtRecruiterRegister_Designation" runat="server" Height="34px" Width="164px" Font-Size="Medium"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_Photo" Text="Photo: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1">
                    <asp:Image ID="Image1" runat="server" Height="98px" Width="82px" />
&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_CompanyName" Text="Company Name: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1"><asp:TextBox ID="txtRecruiterRegister_CompanyName" runat="server" Height="34px" Width="164px" Font-Size="Medium"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_CompanyAddress" Text="Company Address: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1"><asp:TextBox ID="txtRecruiterRegister_CompanyAddress" runat="server" Height="68px" Width="165px" Font-Size="Medium" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_CompanyPhone" Text="Company Phone: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1"><asp:TextBox ID="txtRecruiterRegister_CompanyPhone" runat="server" Height="34px" Width="164px" Font-Size="Medium"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRecruiterRegister_CompanyEmail" Text="Company Email: " runat="server" Font-Size="Medium"></asp:Label></td>
                <td class="auto-style1"><asp:TextBox ID="txtRecruiterRegister_CompanyEmail" runat="server" Height="34px" Width="164px" Font-Size="Medium"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style1">
                    <asp:Button ID="btnRecruiterRegister_Submit" runat="server" Text="Add" OnClick="btnRecruiterRegister_Submit_Click" />
                    &nbsp;&nbsp;
                    <asp:Label ID="lblRecruiterRegister_SuccessMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

