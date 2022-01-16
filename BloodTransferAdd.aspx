<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BloodTransferAdd.aspx.cs" Inherits="BloodBank.BloodTransferAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Add new transfer
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto mb-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img src="../Images/blood.png" width="64px" />
                                <h3>Add new Blood Transfer</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-11 mx-auto">
                                <div class="form-group">
                                    <label>Patient ID</label>
                                    <asp:TextBox CssClass="form-control" placeholder="ID" ID="PatientTextBox" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Donor ID</label>
                                    <asp:TextBox CssClass="form-control" placeholder="ID" ID="DonorTextBox" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Date of Transfer</label>
                                    <asp:TextBox CssClass="form-control" ID="DateTextBox" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-block btn-outline-info" ID="AddButton" runat="server" Text="Add" OnClick="AddButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
