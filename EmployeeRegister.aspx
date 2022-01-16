<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeRegister.aspx.cs" Inherits="BloodBank.EmployeeRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Emplopyee Register
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img src="../Images/employee1.png" />
                                <h3>Employee Register</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11 mx-auto">
                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Mr. X" ID="NameTextBox" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Blood Group</label>
                                    <asp:DropDownList CssClass="form-control" ID="BloodGroupDropDownList" runat="server">
                                        <asp:ListItem Selected="True">--SELECT--</asp:ListItem>
                                        <asp:ListItem Value="A+">A+</asp:ListItem>
                                        <asp:ListItem Value="A-">A-</asp:ListItem>
                                        <asp:ListItem Value="B+">B+</asp:ListItem>
                                        <asp:ListItem Value="B-">B-</asp:ListItem>
                                        <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                        <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                        <asp:ListItem Value="O+">O+</asp:ListItem>
                                        <asp:ListItem Value="O-">O-</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Gender</label>
                                    <asp:DropDownList CssClass="form-control" ID="GenderDropDownList" runat="server">
                                        <asp:ListItem Selected="True">--SELECT--</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                        <asp:ListItem Value="Unspecified">Unspecified</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="DoBTextBox" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <asp:TextBox CssClass="form-control" placeholder="01XXXXXXXXX" ID="PhoneTextBox" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Street, Division" ID="AddressTextBox" TextMode="MultiLine" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox CssClass="form-control" placeholder="At least 6 digits" ID="PasswordTextBox" TextMode="password" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <asp:TextBox CssClass="form-control" placeholder="At least 6 digits" ID="ConfirmPasswordTextBox" TextMode="password" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-block btn-warning" ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
