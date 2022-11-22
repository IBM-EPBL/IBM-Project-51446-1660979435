<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master"  AutoEventWireup="true" CodeFile="CustomerFeedBack.aspx.cs" Inherits="Admin_CustomerFeedBack" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/BrowseFile.ascx" TagName="BrowseFile" TagPrefix="Uc1"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#003366" runat="server" Text="Customer FeedBack"
                Style="font-size: small; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="ddlFeedBackId" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnShowAll" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCloseGrid" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btncancel" EventName="Click" />
               <asp:PostBackTrigger ControlID="BrowseFile1" />
               </Triggers>
                <ContentTemplate>
                    <table style="border: thin solid #cccc00; background-color:#CCCC00; width: 657px; ">
                        <tr>
                            <td  colspan="2">
                                <b>Select the mode of operation you want </b>
                            </td>
                            </tr>
                            <tr>
                            <td >
                                <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" 
                                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem>Add New Record
                                    </asp:ListItem>
                                    <asp:ListItem>Modify Old Record</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="text-align: left" >
                                <asp:DropDownList ID="ddlFeedBackId" Enabled="False" runat="server" Height="44px"
                                    Width="120px"  AutoPostBack="True" onselectedindexchanged="ddlFeedBackId_SelectedIndexChanged1" 
                                    >
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            
                    <table style="border: thin solid #cccc00; background-color: Window;  width: 657px;">
                        
                       <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right" >CustomerId</td>
                        <td align="left">
                        <asp:DropDownList ID="ddlCustomerId" runat="server" Width="153px"></asp:DropDownList>
                        </td>
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">FeedBack Date</td>
                        <td  align="left"><asp:TextBox ID="txtFeedBackDate" runat="server" 
                                style="margin-left: 0px"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtFeedBackDate_CalendarExtender1" runat="server" TargetControlID="txtFeedBackDate">
                            </cc1:CalendarExtender>
                                </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="*" ControlToValidate="txtFeedBackDate"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                         <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right" valign="top" >Feedback Text</td>
                        <td align="left">
                        <asp:TextBox ID="txtFeedBackText" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFeedBackText"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">EmailId</td>
                        <td align="left">
                           <asp:TextBox ID="txtEmailId" runat="server"></asp:TextBox>
                            </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtEmailId"></asp:RequiredFieldValidator>
                        </td> 
                        </tr>
                        
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                      <tr>
                        <td align="right">FeedBack Voice File</td>
                        <td align="left">
                        <Uc1:BrowseFile ID="BrowseFile1" runat="server" />
                            </td>
                        <td>
                            </td> 
                        </tr>
                     <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">ComplaintRegistrationId</td>
                        <td align="left">
                           <asp:DropDownList ID="ddlComplaintRegistrationId" runat="server" Width="153px"></asp:DropDownList>
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
                        <tr>
                            <td colspan="3"  align="left" style="background-color:#cccc00">
                            </td>
                        </tr>
                         <tr>
                    <td colspan="3">
                        <asp:GridView AutoGenerateColumns="False" ID="grdAllCustomerFeedBack" runat="server" 
                            Width="300px" CellPadding="2" ForeColor="Black" GridLines="None" 
                            AllowPaging="True" PageSize="5" 
                             BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" 
                            >
                            <FooterStyle BackColor="Tan" />
                        <Columns>
                        <asp:TemplateField HeaderText="CustomerId">
                        <ItemTemplate >
                        <asp:Label ID="lblCustomerId" runat="server" Text='<%#Eval("CustomerId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FeedBackDate">
                        <ItemTemplate >
                        <asp:Label ID="lblFeedBackDate" runat="server" Text='<%#Eval("FeedBackDate")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FeedBackText">
                        <ItemTemplate >
                        <asp:Label ID="lblText" runat="server" Text='<%#Eval("FeedBackText")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EmailId">
                        <ItemTemplate >
                        <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("EmailId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="VoiceFile">
                        <ItemTemplate >
                        <asp:Label ID="lblVoiceFile" runat="server" Text='<%#Eval("FeedBackVoiceFile")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FileName">
                        <ItemTemplate >
                        <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("VoiceFileName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ComplaintRegistrationId">
                        <ItemTemplate >
                        <asp:Label ID="lblComplaintRegistrationId" runat="server" Text='<%#Eval("ComplaintRegistrationId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                  
                       </Columns>
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                <td colspan="3">
                    <asp:Button BorderColor="#CCCC00" BackColor="#797A80" ID="btnCloseGrid" 
                        runat="server" Text="Close" Height="21px" 
                        Width="90px" CausesValidation="False" onclick="btnCloseGrid_Click" />
                </td>
                </tr>
                        </table>
                       <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
    </div>
</asp:Content>


