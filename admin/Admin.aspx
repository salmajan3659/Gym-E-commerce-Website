<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="admin.WebForm7" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FitBuy Admin Dashboard</title>
    <style>
        body {margin:0;padding:0;font-family:'Segoe UI',Arial,sans-serif;background:#f5f5f5;color:#333;}
        .header {position:fixed;top:0;left:0;width:98%;height:70px;background:#1B2A49;color:white;
                 display:flex;justify-content:space-between;align-items:center;padding:0 30px;
                 box-shadow:0 3px 8px rgba(0,0,0,0.2);z-index:1000;}
        .logo {font-size:32px;font-weight:bold;background:linear-gradient(90deg,#FF9900,#FFB84D);
               -webkit-background-clip:text;-webkit-text-fill-color:transparent;cursor:pointer;transition:0.3s;}
        .logo:hover {transform:scale(1.1);}
        .button-group {display:flex;gap:12px;}
        .aspNet-Button {padding:8px 20px;border-radius:6px;font-weight:500;border:none;cursor:pointer;
                        background:linear-gradient(90deg,#FF9900,#FFB84D);color:white;}
        .sidebar {position:fixed;top:70px;left:0;width:220px;height:calc(100% - 70px);background:#fff;
                  border-right:1px solid #ddd;padding-top:20px;}
        .menu-link {display:block;margin:8px auto;padding:12px 15px;width:90%;border-radius:6px;
                    text-decoration:none;color:#1B2A49;font-size:16px;font-weight:500;transition:0.3s;}
        .menu-link:hover {background:#FF9900;color:white;}
        .main-content {margin-left:220px;margin-top:70px;padding:30px 40px;}
        .dashboard-cards {display:grid;grid-template-columns:repeat(auto-fit,minmax(300px,1fr));gap:20px;}
        .card {background:#fff;padding:25px;border-radius:12px;box-shadow:0 3px 10px rgba(0,0,0,0.08);
               transition:0.3s;cursor:pointer;}
        .card:hover {transform:translateY(-6px) scale(1.03);}
        .card.products {border-left:6px solid #FF9900;}
        .card.categories {border-left:6px solid #22BB33;}
        .card.orders {border-left:6px solid #0073BB;}
        .card h3 {margin:0;color:#1B2A49;font-size:32px;}
        .card p {margin:6px 0 0;color:#555;}
        .progress {height:6px;background:#eee;border-radius:6px;margin-top:10px;overflow:hidden;}
        .progress-bar {height:6px;width:0;animation:loadProgress 1.2s forwards;}
        .card.products .progress-bar {background:#FF9900;}
        .card.categories .progress-bar {background:#22BB33;}
        .card.orders .progress-bar {background:#0073BB;}
        @keyframes loadProgress {0%{width:0;}100%{width:70%;}}
    </style>

    <!-- Counter Animation -->
    <script>
        function animateLabel(lblId) {
            let lbl = document.getElementById(lblId);
            let endValue = parseInt(lbl.innerText);
            let count = 0;
            let step = Math.ceil(endValue / 50);
            let timer = setInterval(() => {
                count += step;
                if (count >= endValue) {
                    count = endValue;
                    clearInterval(timer);
                }
                lbl.innerText = count;
            }, 20);
        }
        window.onload = function () {
            animateLabel("<%= lblProducts.ClientID %>");
            animateLabel("<%= lblCategories.ClientID %>");
            animateLabel("<%= lblOrders.ClientID %>");
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">

        <div class="header">
            <div class="logo">FitBuy Admin</div>
            <div class="button-group">
                <asp:Button ID="Button1" runat="server" Text="👤 Profile" CssClass="aspNet-Button" OnClick="btnProfile_Click" />
                <asp:Button ID="btnLogout" runat="server" Text="🚪 Log Out" CssClass="aspNet-Button" OnClick="btnLogout_Click1" />
            </div>
        </div>

    <div class="sidebar">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="addcategory.aspx" CssClass="menu-link">➕ Add Category</asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Add Product.aspx" CssClass="menu-link">➕ Add Product</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="editcategory.aspx" CssClass="menu-link">✏️ Edit Category</asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="editpro.aspx" CssClass="menu-link">✏️ Edit Product</asp:HyperLink>
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="viewfeedback.aspx" CssClass="menu-link">💬 View Feedback</asp:HyperLink>
</div>


        <div class="main-content">
            <h2>📊 Dashboard Overview</h2>

            <div class="dashboard-cards">
                <div class="card products">
                    <h3><asp:Label ID="lblProducts" runat="server" Text="0"></asp:Label></h3>
                    <p>Total Products</p>
                    <div class="progress"><div class="progress-bar"></div></div>
                </div>

                <div class="card categories">
                    <h3><asp:Label ID="lblCategories" runat="server" Text="0"></asp:Label></h3>
                    <p>Categories</p>
                    <div class="progress"><div class="progress-bar"></div></div>
                </div>

                <div class="card orders">
                    <h3><asp:Label ID="lblOrders" runat="server" Text="0"></asp:Label></h3>
                    <p>Orders</p>
                    <div class="progress"><div class="progress-bar"></div></div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
