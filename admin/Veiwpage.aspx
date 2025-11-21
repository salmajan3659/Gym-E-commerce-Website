<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Veiwpage.aspx.cs" Inherits="admin.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlainContent" runat="server">
    <style>
        /* 🔹 Full Background Slider */
        body {
            margin: 0;
            padding: 0;
        }

        .bg-slider {
            position: fixed;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .bg-slider img {
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            animation: fade 15s infinite;
        }

        /* Each image starts at different time */
        .bg-slider img:nth-child(1) { animation-delay: 0s; }
        .bg-slider img:nth-child(2) { animation-delay: 5s; }
        .bg-slider img:nth-child(3) { animation-delay: 10s; }

        @keyframes fade {
            0%   { opacity: 0; }
            10%  { opacity: 1; }
            30%  { opacity: 1; }
            40%  { opacity: 0; }
            100% { opacity: 0; }
        }

        /* 🔹 Product Container */
        .products-container {
            padding: 40px 20px;
            text-align: center;
            min-height: 100vh;
            position: relative;
            z-index: 1;
        }

        .products-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 40px;
            color: #fff;
            position: relative;
            display: inline-block;
            text-shadow: 0px 2px 6px rgba(0,0,0,0.6);
        }

        .products-title::after {
            content: '';
            display: block;
            width: 50%;
            height: 3px;
            background: linear-gradient(to right, #3498db, #9b59b6);
            margin: 8px auto 0;
            border-radius: 2px;
        }

        /* 🔹 Product card */
        .product-card {
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 20px 15px;
            margin: 15px;
            text-align: center;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease-in-out;
            background: rgba(255,255,255,0.9);
        }

        .product-card:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0px 8px 25px rgba(0,0,0,0.15);
            cursor: pointer;
        }

        /* 🔹 Product image */
        .product-img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border-radius: 12px;
            transition: transform 0.3s ease;
        }

        .product-card:hover .product-img {
            transform: scale(1.1);
        }

        /* 🔹 Product info */
        .product-name {
            margin-top: 12px;
            font-size: 20px;
            font-weight: 600;
            color: #34495e;
        }

        .product-price {
            margin-top: 6px;
            font-size: 18px;
            color: #27ae60;
            font-weight: 500;
        }

        /* 🔹 Buttons */
        .product-actions {
            margin-top: 15px;
        }

        .product-actions .btn {
            padding: 8px 18px;
            margin: 5px;
            border-radius: 6px;
            border: none;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        #btnAddToCart {
            background: linear-gradient(45deg, #f39c12, #e67e22);
            color: #fff;
        }
        #btnAddToCart:hover {
            background: linear-gradient(45deg, #e67e22, #d35400);
            transform: scale(1.05);
        }

        #btnBuyNow {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: #fff;
        }
        #btnBuyNow:hover {
            background: linear-gradient(45deg, #2980b9, #2471a3);
            transform: scale(1.05);
        }

        /* 🔹 Responsive */
        @media screen and (max-width: 1200px) {
            .DataList1 table { width: 100% !important; }
        }
        @media screen and (max-width: 768px) {
            .product-card { margin: 15px auto; }
            .product-img { width: 140px; height: 140px; }
        }
        @media screen and (max-width: 480px) {
            .product-card { padding: 15px 10px; }
            .product-name { font-size: 18px; }
            .product-price { font-size: 16px; }
            .product-actions .btn { padding: 6px 12px; font-size: 14px; }
        }
    </style>

    <!-- 🔹 Background Slider -->
    <div class="bg-slider">
        <img src="Images/bg1.png" alt="Background 1" />
        <img src="Images/bg2.png" alt="Background 2" />
        <img src="Images/bg3.png" alt="Background 3" />
    </div>

    <!-- 🔹 Products List -->
    <div class="products-container">
        <div class="products-title">Products</div>

        <asp:DataList ID="DataList12" runat="server" RepeatColumns="4">
            <ItemTemplate>
                <div class="product-card">
                    <asp:Image ID="ProductImage" runat="server"
                        ImageUrl='<%# Eval("image") %>'
                        CssClass="product-img" />

                    <div class="product-name"><%# Eval("Name") %></div>
                    <div class="product-price">₹ <%# Eval("price") %></div>

                   
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
