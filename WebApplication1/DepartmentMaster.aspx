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
    </div>

    
</asp:Content>

