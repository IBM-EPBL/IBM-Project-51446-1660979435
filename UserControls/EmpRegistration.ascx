<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpRegistration.ascx.cs" Inherits="UserControls_EmpRegistration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/BrowseImage.ascx" TagName="BrowseImage" TagPrefix="Uc1" %>
<ContentTemplate>
<center style="height: 349px; width: 765px;  background-image: url('../Images/tableInnerback.JPG');
            background-repeat: repeat-x;border:2px solid #CCCC00;">
    <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Larger" 
        ForeColor="Black"></asp:Label>
    <asp:Label ID="lblMsg" BackColor="Yellow" runat="server" Font-Bold="True" Font-Names="Verdana"
        Font-Size="10px" ForeColor="#FF3300"></asp:Label>
    <fieldset style="border-style: none; border-color: inherit; border-width: 0; width: 700px;">
        <legend style="font-family: Verdana; width: 770px; background-image: url('Images/linkbg.gif');
            font-size: 15px; font-weight: bold; background-color: #005CB9; color: #FFFFFF;" 
           ><center>Employee Registration</center></legend>
        <br />
        <br />
        <center>
        <table style="border: 1px dashed #CCCC00; width: 779px; height: 160px; font-family: Verdana; font-size: 10px;" 
            >
            <tr>
                <td>
                </td>
                <td style="color: #000000" align="right">
                    First Name<span style="color:#FF0000">*</span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td align="left" valign="top" colspan="3" rowspan="5">
                              <Uc1:BrowseImage ID="BrowseImage1" runat="server" DefaultImageUrl="~\Images\NoImage.jpg" />
                              
                             
                                  </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    Middle Name<span style="color:#FF0000">*</span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtMidName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtMidName"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    Last Name<span style="color:#FF0000">*</span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtLastName"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr style="height: 20px">
                <td>
                </td>
                <td align="right">
                    Date Of Birth<span style="color:#FF0000">*</span>
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="txtDob" runat="server"></asp:TextBox>
                    
                    <cc1:CalendarExtender ID="txtDob_CalendarExtender1" runat="server" TargetControlID="txtDob">
                    </cc1:CalendarExtender> 
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtDob"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator> 
                </td>
                <td align="right" style="text-align: left">
                   
                </td>
                <td>
                    &nbsp;</td>
            </tr>
                
            <tr style="height: 20px">
                <td>
                </td>
                <td align="right">
                    Date Of Joining<span style="color:#FF0000">*</span>
                </td>
                <td align="left" colspan="2">
                    <asp:TextBox ID="txtDOJ" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOJ">
                    </cc1:CalendarExtender>
                    
                </td>
                <td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txtDOJ"
                        runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td align="right" style="text-align: left">
                   
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                </td>
                <td valign="top" align="right">
                    Address<span style="color:#FF0000">*</span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="Multiline" Width="153px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        ControlToValidate="txtAddress" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    Email<span style="color:#FF0000">*</span>
                </td>
                <td align="left">
                   <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        ControlToValidate="txtEmail" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    Phone<span style="color:#FF0000">*</span>
                </td>
                <td align="left">
                   <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        ControlToValidate="txtPhone" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                     Designation<span style="color:#FF0000">*</span>
                </td>
                <td align="left">
               
                    <asp:DropDownList ID="ddlDesg" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlDesg_SelectedIndexChanged" Height="18px" 
                        Width="153px">   
                        <asp:ListItem>--Select One--</asp:ListItem>                     
                    </asp:DropDownList>
                   
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator InitialValue="--Select One--" ID="RequiredFieldValidator8"
                        ControlToValidate="ddlDesg" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: right">
                    
                </td>
                <td align="left">
               
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    Department <span style="color:#FF0000">*</span>
                </td>
                <td align="left">
                 
                     <asp:DropDownList ID="ddlDept" runat="server" Height="16px" Width="153px" 
                        onselectedindexchanged="ddlDept_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="--Select One--">--Select One--</asp:ListItem>
                    </asp:DropDownList>
              
                   
                </td>
                <td align="left">
                    <asp:RequiredFieldValidator InitialValue="--Select One--" ID="RequiredFieldValidator10"
                        ControlToValidate="ddlDept" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                <td style="text-align: right">
                   
                </td>
                <td align="left">
                   
                      </td>
                <td align="left">
                </td>
            </tr>
         <tr>
               <td></td>
            <td align="right">
          Superior Employee<span style="color:#FF0000">*</span>
            </td>
            <td align="left">
            <asp:DropDownList ID="ddlSupEmp" runat="server" Width="153px"></asp:DropDownList>
            </td>
            <td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            </tr>
            <tr>
            <td></td>
            <td align="right">
            User Name<span style="color:#FF0000">*</span>
            </td>
            <td align="left">
            <asp:TextBox ID="txtUserName"  runat="server" />
            </td>
            <td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserName"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            </tr>
               <tr>
               <td></td>
            <td align="right">
          Password<span style="color:#FF0000">*</span>
            </td>
            <td align="left">
            <asp:TextBox ID="txtPassword"  runat="server" TextMode="Password" />
            </td>
            <td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            </tr>
            
        </table></center>
        
    </fieldset>
    
    <fieldset style="border-style: none; border-width: 0; width: 700px; background-image: url('../../Images/newbackground.jpg');">
       
       <center>
        <table style="border: 1px dashed #CCCC00; width: 775px; font-size: 10px; font-family: verdana;" 
            >
            <tr>
                
                <td align="right">
                    <asp:ImageButton ID="btnSubmit"  runat="server" Width="100px" Height="20px"
                        ImageUrl="~/Images/btn_submit.jpg" OnClick="btnSubmit_Click" />
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table></center>
        <br /><br />
    </fieldset>
</center>
</ContentTemplate> 