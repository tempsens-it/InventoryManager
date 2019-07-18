﻿<%@ Page Title="Brand Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="BrandMaster.aspx.cs" Inherits="BrandMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <script type='text/javascript'>
         function delete_id(brandId) {
             if (confirm('Sure To Remove This Record ?')) {
                 window.location.href = 'BrandMaster.aspx?delete_id=' + brandId
             }
         }
       </script>


    <div class="modal fade" id="defaultModal_1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 1300px;">
            <div class="modal-content">               
            </div>
            <!-- Basic Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>UPDATE BRAND</h2>
                        </div>
                        <div class="body">
                            <div class="row clearfix">

                                <div class="col-sm-2">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Id:</b>
                                    
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlId" runat="server" class="form-control show-tick" AutoPostBack="true" OnSelectedIndexChanged="ddlId_SelectedIndexChanged"></asp:DropDownList>
                                       </ContentTemplate>
                                    </asp:UpdatePanel>
                                    
                                </div>
                            </div>
                        </div>

                                <div class="col-sm-10">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Brand Name:</b>
                                            <asp:TextBox ID="TxtBrand" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Brand Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                               

                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <asp:Button ID="buttonUpdate" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnUpdate" />
                                        &ensp;
                                        <button type="button" class="btn btn-primary m-t-15 waves-effect" data-dismiss="modal">CLOSE</button>
                                        <button type="button" class="btn btn-primary m-t-15 waves-effect" onclick="Button1_Click">Extra buttons</button>
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
        <h2>Brand Master </h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Brand</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="#" data-toggle="modal" data-target="#defaultModal_1" class=" waves-effect waves-block">Edit</a></li>
                            </ul>
                        </li>
                    </ul>                    
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
                                                        <th>Brand ID</th>
                                                        <th>Name</th>
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
                            
                            <asp:Label ID="Message" runat="server" Text="Hi"/>
                            <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />--%>
                        </div>


                        <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <label for="brand_name">Brand Name</label>
                                    <div class="form-group">
                                        <div class="form-line">

                                            <input type="text" id="brand_name" class="form-control" placeholder="Enter Brand name">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="buttonSave" runat="server" OnClick="save" class="btn btn-primary m-t-15 waves-effect" Text="SAVE" />
                            
                            
                            
                        </div>

                        

                    </div>

                    
                </div>

            </div>
        </div>
    </div>


    


</asp:Content>
