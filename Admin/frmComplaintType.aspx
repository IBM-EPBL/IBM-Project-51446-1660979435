<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaste.master" AutoEventWireup="true" CodeFile="frmComplaintType.aspx.cs" Inherits="Admin_frmComplaintType" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#003366" 
                runat="server" Text="Complaint Type Master"
                Style="font-size: small; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="ddlComplaintTypeId" EventName="SelectedIndexChanged" />
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
                                <asp:DropDownList ID="ddlComplaintTypeId" Enabled="False" runat="server" Height="44px"
                                    Width="120px" AutoPostBack="True" 
                                    onselectedindexchanged="ddlComplaintTypeId_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            
                    <table style="border: thin solid #cccc00; background-color: Window;  width: 450px;">
                        
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td >ComplaintType Name</td>
                        <td><asp:TextBox ID="txtComplaintTypeName" runat="server"></asp:TextBox></td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="txtComplaintTypeName"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>ComplaintType Abbr</td>
                        <td  align="center"><asp:TextBox ID="txtComplaintTypeAbbr" runat="server"  
                               ></asp:TextBox></td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvAbbr" runat="server" ErrorMessage="*" ControlToValidate="txtComplaintTypeAbbr"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td >ComplaintType Desc</td>
                        <td  align="center">
                           <asp:TextBox ID ="txtDesc" runat="server" TextMode="MultiLine" Height="47px" 
                                Width="155px" ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDesc"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                         <tr>
                        <td>InchargeId</td>
                        <td align="center">
                           <asp:DropDownList ID="ddlInChargeId" runat="server" Height="16px" Width="153px"></asp:DropDownList>
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
                        <asp:GridView AutoGenerateColumns="False" ID="grdAllComplaintTypes" runat="server" 
                            Width="300px" CellPadding="2" ForeColor="Black" GridLines="None" 
                            AllowPaging="True" PageSize="5" 
                            onpageindexchanging="grdAllComplaintTypes_PageIndexChanging" BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px">
                            <FooterStyle BackColor="Tan" />
                        <Columns>
                        <asp:TemplateField HeaderText="ComplaintTypeName">
                        <ItemTemplate >
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("ComplaintTypeName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ComplaintTypeAbbr">
                        <ItemTemplate >
                        <asp:Label ID="lblAbbreviation" runat="server" Text='<%#Eval("ComplaintTypeAbbr")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ComplaintTypeDesc">
                        <ItemTemplate >
                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("ComplaintTypeDesc")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Incharge Name">
                        <ItemTemplate >
                        <asp:Label ID="lblIncharge" runat="server" Text='<%#Eval("emp_Firstname")%>'></asp:Label>
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

