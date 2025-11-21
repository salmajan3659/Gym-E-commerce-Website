<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="billview.aspx.cs" Inherits="admin.billview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .bill-container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
        }
        .bill-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .bill-table {
            width: 100%;
            border-collapse: collapse;
        }
        .bill-table th, .bill-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        .total-row {
            font-weight: bold;
        }
        .customer-info {
            margin-bottom: 20px;
        }
    </style>
     <div class="bill-container">
        <div class="bill-header">
            <h2>Fitbuy - Invoice</h2>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>

        <div class="customer-info">
            <h4>Customer Details</h4>
            <p><strong>Name:</strong> <asp:Label ID="Label2" runat="server" /></p>
            <p>&nbsp;</p>
            <p><strong>Address:</strong> <asp:Label ID="Label4" runat="server" /></p>
            <p><strong>Phone:</strong> <asp:Label ID="Label5" runat="server" /></p>
        </div>

        <h4>Order Details</h4>
        <asp:GridView ID="gridview2" runat="server" AutoGenerateColumns="False" CssClass="bill-table">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Product Name" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="price" HeaderText="Unit Price" />
                <asp:BoundField DataField="subtotal" HeaderText="Total" />
            </Columns>
        </asp:GridView>

        <br />
        <table style="width:100%;">
            <tr class="total-row">
                <td style="text-align:right;">Grand Total:</td>
                <td style="width:150px;text-align:center;">
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>

        <br />
        <div style="text-align:center;">
            <asp:Button ID="Button1" runat="server" Text="proceed to payment" CssClass="btn btn-primary" OnClick="btnPrint_Click" />
        </div>
    </div>
</asp:Content>




