<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Productpage.aspx.cs" Inherits="admin.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f2f4f8;
        }

        /* 🔹 Page Layout */
        .page-container {
            display: flex;
            margin: 20px;
            gap: 20px;
        }

        /* 🔹 Sidebar */
        .sidebar {
            width: 250px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.05);
            height: fit-content;
        }

        .sidebar h3 {
            font-size: 18px;
            margin-bottom: 12px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 6px;
            color: #222;
        }

        .filter-group {
            margin-bottom: 28px;
        }

        .filter-group h4 {
            font-size: 15px;
            margin-bottom: 8px;
            color: #333;
        }

        .filter-group label {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 14px;
    color: #333;
    margin: 6px 0;
    cursor: pointer;
}

.filter-group input[type="checkbox"],
.filter-group input[type="radio"] {
    width: 16px;
    height: 16px;
    margin: 0;
}


        /* 🔹 Products Section */
        .products-grid {
            flex: 1;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        /* 🔹 Product Card */
        .product-card {
            width:290px;
            background: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: all 0.25s ease-in-out;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            border-color: #c45500;
        }

        .product-img {
            width: 100%;
            height: 240px;
            object-fit: contain;
            display: block;
            margin: 0 auto 10px;
            transition: transform 0.3s ease;
        }

        .product-card:hover .product-img {
            transform: scale(1.05);
        }

        .product-name {
            font-size: 20px;
            font-weight: 700;
            color: #1a1a1a;
            margin-top: 10px;
            text-transform: capitalize;
        }

        .product-brand {
            font-size: 16px;
            font-weight: 600;
            color: #007bff; /* bright blue */
            margin-top: 4px;
        }

        .product-price {
            font-size: 18px;
            color: #b12704;
            font-weight: bold;
            margin-top: 8px;
        }

        .buy-btn {
            padding: 8px 18px;
            margin-top: 10px;
            border-radius: 6px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            background-color: #ff6600;
            color: #fff;
            transition: all 0.2s ease-in-out;
            display: inline-block;
        }

        .buy-btn:hover {
            background-color: #e05500;
            transform: scale(1.05);
        }

        /* 🔹 Responsive Design */
        @media (max-width: 1200px) {
            .products-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 900px) {
            .page-container {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
            }
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {
            .products-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <!-- 🔹 Page Layout -->
    <div class="page-container">

        <!-- 🔹 Sidebar Filters -->
        <div class="sidebar">
            <h3>Filters</h3>

           <div class="filter-group">
              <h4>Category</h4>
         <label><asp:CheckBox ID="chkSupp" runat="server" Text=" Supplements" /></label>
          <label><asp:CheckBox ID="chkEquip" runat="server" Text=" Equipments" /></label>
            <label><asp:CheckBox ID="chkAcc" runat="server" Text=" Gym Accessories" /></label>
          <label><asp:CheckBox ID="chkCloth" runat="server" Text=" Gym Clothings" /></label>
              </div>


            <div class="filter-group">
                <h4>Price</h4>
                <label><input type="radio" name="price" /> Under ₹500</label>
                <label><input type="radio" name="price" /> ₹500 - ₹2000</label>
                <label><input type="radio" name="price" /> ₹2000 - ₹5000</label>
                <label><input type="radio" name="price" /> ₹5000 & Above</label>
            </div>
        </div>

        <!-- 🔹 Product Display Grid -->
        <div class="products-grid">
            <asp:DataList ID="DataList1" runat="server" RepeatLayout="Table" RepeatColumns="4" CellPadding="10">
                <ItemTemplate>
                    <div class="product-card">
                        <asp:ImageButton ID="ImageButton1" runat="server" 
                            CommandArgument='<%# Eval("pro_id") %>' 
                            Height="240px" 
                            ImageUrl='<%# Eval("image") %>' 
                            OnCommand="ImageButton1_Command" 
                            Width="240px" 
                            CssClass="product-img" />

                        <div class="product-name"><%# Eval("Name") %></div>
                        <div class="product-brand"><%# Eval("Brand") %></div>
                        <div class="product-price">₹ <%# Eval("price") %></div>

                        <div class="product-actions">
                            <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="buy-btn" OnClick="btnBuyNow_Click" CommandArgument='<%# Eval("pro_id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

</asp:Content>
