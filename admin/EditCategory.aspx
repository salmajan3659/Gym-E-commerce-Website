<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="admin.WebForm9" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="PlainContent">
    <!-- Page Heading -->

    <div style="text-align:center; margin-bottom:40px; background-color:#4A3C8C; padding:20px; border-radius:10px;">
        <h1 style="color:white; font-family:Arial, Helvetica, sans-serif; font-size:42px; letter-spacing:2px;">
            Edit Categories
        </h1>
    </div>

    <!-- Centered GridView Container -->
    <div style="display:flex; justify-content:center;">
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="cat_id"
            OnRowCancelingEdit="GridView1_RowCancelingEdit1"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowEditing="GridView1_RowEditing1"
            OnRowUpdating="GridView1_RowUpdating1"
            CssClass="styledGrid"
            Width="100%">

            <Columns>
                <asp:BoundField DataField="cat_id" HeaderText="Category ID" ReadOnly="True" />
                <asp:BoundField DataField="cat_name" HeaderText="Category Name" />
                <asp:BoundField DataField="cat_desc" HeaderText="Category Description" />
                
                <asp:TemplateField HeaderText="Category Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="80px" Width="120px" ImageUrl='<%# Eval("cat_image") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("cat_image") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="status" HeaderText="Category Status" />
                <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
            </Columns>

            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />

            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Font-Size="Large" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" Font-Size="Medium" />
            <AlternatingRowStyle BackColor="Gainsboro" HorizontalAlign="Center" Font-Size="Medium" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" Font-Size="Medium" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>

    <!-- External CSS for hover, padding, edit mode -->
    <style type="text/css">
        .styledGrid tr:hover {
            background-color: #e0dfff;
        }
        .styledGrid th, .styledGrid td {
            text-align: center;
            padding: 15px;
        }

        /* Edit mode textboxes and file upload styling */
        .styledGrid tr td input[type="text"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 90%;
        }
        .styledGrid tr td input[type="file"] {
            padding: 5px;
        }
        .styledGrid tr td img {
            border-radius: 5px;
        }
    </style>
</asp:Content>
