<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaste.master" AutoEventWireup="true" CodeFile="frmReportEmployee.aspx.cs" Inherits="Admin_frmReportEmployee" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">
 
    function callPrint(elementId)
    {
       var prtContent = document.getElementById(elementId);                
       var WinPrint = window.open('','', 'left=0,top=0,width=1000,height=600,toolbar=2,scrollbars=2,status=0');
       var docColor="Black";
       var strInnerHTML=prtContent.innerHTML;
       var strModifiedInnerHTMl=strInnerHTML.replace(/white/g,docColor);
       WinPrint.document.write(strModifiedInnerHTMl);
       WinPrint.document.close();
       WinPrint.focus();
       WinPrint.print();
       WinPrint.close();
    }
    
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center style="height: 404px">
    <br />
    <br />
    <br />
    <asp:Label ID="lblHeading" ForeColor="#990033" 
                runat="server" Text="Employee Report"
                Style="font-size: large; font-weight: 700; font-family: Verdana"></asp:Label>
            <br />
            <br />
    
  <div id="divemp" style="border: thin groove #006666; width:714px; overflow:scroll; height: 273px;">
      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
          AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
          BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" 
          ForeColor="Black" GridLines="None" PageSize="4">
          <FooterStyle BackColor="Tan" />
          <Columns>
              <asp:BoundField DataField="Emp_FirstName" HeaderText="Emp_FirstName" 
                  SortExpression="Emp_FirstName" />
              <asp:BoundField DataField="Emp_LastName" HeaderText="Emp_LastName" 
                  SortExpression="Emp_LastName" />
              <asp:BoundField DataField="Emp_MiddleName" HeaderText="Emp_MiddleName" 
                  SortExpression="Emp_MiddleName" />
              <asp:BoundField DataField="Emp_DOB" HeaderText="Emp_DOB" 
                  SortExpression="Emp_DOB" />
              <asp:BoundField DataField="Emp_DOJ" HeaderText="Emp_DOJ" 
                  SortExpression="Emp_DOJ" />
              <asp:BoundField DataField="Address" HeaderText="Address" 
                  SortExpression="Address" />
              <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
              <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
              <asp:BoundField DataField="DeptName" HeaderText="DeptName" 
                  SortExpression="DeptName" />
              <asp:BoundField DataField="Desg_Name" HeaderText="Desg_Name" 
                  SortExpression="Desg_Name" />
          </Columns>
          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
              HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
          <HeaderStyle BackColor="Tan" Font-Bold="True" />
          <AlternatingRowStyle BackColor="PaleGoldenrod" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:CustomerDeskConnectionString %>" 
          SelectCommand="spReportEmployee" SelectCommandType="StoredProcedure">
      </asp:SqlDataSource>
  </div>
  <table>
  <tr>
  
  <td>
    <asp:Button ID="btnReport" runat="server"
                        Text="Print Report"   BackColor="#FF9900" OnClientClick="callPrint('divemp')"
                        BorderColor="#FF9900" Font-Bold="True" Font-Size="Small" 
         />
  </td>
  </tr>
  </table>
  <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</center> 
</asp:Content>

