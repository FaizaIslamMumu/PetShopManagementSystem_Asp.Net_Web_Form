<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="My_ASP_Project.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="row">
        <div class="col">
            <asp:FormView runat="server" AllowPaging="True" DataSourceID="ObCategoryEntry" DefaultMode="Insert">
                
                   
                <InsertItemTemplate>
                   
                    CategoryName:
                    <asp:TextBox ID="CategoryNameTextBox" runat="server"   cssClass="form-control mt-3" Text='<%# Bind("CategoryName") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Bind("id") %>' />
                    <br />
                    CategoryName:
                    <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' />
                    <br />
                    <asp:LinkButton ID="NewButton" runat="server" cssClass="form-control" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObCategoryEntry" runat="server" DataObjectTypeName="My_ASP_Project.Models.categoryInfo" InsertMethod="Insert" SelectMethod="Get" TypeName="My_ASP_Project.DAL.CategoryGetWay"></asp:ObjectDataSource>
        </div>
    </div>

   <div class="row">
       <div class="col">
           <asp:GridView runat="server" cssClass="table table-bordered" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="categoryID" DataSourceID="SqlDataSource1">
               <Columns>
                   <asp:TemplateField HeaderText="category ID" InsertVisible="False" SortExpression="categoryID">
                       <EditItemTemplate>
                           <asp:Label ID="Label1" runat="server" cssClass="form-control" Text='<%# Eval("categoryID") %>'></asp:Label>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label2" runat="server"  cssClass="form-control" Text='<%# Bind("categoryID") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="category Name" SortExpression="categoryName">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server"  cssClass="form-control"  Text='<%# Bind("categoryName") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Label ID="Label1" runat="server"  cssClass="form-control"  Text='<%# Bind("categoryName") %>'></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField ShowHeader="False">
                       <EditItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                           &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                           &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petDBConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [categoryID] = @categoryID" InsertCommand="INSERT INTO [Category] ([categoryName]) VALUES (@categoryName)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [categoryName] = @categoryName WHERE [categoryID] = @categoryID">
               <DeleteParameters>
                   <asp:Parameter Name="categoryID" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="categoryName" Type="String" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="categoryName" Type="String" />
                   <asp:Parameter Name="categoryID" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>
       </div>
   </div>

    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
