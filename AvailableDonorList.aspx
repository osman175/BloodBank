<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AvailableDonorList.aspx.cs" Inherits="BloodBank.AvailableDonorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Available Donors
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-3 mb-5">
        <div class="row text-center">
            <div class="col">
                <h3>Available Donor List</h3>
            </div>
        </div>
        <asp:GridView ID="DonorsGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="blood_group" HeaderText="Blood Group" />
            <asp:BoundField DataField="available" HeaderText="Availability" />
            <asp:BoundField DataField="last_donated" HeaderText="Last Donated" DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="gender" HeaderText="Gender" />
            <asp:BoundField DataField="phone" HeaderText="Phone" />
            <asp:BoundField DataField="address" HeaderText="Address" />
            <asp:BoundField DataField="date_of_birth" HeaderText="Date of Birth" DataFormatString="{0:MM/dd/yyyy}" />

        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
