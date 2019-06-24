<%@ Page Title="Transaction Outward" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="TransactionOutward.aspx.cs" Inherits="TranscationOutward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="block-header">
        <h2>Transaction Outward</h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Transaction Details
                    </h2>

                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-6">
                            <label for="transOut_partName">Part Name</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>

                        </div>

                        <div class="col-md-6">
                            <label for="transOut_company">Company</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="transOut_dept">Department</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="transOut_emp">Employee</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="transOut_quant">Quantity</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transOut_quant" class="form-control" placeholder="Enter Quantity">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transOut_serialNum">Serial Number</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transOut_serialNum" class="form-control" placeholder="Enter Serial number">
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

