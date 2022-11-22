<%@ Page Language="C#" MasterPageFile="~/Employee/EmployeeMaster.master" AutoEventWireup="true" CodeFile="ResponseComplaint.aspx.cs" Inherits="Employee_ResponseComplaint" Title="Untitled Page" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="width: 953px">
    <br />
    <asp:Label ID="lblHeading" ForeColor="#004B97" 
                runat="server" Text="Complaint Response"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
        
                    <div style="width: 54%">
                        <table style="width: 105%">
                            <tr>
                                <td style="color: black" valign="top" align="right">
                                    Complaint Status
                                </td>
                                 <td align="left">
                                    <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                                </td>
                                <td class="style5">
                                    
                                </td>
                            </tr>
                            <tr>
                                 <td align="right">
                                    Complaint Escalated Status
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtEscalatedStatus" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">
                                    Count Of Escalation
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtCount" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">
                                     Complaint Response Text
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtComplaintResponse" runat="server" Height="85px" 
                                        TextMode="MultiLine" Width="211px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">
                                     Complaint Severity
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtSeverity" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td align="right" valign="top">
                                     &nbsp;Complient record voice file</td>
                                <td align="left">
                                    &nbsp;</td>
                                <td>
                                    </td>
                            </tr>
                            
                            <tr>
                                <td align="right" valign="top">
                                     Record responce voice to send customer
                                </td>
                                <td align="left">
                                    <asp:Button ID="btnResponce" runat="server" style="font-weight: 700" 
                                        Text="Record my Responce" Width="161px" onclick="btnResponce_Click" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td align="right" valign="top">
                                     &nbsp;</td>
                                <td align="left">
                                    <asp:Button ID="btnPlay" runat="server" onclick="btnPlay_Click" 
                                        style="font-weight: 700" Text="Play Once" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td align="center" colspan="2" class="style20">
                                    <asp:Button ID="BtnAdd" runat="server" OnClick="BtnAdd_Click" Text="Submit" 
                                        ValidationGroup="g" BackColor="#FF9900" BorderColor="#FF9900" 
                                        Font-Bold="True" />
                                        &nbsp;
                                         <asp:Button ID="BtnBack" runat="server"  Text="Back" 
                                        ValidationGroup="g" BackColor="#FF9900" BorderColor="#FF9900" 
                                        Font-Bold="True" onclick="BtnBack_Click" />
                                       
                                   
                                                                   </td>
                                <td>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center" colspan="2" class="style20">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        
                    </div>
             
            
                    <asp:Label ID="lblMsg" runat="server" ForeColor="#FF5050"></asp:Label>
                     <asp:DataList ID="datalistaudio" RepeatColumns="1" runat="server">
                                                <ItemTemplate>
                                                    <object id="Audioplayer" classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6" height="150"
                                                        width="200">
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
               
    </center>
</asp:Content>

