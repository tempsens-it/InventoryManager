<%@ Page Title="Configurational Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="ConfigurationalMaster.aspx.cs" Inherits="ConfigurationalMaster" %>

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
                            <h2>UPDATE CONFIGURATION DETAILS</h2>

                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Part Name:</b>
                                            <asp:TextBox ID="TxtName" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Part Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Document Type</b>
                                            <asp:DropDownList ID="DropDownListDocType" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Mustard</asp:ListItem>
                                                <asp:ListItem>Ketchup</asp:ListItem>
                                                <asp:ListItem>Relish</asp:ListItem>
                                                
                                            </asp:DropDownList>
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
        <h2>Configurational Master </h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Configurational
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
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <label for="company_name">Details</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="company_name" class="form-control" placeholder="Enter your Company name">
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


</asp:Content>

