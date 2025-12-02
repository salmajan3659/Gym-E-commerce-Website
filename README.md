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


## DashBoard page
<img width="1920" height="1008" alt="Screenshot 2025-11-30 213023" src="https://github.com/user-attachments/assets/d69bad3e-0172-47d5-84d2-48944e39eb07" />
<img width="1920" height="1008" alt="Screenshot 2025-11-30 213032" src="https://github.com/user-attachments/assets/fd955b24-6aea-47bf-b434-61449bedf658" />

## Product Page
<img width="1920" height="1008" alt="Screenshot 2025-11-30 213043" src="https://github.com/user-attachments/assets/c8380e4e-8a94-4bf1-a0e0-ec789722a2f2" />

## Single page
<img width="1920" height="1008" alt="Screenshot 2025-11-30 213208" src="https://github.com/user-attachments/assets/6ce4fe0d-fd39-4f04-b01b-d23fc2568272" />

## Cart Page
<img width="1920" height="1008" alt="Screenshot 2025-11-30 213214" src="https://github.com/user-attachments/assets/e65bbd9d-27ff-40ed-b1af-5280577f651b" />

## Billing Page
<img width="1920" height="1008" alt="Screenshot 2025-11-30 213532" src="https://github.com/user-attachments/assets/08c3a4ff-1b6d-41c3-b9de-0a2ab2ed648e" />


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

