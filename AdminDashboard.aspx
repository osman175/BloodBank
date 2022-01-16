<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="BloodBank.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Admin Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="NavBarPlaceHolder" runat="server">
    <li class="nav-item">
        <a class="nav-link" href="AdminDashboard.aspx">Dashboard</a>
    </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-7 mx-auto text-center">
                <h1>Welcome <asp:Label ID="AdminNameLabel" runat="server" Text="Label"></asp:Label></h1>
                <div class="row mt-3">
                    <div class="col">
                        <h2><asp:Label ID="EmployeesLabel" runat="server" Text="-1"></asp:Label></h2>
                        <h4>Employees</h4>
                    </div>
                    <div class="col">
                        <h2><asp:Label ID="AvailableDonorsLabel" runat="server" Text="-1"></asp:Label></h2>
                        <h4>Available Donors</h4>
                    </div>
                    <div class="col">
                        <h2><asp:Label ID="PatientsLabel" runat="server" Text="-1"></asp:Label></h2>
                        <h4>Patients</h4>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <a style="text-decoration: none" href="AvailableDonorList.aspx" class="btn btn-block btn-outline-warning" type="button">Available Donors</a>                        
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col">
                        <a style="text-decoration: none" href="EmployeeList.aspx" class="btn btn-block btn-outline-success" type="button">View Employees</a>                        
                    </div>
                    <div class="col">
                        <a style="text-decoration: none" href="EmployeeRegister.aspx" class="btn btn-block btn-outline-warning" type="button">Register New Employee</a>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col">
                        <a style="text-decoration: none" href="DonorList.aspx" class="btn btn-block btn-outline-primary" type="button">View Donors</a>                        
                    </div>
                    <div class="col">
                        <a style="text-decoration: none" href="PatientList.aspx" class="btn btn-block btn-outline-secondary" type="button">View Patients</a>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col">
                        <a style="text-decoration: none" href="DonorEdit.aspx" class="btn btn-block btn-outline-success" type="button">Add Donor</a>                        
                    </div>
                    <div class="col">
                        <a style="text-decoration: none" href="PatientEdit.aspx" class="btn btn-block btn-outline-danger" type="button">Add Patient</a>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col">
                        <a style="text-decoration: none" href="BloodTransferList.aspx" class="btn btn-block btn-outline-info" type="button">Blood Transfer History</a>                        
                    </div>
                    <div class="col">
                        <a style="text-decoration: none" href="BloodTransferAdd.aspx" class="btn btn-block btn-outline-dark" type="button">New Blood Transfer</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
