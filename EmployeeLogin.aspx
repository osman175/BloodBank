<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeLogin.aspx.cs" Inherits="BloodBank.EmployeeLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Employee Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img src="../Images/employee.png" />
                                <h3>Employee Login</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11 mx-auto">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="Employee ID" ID="EmployeeIdTextBox" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" placeholder="Password" ID="PasswordTextBox" TextMode="password" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-block btn-success" ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
