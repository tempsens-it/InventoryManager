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
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_name">Supplier Name</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_name" class="form-control" placeholder="Enter Supplier name">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <label for="sup_address">Address</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_address" class="form-control" placeholder="Enter Supplier Address">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_state">State</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_state" class="form-control" placeholder="Enter Supplier State">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_city">City</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_city" class="form-control" placeholder="Enter Supplier City">
                                </div>
                            </div>
                        </div>

                        <%--If dropdown is Required --%>
                            
                        <div class="col-md-6">
                            <label for="sup_state">State</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>
                        </div> 

                        <div class="col-md-6">
                            <label for="sup_city">City</label>
                            <select class="form-control show-tick">
                                <option>Mustard</option>
                                <option>Ketchup</option>
                                <option>Relish</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_pincode">Pincode</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_pincode" class="form-control" placeholder="Enter Supplier Pincode">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_mnumber">Mobile Number</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_mnumber" class="form-control" placeholder="Enter Supplier Mobile number">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_lnumber">Landline Number</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_lnumber" class="form-control" placeholder="Enter Supplier Landline number">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_email">Email address</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_email" class="form-control" placeholder="Enter Supplier Email address">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_payment_term">Payment Terms</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_payment_term" class="form-control" placeholder="Enter Payment Terms">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="sup_payment_desc">Payment Terms Description</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_payment_desc" class="form-control" placeholder="Enter Payment terms description">
                                </div>
                            </div>
                        </div>
                    </div>  
                    
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Supplier Contact Person
                    </h2>
                    
                </div>
                <div class="body">
                        <div class="row clearfix">
                            <div class="col-md-6">
                                <p>
                                    <b>Supplier Name</b>
                                </p>
                                <select class="form-control show-tick">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>
                            </div> 

                            <div class="col-md-6">
                                <label for="sup_emp_name">Name</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="sup_emp_name" class="form-control" placeholder="Enter name">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="sup_emp_designation">Designation</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="sup_emp_designation" class="form-control" placeholder="Enter desgination">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="sup_emp_mnumber">Mobile Number</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="sup_emp_mnumber" class="form-control" placeholder="Enter mobile number">
                                    </div>
                                </div>
                            </div>
                        </div>

                        
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                        &ensp;
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                        &ensp;
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>

    <%--<div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Payment Terms
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_payment_term">Payment Terms</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_payment_term" class="form-control" placeholder="Enter Payment Terms">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <label for="sup_payment_desc">Payment Terms Description</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_payment_desc" class="form-control" placeholder="Enter Payment terms description">
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                </div>
            </div>
        </div>
    </div>--%>

   <%-- <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Document Type
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_document_type">Document Typer</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_document_type" class="form-control" placeholder="Enter Document Type">
                                </div>
                            </div>
                        </div>
                    </div>   
 
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Category
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_category">Category</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_category" class="form-control" placeholder="Enter Category">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Brand
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_brand">Brand</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_brand" class="form-control" placeholder="Enter Brand">
                                </div>
                            </div>
                        </div>
                    </div>   

                    
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>--%>


</asp:Content>

