<%@ Page Title="Part Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="PartMaster.aspx.cs" Inherits="PartMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="block-header">
        <h2>Part Master </h2>
    </div>


    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Part Description
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

                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="view_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="home">
                                        <div class="table-responsive">
                                            <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                                <thead>
                                                    <tr>
                                                        <th>Part No.</th>
                                                        <th>Name</th>
                                                        <th>Document Type</th>
                                                        <th>Category</th>
                                                        <th>Brand</th>
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
                                                        <th>Part No.</th>
                                                        <th>Name</th>
                                                        <th>Document Type</th>
                                                        <th>Category</th>
                                                        <th>Brand</th>
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
                                                        <th>Part No.</th>
                                                        <th>Name</th>
                                                        <th>Document Type</th>
                                                        <th>Category</th>
                                                        <th>Brand</th>
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
                                    <label for="sup_name">Part Name</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="sup_name" class="form-control" placeholder="Enter Part name">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="sup_state">Document Type</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="sup_state">Category</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="sup_city">Brand</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="sup_pincode">Desciption</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="sup_pincode" class="form-control" placeholder="Enter Desciption">
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

</asp:Content>

