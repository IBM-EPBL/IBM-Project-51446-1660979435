<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master" AutoEventWireup="true" CodeFile="CustomerComplaintRegistration .aspx.cs" Inherits="Employee_CustomerComplaintRegistration_" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/BrowseFile.ascx" TagName="BrowseFile" TagPrefix="Uc1"%>
<%@ Register Src="~/UserControls/BrowseFile1.ascx" TagName="BrowseFile1" TagPrefix="Uc2"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="width: 953px">
    <br />
    <asp:Label ID="lblHeading" ForeColor="#004B97" 
                runat="server" Text="Complaints Registration"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
        
                    <div style="width: 54%; height: 445px;">
                        <table style="width: 105%">
                            
                            <tr>
                                <td style="color: black" align="right">
                                    Registration Date
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtRegistrationDate" runat="server">
                                    </asp:TextBox>
                                    <cc1:CalendarExtender ID="txtRegistrationDate_CalendarExtender1" runat="server" TargetControlID="txtRegistrationDate">
                                    </cc1:CalendarExtender> 
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRegistrationDate"
                                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td  style="color: black"  align="right">
                                    Registration Time
                                </td>
                         
                                   <td align="left">
                                    <asp:DropDownList ID="ddlHrs" runat="server">
                                        <asp:ListItem>00</asp:ListItem>
                                        <asp:ListItem>01</asp:ListItem>
                                        <asp:ListItem>02</asp:ListItem>
                                        <asp:ListItem>03</asp:ListItem>
                                        <asp:ListItem>04</asp:ListItem>
                                        <asp:ListItem>05</asp:ListItem>
                                        <asp:ListItem>06</asp:ListItem>
                                        <asp:ListItem>07</asp:ListItem>
                                        <asp:ListItem>08</asp:ListItem>
                                        <asp:ListItem>09</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlMins" runat="server">
                                        <asp:ListItem>00</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>40</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlAm" runat="server">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>AM</asp:ListItem>
                                        <asp:ListItem>PM</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </td>
                                
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="color: black" valign="top" align="right">
                                    CustomerId
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlCustomerId" runat="server" Width="153px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCustomerId"
                                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: black" valign="top" align="right">
                                    Ser.Cust.DomainId
                                </td>
                                 <td align="left">
                                    <asp:DropDownList ID="ddlServiceCustomerDomainId" runat="server" Width="153px">
                                    </asp:DropDownList>
                                </td>
                                <td class="style5">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlServiceCustomerDomainId"
                                        ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                 <td align="right">
                                    PhoneNo
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtPhoneNo" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">
                                    Text Complaint
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtComplaint" runat="server" Height="49px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtComplaint" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                               <td align="right">
                                    EmployeeId
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlEmpId" runat="server" Width="153px">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" InitialValue="Select"
                                        ControlToValidate="ddlEmpId" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                   VoiceTextFile
                                </td>
                                <td align="left">
                                    <Uc1:BrowseFile ID="BrowseFile" runat="server" />
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                               <td align="right">
                                    Comp. Status
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtStatus" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                 <td align="right">
                                    Comp. Escalated Status
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtEscalatedStatus" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtEscalatedStatus" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Count Escalation
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtCount" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtCount" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                 <td align="right" valign="top">
                                    Response Text
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtResponseText" runat="server" Height="44px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtResponseText" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Response VoiceFile
                                </td>
                                <td align="left">
                                    <Uc2:BrowseFile1 ID="BrowseFile2" runat="server" />
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                             <td align="right">
                                    ComplaintSeverity
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtSeverity" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtSeverity" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2" class="style20">
                                    <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                                        ValidationGroup="g" BackColor="#FF9900" BorderColor="#FF9900" 
                                        Font-Bold="True" />
                                    <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Cancel"
                                        BackColor="#FF9900" BorderColor="#FF9900" Font-Bold="True" 
                                        Font-Size="Small" />
                                                                   </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
             
            
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF5050"></asp:Label>
               
    </center>
</asp:Content>

