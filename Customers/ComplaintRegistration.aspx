<%@ Page Language="C#" MasterPageFile="~/Customers/ServiceMaster.master" AutoEventWireup="true" CodeFile="ComplaintRegistration.aspx.cs" Inherits="Customers_ComplaintRegistration" Title="Untitled Page" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="width: 953px">
    <br />
    <asp:Label ID="lblHeading" ForeColor="#004B97" 
                runat="server" Text="Complaints Registration"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
        
                    <div style="width: 54%">
                        <table style="width: 105%">
                            <tr>
                                <td align="right" valign="top">
                                    <span class="style6">If u want to send your voice message please record your 
                                    complaint by click onthis this button</span>
                                </td>
                                 <td align="left">
                                     <asp:Button ID="btnRecord" runat="server"  
                                         style="font-weight: 700" Text="Record Voice" Width="100px" 
                                         onclick="btnRecord_Click1" />
                                </td>
                                <td class="style5">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="color: black" valign="top" align="right">
                                    Service Customer Domain
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
                                     PhoneNo.
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtPhoneNo" runat="server" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">
                                    Text Complaint
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtComplaint" runat="server" Height="76px" 
                                        TextMode="MultiLine" Width="223px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td align="right" valign="top" class="style7">
                                    <span class="style6">If u want to send your voice message please record your 
                                    complaint by click onthis this button</span>
                                </td>
                                <td align="left" class="style7">
                                </td>
                                <td class="style7">
                                    </td>
                            </tr>
                            
                            <tr>
                                <td align="center" colspan="2" class="style20">
                                    <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                                        ValidationGroup="g" BackColor="#FF9900" BorderColor="#FF9900" 
                                        Font-Bold="True" />
                                       
                                   
                                                                   </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
             
            
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF5050"></asp:Label>
               
    </center>
</asp:Content>




<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style5
        {
            font-size: x-small;
        }
        .style6
        {
            font-size: x-small;
            font-weight: bold;
        }
        .style7
        {
            height: 28px;
        }
    </style>

</asp:Content>





