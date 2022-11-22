<%@ Page Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="CustomerRegistration.aspx.cs" Inherits="CustomerRegistration" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="width: 344px; height: 416px;">
 <br />
 <br />
 
 <asp:Label ID="lblCsuRegistration" runat="server" Text="Customer Registration" 
                            Font-Bold="True" Font-Size="Large" ForeColor="#003366"></asp:Label>
                            <br />
 <br />
        <div>
            <table style="border: thin solid #FF00FF; height: 326px; width: 324px;">
               
                <tr>
                    <td valign="top">
                         Name<span style="color:Red">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCustomerName" runat="server" 
                            ValidationGroup="g" Font-Size="Small"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerName"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date Of Birth<span style="color:Red">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCustomerDOB" runat="server" 
                            ValidationGroup="g" Font-Size="Small"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtCustomerDOB_CalendarExtender1" runat="server" TargetControlID="txtCustomerDOB">
                        </cc1:CalendarExtender>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerDOB"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                         PhoneNo<span style="color:Red">*</span>
                    </td>
                    <td >
                        <asp:TextBox ID="txtPhoneNo"  runat="server" 
                            ValidationGroup="g" Font-Size="Small"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhoneNo"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td> 
                        EmailId<span style="color:Red">*</span>
                    </td>
                    <td>
                      <asp:TextBox ID="txtEmailId"  runat="server" 
                            ValidationGroup="g" Font-Size="Small"></asp:TextBox> 
                    </td> 
                    <td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmailId"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                    </td>
                        
                </tr>
                <tr>
                    <td>
                         Desc<span style="color:Red">*</span>
                    </td>
                    <td>
                       <asp:TextBox ID="txtDesc"  runat="server" TextMode="MultiLine"
                            ValidationGroup="g" Font-Size="Small" Width="153px"></asp:TextBox> 
                            </td> 
                            <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDesc"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                            </td>
                </tr>
                 
                 <tr>
                    <td>
                         Address<span style="color:Red">*</span>
                    </td>
                    <td>
                       <asp:TextBox ID="txtAddress"  runat="server" TextMode="MultiLine"
                            ValidationGroup="g" Font-Size="Small" Width="153px"></asp:TextBox> 
                        
                            
                            </td> 
                            <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress"
                            ErrorMessage="RequiredFieldValidator" ValidationGroup="g">*</asp:RequiredFieldValidator>
                            </td>
                </tr>
                 <tr>
            <td>
            User Name<span style="color:Red">*</span>
            </td>
            <td>
            <asp:TextBox ID="txtUserName"  runat="server" />
            </td>
            <td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUserName"
                            ErrorMessage="*" ValidationGroup="g"></asp:RequiredFieldValidator>
            </td>
            </tr>
              <tr>
            <td>
          Password<span style="color:Red">*</span>
            </td>
            <td>
            <asp:TextBox ID="txtPassword"  runat="server" TextMode="Password" />
            </td>
            <td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="*" ValidationGroup="g"></asp:RequiredFieldValidator>
            </td>
            </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnSubmit" runat="server" Height="24px"  Text="Submit"
                            Width="55px" ValidationGroup="g" BackColor="#003366" 
                            BorderColor="#003366" Font-Bold="True" ForeColor="White" 
                            onclick="BtnSubmit_Click" />
                        
                    </td>
                    <td>
                    </td>
                </tr>
                 <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
            </table>
            </div> 
            
            
       
        
    </center>
</asp:Content>

