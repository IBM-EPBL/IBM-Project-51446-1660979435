<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaste.master" AutoEventWireup="true" CodeFile="frmDomainMaster.aspx.cs" Inherits="Admin_frmDomainMaster" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#003366" 
                runat="server" Text="Domain Master"
                Style="font-size: small; font-weight: 700; font-family: Verdana" 
                Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="ddlDomainId" EventName="SelectedIndexChanged" />
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
                                <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList1" runat="server" 
                                    RepeatDirection="Horizontal" 
                                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem>Add New Record
                                    </asp:ListItem>
                                    <asp:ListItem>Modify Old Record</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="text-align: left" >
                                <asp:DropDownList ID="ddlDomainId" Enabled="False" runat="server" Height="44px"
                                    Width="120px"  AutoPostBack="True" 
                                    onselectedindexchanged="ddlDomainId_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            
                    <table style="border: thin solid #cccc00; background-color: Window;  width: 450px;">
                        
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td >Domain Name</td>
                        <td><asp:TextBox ID="txtDomainName" runat="server"></asp:TextBox></td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="txtDomainName"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Domain Abbr</td>
                        <td  align="center"><asp:TextBox ID="txtAbbreviation" runat="server" 
                                style="margin-left: 0px"></asp:TextBox></td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvAbbreviation" runat="server" ErrorMessage="*" ControlToValidate="txtAbbreviation"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Domain Desc</td>
                        <td  align="center">
                           <asp:TextBox ID ="txtDomainDesc" runat="server" TextMode="MultiLine" Height="47px" 
                                Width="155px" ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDomainDesc"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                      <tr>
                        <td>Domain Incharge</td>
                        <td  align="center">
                        <asp:DropDownList ID="ddlInChargeId" runat="server" Height="16px" Width="153px"></asp:DropDownList>
                            </td>
                        <td>
                            </td> 
                        </tr>
                     <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>DepartmentId</td>
                        <td align="center">
                        <asp:DropDownList ID="ddlDeptId" runat="server" Width="153px"></asp:DropDownList>
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
                        <tr>
                            <td colspan="3"  align="left" style="background-color:#cccc00">
                            </td>
                        </tr>
                         <tr>
                    <td colspan="3">
                        <asp:GridView AutoGenerateColumns="False" ID="grdAllDomains" runat="server" 
                            Width="300px" CellPadding="2" ForeColor="Black" GridLines="None" 
                            AllowPaging="True" PageSize="5" 
                             BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" 
                            onpageindexchanging="grdAllDomains_PageIndexChanging">
                            <FooterStyle BackColor="Tan" />
                        <Columns>
                        <asp:TemplateField HeaderText="DomainName">
                        <ItemTemplate >
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("DomainName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DomainAbbr">
                        <ItemTemplate >
                        <asp:Label ID="lblAbbreviation" runat="server" Text='<%#Eval("DomainAbbr")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DomainDesc">
                        <ItemTemplate >
                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("DomainDesc")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Emp Name">
                        <ItemTemplate >
                        <asp:Label ID="lblIncharge" runat="server" Text='<%#Eval("Emp_firstname")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DeptName">
                        <ItemTemplate >
                        <asp:Label ID="lblDeptId" runat="server" Text='<%#Eval("DeptName")%>'></asp:Label>
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

