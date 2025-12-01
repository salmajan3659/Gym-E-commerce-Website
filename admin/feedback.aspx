<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="admin.feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    .feedback-card {
        background: #fff;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.10);
        width: 100%;
        max-width: 600px;
        margin: 60px auto;
    }
    .feedback-title {
        font-size: 26px;
        font-weight: 600;
        text-align: center;
        margin-bottom: 25px;
        color: #0A3D62;
        border-bottom: 3px solid #2E86DE;
        padding-bottom: 8px;
        display: inline-block;
    }
    .form-label {
        font-weight: 500;
        margin-bottom: 6px;
    }
    .btn-feedback {
        background: #2E86DE;
        border: none;
        border-radius: 8px;
        padding: 12px 15px;
        font-size: 18px;
        font-weight: 600;
        width: 100%;
        color: #fff;
        transition: 0.3s;
    }
    .btn-feedback:hover {
        background: #1765BF;
    }
</style>

<div class="feedback-card">
    <div class="feedback-title">Share Your Feedback</div>

    <div class="mb-3">
        <label class="form-label">Full Name</label>
        <asp:TextBox ID="txtName" runat="server"
            CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
    </div>

    <div class="mb-3">
        <label class="form-label">Email Address</label>
        <asp:TextBox ID="txtEmail" runat="server"
            CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
    </div>

    <div class="mb-3">
        <label class="form-label">Your Feedback</label>
        <asp:TextBox ID="txtFeedback" runat="server"
            CssClass="form-control"
            TextMode="MultiLine" Rows="6"
            placeholder="Write your feedback here..."></asp:TextBox>
    </div>

    <asp:Button ID="btnSubmit" runat="server" CssClass="btn-feedback"
        Text="Submit Feedback" OnClick="btnSubmit_Click" />

    <div class="text-center mt-3">
        <asp:Label ID="lblMsg" runat="server" CssClass="fw-bold"></asp:Label>
    </div>
</div>

</asp:Content>
