<%@ Page Title="Supplier Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="SupplierMaster.aspx.cs" Inherits="SupplierMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="block-header">
        <h2>Supplier Master </h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Add Supplier
                    </h2>

                </div>
                <div class="body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#view_with_icon_title" data-toggle="tab">
                                <i class="material-icons">view_comfy</i> VIEW
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#addBox_with_icon_title" data-toggle="tab">
                                <i class="material-icons">add_box</i> ADD
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#personAdd_with_icon_title" data-toggle="tab">
                                <i class="material-icons">person_add</i> ADD CONTACT PERSON
                            </a>
                        </li>

                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="view_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="home">
                                        <div class="table-responsive">
                                            <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable" style="width: auto;">
                                                <thead>
                                                    <tr>
                                                        <th>Supplier No.</th>
                                                        <th>Name</th>
                                                        <th>City</th>
                                                        <th>State</th>
                                                        <th>Pincode</th>
                                                        <th>Mobile No.</th>
                                                        <th>Landline No.</th>
                                                        <th>Email id</th>
                                                        <th>Payment Terms</th>
                                                        <th>Contact Person</th>
                                                        <th>Mobile No.</th>
                                                        <th>Designation</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%--<tr>
                                                        <th>1</th>
                                                        <th>national computer</th>
                                                        <th>Udaipur</th>
                                                        <th>Rajasthan</th>
                                                        <th>313001</th>
                                                        <th>+919999999999</th>
                                                        <th>+9124924242</th>
                                                        <th>abc@example.com</th>
                                                        <th>afasdfas</th>
                                                        <th>Ram kumar</th>
                                                        <th>+9198989898</th>
                                                        <th>Sales</th>
                                                        <th>Action</th>
                                                    </tr>--%>
                                                    <%--<%=getSourceData() %>--%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="profile">
                                        <div class="table-responsive">
                                            <table id="table1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                                <thead>
                                                    <tr>
                                                        <th>Employee No.</th>
                                                        <th>Name</th>
                                                        <th>Designation</th>
                                                        <th>Department</th>
                                                        <th>Company</th>
                                                        <th>Contact No.</th>
                                                        <th>Internal Email id</th>
                                                        <th>External Email id</th>
                                                        <th>Active</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%--  <%=getSourceData_1() %>--%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="messages">
                                        <div class="table-responsive">
                                            <table id="table2" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                                <thead>
                                                    <tr>
                                                        <th>Employee No.</th>
                                                        <th>Name</th>
                                                        <th>Designation</th>
                                                        <th>Department</th>
                                                        <th>Company</th>
                                                        <th>Contact No.</th>
                                                        <th>Internal Email id</th>
                                                        <th>External Email id</th>
                                                        <th>Active</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%--<%=getSourceData_2() %>--%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="addBox_with_icon_title">
                            <br />
                            
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

                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="personAdd_with_icon_title">
                            <br />

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


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Contact Person --%>
    <%--<div class="row clearfix">
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
    </div>--%>

    <%--Payment Terms--%>
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

    <%--Documentation Type--%>
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
    </div>--%>

    <%--Catagory--%>
    <%--<div class="row clearfix">
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
    </div>--%>

    <%--Brand--%>
    <%--<div class="row clearfix">
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

