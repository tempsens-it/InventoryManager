<%@ Page Title="Transaction Inward" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="TransactionInward.aspx.cs" Inherits="TranscationInward" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="modal fade" id="defaultModal_1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 1300px;">
            <div class="block-header">
            </div>
            <!-- Basic Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>ADD ITEM</h2>

                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Line No.</b>
                                            <asp:TextBox ID="TxtLineNo" runat="server" Style="text-transform: capitalize" class="form-control" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Part Name</b>
                                            <asp:DropDownList ID="DropDownListPartName" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Brand</b>
                                            <asp:DropDownList ID="DropDownListBrand" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 1</b>
                                            <asp:DropDownList ID="DropDownListSpec1" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 2</b>
                                            <asp:DropDownList ID="DropDownListSpec2" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 3</b>
                                            <asp:DropDownList ID="DropDownListSpec3" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Quantity</b>
                                            <asp:TextBox ID="TextBoxQuntity" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Quntity"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Rate</b>
                                            <asp:TextBox ID="TextBoxRate" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Rate"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Unit</b>
                                            <asp:TextBox ID="TextBoxUnit" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Unit"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Discount(in %)</b>
                                            <asp:TextBox ID="TextBoxDisc" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Discount"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="btnSubmit" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSubmit_Click" />
                                        &ensp;
                                        <button type="button" class="btn btn-primary m-t-15 waves-effect" data-dismiss="modal">CLOSE</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="defaultModal_2" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 1300px;">
            <div class="block-header">
            </div>
            <!-- Basic Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>UPDATE DEPARTMENT</h2>

                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>CGST rate</b>
                                            <asp:TextBox ID="TxtCGSTRate" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="CGST rate"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>SGST rate</b>
                                            <asp:TextBox ID="TextBoxSGSTRate" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="SGST rate"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>IGST rate</b>
                                            <asp:TextBox ID="TextBoxIGSTRatrw" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="IGST rate"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="Button1" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSubmit_Click" />
                                        &ensp;
                                        <button type="button" class="btn btn-primary m-t-15 waves-effect" data-dismiss="modal">CLOSE</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                            <label for="transIn_invoiceDate">Invoice Date</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_invoiceDate" class="datepicker form-control" placeholder="Invoice Date">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_inwardDate">Inward Date</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_inwardDate" class="datepicker form-control" placeholder="Inward Date">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_supp">Supplier</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_invoiceno">Invoice Number</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_invoiceno" class="form-control" placeholder="Enter Invoice number">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_supGST">GST Number</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_supGST" class="form-control" placeholder="Enter GST number" disabled>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_payTerms">Payment Terms</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="transIn_payTerms" class="form-control" placeholder="Enter payment terms">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="transIn_comp">Company</label>
                            <select class="form-control show-tick">
                                <option>Unit 1</option>
                                <option>Unit 2</option>
                                <option>Unit 4</option>
                                <option>AST</option>
                                <option>ASTI</option>
                                <option>Marathon</option>
                            </select>
                        </div>
                    </div>


                    <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                  Line DETAILS
                            </h2>
                            
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    <thead>
                                         <tr>
                                            <th>Line No.</th>
                                                <th>Part Name</th>
                                                <th>Brand</th>
                                                <th>Speci </th>
                                                <th>Speci </th>
                                                <th>Speci </th>
                                                <th>Quantity</th>
                                                <th>Rate</th>
                                                <th>Unit</th>
                                                <th>Disc%</th>
                                                <th>Amount</th>
                                                <th>Action</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                         
                          <%=getSourceData() %>
                        </tbody>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                   <%-- <hr style="border-width: 1px; display: block; border-color: #a7a7a7;" />--%>

                    <%--<div class="row clearfix">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                <div class="body table-responsive">
                                    <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                        <thead>
                                            <tr>
                                                <th>Line No.</th>
                                                <th>Part Name</th>
                                                <th>Brand</th>
                                                <th>Specification 1</th>
                                                <th>Specification 2</th>
                                                <th>Specification 3</th>
                                                <th>Quantity</th>
                                                <th>Rate</th>
                                                <th>Unit</th>
                                                <th>Disc%</th>
                                                <th>Amount</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                           <%-- <%=getSourceData() %>
                                            <%=addTaxes() %>
                                            <%=getTotalAmount() %>--%>
                                       <%-- </tbody>
                                    </table>--%>
                              <%--  </div>
                            </div>
                        </div>


                    </div>--%>

                    <%--<hr style="color:#a7a7a7; display:block; border-width:1px; border-style:inset;"/>--%>

                   <%-- <div class="row clearfix">
                    </div>--%>

                    <br>
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">SUBMIT</button>
                </div>
            </div>
        </div>
    </div>

     <!-- Custom Js -->
    <script src="../../js/admin.js"></script>
    <script src="../../js/pages/tables/jquery-datatable.js"></script>


</asp:Content>

