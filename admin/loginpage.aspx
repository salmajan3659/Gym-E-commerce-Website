<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="admin.WebForm3" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <h2 style="text-align:center; color:#333;"> Login</h2>
    <table style="width:100%;">
        <tr >
            <td>User Name</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter username"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" style="width:100%; padding:10px; background-color:#007BFF; color:white; border:none; border-radius:5px; cursor:pointer;" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" style="text-align:center; display:block; margin-top:10px;"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
