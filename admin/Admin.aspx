<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="admin.WebForm7" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FitBuy Admin Dashboard</title>
    <style>
/* ---------- BODY ---------- */
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Arial, sans-serif;
    background: #f5f5f5;
    color: #333;
}

/* ---------- HEADER ---------- */
.header {
    position: fixed;
    top: 0;
    left: 0;
    width: 98%;
    height: 70px;
    background: #1B2A49;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 30px;
    box-shadow: 0 3px 8px rgba(0,0,0,0.2);
    z-index: 1000;
}

/* ---------- LOGO ---------- */
.logo {
    font-size: 32px;
    font-weight: bold;
    background: linear-gradient(90deg, #FF9900, #FFB84D);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
    transition: transform 0.3s ease;
    cursor: pointer;
}

.logo:hover {
    transform: scale(1.1);
}

/* ---------- BUTTONS ---------- */
.button-group {
    display: flex;
    gap: 12px;
}

.aspNet-Button {
    border: none;
    padding: 8px 20px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 6px;
    font-weight: 500;
    background: linear-gradient(90deg, #FF9900, #FFB84D);
    color: #fff;
    transition: all 0.3s ease, box-shadow 0.3s ease;
}

.aspNet-Button:hover {
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 6px 15px rgba(255,165,0,0.4);
}

/* ---------- SIDEBAR ---------- */
.sidebar {
    position: fixed;
    top: 70px;
    left: 0;
    width: 220px;
    height: calc(100% - 70px);
    background: #fdfdfd;
    border-right: 1px solid #ddd;
    display: flex;
    flex-direction: column;
    padding-top: 20px;
}

.menu-link {
    display: block;
    width: 90%;
    margin: 8px auto;
    padding: 12px 15px;
    color: #1B2A49;
    text-decoration: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.menu-link:hover {
    background: #FF9900;
    color: #fff;
}

/* ---------- MAIN CONTENT ---------- */
.main-content {
    margin-left: 220px;
    margin-top: 70px;
    padding: 30px 40px;
    min-height: calc(100vh - 70px);
}

.main-content h2 {
    font-size: 28px;
    margin-top: 0;
    margin-bottom: 25px;
    color: #FF5722;
}

/* ---------- DASHBOARD CARDS ---------- */
.dashboard-cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
}

.card {
    background: #fff;
    border-radius: 12px;
    padding: 25px 20px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.08);
    display: flex;
    flex-direction: column;
    justify-content: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
    position: relative;
}

.card:hover {
    transform: translateY(-6px) scale(1.03);
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
}

.card h3 {
    font-size: 28px;
    margin: 0 0 10px;
    color: #1B2A49;
}

.card p {
    font-size: 16px;
    margin: 0;
    color: #555;
}

/* ---------- CARD VARIANTS ---------- */
.card.products { border-left: 6px solid #FF9900; }
.card.categories { border-left: 6px solid #22BB33; }
.card.orders { border-left: 6px solid #0073BB; }

/* ---------- PROGRESS BARS ---------- */
.card .progress {
    height: 6px;
    border-radius: 6px;
    background: #eee;
    margin-top: 15px;
    overflow: hidden;
}

.card .progress-bar {
    height: 6px;
    width: 0;
    animation: loadProgress 1.2s forwards;
}

.card.products .progress-bar { background: #FF9900; }
.card.categories .progress-bar { background: #22BB33; }
.card.orders .progress-bar { background: #0073BB; }

@keyframes loadProgress {
    0% { width: 0; }
    100% { width: 70%; } /* example fill */
}

/* ---------- RESPONSIVE ---------- */
@media (max-width: 768px) {
    .sidebar { width: 180px; }
    .main-content { margin-left: 180px; padding: 20px; }
    .card h3 { font-size: 24px; }
    .card p { font-size: 14px; }
}
        .auto-style1 {
            position: fixed;
            top: 70px;
            left: 0;
            width: 180px;
            height: 220px;
            display: flex;
            flex-direction: column;
            border-right: 1px solid #ddd;
            padding-top: 20px;
            background: #fdfdfd;
        }
    </style>
    <script>
        // ---------- ANIMATED COUNTERS ----------
        function animateCounter(id, endValue) {
            let element = document.getElementById(id);
            let count = 0;
            let increment = Math.ceil(endValue / 100);
            let interval = setInterval(() => {
                count += increment;
                if (count >= endValue) {
                    count = endValue;
                    clearInterval(interval);
                }
                element.innerText = count;
            }, 20);
        }

        window.onload = function () {
            animateCounter("productsCount", 120);
            animateCounter("categoriesCount", 35);
            animateCounter("ordersCount", 480);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- ---------- HEADER ---------- -->
        <div class="header">
            <div class="logo">FitBuy Admin</div>
            <div class="button-group">
                <asp:Button ID="Button1" runat="server" Text="👤 Profile" CssClass="aspNet-Button" OnClick="btnProfile_Click" />
                <asp:Button ID="btnLogout" runat="server" Text="🚪 Log Out" CssClass="aspNet-Button" OnClick="btnLogout_Click1" />
            </div>
        </div>

        <!-- ---------- SIDEBAR ---------- -->
        <div class="auto-style1">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="addcategory.aspx" CssClass="menu-link">➕ Add Category</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Add Product.aspx" CssClass="menu-link">➕ Add Product</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="editcategory.aspx" CssClass="menu-link">✏️ Edit Category</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="editpro.aspx" CssClass="menu-link">✏️ Edit Product</asp:HyperLink>
        </div>

        <!-- ---------- MAIN CONTENT ---------- -->
        <div class="main-content">
            <h2>📊 Dashboard Overview</h2>
            <div class="dashboard-cards">
                <div class="card products">
                    <h3 id="productsCount">0</h3>
                    <p>Total Products</p>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                </div>
                <div class="card categories">
                    <h3 id="categoriesCount">0</h3>
                    <p>Categories</p>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                </div>
                <div class="card orders">
                    <h3 id="ordersCount">0</h3>
                    <p>Orders</p>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
