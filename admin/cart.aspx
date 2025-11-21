<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="admin.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f8f9fa;
        }

        .cart-container {
            width: 90%;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }

        .cart-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 18px;
        }

        .cart-table th, .cart-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .cart-table th {
            background-color: #f7f7f7;
            font-weight: bold;
        }

        .cart-table tr:hover {
            background-color: #f0f0f0;
        }

        .quantity-input {
            width: 60px;
            text-align: center;
            font-size: 16px;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .btn-qty {
            padding: 5px 12px;
            margin: 0 5px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            background-color: #fa8900;
            color: #fff;
            border-radius: 5px;
        }

        .btn-qty:hover {
            background-color: #e07a00;
        }

        .cart-btn {
            background-color: #fa8900;
            color: #fff;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 16px;
            margin: 10px 5px;
            cursor: pointer;
        }

        .cart-btn:hover {
            background-color: #e07a00;
        }

        @media (max-width: 992px) {
            .cart-container {
                width: 95%;
            }
            .cart-table th, .cart-table td {
                padding: 10px;
                font-size: 16px;
            }
            .quantity-input {
                width: 50px;
                font-size: 14px;
            }
            .btn-qty {
                padding: 4px 10px;
                font-size: 14px;
            }
        }
    </style>

    <div class="cart-container">
        <div class="cart-title">Your Shopping Cart<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="cart-table" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="cartid">
            <Columns>
                <asp:BoundField DataField="productid" HeaderText="Product" />
                    <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="₹{0}" />
                <asp:BoundField DataField="subtotal" HeaderText="Subtotal" DataFormatString="₹{0}" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        </div>

        <div style="text-align: right; margin-top: 20px;">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Cart" CssClass="cart-btn" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="cart-btn" OnClick="btnCheckout_Click1" />
        </div>
    </div>
<script>
    function incrementQty(btn) {
        var input = btn.previousElementSibling; // TextBox before the +
        var val = parseInt(input.value) || 0;
        input.value = val + 1;
    }

    function decrementQty(btn) {
        var input = btn.nextElementSibling; // TextBox after the -
        var val = parseInt(input.value) || 1;

        if (val > 1) {
            input.value = val - 1;
        } else {
            // Quantity is going below 1 → delete product
            var row = btn.closest('tr');
            row.classList.add('slide-out');
            setTimeout(function () {
                __doPostBack(btn.id, 'delete'); // triggers server-side deletion
            }, 500);
        }
    }
</script>


</asp:Content>
