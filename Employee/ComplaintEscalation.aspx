<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master" AutoEventWireup="true" CodeFile="ComplaintEscalation.aspx.cs" Inherits="Employee_ComplaintEscalation" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/BrowseFile.ascx" TagName="BrowseFile" TagPrefix="Uc1"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#003366" 
                runat="server" Text="Complaint Escalation"
                Style="font-size: small; font-weight: 700; font-family: Verdana" 
                Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="ddlComplaintEscalationId" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnShowAll" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCloseGrid" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btncancel" EventName="Click" />
               <asp:PostBackTrigger  ControlID="BrowseFile1" />
               <asp:PostBackTrigger ControlID="BrowseFile2" />
               </Triggers>
                <ContentTemplate>
                    <table style="border: thin solid #cccc00; background-color:#CCCC00; width: 489px; height: 60px;">
                        <tr>
                            <td  colspan="2">
                                <b>Select the mode of operation you want </b>
                            </td>
                            </tr>
                            <tr>
                            <td >
                                <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Add New Record
                                    </asp:ListItem>
                                    <asp:ListItem>Modify Old Record</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="text-align: left" >
                                <asp:DropDownList ID="ddlComplaintEscalationId" Enabled="False" 
                                    runat="server" Height="44px"
                                    Width="120px" AutoPostBack="True" onselectedindexchanged="ddlComplaintEscalationId_SelectedIndexChanged"  
                                    >
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            
                    <table style="border: thin solid #cccc00; background-color: Window;  width: 489px; height: 594px;">
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">Escalation Date</td>
                        <td align="left"><asp:TextBox ID="txtEscalationDate" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtEscalationDate_CalendarExtender1" runat="server" TargetControlID="txtEscalationDate">
                            </cc1:CalendarExtender>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtEscalationDate"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">Escalation Time</td>
                        <td  align="left">
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
                        <asp:TextBox ID="txtEscalationTime" runat="server"></asp:TextBox> 
                        </td> 
                        <td>
                        
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">Complaint RegistrationId</td>
                        <td  align="left">
                           <asp:DropDownList ID="ddlComplaintRegistrationId" runat="server" Height="16px" Width="148px"></asp:DropDownList>
                            </td>
                        <td>
                        </td> 
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                          <tr>
                        <td align="right">Employee Id</td>
                        <td align="left">
                           <asp:DropDownList ID="ddlEmpId" runat="server" Height="16px" Width="149px"></asp:DropDownList>
                            </td>
                        <td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">Complaint Esacalation Text</td>
                        <td align="left">
                           <asp:TextBox ID="txtEscalationText" runat="server" Height="49px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtEscalationText"></asp:RequiredFieldValidator>
                        </td> 
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">PhoneNo</td>
                        <td align="left">
                           <asp:TextBox ID ="txtPhoneNo" runat="server" ></asp:TextBox> 
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneNo"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        
                         <tr>
                        <td align="right">Voice Text File Of Complaint</td>
                        <td align="left">
                            <Uc1:BrowseFile ID="BrowseFile1" runat="server" />
                            </td>
                        <td>
                        </td> 
                        </tr>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                         <tr>
                        <td align="right">Complaint Response Text</td>
                        <td align="left">
                           <asp:TextBox ID="txtResponseText" runat="server" Height="44px" 
                                TextMode="MultiLine"></asp:TextBox>
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtResponseText"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                         <tr>
                        <td align="right">Complaint Response Voice</td>
                        <td align="left">
                           <Uc1:BrowseFile ID="BrowseFile2" runat="server" />
                            </td>
                        <td>
                        </td> 
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>
                        <asp:Button ID="btnShowAll" Text="ShowAll" BorderColor="#CCCC00" 
                                    BackColor="#797A80" ForeColor="White"  runat="server" Width="95px" 
                                onclick="btnShowAll_Click" CausesValidation="False" />
                        </td>
                        <td colspan="2" style="text-align: right; font-weight: 700;">
                                &nbsp;&nbsp;
                                <asp:Button ID="btnSubmit" BorderColor="#CCCC00" 
                                    BackColor="#797A80" ForeColor="White" runat="server"
                                    Text="Submit" Height="25px" Width="124px" OnClick="btnSubmit_Click" 
                                    Enabled="False" />&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btncancel" BorderColor="#CCCC00" ForeColor="White" 
                                    BackColor="#797A80" runat="server"
                                    Text="Cancel" Height="25px" Width="60px" OnClick="btncancel_Click" 
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        
                  
                        </table>
                        <div style="width: 483px; overflow:scroll;" id="divEscalation" runat="server" visible="false">
                        <asp:GridView AutoGenerateColumns="False" ID="grdAllComplaintEscalation" runat="server" 
                            Width="137px" CellPadding="2" ForeColor="Black" GridLines="None" 
                            AllowPaging="True" PageSize="5" 
                            BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" 
                                onpageindexchanging="grdAllComplaintEscalation_PageIndexChanging" Height="170px" 
                            >
                            <FooterStyle BackColor="Tan" />
                        <Columns>
                        <asp:TemplateField HeaderText="EscalationDate">
                        <ItemTemplate >
                        <asp:Label ID="lblDate" runat="server" Text='<%#Eval("ComplaintEscalationDate")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EscalationTime">
                        <ItemTemplate >
                        <asp:Label ID="lblTime" runat="server" Text='<%#Eval("ComplaintEscalationTime")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ComplaintRegistrationId">
                        <ItemTemplate >
                        <asp:Label ID="lblComplaintRegistrationId" runat="server" Text='<%#Eval("ComplaintRegistrationId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EmpId">
                        <ItemTemplate >
                        <asp:Label ID="lblEmpId" runat="server" Text='<%#Eval("EmployeeId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="EscalationText">
                        <ItemTemplate >
                        <asp:Label ID="lblEscalationText" runat="server" Text='<%#Eval("ComplaintEscalationText")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="PhoneNo">
                        <ItemTemplate >
                        <asp:Label ID="lblPhoneNo" runat="server" Text='<%#Eval("PhoneNo")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                          
                        <asp:TemplateField HeaderText="VoiceText">
                        <ItemTemplate >
                        <asp:Label ID="lblVoiceText" runat="server" Text='<%#Eval("VoiceTextFileOfComplaint")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TextFile">
                        <ItemTemplate >
                        <asp:Label ID="lblTextFile" runat="server" Text='<%#Eval("VoiceTextFile")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ResponseText">
                        <ItemTemplate >
                        <asp:Label ID="lblTextFile" runat="server" Text='<%#Eval("ComplaintResponseText")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="VoiceFile">
                        <ItemTemplate >
                        <asp:Label ID="lblTextFile" runat="server" Text='<%#Eval("ComplaintResponseVoiceFile")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="VoiceFileName">
                        <ItemTemplate >
                        <asp:Label ID="lblTextFile" runat="server" Text='<%#Eval("VoiceFileName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                       </Columns>
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        </asp:GridView>
                        <asp:Button BorderColor="#CCCC00" BackColor="#797A80" ID="btnCloseGrid" 
                        runat="server" Text="Close" Height="21px" 
                        Width="90px" CausesValidation="False" onclick="btnCloseGrid_Click" />
                        </div>
                       <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
    </div>
</asp:Content>



