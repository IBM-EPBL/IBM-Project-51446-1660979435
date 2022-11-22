<%@ Page Language="C#" MasterPageFile="~/Customers/ServiceMaster.master"  AutoEventWireup="true" CodeFile="frmServiceCustomerDomainPhone.aspx.cs" Inherits="Services_frmServiceCustomerDomainPhone" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
            <table style="border: thin solid #CCFF33; width: 393px; height: 210px">
                <tr>
                    <td colspan="2">
                    <asp:Label ID="lblInCharge" runat="server" 
                            Text="Service Customer Domain PhoneNos" BackColor="#003366" 
                            Font-Bold="True" ForeColor="White"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td>
                       Service Customer DomainId
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlServiceCustomerDomainId" runat="server" Height="16px" Width="122px"></asp:DropDownList>
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone No1</td>
                    <td>
                       <asp:TextBox ID="txtPhoneNo1" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator ID="rfvPhone1" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneNo1"></asp:RequiredFieldValidator>
                        </td> 
                </tr>
                
               <tr>
                    <td>
                        Phone No2</td>
                    <td>
                       <asp:TextBox ID="txtPhoneNo2" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneNo2"></asp:RequiredFieldValidator>
                        </td> 
                </tr>
                 <tr>
                    <td>
                        Phone No3</td>
                    <td>
                       <asp:TextBox ID="txtPhoneNo3" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPhoneNo3"></asp:RequiredFieldValidator>
                        </td> 
                </tr>
                
                <tr>
                    <td align="right" colspan="2">
                        <asp:Button ID="BtnAdd" runat="server" Height="24px" OnClick="BtnAdd_Click" Text="ADD"
                            Width="43px" ValidationGroup="g" BackColor="#003366" 
                            BorderColor="#003366" Font-Bold="True" ForeColor="White" />
                        <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="CLEAR" 
                            Width="57px" BackColor="#003366" BorderColor="#003366" Font-Bold="True" 
                            Font-Size="Small" ForeColor="White" />
                        
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
            
    </center>
</asp:Content>

