<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ViewRecruiters.aspx.cs" Inherits="ViewRecruiters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        td{
            column-span:2px;
            text-align:center;
        }
        #table_box{
            width:350px;
            height:200px;
            border:solid;
        }
        .table{
            text-align:center;
            width:350px;
            height:200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:DataList ID="DataList1" runat="server" CellSpacing="3" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="3">
        <ItemTemplate>
            <div id="table_box">
                <table class="table">
                <tr>
                    <td>
                        <%--<%# Eval("Recruiter_photo") %><br />--%><%--Eval("Recruiter_photo")--%>
                            <asp:Image runat="server" ImageURL='<%# Eval("Recruiter_photo","~/Uploaded_Images/{0}") %>' Height="98px" Width="82px" ></asp:Image>                            
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <%# Eval("Recruiter_name") %><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <%# Eval("Recruiting_company") %><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Posted Job" />
                    </td>
                    
                </tr>
            </table>
            </div>
            
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\JobPortal.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM JobRecruiter"></asp:SqlDataSource>

</asp:Content>

