<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BloodTransferList.aspx.cs" Inherits="BloodBank.BloodTransferList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="server">
    Blood Transfer
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div class="container mt-3 mb-5">
        <div class="row text-center">
            <div class="col">
                <h3>Blood Transfer History</h3>
            </div>
        </div>
        <asp:GridView ID="BloodTransfersGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" />
            <asp:BoundField DataField="patient_id" HeaderText="Patient ID" />
            <asp:BoundField DataField="donor_id" HeaderText="Donor ID" />
            <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" />
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
