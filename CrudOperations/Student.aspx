<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="CrudOperations.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            border: 5px ridge black;
            margin:auto;
            width:409px;
            text-align:center;
            height: 260px;
        }
        .auto-style2 {
            width: 215px;
        }
        .auto-style4 {
            width: 267px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <table cellpadding="2" class="auto-style1">
                <tr>
                    <td colspan="5"><b>Student Form</b></td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="4">Id :</td>
                    <td>
                        <asp:TextBox ID="id" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="4">Name :</td>
                    <td>
                        <asp:TextBox ID="nametxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="4">Email :</td>
                    <td>
                        <asp:TextBox ID="emailtxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="4">Contact :</td>
                    <td>
                        <asp:TextBox ID="contacttxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="4">Address :</td>
                    <td>
                        <asp:TextBox ID="addtxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="4">Gender:</td>
                    <td>
                        <asp:DropDownList ID="ddl" runat="server">
                            <asp:ListItem Value="0">Select Gender</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Insert" runat="server" Text="Insert" OnClick="Insert_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="Update" runat="server" Text="Update" OnClick="Update_Click" />
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="Delete" runat="server" Text="Delete" OnClick="Delete_Click" />
                    </td>
                    <td colspan="2">
                        <asp:Button ID="Clear" runat="server" Text="Clear" OnClick="Clear_Click" />
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="118px" Width="453px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:TemplateField HeaderText="ID">
                       <ItemTemplate>
                            <asp:Label ID="Labelid" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                       </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Labelname" runat="server" Text='<%#Eval("name")%>'></asp:Label>
                       </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                                <asp:Label ID="Labelemail" runat="server" Text='<%#Eval("email")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                           <ItemTemplate>
                                <asp:Label ID="Labelcontact" runat="server" Text='<%#Eval("contact") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                           <ItemTemplate>
                                <asp:Label ID="Labeladd" runat="server" Text='<%#Eval("address")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                         <ItemTemplate>
                                <asp:Label ID="Labelgender" runat="server" Text='<%#Eval("gender")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
    </form>
</body>
</html>
