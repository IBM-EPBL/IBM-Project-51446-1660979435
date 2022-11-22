<%@ Page Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <br />
        <br />
        <br />
        <br />
    <br />
        <table width="250" border="0" cellspacing="0" cellpadding="0" style="border: thin solid #000000;
            background-color: #FFFFFF">
           
            <tr>
                <td>
                    &nbsp;
                </td>
                <td colspan="2" align="left" >
                    User Name
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtusername" runat="server" TabIndex="1" class="log_field" Style="height: 20px;
                        width: 188px;" />
                </td>
                <td >
                    <asp:RequiredFieldValidator ControlToValidate="txtusername" ID="RequiredFieldValidator1"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td colspan="2" align="left" >
                    Password
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td colspan="2">
                    <span class="innertxt">
                        <asp:TextBox TextMode="Password" ID="txtpassword" runat="server" TabIndex="1" class="log_field"
                            Style="height: 20px; width: 188px;" /></span>
                </td>
                <td >
                    <asp:RequiredFieldValidator ControlToValidate="txtpassword" ID="RequiredFieldValidator2"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td >
                    &nbsp;
                </td>
                <td >
                    
                </td>
                <td align="right" >
                    <a href="#"></a>
                    <asp:Button runat="server" ID="ImgBtnEmail" TabIndex="3" Text="Login" Style="border-width: 0px;
                        color: #FFFFFF; font-weight: 700; background-color: #003366;" OnClick="ImgBtnEmail_Click"
                        Height="28px" Width="78px" />
                </td>
                <td >
                    &nbsp;
                </td>
            </tr>
        </table>
       <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300" ></asp:Label>
        <br />
        <br />
    </center>
</asp:Content>
