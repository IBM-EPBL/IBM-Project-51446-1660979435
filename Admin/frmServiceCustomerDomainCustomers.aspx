<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaste.master" AutoEventWireup="true" CodeFile="frmServiceCustomerDomainCustomers.aspx.cs" Inherits="Admin_frmServiceCustomerDomainCustomers" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center style="width: 445px">
            <table style="border: thin solid #CCFF33">
                <tr>
                    <td colspan="2">
                    <asp:Label ID="lblInCharge" runat="server" 
                            Text="Service Customer Domain Customers" BackColor="#003366" 
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
                        Customer Id</td>
                    <td>
                       <asp:DropDownList ID="ddlCustomerId" runat="server" Width="122px"></asp:DropDownList> 
                    </td>
                    <td>
                    
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

