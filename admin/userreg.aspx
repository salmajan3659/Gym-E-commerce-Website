<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userreg.aspx.cs" Inherits="admin.WebForm2" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <div style="max-height:500px; overflow-y:auto; padding:20px; 
                font-family: 'Segoe UI', Arial, sans-serif; display:flex; flex-direction:column; gap:12px;">

        <h2 style="text-align:center; margin-bottom:15px; color:#1a1a1a; font-size:24px;">User Registration</h2>

        <!-- Full Name -->
        <div style="display:flex; align-items:center; gap:10px;">
            <label style="width:150px; font-weight:bold; color:#333;">Full Name</label>
            <asp:TextBox ID="TextBox1" runat="server" Width="100%" 
                         style="padding:6px 10px; border-radius:8px; border:1px solid #ccc;"></asp:TextBox>
        </div>

        <!-- Phone -->
        <div style="display:flex; align-items:center; gap:10px;">
            <label style="width:150px; font-weight:bold; color:#333;">Phone</label>
            <asp:TextBox ID="TextBox2" runat="server" Width="100%" 
                         style="padding:6px 10px; border-radius:8px; border:1px solid #ccc;"></asp:TextBox>
        </div>

        <!-- Gender -->
        <div style="display:flex; align-items:center; gap:10px;">
            <label style="width:150px; font-weight:bold; color:#333;">Gender</label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <!-- DOB -->
        <div style="display:flex; align-items:center; gap:10px;">
            <label style="width:100px; font-weight:bold; color:#333;">DOB</label>
            <br />
            <asp:TextBox ID="TextBox6" runat="server" TextMode="Date"></asp:TextBox>
        </div>

        <!-- Address -->
        <div style="display:flex; align-items:center; gap:10px;">
            <label style="width:150px; font-weight:bold; color:#333;">Address</label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Rows="3" Width="100%" 
                         style="padding:6px 10px; border-radius:8px; border:1px solid #ccc;"></asp:TextBox>
        </div>

        <!-- User Name -->
        <div style="display:flex; align-items:center; gap:10px;">
            <label style="width:150px; font-weight:bold; color:#333;">User Name</label>
            <asp:TextBox ID="TextBox4" runat="server" Width="100%" 
                         style="padding:6px 10px; border-radius:8px; border:1px solid #ccc;"></asp:TextBox>
        </div>

        <!-- Password -->
        <div style="display:flex; align-items:center; gap:10px;">
            <label style="width:150px; font-weight:bold; color:#333;">Password</label>
            <asp:TextBox ID="TextBox5" runat="server" Width="100%" TextMode="Password"
                         style="padding:6px 10px; border-radius:8px; border:1px solid #ccc;"></asp:TextBox>
        </div>

        <!-- Register Button -->
        <div style="text-align:center; margin-top:10px;">
            <asp:Button ID="Button1" runat="server" ForeColor="White" BackColor="#007bff" 
                OnClick="Button1_Click" Text="Register" Height="35px" Width="100%" 
                Style="border:none; border-radius:10px; font-size:16px; cursor:pointer; transition:0.3s;"
                onmouseover="this.style.backgroundColor='#0056b3';" 
                onmouseout="this.style.backgroundColor='#007bff';" />
        </div>

        <!-- Error/Status Label -->
        <div style="text-align:center; margin-top:5px;">
            <asp:Label ID="Label1" runat="server" Text="" ForeColor="#ff0000"></asp:Label>
        </div>

    </div>
</asp:Content>
