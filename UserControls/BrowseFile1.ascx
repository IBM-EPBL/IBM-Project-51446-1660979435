﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BrowseFile1.ascx.cs" Inherits="BrowseImage1" %>

<table style="width: 286px; height: 21px;">
    <tr>
        <td valign="bottom"  >
            <asp:FileUpload ID="Upload1" runat="server" Font-Names="Verdana" 
                Font-Size="10px" Height="20px" Width="200px" />
        </td>
        <td valign="bottom">
            <asp:Button ID="btnAttachFile" CausesValidation="false" runat="server" Text="Attach File"
                 Height="20px" Font-Names="Verdana" Font-Size="10px" 
                onclick="btnAttachFile_Click" />
        </td>
        <td valign="bottom">
            <asp:Label ID="lblMessage" Height="20px" runat="server" Font-Names="Verdana" Font-Size="10px" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
