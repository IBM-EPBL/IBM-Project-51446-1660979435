<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master" AutoEventWireup="true" CodeFile="FeedbackEvaluation.aspx.cs" Inherits="Admin_FeedbackEvaluation" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/BrowseFile.ascx" TagName="BrowseFile" TagPrefix="Uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
            <br />
            <asp:Label ID="lblHeading" BackColor="Window" ForeColor="#003366" runat="server" Text="FeedBack Evaluation"
                Style="font-size: small; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
           <%-- <asp:UpdatePanel ID="panel1" runat="server">
               <Triggers>               
               <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="ddlFeedBackEvaluationId" EventName="SelectedIndexChanged" />
               <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnShowAll" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btnCloseGrid" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="btncancel" EventName="Click" />
               <asp:AsyncPostBackTrigger ControlID="grdAllFeedBackEvaluation" EventName="RowCommand" />
               <asp:PostBackTrigger ControlID="BrowseFile1" />
               </Triggers>
                <ContentTemplate>--%>
                    <table style="border: thin solid #cccc00; background-color:#CCCC00; width: 500px; ">
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
                                <asp:DropDownList ID="ddlFeedBackEvaluationId" Enabled="False" runat="server" Height="44px"
                                    Width="120px"  AutoPostBack="True" onselectedindexchanged="ddlFeedBackEvaluationId_SelectedIndexChanged" 
                                    >
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
            
                    <table style="border: thin solid #cccc00; background-color: Window;  width: 568px;">
                        
                       
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">FeedBack Evaluation Date</td>
                        <td  align="left"><asp:TextBox ID="txtFeedBackEvaluationDate" runat="server" 
                                style="margin-left: 0px"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtFeedBackEvaluationDate_CalendarExtender1" runat="server" TargetControlID="txtFeedBackEvaluationDate">
                            </cc1:CalendarExtender>
                                </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="*" 
                                ControlToValidate="txtFeedBackEvaluationDate" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                         <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">EmpId</td>
                        <td align="left">
                        <asp:DropDownList ID="ddlEmpId" runat="server" Width="153px"></asp:DropDownList>
                        </td>
                        <td>
                        </td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right">FeedBackId</td>
                        <td align="left">
                           <asp:DropDownList ID="ddlFeedBackId" runat="server" Width="153px"></asp:DropDownList>
                            </td>
                        <td>
                        </td> 
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                        <tr>
                        <td align="right" valign="top">FeedBack Evaluation Text</td>
                        <td align="left">
                           <asp:TextBox ID ="txtEvaluationText" runat="server" TextMode="MultiLine" ></asp:TextBox>
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtEvaluationText" ValidationGroup="g"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td colspan="3"></td>
                        </tr>
                      <tr align="right">
                        <td>FeedBack Link File</td>
                        <td align="left">
                        <Uc1:BrowseFile ID="BrowseFile1" runat="server" />
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
                                    BackColor="#797A80" ForeColor="White" runat="server" ValidationGroup="g"
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
                        <asp:GridView AutoGenerateColumns="False" ID="grdAllFeedBackEvaluation" runat="server" 
                            Width="300px" CellPadding="2" ForeColor="Black" GridLines="None" 
                            AllowPaging="True" PageSize="5" 
                             BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" 
                            onpageindexchanging="grdAllFeedBackEvaluation_PageIndexChanging" onrowcommand="grdAllFeedBackEvaluation_RowCommand" 
                            >
                            <FooterStyle BackColor="Tan" />
                        <Columns>
                        <asp:TemplateField HeaderText="EvaluationDate">
                        <ItemTemplate >
                        <asp:Label ID="lblFeedBackEvaluationDate" runat="server" Text='<%#Eval("FeedBackEvaluationDate")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Incharge Name">
                        <ItemTemplate >
                        <asp:Label ID="lblInchargeId" runat="server" Text='<%#Eval("Emp_FirstName")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FeedBackId">
                        <ItemTemplate >
                        <asp:Label ID="lblFeedBackId" runat="server" Text='<%#Eval("FeedBackId")%>'></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EvaluationText">
                        <ItemTemplate >
                         <asp:Panel ID="pnl1" runat="server" Height="50px" Width="200px"  ScrollBars="Vertical" >
                        <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("FeedBackEvaluationText")%>'></asp:Label>
                        </asp:Panel> 
                        </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="FileName">
                        <ItemTemplate >
                        <asp:LinkButton ID="lnkfile" runat="server" Text='<%#Eval("LinkFileName")%>' CommandArgument='<%#Eval("FeedBackEvaluationId") %>'></asp:LinkButton>
                        
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

  <%--              </ContentTemplate>
            </asp:UpdatePanel>--%>
        </center>
    </div>
</asp:Content>



