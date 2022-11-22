<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master" AutoEventWireup="true" CodeFile="ReceiveComplaint.aspx.cs" Inherits="Employee_ReceiveComplaint" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .tabledata
        {
            font-family: Verdana;
            font-weight: bold;
            font-size: xx-small;
            text-align: left;
        }
        .lbldata
        {
            font-weight: bold;
            font-family: Verdana;
            color: #FF0066;
        }
        .head
        {
            color: #004B97;
        }
        .Complaint
        {
        	Color:Red;
        	
        	}
        	
        	.Answer
        {
        	Color:Blue;
        	
        	}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <br />
        <h1 class="head">
          View Complaint 
        </h1>
        <table width="100%" class="tabledata">
            <tr>
                <td>
                     <asp:GridView ID="GridView1" Width="63%" runat="server" AutoGenerateColumns="False"
                        OnRowCommand="GridView1_RowCommand" CellPadding="3" BackColor="White" 
                         BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <RowStyle ForeColor="#000066" />
                        <Columns>
                            <asp:TemplateField ControlStyle-Width="100%">
                                <HeaderTemplate>
                                    <center>
                                        <h3>
                                            Display the Complaints
                                        </h3>
                                    </center>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="tabledata" Width="100%">
                                        <tr>
                                            <td class="Complaint">
                                                <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Height="20px" Width="100%">
                                                    Text of Complaint: <%#Eval("TextofComplaint")%>
                                                    <asp:Label  ID="lblComplaint" runat="server" Visible="false" Text='<%#Eval("CustomerId") %>'></asp:Label>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                 Date:
                                                <%#Eval("RegistrationDate")%>
                                            </td>
                                            <td>
                                                Time :
                                                <%#Eval("RegistrationTime")%>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                         <td>
                                         <asp:LinkButton ID="lnkPlayAudio" Text="Audio Support" runat="server" CommandArgument='<%#Eval("ComplaintRegistrationId")%>' CommandName="Play" ></asp:LinkButton>
                                         </td>
                                            <td style="text-align: right" colspan="2">
                                                <asp:LinkButton ID="LinkButton1" Text="Click Here To Submit The Response" CommandArgument='<%#Eval("ComplaintRegistrationId") %>' CommandName="Reply"
                                                    runat="server"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>

<ControlStyle Width="100%"></ControlStyle>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
          <asp:DataList ID="datalistaudio" RepeatColumns="1" runat="server">
                                                <ItemTemplate>
                                                    <object v id="Audioplayer" classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6" height="150"
                                                        width="300">
                                                        <param name="URL" value='<%# "../MyHnd.ashx?id=" + Eval("ComplaintRegistrationId") %>'>
                                                            <param name="autoStart" value="True">
                                                        <param name="rate" value="1">
                                                        <param name="balance" value="0">
                                                        <param name="enabled" value="true">
                                                        <param name="enabledContextMenu" value="true">
                                                        <param name="fullScreen" value="false">
                                                        <param name="playCount" value="1">
                                                        <param name="volume" value="100">
                                                    </object>
                                                </ItemTemplate>
                                            </asp:DataList>
        <br />
        <br />
        <asp:Label ID="lblMsg" CssClass="lbldata" runat="server"></asp:Label>
    </center>
</asp:Content>
