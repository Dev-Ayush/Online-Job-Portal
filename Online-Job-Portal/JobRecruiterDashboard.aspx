<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="JobRecruiterDashboard.aspx.cs" Inherits="JobRecruiterDashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #Information_Panel,#main_table{
            width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
    
<asp:gridview ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1"
        DataKeyNames="Recruiter_id" EmptyDataText="No Records Have Been Added" OnRowDataBound="OnRowDataBound">
        <Columns>
            <asp:BoundField DataField="Jobposted_id" HeaderText="Job Posted ID" ItemStyle-Width="150" />
            <asp:BoundField DataField="Job_description" HeaderText="Job Description" ItemStyle-Width="150" />
            <asp:BoundField DataField="Job_Posted_Date" HeaderText="Posted Date" ItemStyle-Width="150" />
            <asp:BoundField DataField="Job_Status" HeaderText="Status" ItemStyle-Width="150" />
            <asp:BoundField DataField="No_Vacancies" HeaderText="Number Of Vacancies" ItemStyle-Width="150" />
            <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" />
        </Columns>
</asp:gridview>

<table border="1" style="border-collapse:collapse">
        <tr>
            <td>
                Description: <br />
                <asp:textbox id="txt_Dashboard_Description" runat="server"></asp:textbox>
            </td>
            <td>
                Date: <br />
                <asp:textbox id="txt_Dashboard_Date" runat="server"></asp:textbox>
            </td>
            <td>
                Status: <br />
                <asp:dropdownlist id="txt_Dashboard_Status" runat="server">
                    <asp:ListItem>Fresher</asp:ListItem>
                    <asp:ListItem>Experienced</asp:ListItem>
                </asp:dropdownlist>
            </td>
            <td>
                Vacancies: <br />
                <asp:textbox id="txt_Dashboard_Vacancies" runat="server"></asp:textbox>
            </td>
            <td>
                <asp:button id="btn_Dashboard_AddNewJobData" runat="server" text="Add" onClick="Insert" />
            </td>
        </tr>
    </table>

    

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
    SelectCommand="SELECT Jobposted_id,Job_description,Job_Posted_Date,Job_Status,No_Vacancies FROM JobPosted WHERE Recruiter_id=@Recruiter_id"
    InsertCommand="INSERT INTO JobPosted VALUES(@desc,@date,@status,@no_of_vac)"
    UpdateCommand="UPDATE JobPosted SET Job_description=@desc, Job_Posted_Date=@date, Job_Status=@status, No_Vacancies=@no_of_vac WHERE Recruiter_id=@Recruiter_id"
    DeleteCommand="DELETE FROM JobPosted WHERE Recruiter_id=@Recruiter_id"
    >
    <InsertParameters>
        <asp:ControlParameter Name="Job_description" ControlID="txt_Dashboard_Vacancies" Type="String" />
        <asp:ControlParameter Name="Job_Posted_Date" ControlID="txt_Dashboard_Date" Type="String" />
        <asp:ControlParameter Name="Job_Status" ControlID="txt_Dashboard_Status" Type="String" />
        <asp:ControlParameter Name="No_Vacancies" ControlID="txt_Dashboard_Vacancies" Type="String" />
        <asp:SessionParameter Name="r_idd" SessionField="@Recruiter_id" Type="Int32"/>
    </InsertParameters>
    
    <SelectParameters>
        <asp:SessionParameter Name="r_idd" SessionField="@Recruiter_id" Type="Int32"/>
    </SelectParameters>

    <UpdateParameters>
        <asp:Parameter Name="Recruiter_id" Type="Int32" />
        <asp:Parameter Name="Job_description" Type="String" />
        <asp:Parameter Name="Job_Posted_Date" Type="String" />
        <asp:Parameter Name="Job_Status" Type="String" />
        <asp:Parameter Name="No_Vacancies" Type="String" />
        <asp:SessionParameter Name="r_idd" SessionField="@Recruiter_id" Type="Int32"/>
    </UpdateParameters>

    <DeleteParameters>
        <asp:Parameter Name="Recruiter_id" Type="Int32" />
        <asp:SessionParameter Name="r_idd" SessionField="@Recruiter_id" Type="Int32"/>
    </DeleteParameters>
</asp:SqlDataSource>
</asp:Content>