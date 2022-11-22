<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master"   AutoEventWireup="true" CodeFile="FrmEmpComposeMails.aspx.cs" Inherits="Employee_FrmUserComposeMails" Title="Untitled Page" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      
        .style6
        {
            font-size: x-small;
            color: #FF0000;
            text-align: left;
        }
        .style7
        {
            height: 19px;
        }
        .style10
        {
            height: 66px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="panel1" runat="server">

<Triggers>
<asp:AsyncPostBackTrigger ControlID="rdbCustomer" EventName="CheckedChanged" />
<asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
<%--<asp:AsyncPostBackTrigger ControlID="BtnInBox" EventName="Click" />
<asp:AsyncPostBackTrigger ControlID="BtnOutBox" EventName="Click" />--%>

</Triggers>
<ContentTemplate>


<center>
        <br />
        <br />
        <table width="80%" border="1" style="border-color: #5A5D5A; border-width: 1px;">
            <tr>
                <td bgcolor="#004B97" class="style10">
                    <br />
                    
                    <asp:Label ID="lblMail" runat="server" Text="Compose Email" Font-Bold="True" 
                        Font-Size="X-Large" ForeColor="White"></asp:Label>
                        <br />
                </td>
            </tr>
            <tr>
                <td align="right">
                   <asp:Button ID="BtnInBox" runat="server" Text="InBox" 
                                    Style="font-weight: 700" onclick="BtnInBox_Click" 
                        CausesValidation="False" />
                                    &nbsp;&nbsp;
                                     <asp:Button ID="BtnOutBox" runat="server" Text="OutBox" 
                                    Style="font-weight: 700" onclick="BtnOutBox_Click" 
                        CausesValidation="False" />
                    <br />
                    <br />
                    <table>
                    <tr>
                    <td>
                    Select Emails :
                    </td>
                    <td align="left">
                        Customer&nbsp; :
                    <asp:RadioButton ID="rdbCustomer" GroupName="rb" runat="server" AutoPostBack="True" oncheckedchanged="rdbCustomer_CheckedChanged"
                             />
                    
                       
                    </td>
                    </tr>
                    <tr>
                            <td style="text-align: left" valign="top">
                                To  :</td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="ddlto" runat="server" Width="350px"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ControlToValidate="ddlto" ID="RequiredFieldValidator3" 
                                    runat="server" ErrorMessage="*" InitialValue="--Select EmailId--"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                        </tr>
                    
                    <tr>
                            <td style="text-align: left" valign="top">
                                Subject  :</td>
                            <td style="text-align: left">
                                <asp:TextBox ID="txtsubject" runat="server" Width="350px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ControlToValidate="txtsubject" ID="RequiredFieldValidator2"
                                    runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left" valign="top">
                                Body&nbsp; :</td>
                            <td style="text-align: left">
                                <asp:TextBox ID="txtbody" runat="server" Height="120px" TextMode="MultiLine" 
                                    Width="350px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ControlToValidate="txtbody" ID="RequiredFieldValidator1"
                                    runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                        </tr>
                        
                       
                        <tr>
                            <td style="text-align: right" class="style7" colspan="2">
                              
                            </td>
                            <td colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td class="style6" colspan="2">
                                fields marked with ( * ) are mandetory
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right" colspan="2">
                                <asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="btnSubmit_Click"
                                    Style="font-weight: 700" />&nbsp;&nbsp;
                                </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <center>
                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label></center>
                </td>
            </tr>
            <tr>
                <td bgcolor="#004B97">
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
    </center>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


