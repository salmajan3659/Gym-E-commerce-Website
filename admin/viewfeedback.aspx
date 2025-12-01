<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="viewfeedback.aspx.cs" Inherits="admin.viewfeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="max-width:700px; margin:40px auto;">
        <h2 class="text-center mb-4">User Feedbacks</h2>

        <asp:GridView ID="gridview1" runat="server" CssClass="table table-bordered table-striped"
            AutoGenerateColumns="False" DataKeyNames="review_id">
            <Columns>
                <asp:BoundField DataField="User_Fullname" HeaderText="Username" />
                <asp:BoundField DataField="review" HeaderText="Feedback" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server"
                            CommandArgument='<%# Eval("review_id") %>'
                            OnCommand="LinkButton1_Command1">Reply</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
