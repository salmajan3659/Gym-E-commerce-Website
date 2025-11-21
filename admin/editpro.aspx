<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="editpro.aspx.cs" Inherits="admin.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlainContent" runat="server">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="pro_id" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="#DCDCDC" />

        <Columns>
            <asp:BoundField DataField="pro_id" HeaderText="Product ID" />
            <asp:BoundField DataField="cat_id" HeaderText="category ID" />
            <asp:BoundField DataField="Name" HeaderText="Product Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" >
            </asp:BoundField>
            <asp:BoundField DataField="brand" HeaderText="Brand" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:TemplateField HeaderText="Image">
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Image") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="57px" ImageUrl='<%# Eval("image") %>' Width="94px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Stock" HeaderText="Stock" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
            <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
        
            

    </asp:GridView>
</asp:Content>
