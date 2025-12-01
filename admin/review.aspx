<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="WebForm11.aspx.cs" Inherits="admin.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <title>Send Email</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        .email-form-container { max-width: 500px; margin: 40px auto; padding: 30px 28px; background: #fafdff; border-radius: 12px; box-shadow: 0 4px 20px rgba(40,43,53,0.10); }
    </style>

    <div class="email-form-container">
        <h3 class="text-center mb-4">Send Email</h3>

        <div class="form-group">
            <asp:Label ID="textto" runat="server" Text="To Email"></asp:Label>
            <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" placeholder="Recipient email"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="textfrom" runat="server" Text="From Email"></asp:Label>
            <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control" placeholder="Your email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Body</label>
            <asp:TextBox ID="txtBody" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6"></asp:TextBox>
        </div>

        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary btn-block"
            Text="Send Email" OnClick="btnSend_Click" />
        <asp:Label ID="lblResult" runat="server" CssClass="d-block mt-3 text-center" />
        <asp:Label ID="Label1" runat="server" CssClass="d-block mt-3 text-center" />
    </div>

</asp:Content>
