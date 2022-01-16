<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientList.aspx.cs" Inherits="BloodBank.PatientList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Patient List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-3 mb-5">
        <div class="row text-center">
            <div class="col">
                <h3>Patient List</h3>
            </div>
        </div>
        <asp:GridView ID="PatientsGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnRowCommand="PatientsGridView_OnRowCommand">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="blood_group" HeaderText="Blood Group" />
            <asp:BoundField DataField="gender" HeaderText="Gender" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="phone" HeaderText="Phone" />
            <asp:BoundField DataField="address" HeaderText="Address" />
            <asp:BoundField DataField="date_of_birth" HeaderText="Date of Birth" DataFormatString="{0:MM/dd/yyyy}" />

            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <div class="row">
                        <div class="col">
                            <asp:Button ID="EditButton" CssClass="btn btn-sm btn-block btn-info" runat="server" CausesValidation="false" CommandName="EditRow" Text="Edit" CommandArgument='<%# Eval("id") %>' />
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            <asp:Button ID="DeleteButton" CssClass="btn btn-sm btn-block btn-danger" runat="server" CausesValidation="false" CommandName="DeleteRow" Text="Delete" CommandArgument='<%# Eval("id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
