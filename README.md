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

### Customer Features
- **Product Browsing**: Browse gym supplements, clothing, and accessories
- **Single Product View**: Detailed product pages with images, descriptions, and pricing
- **Shopping Cart**: Add products to cart with quantity selection
- **Product Search**: Search and filter functionality
- **Responsive Design**: Mobile-friendly interface

### Admin Features
- **Product Management**: Add, edit, and view products
- **Category Management**: Organize products by categories
- **Order Tracking**: View and manage customer orders
- **Feedback Management**: View customer feedback and reviews
- **User Management**: Admin profile and user list management

### Core Pages

| Page | Purpose |
|------|---------|
| index.html | Homepage with featured products |
| shop.html | Product catalog and listing |
| shop-single.html | Individual product details |
| about.html | Company information and services |
| contact.html | Contact form with map integration |
| Singlepage.aspx | ASP.NET product detail page |
| mainpage.aspx | Main dashboard page |

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

## 📝 ASP.NET Pages

### Server-Side Forms

| Page | Purpose |
|------|---------|
| account.aspx | User account management |
| Add Product.aspx | Admin product creation |
| addCategory.aspx | Category management |
| Admin.aspx | Admin dashboard |
| adminreg.aspx | Admin registration |
| cart.aspx | Shopping cart |
| feedback.aspx | Feedback submission |
| PROFILE.aspx | Admin profile and users list |

### Master Pages

- Site1.Master - Primary master page
- Site2.Master - Secondary master page with FitBuy branding

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
