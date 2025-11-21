<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PROFILE.aspx.cs" Inherits="admin.PROFILE" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Profile - Users List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298, #6dd5ed);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container-box {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .section-title {
            color: #007bff;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .admin-card {
            background-color: #e9f4ff;
            border: 1px solid #b3daff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        .admin-card h4 {
            margin-bottom: 10px;
            color: #0056b3;
        }
        .gridview table {
            width: 100%;
        }
        .gridview th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .gridview td {
            text-align: center;
            vertical-align: middle;
        }
        .gridview .aspNetDisabled {
            color: gray;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-box">
            <h2 class="text-center mb-4">Admin Profile</h2>

            <!-- Admin Details Section -->
            <div class="admin-card">
                <div class="row">
                    <div class="col-md-6">
                        <h4><asp:Label ID="lblAdminName" runat="server" Text="Admin Name: John Doe"></asp:Label></h4>
                        <p><asp:Label ID="lblAdminEmail" runat="server" Text="Email: admin@example.com"></asp:Label></p>
                    </div>
                    <div class="col-md-6 text-md-right text-left">
                        <p><asp:Label ID="lblAdminRole" runat="server" Text="Role: Super Admin"></asp:Label></p>
                        <p><asp:Label ID="lblAdminPhone" runat="server" Text="Phone: +91 9876543210"></asp:Label></p>
                    </div>
                </div>
            </div>

            <!-- Users List Section -->
            <h3 class="section-title text-center">Users List</h3>

            <div class="gridview">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
                    AutoGenerateColumns="False" DataKeyNames="User_id"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating">

                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="User_Fullname" HeaderText="Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="User_Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Change Status">
                            <ItemTemplate>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
