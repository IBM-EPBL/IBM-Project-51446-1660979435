<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaste.master" AutoEventWireup="true" CodeFile="frmAddEmployee.aspx.cs" Inherits="Admin_frmAddEmployee" Title="Untitled Page" %>
<%@ Register Src="~/UserControls/EmpRegistration.ascx" TagName="EmpReg" TagPrefix="Uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <center>
 <Uc1:EmpReg ID="EmpRegitration" runat="server" ConnectionName="CustomerDeskConnectionString" />
</center>

</asp:Content>

