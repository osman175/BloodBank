<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BloodBank.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12 text-center">
                <img width="128px" src="../Images/blood.png" />
                <h2>Blood Bank</h2>
                <p>Your trusted blood dealer</p>

                <a class="btn btn-outline-danger" href="AdminLogin.aspx" role="button">Admin Login</a>
                <a class="btn btn-danger" href="EmployeeLogin.aspx" role="button">Employee Login</a>
            </div>
        </div>
    </div>
</asp:Content>
