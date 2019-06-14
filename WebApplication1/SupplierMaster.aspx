<%@ Page Title="Supplier Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="SupplierMaster.aspx.cs" Inherits="SupplierMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="block-header">
        <h2>Supplier Master </h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Supplier
                    </h2>
                    
                </div>
                <div class="body">
                    <form>
                        <label for="sup_name">Supplier Name</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_name" class="form-control" placeholder="Enter Supplier name">
                            </div>
                        </div>

                        <label for="sup_address">Address</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_address" class="form-control" placeholder="Enter Supplier Address">
                            </div>
                        </div>

                        <label for="sup_state">State</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_state" class="form-control" placeholder="Enter Supplier State">
                            </div>
                        </div>

                        <label for="sup_city">City</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_city" class="form-control" placeholder="Enter Supplier City">
                            </div>
                        </div>
                        
                        <%--If dropdown is Required
                            <div class="row clearfix">
                            <div class="col-md-12">
                                <p>
                                    <b>State</b>
                                </p>
                                <select class="form-control show-tick">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>

                            </div> 
                        </div>

                        <div class="row clearfix">
                            <div class="col-md-12">
                                <p>
                                    <b>City</b>
                                </p>
                                <select class="form-control show-tick">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>

                            </div> 
                        </div>--%>

                        <label for="sup_pincode">Pincode</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_pincode" class="form-control" placeholder="Enter Supplier Pincode">
                            </div>
                        </div>

                        <label for="sup_mnumber">Mobile Number</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_mnumber" class="form-control" placeholder="Enter Supplier Mobile number">
                            </div>
                        </div>

                        <label for="sup_lnumber">Landline Number</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_lnumber" class="form-control" placeholder="Enter Supplier Landline number">
                            </div>
                        </div>

                        <label for="sup_email">Email address</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="sup_email" class="form-control" placeholder="Enter Supplier Email address">
                            </div>
                        </div>

                        
                         
                        <br>
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                        &ensp;
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                        &ensp;
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Company
                    </h2>
                    
                </div>
                <div class="body">
                    <form>
                        <label for="email_address">Company Name</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="email_address" class="form-control" placeholder="Enter your Company name">
                            </div>
                        </div>
                        

                        <%--<input type="checkbox" id="remember_me" class="filled-in">
                        <label for="remember_me">Remember Me</label>--%>
                        <br>
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD COMPANY</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

