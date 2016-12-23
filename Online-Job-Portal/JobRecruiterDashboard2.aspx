<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="JobRecruiterDashboard2.aspx.cs" Inherits="JobRecruiterDashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link type="text/css" rel="stylesheet" href="css/Dashboard2.css" />
    <style>
        /*#Information_Panel,#main_table{
            width:100%;
        }*/
    </style>
    
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="Scripts/JqueryUI/jquery-1.10.2.js"></script>
	<script src="Scripts/JqueryUI/jquery-ui.js"></script>
	<link rel="stylesheet" href="Scripts/JqueryUI/jquery-ui.css"></link>
    <script type="text/javascript">
        $(function () {
            $('#<%=txt_Dashboard2_JobPostedDate.ClientID%>').datepicker({ changeMonth: true, changeYear: true });
        });
    </script>

    <div id="Information_Panel">
        <table id="main_table">
            <tr>
                <td>
                    <asp:image ID="Dashboard_Recruiter_photo" runat="server" Height="133px" Width="106px"></asp:image>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblDashboard_Name" runat="server" Text="" Font-Size="Medium"></asp:Label>
                            </td>
                        </tr>
                        <tr><td></td></tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDashboard_Company" runat="server" Text="" Font-Size="Medium"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <asp:button ID="btn_Dashboard_Edit" runat="server" text="Edit Profile" />
                    &nbsp;&nbsp;
                    <asp:button ID="btn_Dashboard_Change_Password" runat="server" text="Change Password" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:button ID="btn_Dashboard_Logout" runat="server" text="LogOut" />
                </td>
            </tr>
        </table>
    </div>
    <br />

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Jobposted_id" EmptyDataText="No records has been added." OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" 
        OnRowUpdating="OnRowUpdating" OnRowDataBound="OnRowDataBound" OnRowDeleting="OnRowDeleting" >
        <Columns>
            <asp:TemplateField HeaderText="Job Posted ID" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lbl_Dashboard2_JobPostedID" runat="server" Text='<%# Eval("Jobposted_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Dashboard2_JobPostedID" runat="server" Text='<%# Eval("Jobposted_id") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lbl_Dashboard2_Description" runat="server" Text='<%# Eval("Job_description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Dashboard2_Description" runat="server" Text='<%# Eval("Job_description") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Posted Date" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lbl_Dashboard2_JobPostedDate" runat="server" Text='<%# Eval("Job_Posted_Date") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Dashboard2_JobPostedDate" runat="server" Text='<%# Eval("Job_Posted_Date") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Status" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lbl_Dashboard2_JobPostedStatus" runat="server" Text='<%# Eval("Job_Status") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Dashboard2_JobPostedStatus" runat="server" Text='<%# Eval("Job_Status") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Number Of Vacancies" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lbl_Dashboard2_JobPostedVacancies" runat="server" Text='<%# Eval("No_Vacancies") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Dashboard2_JobPostedVacancies" runat="server" Text='<%# Eval("No_Vacancies") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150"/>
        </Columns>
</asp:GridView>

    <table border="1"  style="border-collapse:collapse">
        <tr>
            <td style="width:150px"></td>
            <td style="width:150px">
                Description<br />
                <asp:TextBox ID="txt_Dashboard2_Description" runat="server" Width="140"></asp:TextBox>
            </td>
            <td style="width:150px">
                Posted Date<br />
                <asp:TextBox ID="txt_Dashboard2_JobPostedDate" runat="server" Width="140"></asp:TextBox>
            </td>
            <td style="width:150px">
                Status<br />
                <%--<asp:TextBox ID="txt_Dashboard2_JobPostedStatus" runat="server" Width="140"></asp:TextBox>--%>
                <asp:dropdownlist ID="txt_Dashboard2_JobPostedStatus" runat="server" Width="140">
                    <asp:ListItem>Fresher</asp:ListItem>
                    <asp:ListItem>Experienced</asp:ListItem>
                </asp:dropdownlist>
            </td>
            <td style="width:150px">
                Vacancies<br />
                <asp:TextBox ID="txt_Dashboard2_JobPostedVacancies" runat="server" Width="140"></asp:TextBox>
            </td>
            <td style="width:150px">
                <asp:Button ID="btn_Dashboard2_Add" runat="server" Text="Add" OnClick="Insert"></asp:Button>
            </td>
        </tr>
    </table>

</asp:Content>

