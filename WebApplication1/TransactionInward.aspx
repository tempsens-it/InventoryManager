<%@ Page Title="Transaction Inward" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="TransactionInward.aspx.cs" Inherits="TranscationInward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="block-header">
        <h2>Transaction Outward</h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Add Transaction Details
                    </h2>

                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-6">
                            <label for="transIn_partno">Part Number</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>

                        </div>

                        <div class="col-md-6">
                            <label for="transIn_invoiceno">Quantity</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_invoiceno" class="form-control" placeholder="Enter Invoice number">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_quant">Quantity</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_quant" class="form-control" placeholder="Enter Quantity">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_price">Price</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_price" class="form-control" placeholder="Enter Price">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_GST">GST</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_GST" class="form-control" placeholder="Enter GST">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_priceWithTax">Final Price</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_priceWithTax" class="form-control" placeholder="Enter Final Price">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_invoiceDate">Invoice Date</label>
                            <%--<div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_invoiceDate" class="form-control" placeholder="Enter Invoice date">
                                </div>
                            </div>--%>
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="material-icons">date_range</i>
                                </span>
                                <div class="form-line">
                                    <input type="text" class="form-control date" placeholder="Ex: 30/07/2016">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

