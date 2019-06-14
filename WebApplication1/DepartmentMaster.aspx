﻿<%@ Page Title="Department Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="DepartmentMaster.aspx.cs" Inherits="DepartmentMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="block-header">
        <h2>Department Master </h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Company
                    </h2>
                    <%--<ul class="header-dropdown m-r--5">
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
                    </ul>--%>
                </div>
                
                <div class="body">
                    <form>
                        <label for="dept_name">Department Name</label>
                        <div class="form-group">
                            <div class="form-line">
                                <input type="text" id="dept_name" class="form-control" placeholder="Enter Department name">
                            </div>
                        </div>
                        
                        <div class="row clearfix">
                            <div class="col-md-12">
                                <p>
                                    <b>Company</b>
                                </p>
                                <select class="form-control show-tick">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>

                            </div> 
                        </div>

                        <%--<input type="checkbox" id="remember_me" class="filled-in">
                        <label for="remember_me">Remember Me</label>--%>
                        <br>
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                        &ensp;
                        <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    
</asp:Content>

