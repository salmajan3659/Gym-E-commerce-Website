<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PROFILE.aspx.cs" Inherits="admin.PROFILE" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Profile - Users List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298, #6dd5ed);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container-box {
            max-width: 1000px;
            margin: 50px auto;
            background: white;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .admin-card {
            background-color: #e9f4ff;
            border: 1px solid #b3daff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        .admin-card h4 {
            color: #0056b3;
        }
        .gridview th {
            background-color: #007bff !important;
            color: white !important;
            text-align: center;
        }
        .gridview td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-box">
            <h2 class="text-center mb-4">Admin Profile</h2>

            <div class="admin-card">
                <h4>Admin Name: <asp:Label ID="LabelAdminName" runat="server" /></h4>
                <p>
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="Phone Number:"></asp:Label>
&nbsp;<asp:Label ID="LabelAdminPhone" runat="server" ForeColor="#FF3300" /></p>
            </div>

            <h3 class="text-center mb-4 text-primary">Users List</h3>

            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped gridview"
                AutoGenerateColumns="False" DataKeyNames="User_id"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDataBound="GridView1_RowDataBound">

                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="User_Fullname" HeaderText="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="User_Phone" HeaderText="Phone" />

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <%# Eval("Status") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                            </asp:RadioButtonList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
