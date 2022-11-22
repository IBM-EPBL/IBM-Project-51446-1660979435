<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaste.master" AutoEventWireup="true" CodeFile="frmServiceCustomerDomain.aspx.cs" Inherits="Admin_frmServiceCustomerDomain" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#003366" runat="server" Text="Service Customer Domain"
                Style="font-size: small; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="ddlServiceCustomerDomainId" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnShowAll" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCloseGrid" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btncancel" EventName="Click" />
               </Triggers>
                <ContentTemplate>
                    <table style="border: thin solid #cccc00; background-color:#CCCC00; width: 450px; ">
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
                                <asp:DropDownList ID="ddlServiceCustomerDomainId" Enabled="False" 
                                    runat="server" Height="44px"
                                    Width="120px" AutoPostBack="True" 
                                    onselectedindexchanged="ddlServiceCustomerDomainId_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            
                    <table style="border: thin solid #cccc00; background-color: Window;  width: 450px;">
                        
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td >Service Customer Id</td>
                        <td><asp:DropDownList ID="ddlServiceCustomerId" runat="server" Height="16px" 
                                Width="121px"></asp:DropDownList></td> 
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Service Customer Domain MasterId</td>
                        <td  align="center">
                        <asp:DropDownList ID="ddlDomainId" runat="server" Height="16px" Width="121px"></asp:DropDownList>
                        </td> 
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Service Customer Domain Phone</td>
                        <td  align="center">
                           <asp:TextBox ID ="txtPhone" runat="server" ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtPhone"></asp:RequiredFieldValidator></td>
                        </tr>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Srevice Customer Domain InchargeId</td>
                        <td align="center">
                        <asp:DropDownList ID="ddlInChargeId" runat="server" Height="16px" Width="121px"></asp:DropDownList>
                        </td> 
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Service Customer Complaint Manager Name</td>
                        <td  align="center">
                           <asp:TextBox ID ="txtManagerName" runat="server" ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtManagerName"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Service Customer Domain Email</td>
                        <td align="center">
                           <asp:TextBox ID ="txtEmail" runat="server" ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td >Service Customer Domain Address</td>
                        <td  align="center">
                           <asp:TextBox ID ="txtAddress" runat="server" TextMode="MultiLine" ></asp:TextBox> 
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator></td>
                        </tr>
                         
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Service Customer Domain Desc</td>
                        <td  align="center">
                           <asp:TextBox ID ="txtDesc" runat="server" TextMode="MultiLine" Height="47px" 
                                Width="155px" ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtDesc"></asp:RequiredFieldValidator></td>
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
                        <tr>
                            <td colspan="3"  align="left" style="background-color:#cccc00">
                            </td>
                        </tr>
                         <tr>
                    <td colspan="3">
                        <asp:GridView AutoGenerateColumns="False" ID="grdAllServiceCustomerDomain" runat="server" 
                            Width="300px" CellPadding="2" ForeColor="Black" GridLines="None" 
                            AllowPaging="True" PageSize="5" 
                            BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" onpageindexchanging="grdAllServiceCustomerDomain_PageIndexChanging" 
                            >
                            <FooterStyle BackColor="Tan" />
                        <Columns>
                        <asp:TemplateField HeaderText="ServiceCustomerId">
                        <ItemTemplate >
                        <asp:Label ID="lblCustomerId" runat="server" Text='<%#Eval("ServiceCustomerId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DomainId">
                        <ItemTemplate >
                        <asp:Label ID="lblDOR" runat="server" Text='<%#Eval("ServiceCustomerDomainMasterId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate >
                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("ServiceCustomerDomainPhone")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="InchargeId">
                        <ItemTemplate >
                        <asp:Label ID="lblIncharge" runat="server" Text='<%#Eval("ServiceCustomerDomainInChargeId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ManagerName">
                        <ItemTemplate >
                        <asp:Label ID="lblManagerName" runat="server" Text='<%#Eval("ServiceCustomerDomainManagerName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Email">
                        <ItemTemplate >
                        <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("ServiceCustomerDomainEmail")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                        <ItemTemplate >
                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("ServiceCustomerDomainAddress")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                        <ItemTemplate >
                        <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("ServiceCustomerDomainDesc")%>'></asp:Label>
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

