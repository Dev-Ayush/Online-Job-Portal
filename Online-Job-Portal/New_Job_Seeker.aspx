<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="New_Job_Seeker.aspx.cs" Inherits="New_Job_Seeker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script src="Scripts/New_Job_Seeker_Job_Skill_Data.js"></script>
    <script src="Scripts/JqueryUI/jquery-1.10.2.js"></script>
	<script src="Scripts/JqueryUI/jquery-ui.js"></script>
	<link rel="stylesheet" href="Scripts/JqueryUI/jquery-ui.css"></link>
    <script type="text/javascript">
        
    function disableTextbox123() {
    alert("Hello");
    debugger;
    var textBoxID = document.getElementById('<%= txtProficiency.ClientID %>');
    var chechboxID = document.getElementById('<%= CheckBoxFresher.ClientID %>');
    alert(textBoxID);
    if (chechboxID.checked)
    {
        textBoxID.disabled = true;
    }
    else {
        textBoxID.disabled = false;
    }
}
    </script>
    <script type="text/javascript">

        var validFileTypes = ["pdf", "docx", "doc"];
        function ValidateFile()
        {
            var file = document.getElementById('<%=FileUpload2.ClientID%>');
            var label = document.getElementById('<%=lblresumeUploadStatus.ClientID%>');
            var path = file.value;
            var extension = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
            var isValidFile = false;
            for (var i=0;i<validFileTypes.length;i++)
            {
                if(extension==validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if(!isValidFile)
            {
                label.style.color = "red";
                label.innerHTML = "Invalid File. Please Upload a file with" + "extension: \n\n" + validFileTypes.join(",");
            }
            else
            {
                label.style.color = "green";
                label.innerHTML = "File Uploaded Successfully !";
            }
            return isValidFile;
        }

    </script>
    <script type="text/javascript">
        $(function () {
            $('#<%=txtDateOfBirth.ClientID%>').datepicker({ changeMonth: true, changeYear: true });
        });
    </script>


    <p style="width: 100%">
        <asp:Wizard ID="Wizard1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="446px" style="margin-top: 61px" Width="100%" ActiveStepIndex="0" HeaderText="Job Seeker Information" OnFinishButtonClick="Wizard1_FinishButtonClick">
            <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="#CCFFFF" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <SideBarButtonStyle BackColor="#507CD1" Width="100px" Font-Names="Verdana" ForeColor="White" />
            <SideBarStyle BackColor="#507CD1" Font-Size="Small" VerticalAlign="Top" Width="50px" BorderStyle="Ridge" BorderWidth="5px" Font-Bold="False" Font-Names="Arial" />
            <StepStyle Font-Size="0.8em" ForeColor="#333333" />
            <WizardSteps>
                <asp:WizardStep runat="server" title="Personal Information">
                    <div id="Panel1" style="height:347px; text-align:left;width:100%;">
                        <table style="width: 100%;">
                            <tr>
                                <td><asp:Label ID="lblName" runat="server" Text="Name: " Font-Size="Medium"></asp:Label></td>
                                <td><asp:TextBox ID="txtName" runat="server" Font-Size="Medium" Width="162px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblAddress" runat="server" Text="Address" Font-Size="Medium"></asp:Label></td>
                                <td><asp:TextBox ID="txtAddress" runat="server" Height="34px" Width="164px" Font-Size="Medium"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblEmail" runat="server" Text="Email: " Font-Size="Medium"></asp:Label></td>
                                <td><asp:TextBox ID="txtEmail" runat="server" Font-Size="Medium" Width="166px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblPhone" runat="server" Text="Phone: " Font-Size="Medium"></asp:Label></td>
                                <td><asp:TextBox ID="txtPhone" runat="server" Font-Size="Medium" Width="164px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblGender" runat="server" Font-Size="Medium" Text="Select Gender:"></asp:Label></td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="Medium" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblDateOfBirth" runat="server" Font-Size="Medium" Text="Date Of Birth: "></asp:Label></td>
                                <td><asp:TextBox ID="txtDateOfBirth" runat="server" Font-Size="Medium" Width="162px"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblPassword" runat="server" Font-Size="Medium" Text="Password: "></asp:Label></td>
                                <td><asp:TextBox ID="txtPassword" runat="server" Font-Size="Medium" Width="162px" TextMode="Password"></asp:TextBox></td>
                                
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblPhoto" runat="server" Font-Size="Medium" Text="Upload Photo "></asp:Label></td>
                                <td><asp:FileUpload ID="FileUpload1" runat="server" Font-Size="Medium" Width="275px" OnLoad="FileUpload1_Load" /></td>
                                <td><asp:Image ID="Image1" runat="server" Height="95px" Width="127px" /></td>
                                
                            </tr>
                        </table>
                    </div>
                </asp:WizardStep>



                <asp:WizardStep runat="server" title="Academic Information">
                    <div id="Panel2" style="height:347px; text-align:left;width:100%;">

                        <table style="width: 100%;">
                            <tr>
                                <td><asp:Label ID="lblHighestQualification" runat="server" Font-Size="Medium" Text="Highest Qualification: "></asp:Label></td>
                                <td><asp:DropDownList ID="DropDownListQualification" runat="server" Font-Size="Medium" Height="24px" Width="203px"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblspecilization" runat="server" Font-Size="Medium" Text="Specilization: "></asp:Label></td>
                                <td><asp:TextBox ID="txtSpecilization" runat="server" Font-Size="Medium" Width="197px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblMarksObtained" runat="server" Font-Size="Medium" Text="Marks Obtained: "></asp:Label></td>
                                <td><asp:TextBox ID="txtMarksObtained" runat="server" Font-Size="Medium" Width="197px"></asp:TextBox></td>
                                <td><asp:Label ID="lblInPercentage" runat="server" Font-Italic="True" Font-Size="X-Small" Text="In Percentage"></asp:Label></td>
                            </tr>
                            <%--<tr>
                                <td><asp:Label ID="lblYearOfPassing" runat="server" Font-Size="Medium" Text="Year Of Passing: "></asp:Label></td>
                                <td><asp:DropDownList ID="DropDownListYearRange" runat="server" Font-Size="Medium" Height="23px" Width="215px"></asp:DropDownList></td>
                            </tr>--%>
                            <tr>
                                <td><asp:Label ID="lblBoard" runat="server" Font-Size="Medium" Text="Board / University: "></asp:Label></td>
                                <td><asp:TextBox ID="txtBoard" runat="server" Font-Size="Medium" Width="205px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="lblCertification" runat="server" Font-Size="Medium" Text="Any Other Certification: "></asp:Label></td>
                                <td><asp:TextBox ID="txtCertification" runat="server" Font-Size="Medium" Width="203px"></asp:TextBox></td>
                            </tr>
                        </table>

                    </div>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Job Skill Data">
                    <div id="Panel3" style="width:100%; text-align:left; height:347px">
                        <table style="width: 100%;">
                            <tr>
                                <td><asp:CheckBox ID="CheckBoxFresher" runat="server" Font-Size="Medium" Checked="false" OnClick="disableTextbox(this.id);" OnCheckedChanged="CheckBoxFresher_CheckedChanged" Text="Apply As Fresher" TextAlign="Left" /></td>   
                            </tr>
                            
                            <table id="employer_panel" style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDomain" runat="server" Font-Size="Medium" Text="Domain: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownListDomain" runat="server" Font-Size="Medium" Height="18px" Width="242px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblProficiency" runat="server" Font-Size="Medium" Text="Proficiency: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProficiency" runat="server" Font-Size="Medium" Width="241px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblExpirienced" runat="server" Font-Size="Medium" Text="Expirienced In: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtExpirienced" runat="server" Font-Size="Medium" Width="197px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWorkingPeriod" runat="server" Font-Size="Medium" Text="Working Period: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWorkingPeriod" runat="server" Font-Size="Medium" Width="198px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCurrentlyWorking" runat="server" Font-Size="Medium" Text="Currently Working: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxYes" runat="server" Font-Size="Medium" Text="Yes" />
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="CheckBoxNo" runat="server" Font-Size="Medium" Text="No" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblEmployerName" runat="server" Font-Size="Medium" Text="Employer Name: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmployerName" runat="server" Font-Size="Medium" Width="204px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                                
                        </table>
                        
                    </div>
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Job Seeking Data">
                    <div id="Panel4" style="text-align:left;width:100%;">
                        <table style="width:100%;">
                        <tr>
                            <td style="width:25%">
                                <asp:Label ID="lblDomain2" runat="server" Font-Size="Medium" Text="Domain: "></asp:Label>
                            </td>
                            
                            <td>
                                <asp:DropDownList ID="DropDownListDomain2" runat="server" Font-Size="Medium" Height="18px" Width="242px">
                        </asp:DropDownList>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                            </td>                        
                            <td><asp:Label ID="lblapplyingProficiency" runat="server" Font-Size="Medium" Text="Applying Profociency:  "></asp:Label>
                                <asp:TextBox ID="txtapplyingProficiency" runat="server" Font-Size="Medium" Width="204px"></asp:TextBox>
                            </td>
                        </tr>

                            <tr>
                                <td>
                                    <asp:Label ID="lblResume" runat="server" Font-Size="Medium" Text="Upload Resume: "></asp:Label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload2" runat="server" Font-Size="Medium" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%--<asp:Button ID="btnresumeUpload" runat="server" OnClientClick="return ValidateFile()" Text="Upload" />--%>
                                    <input id="btnFileUpload2_html" type="button" onclick="return ValidateFile()" value="Upload" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Label ID="lblresumeUploadStatus" runat="server" Font-Size="Small"></asp:Label>
                                </td>
                            </tr>
                            </tr>

                    </table>
                    </div>
                    
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
        <br />
    </p>
</asp:Content>

