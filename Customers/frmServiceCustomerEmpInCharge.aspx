<%@ Page Language="C#" MasterPageFile="~/Customers/ServiceMaster.master"  AutoEventWireup="true" CodeFile="frmServiceCustomerEmpInCharge.aspx.cs" Inherits="Services_frmServiceCustomerEmpInCharge" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<table style="border: thin solid #CCFF33">
   <tr>
   <td>
        <div>
            <table>
                <tr>
                    <td colspan="2">
                    <asp:Label ID="lblInCharge" runat="server" 
                            Text="Service Customer Employee InChargeId" BackColor="#003366" 
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
                        Service Customer Domain InChargeId</td>
                    <td>
                       <asp:DropDownList ID="ddlInChargeId" runat="server" Height="16px" Width="122px"></asp:DropDownList>
                    </td>
                    <td>
                        </td> 
                </tr>
                
                <tr>
                    <td>EmployeeId
                       </td>
                    <td>
                       <asp:DropDownList ID="ddlEmpId" runat="server" Height="16px" Width="122px"></asp:DropDownList>
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
            </table>
            
        <tr>
        <td>
        <asp:Label ID="lblMsg" runat="server" 
         ForeColor="#FF5050" ></asp:Label>
         </td>
         </tr>
         </div> 
         </td> 
         </tr> 
        </table>
    </center>
</asp:Content>

