## 📋 Project Overview

FitBuy is a full-featured e-commerce application specializing in gym supplements, equipment, and fitness accessories. The platform provides both customer-facing shopping functionality and administrative management tools.

## 🏗️ Architecture

### Technology Stack

- **Backend**: ASP.NET 4.7.2 (C#)
- **Frontend**: HTML5, CSS3, Bootstrap 5
- **Database**: SQL Server
- **Web Services**: Windows Communication Foundation (WCF)
- **Build System**: MSBuild
- **JavaScript**: jQuery 1.11.0, Bootstrap Bundle 5

### Project Structure

```
admin/
├── Connected Services/
│   └── bal/                    # WCF Service References
├── assets/
│   ├── css/                    # Stylesheets (Bootstrap, FontAwesome, Custom)
│   ├── js/                     # JavaScript libraries and custom scripts
│   └── img/                    # Product and brand images
├── Phs/                        # Photo storage
├── *.aspx                      # ASP.NET Web Forms
├── *.html                      # Static HTML pages
└── Web.config                  # Configuration file
```

## 🔧 Key Features

### 🛍 Customer Features
- **Product Browsing**: Explore supplements, gym equipment, and clothing
- **Single Product View**: Detailed display with images, brand, and pricing
- **Shopping Cart**: Add products with quantity selection and checkout support
- **Product Search**: Search and category-based filtering
- **Responsive Design**: Optimized for mobile and desktop

### 🛠 Admin Features
- **Product Management**: Add, edit, view, and manage inventory
- **Category Management**: Organize products by category
- **Order Tracking**: View and manage purchase orders
- **Feedback Management**: Monitor customer reviews and ratings
- **User Management**: Admin profile and registered user list

---

## 📄 Major Application Pages

### 🛍 Customer Pages

| Page | Purpose |
|------|---------|
| **index.html** | Homepage with featured and trending products |
| **Product.aspx** | Product listing based on selected category |
| **Singlepage.aspx** | Detailed product view + Add to cart |
| **cart.aspx** | Manage selected items and checkout |
| **feedback.aspx** | Submit user feedback for products |
| **account.aspx** | User login, registration & profile |

---

### 🛠️ Admin Pages

| Page | Purpose |
|------|---------|
| **Admin.aspx / mainpage.aspx** | Admin dashboard overview |
| **Add Product.aspx** | Add and manage products |
| **addCategory.aspx** | Create and manage product categories |
| **PROFILE.aspx** | Admin profile and registered users |
| **feedback.aspx** | View and manage customer feedback |
| **Product.aspx** | Admin product view based on selected category |

---

### 🧩 Master Pages

| File | Description |
|------|-------------|
| **Site1.Master** | Main UI layout for the customer side |
| **Site2.Master** | Admin layout with FitBuy branding |

## 🖥️ User Interface Screens

### 🛍 Customer Pages

| Account Page | Feedback Page |
|--|--|
| <img width="450" src="https://github.com/user-attachments/assets/07a3682c-fb46-4b59-ae4e-d36fe893a345" /> | <img width="450" src="https://github.com/user-attachments/assets/7f3d7953-c3a9-43d0-8810-f7dfb27044dc" /> |

| Product Listing | Single Product |
|--|--|
| <img width="450" src="https://github.com/user-attachments/assets/0927dd1c-b405-460a-b76c-4534dbc1a1e2" /> | <img width="450" src="https://github.com/user-attachments/assets/22e4af11-6e46-4d4a-9439-d92103493ddc" /> |

---

### 🧾 Shopping & Checkout

| Cart Page | Billing Page |
|--|--|
| <img width="450" src="https://github.com/user-attachments/assets/67b99eba-3386-48c4-8bf4-0694aa2072c2" /> | <img width="450" src="https://github.com/user-attachments/assets/12da04f3-14e2-4237-8d89-70186256e347" /> |

---

### 🛠 Admin Dashboard

| Admin Dashboard |
|--|
| <img width="450" src="https://github.com/user-attachments/assets/7279c742-6b1f-4c53-a735-75fd6c9b969d" /> | 




## 📦 Database

The application uses SQL Server with the following key entities:
- **Products**: Name, brand, description, price, stock, image
- **Categories**: Product categorization
- **Users**: Customer accounts
- **Orders/Cart**: Shopping cart and order management

Connection via `DBConnectionClass.cs`

## 🔌 WCF Integration

[`Connected Services/bal/Reference.cs`](admin/Connected Services/bal/Reference.cs) provides service operations:

```csharp
- balancheck(string accno)      // Check account balance
- amountreduce(string accno, int uid, int amount)  // Process payment
```

**Service Endpoint**: `http://localhost:57302/Service.svc`

## 🎨 Styling

- **Bootstrap 5**: Responsive grid and components
- **FontAwesome**: Icon library for UI elements
- **Custom CSS**: Brand-specific styling via custom.css

## 🚀 Getting Started

### Prerequisites

- Visual Studio 2019 or later
- .NET Framework 4.7.2
- SQL Server 2016+
- IIS Express (included with Visual Studio)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd admin
   ```

2. **Open the solution**
   ```bash
   admin.sln
   ```

3. **Configure Database Connection**
   - Update connection string in Web.config
   - Run database initialization scripts

4. **Restore NuGet Packages**
   ```bash
   NuGet Package Restore
   ```

5. **Build the Project**
   ```bash
   Build Solution (Ctrl+Shift+B)
   ```

6. **Configure WCF Service**
   - Update service endpoint in Web.config if needed
   - Default: `http://localhost:57302/Service.svc`

7. **Run the Application**
   - Press F5 or click Start Debugging
   - Application launches at `http://localhost:63505/`

## 📋 Web.config Configuration

Key settings in `Web.config`:

```xml
<system.web>
    <compilation debug="true" targetFramework="4.7.2" />
    <httpRuntime targetFramework="4.7.2" />
</system.web>

<system.serviceModel>
    <!-- WCF Service bindings -->
    <bindings>
        <basicHttpBinding>
            <binding name="BasicHttpBinding_IService" />
        </basicHttpBinding>
    </bindings>
    <client>
        <endpoint address="http://localhost:57302/Service.svc" ... />
    </client>
</system.serviceModel>
```

## 📦 Dependencies

Key NuGet packages:
- `Microsoft.CodeDom.Providers.DotNetCompilerPlatform` (v2.0.1)

See `packages.config` for complete list.

## 🔐 Security Features

- Session-based authentication
- User registration and login
- Admin-only access control for management pages
- Input validation on forms

## 📱 Responsive Design

The application uses Bootstrap 5 for responsive layouts:
- Mobile-first approach
- Breakpoints for tablets and desktops
- Flexible navigation menu

