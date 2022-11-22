<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaste.master"  AutoEventWireup="true" CodeFile="frmDesigationMaster.aspx.cs" Inherits="Admin_frmDesigationMaster" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#003366" 
                runat="server" Text="Designation Master"
                Style="font-size: small; font-weight: 700; font-family: Verdana" 
                Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="ddlDesgId" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnShowAll" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCloseGrid" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btncancel" EventName="Click" />
               </Triggers>
                <ContentTemplate>
                    <table style="border: thin solid #CCCC00; background-color:#CCCC00; width: 450px; ">
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
                            <td style="text-align: left">
                                <asp:DropDownList ID="ddlDesgId" Enabled="False" runat="server" Height="44px"
                                    Width="120px"  AutoPostBack="True" 
                                    onselectedindexchanged="ddlDesgId_SelectedIndexChanged1">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            
                    <table style="border: thin solid #CCCC00; background-color: Window;  width: 450px;">
                        
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Desg Name</td>
                        <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Abbreviation</td>
                        <td align="center"><asp:TextBox ID="txtAbbreviation" runat="server" 
                                style="margin-left: 0px"></asp:TextBox></td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvAbbreviation" runat="server" ErrorMessage="*" ControlToValidate="txtAbbreviation"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Desg InChargeId</td>
                        <td align="center">
                        <asp:DropDownList ID="ddlDesgInChargeId" runat="server" Width="153px">
                        <asp:ListItem>--Select One--</asp:ListItem>
                        </asp:DropDownList>
                        
                        </td>
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td>Superior DesgId</td>
                        <td align="center">
                        <asp:DropDownList ID="ddlSuperiorDesgId" runat="server" Width="153px">
                        <asp:ListItem>--Select One--</asp:ListItem>
                        </asp:DropDownList>
                                </td>
                        <td>
                       
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3">
                            
                            </td>
                        </tr>
                        <tr>
                        <td>Description</td>
                        <td  align="center">
                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtDesc"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
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
                            <td colspan="3"  align="left" style="background-color:#CCCC00">
                            
                            </td>
                        </tr>
                         <tr>
                    <td colspan="3">
                    
                        <asp:GridView ID="grdAllDesignations" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
                                GridLines="Vertical" onpageindexchanging="grdAllDesgination_PageIndexChanging" 
                                PageSize="5" Width="300px">
                                <FooterStyle BackColor="#CCCC99" />
                                <RowStyle BackColor="#F7F7DE" />
                                <Columns>
                                    <asp:TemplateField HeaderText="DesgName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Desg_Name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Abbreviation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAbbreviation" runat="server" Text='<%#Eval("Abbreviation")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DesgDesc">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView></td>
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

