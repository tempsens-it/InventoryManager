<%@ Page Title="Part Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="PartMaster.aspx.cs" Inherits="PartMaster" %>

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
                            <h2>UPDATE PART DETAILS</h2>

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

                                <div class="col-md-6">
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

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Description</b>
                                            <asp:TextBox ID="TextBoxDescript" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Description"></asp:TextBox>
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
                                        <div class="body table-responsive">
                                            <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                                <thead>
                                                    <tr>
                                                        <th>Part No.</th>
                                                        <th>Name</th>
                                                        <th>Document Type</th>
                                                        <th>Description</th>
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

                        <div role="tabpanel" class="tab-pane fade" id="addBox_with_icon_title">
                            <br />

                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <label for="part_name">Part Name</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="part_name" class="form-control" placeholder="Enter Part name">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="part_docType">Document Type</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                

<%--                                <div class="col-md-4">
                                    <label for="part_specs1">Specification</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="part_specs1" class="form-control" placeholder="Enter Specification 1">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <label for="part_specs1Unit">Unit</label>
                                    <div class="form-group">
                                       <div class="input-group input-group-lg">
                                            <input type="checkbox" id="part_specs1Unit" class="filled-in">
                                            <label for="part_specs1Unit"></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label for="part_specs2">Specification 2</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="part_specs2" class="form-control" placeholder="Enter Specification 2">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <label for="part_specs2Unit">Unit</label>
                                    <div class="form-group">
                                       <div class="input-group input-group-lg">
                                            <input type="checkbox" id="part_specs2Unit" class="filled-in">
                                            <label for="part_specs2Unit"></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <label for="part_specs3">Specification 3</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="part_specs3" class="form-control" placeholder="Enter Specification 3">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-1">
                                    <label for="part_specs3Unit">Unit</label>
                                    <div class="form-group">
                                       <div class="input-group input-group-lg">
                                            <input type="checkbox" id="part_specs3Unit" class="filled-in">
                                            <label for="part_specs3Unit"></label>
                                        </div>
                                    </div>
                                </div>--%>

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

