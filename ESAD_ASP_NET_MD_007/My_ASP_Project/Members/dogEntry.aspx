<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dogEntry.aspx.cs" Inherits="My_ASP_Project.dogEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemHolder" InsertItemPosition="LastItem" DataKeyNames="DogId" DataSourceID="SqlDataSource1" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating">
        <ItemTemplate>
            <tr class="table table-bordered">

                <td>
                    <asp:Label ID="DogIdLabel" runat="server" CssClass="form-control" Text='<%# Eval("DogId") %>' />
                </td>
                <td>
                    <asp:Label ID="DogNameLabel" runat="server" Text='<%# Eval("DogName") %>' />
                </td>
                <td>
                    <asp:RadioButton ID="RadioButton2" GroupName="Gender" Text="Female" runat="server" />
                    <asp:RadioButton ID="RadioButton1" GroupName="Gender" Text="Male" runat="server" />
                   

                   <%-- <asp:CheckBox ID="DogGenderCheckBox" runat="server" Checked='<%# Eval("DogGender") %>' Enabled="false" />--%>
                </td>
                <td>
                    <asp:Label ID="categoryIDLabel" runat="server" Text='<%# Eval("categoryID") %>' />
                </td>
                <td>
                   <asp:Image ID="Image1" runat="server" Width="50" ImageUrl='<%# Eval("DogImage","~/Images/{0}") %>' />
                </td>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>

            </tr>
        </ItemTemplate>
      
        <EditItemTemplate>

            <tr class="table table-bordered">

                <td>
                    <asp:Label ID="DogIdLabel1" runat="server" Text='<%# Eval("DogId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DogNameTextBox" runat="server" Text='<%# Bind("DogName") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="DogGenderCheckBox" runat="server" Checked='<%# Bind("DogGender") %>' />
                </td>
                <td>
                    <asp:TextBox ID="categoryIDTextBox" runat="server" Text='<%# Bind("categoryID") %>' />
                </td>
                <td>
                     <asp:FileUpload ID="fuPicture" runat="server" CssClass="form-control"/>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("DogImage") %>'/>
                  <%--  <asp:Image ID="Image1" runat="server" Width="50" ImageUrl='<%# Eval("DogImage","~/Images/{0}") %>' />--%>
                </td>
               <td>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-outline-secondary btn-sm" CausesValidation="false" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-warning btn-sm" CausesValidation="false" />
                        </td>
                        

            </tr>

        </EditItemTemplate>



        <InsertItemTemplate>
            <tr class="table table-bordered">

                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="DogNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("DogName") %>' />
                </td>
                <td>
                    <asp:RadioButton ID="RadioButton2" GroupName="Gender" Text="Female" runat="server" />
                    <asp:RadioButton ID="RadioButton1" GroupName="Gender" Text="Male" runat="server" />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="CategoryName" DataValueField="categoryID" SelectedValue='<%# Bind("categoryID") %>'></asp:DropDownList>

                </td>

                <td>
                    <asp:FileUpload ID="fuPicture" runat="server" CssClass="form-control"/>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("DogImage") %>'/>
                   <%-- <asp:TextBox ID="DogImageTextBox" runat="server" Text='<%# Bind("DogImage") %>' />--%>
                </td>
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                </tr>
        </InsertItemTemplate>

        <LayoutTemplate>
            <table runat="server" class="table table-bordered">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" class="table table-bordered">
                            <tr runat="server" class="table table-bordered">
                                <th runat="server">Dog Id</th>
                                <th runat="server">Dog Name</th>
                                <th runat="server">Dog Gender</th>
                                <th runat="server">category</th>
                                <th runat="server">Dog Image</th>
                                <th runat="server">Action</th>

                            </tr>
                            <tr id="itemHolder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--  <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>--%>
            </table>
        </LayoutTemplate>
     
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petDBConnectionString %>" DeleteCommand="DELETE FROM [DogInfo] WHERE [DogId] = @DogId" InsertCommand="INSERT INTO [DogInfo] ([DogName], [DogGender], [categoryID], [DogImage]) VALUES (@DogName, @DogGender, @categoryID, @DogImage)" SelectCommand="SELECT * FROM [DogInfo]" UpdateCommand="UPDATE [DogInfo] SET [DogName] = @DogName, [DogGender] = @DogGender, [categoryID] = @categoryID, [DogImage] = @DogImage WHERE [DogId] = @DogId">
        <DeleteParameters>
            <asp:Parameter Name="DogId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DogName" Type="String" />
            <asp:Parameter Name="DogGender" Type="Boolean" />
            <asp:Parameter Name="categoryID" Type="Int32" />
            <asp:Parameter Name="DogImage" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DogName" Type="String" />
            <asp:Parameter Name="DogGender" Type="Boolean" />
            <asp:Parameter Name="categoryID" Type="Int32" />
            <asp:Parameter Name="DogImage" Type="String" />
            <asp:Parameter Name="DogId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:petDBConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
