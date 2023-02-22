<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DogEntry.aspx.cs" Inherits="My_ASP_Project.DogEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="row">
        <div class="col">
            <asp:ListView ID="ListView1" runat="server" 
                SelectMethod="ListView1_GetData" 
                InsertMethod="ListView1_InsertItem" 
                UpdateMethod="ListView1_UpdateItem" 
                DeleteMethod="ListView1_DeleteItem" 
                ItemPlaceholderID="itemHolder" 
                InsertItemPosition="LastItem" 
                DataKeyNames="DogId" ItemType="My_ASP_Project.Models.DogInfo">
        <ItemTemplate>
             <tr>
                <td>'<%# Eval("DogId") %>'</td>
                <td>'<%# Eval("DogName") %>'</td>
                <td>'<%# Eval("DogGender") %>'</td>
                <td>'<%# Eval("categoryID") %>'</td>
                <td>'<%# Eval("DogImage") %>'</td>
                <td>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-success btn-sm" CausesValidation="false"/>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger btn-sm" CausesValidation="false"/>
                </td>
            </tr>
        </ItemTemplate>

        <InsertItemTemplate>
           <tr>
               <td>Not Required</td>
               <td>
                   <asp:TextBox ID="txtDogName" CssClass="form-control" Text='<%# Bind("DogName") %>' runat="server"></asp:TextBox>
               </td>
               <td>
                   <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Gender" Text="Female" />
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Gender" Text="Male" />
               </td>
               <td>
                   <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" SelectedValue='<%# Bind("categoryID") %>' SelectMethod="ddl_GetData" DataTextField="CategoryName" DataValueField="id" AppendDataBoundItems="true">
                       <asp:ListItem Selected="True" Value="">----Select-----</asp:ListItem>
                   </asp:DropDownList>
               </td>
           </tr>
        </InsertItemTemplate>

        <EditItemTemplate></EditItemTemplate>

        <LayoutTemplate>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Dog Id</th>
                        <th>Dog Name</th>
                        <th>Dog Gender</th>
                        <th>Category</th>
                        <th>Dog Images</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="itemHolder" runat="server"></tbody>
            </table>
        </LayoutTemplate>
    </asp:ListView>
        </div>
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
