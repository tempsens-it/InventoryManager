<%@ Page Title="Department Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="DepartmentMaster.aspx.cs" Inherits="DepartmentMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="block-header">
        <h2>Department Master </h2>
    </div>


    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Department
                    </h2>
                    
                </div>
                <div class="body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#home_with_icon_title" data-toggle="tab">
                                <i class="material-icons">view_comfy</i> VIEW
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#profile_with_icon_title" data-toggle="tab">
                                <i class="material-icons">add_box</i> ADD
                            </a>
                        </li>
                                
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="home_with_icon_title">
                            <br />
                                   
                            

                            <div class="row clearfix">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <div class="table-responsive"> 
                                        <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                        <thead>
                                                <tr>
                                                <th>Ticket No</th>
                                                <th>Category</th>
                                                <th>Subcategory</th>
                                                <th>Complain Date</th>
                                                <th>Remarks</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                                </tr>
                                        </thead>
                                        <tbody>
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
                                                <th>Ticket No</th>
                                                <th>Category</th>
                                                <th>Subcategory</th>
                                                <th>Complain Date</th>
                                                    <th>Remarks</th>
                                                    <th>Status</th>
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
                                                <th>Ticket No</th>
                                                <th>Category</th>
                                                <th>Subcategory</th>
                                                <th>Complain Date</th>
                                                    <th>Remarks</th>
                                                    <th>Status</th>
                                                    <th>Tracking</th>
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
                        <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <label for="dept_name">Department Name</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="dept_name" class="form-control" placeholder="Enter Department name">
                                        </div>
                                    </div>
                                </div>
                        
                                <div class="col-md-6">
                                    <label for="dept_company">Company</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>

                                </div> 
                            </div>

                            <button type="button" class="btn btn-primary m-t-15 waves-effect">SAVE</button>
                            
                    

                        </div>
                                
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Company
                    </h2>
                    
                </div>
                
                <div class="body">
                    
                        <div class="row clearfix">
                            <div class="col-md-6">
                                <label for="dept_name">Department Name</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="dept_name" class="form-control" placeholder="Enter Department name">
                                    </div>
                                </div>
                            </div>
                        
                            <div class="col-md-6">
                                <label for="dept_company">Company</label>
                                <select class="form-control show-tick">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>

                            </div> 
                        </div>

                        <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                        &ensp;
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>--%>

    
</asp:Content>

