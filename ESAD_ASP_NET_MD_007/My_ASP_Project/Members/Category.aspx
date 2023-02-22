<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="My_ASP_Project.Category" %>

<%@ Register Src="~/CategoryUserControl.ascx" TagPrefix="uc1" TagName="CategoryUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <uc1:CategoryUserControl runat="server" id="CategoryUserControl" />
   

    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
