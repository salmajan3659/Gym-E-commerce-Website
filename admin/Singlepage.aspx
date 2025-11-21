<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Singlepage.aspx.cs" Inherits="admin.Singlepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .product-container {
            display: flex;
            gap: 60px;
            margin: 60px auto;
            max-width: 1400px;
            background-color: #ffffff;
            border-radius: 20px;
            padding: 50px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .product-container:hover {
            transform: translateY(-5px);
        }

        /* IMAGE SECTION */
        .product-image {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-image img, .product-image asp\:Image {
            width: 480px;
            height: 480px;
            object-fit: contain;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
            animation: float 4s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        /* DETAILS SECTION */
        .product-details {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            gap: 25px;
        }

        .product-details h2 {
            font-size: 40px;
            font-weight: 700;
            color: #222;
            margin: 0;
        }

        .product-details h3 {
            font-size: 26px;
            color: #ff6600;
            font-weight: bold;
            margin: 0;
        }

        .product-details p {
            font-size: 20px;
            color: #555;
            line-height: 1.6;
        }

        /* PRICE LABEL */
        .label-price {
            color: #ff3e3e;
            font-size: 28px;
            font-weight: bold;
        }

        /* QUANTITY SECTION */
        .quantity-section {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 15px;
        }

        .quantity-section input[type="text"] {
            width: 80px;
            padding: 10px;
            text-align: center;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 20px;
        }

        .btn-qty {
            padding: 12px 20px;
            font-size: 20px;
            cursor: pointer;
            border: none;
            border-radius: 6px;
            background-color: #ff6600;
            color: #fff;
            transition: 0.2s;
        }

        .btn-qty:hover {
            background-color: #e05500;
        }

        /* BUTTONS */
        .add-to-cart-btn {
            margin-top: 30px;
            padding: 18px 40px;
            font-size: 22px;
            font-weight: bold;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 300px;
        }

        .add-to-cart-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .continue-btn {
            background-color: #007bff;
            margin-top: 10px;
        }

        .continue-btn:hover {
            background-color: #0069d9;
            transform: scale(1.05);
        }

        .stock-message {
            color: red;
            font-weight: bold;
            font-size: 20px;
            margin-top: 15px;
        }

        /* POPUP MESSAGE */
        .popup-message {
            visibility: hidden;
            opacity: 0;
            position: fixed;
            top: 30px;
            right: 30px;
            background-color: #28a745;
            color: #fff;
            padding: 20px 35px;
            border-radius: 10px;
            font-size: 22px;
            font-weight: bold;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            transform: translateY(-20px);
            transition: all 0.5s ease;
            z-index: 1000;
        }

        .popup-message.show {
            visibility: visible;
            opacity: 1;
            transform: translateY(0);
        }

        @media (max-width: 768px) {
            .product-container {
                flex-direction: column;
                width: 95%;
                padding: 25px;
            }

            .product-image img {
                width: 100%;
                height: auto;
            }

            .product-details h2 { font-size: 30px; }
            .product-details h3 { font-size: 22px; }
            .product-details p { font-size: 18px; }
        }
    </style>

    <!-- PRODUCT SECTION -->
    <div class="product-container">
        <!-- LEFT: IMAGE -->
        <div class="product-image">
            <asp:Image ID="Image1" runat="server" Height="480px" Width="480px" />
        </div>

        <!-- RIGHT: DETAILS -->
        <div class="product-details">
            <h2><asp:Label ID="Label2" runat="server" Text="Product Name"></asp:Label></h2>
            <h3><asp:Label ID="Label3" runat="server" Text="Brand"></asp:Label></h3>
            <p><asp:Label ID="Label9" runat="server" Text="Description"></asp:Label></p>
            <p>Price: <span class="label-price">₹</span><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></p>

            <!-- Quantity -->
            <div class="quantity-section">
                <asp:Button ID="Button3" runat="server" CssClass="btn-qty" OnClick="Button3_Click" Text="-" />
                <asp:TextBox ID="TextBox1" runat="server" Text="1" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" CssClass="btn-qty" OnClick="Button2_Click" Text="+" />
            </div>

            <!-- Buttons -->
            <asp:Button ID="Button1" 
                runat="server" 
                CssClass="add-to-cart-btn" 
                Text="Add to Cart" 
                OnClick="Button1_Click" />
            
            <asp:Button ID="Button4" 
                runat="server" 
                CssClass="add-to-cart-btn continue-btn" 
                Text="Continue Shopping" 
                OnClick="Button4_Click" />

            <asp:Label ID="Label6" runat="server" CssClass="stock-message" Visible="False"></asp:Label>
        </div>
    </div>

    <!-- Popup -->
    <div id="popup" class="popup-message">🛒 Added to Cart Successfully!</div>

    <script>
        function showPopup() {
            var popup = document.getElementById("popup");
            popup.classList.add("show");
            setTimeout(function () {
                popup.classList.remove("show");
            }, 2500);
        }
    </script>

</asp:Content>
