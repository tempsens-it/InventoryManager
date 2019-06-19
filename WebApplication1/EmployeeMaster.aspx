﻿<%@ Page Title="Employee Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EmployeeMaster.aspx.cs" Inherits="EmployeeMaster" %>

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
                            <h2>EDIT COMPANY</h2>

                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Employee Name:</b>
                                            <asp:TextBox ID="TxtEmployee" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Company Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Department</b>
                                            <asp:DropDownList ID="DropDownListDepartment" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Company</b>
                                            <asp:DropDownList ID="DropDownListCompany" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>   
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Designation</b>
                                            <asp:TextBox ID="TextBoxDesignation" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Designation"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Contact Number</b>
                                            <asp:TextBox ID="TextBoxContact" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Contact Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Internal Mail ID</b>
                                            <asp:TextBox ID="TextBoxIntMail" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Internal Mail ID"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>External Mail ID</b>
                                            <asp:TextBox ID="TextBoxExtMail" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Internal Mail ID"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Is Active</b>
                                            <asp:CheckBox ID="CheckBoxIsActive" runat="server" class="filled-in"/>
                                            <%-- Check Box inActive --%>
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


    <div class="block-header">
        <h2>Employee Master </h2>
    </div>


    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Employee
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
                                        <div class="body table-responsive">
                                            <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
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
                                                        <th>Is Active</th>
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
                        <%--<div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                            <br />
                            <h2 class="card-inside-title">Employee Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">person</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Employee Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">business</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Department">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">business</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Designation">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h2 class="card-inside-title">Employee Contact Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_phone</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Contact No.">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_mail</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Internal email">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">email</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="External email">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h2 class="card-inside-title">Radio &amp; Checkbox</h2>
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <div class="input-group input-group-lg">
                                        <input type="checkbox" id="remember_me_2" class="filled-in">
                                        <label for="remember_me_2">Is Active</label>
                                    </div>
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">SAVE</button>

                                </div>
                            </div>


                        </div>--%>
                        <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <label for="emp_name">Employee Name</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="emp_name" class="form-control" placeholder="Enter Employee name">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="emp_company">Department</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="emp_company">Company</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="emp_des">Designation</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="emp_des" class="form-control" placeholder="Enter Designation">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="emp_contact">Contact Number</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="emp_contact" class="form-control" placeholder="Enter Contact number">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="emp_email_int">Internal Email Address</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="emp_email_int" class="form-control" placeholder="Enter Internal Mail Address">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="emp_email_ext">External Email Address</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="emp_email_ext" class="form-control" placeholder="Enter External Mail Address">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="input-group input-group-lg">
                                        <input type="checkbox" id="remember_me_2" class="filled-in">
                                        <label for="remember_me_2">Is Active</label>
                                    </div>
                                </div>
                            </div>



                            <button type="button" class="btn btn-primary m-t-15 waves-effect">SAVE</button>



                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Employee Master
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <h2 class="card-inside-title">Employee Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">person</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Employee Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Department">
                                        </div>
                                        <%--<span class="input-group-addon">
                                            <i class="material-icons">send</i>
                                        </span>--%>
    <%--<%-- </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">business</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Designation">
                                        </div>
                                        <%--<span class="input-group-addon">
                                            <i class="material-icons">send</i>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <h2 class="card-inside-title">Employee Contact Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_phone</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Contact No.">
                                        </div>
                                       </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_mail</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Internal email">
                                        </div>                                        
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">email</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="External email">
                                        </div>                                        
                                    </div>
                                </div>                               
                            </div>                            

                            <h2 class="card-inside-title">Radio &amp; Checkbox</h2>
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <div class="input-group input-group-lg">                                        
                                        <input type="checkbox" id="remember_me_2" class="filled-in">
                                        <label for="remember_me_2">Is Active</label>                                      
                                    </div>
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>                                    
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>--%>
</asp:Content>

