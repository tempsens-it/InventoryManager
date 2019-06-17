<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EmployeeMaster.aspx.cs" Inherits="EmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
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
                                        <%--<span class="input-group-addon">
                                            <i class="material-icons">send</i>
                                        </span>--%>
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
                </div>


</asp:Content>

