<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="admin.account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function ShowPaymentAlert() {
            var payAmount = document.getElementById('<%= txtPayAmount.ClientID %>').value;
            var payMode = document.getElementById('<%= ddlPayMode.ClientID %>').value;

            if (payAmount.trim() === '') {
                alert("Please enter a payment amount.");
                return false;
            }

            alert("Payment Amount: " + payAmount + "\nPayment Mode: " + payMode);
            return true;
        }
    </script>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .auto-style1 {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
    </style>

    <div class="form-container">
        <!-- Account Panel -->
        <asp:Panel ID="pnlAccount" runat="server">
            <h2 class="text-center mb-4">Enter Account Details</h2>

            <div class="form-group">
                <label for="txtAccNumber">Account Number</label>
                <asp:TextBox ID="txtAccNumber" CssClass="auto-style1" runat="server"
                    placeholder="Enter Account Number" OnTextChanged="txtAccNumber_TextChanged1"
                    AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtAccNumber" ErrorMessage="please enter your account number"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="ddlAccType">Account Type</label>
                <asp:DropDownList ID="ddlAccType" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">Select Account Type</asp:ListItem>
                    <asp:ListItem>Savings</asp:ListItem>
                    <asp:ListItem>Current</asp:ListItem>
                    <asp:ListItem>Fixed Deposit</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="ddlAccType" ErrorMessage="please select account type"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtBalance">Balance Amount</label>
                <asp:TextBox ID="txtBalance" CssClass="form-control" runat="server"
                    placeholder="Enter Balance Amount"></asp:TextBox>
            </div>

            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-block"
                Text="Submit" OnClick="btnSubmit_Click" />
        </asp:Panel>

        <!-- Payment Panel -->
        <asp:Panel ID="pnlPayment" runat="server" Visible="false">
            <h2 class="text-center mb-4">Payment Details</h2>

            <div class="form-group">
                <label for="txtPayAmount">Payment Amount</label>
                <asp:TextBox ID="txtPayAmount" runat="server" CssClass="form-control"
                    placeholder="Enter Payment Amount" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtPayAmount" ErrorMessage="Please enter an amount"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="ddlPayMode">Payment Mode</label>
                <asp:DropDownList ID="ddlPayMode" runat="server" CssClass="form-control">
                    <asp:ListItem>UPI</asp:ListItem>
                    <asp:ListItem>Net Banking</asp:ListItem>
                    <asp:ListItem>Credit Card</asp:ListItem>
                    <asp:ListItem>Debit Card</asp:ListItem>
                    <asp:ListItem>Wallet</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnPay" runat="server" CssClass="btn btn-success btn-block"
                Text="Make Payment" OnClientClick="return ShowPaymentAlert();"
                OnClick="btnPay_Click" />
            <asp:Label ID="lblPayStatus" runat="server" ForeColor="Green"></asp:Label>
        </asp:Panel>
    </div>

</asp:Content>
