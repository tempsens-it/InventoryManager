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
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Item Code</b>
                                            <asp:DropDownList ID="DropDownListItemCode" runat="server" class="form-control show-tick">
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
                                            <b>Brand</b>
                                            <asp:DropDownList ID="DropDownListBrand" runat="server" class="form-control show-tick">
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
                                            <b>Specification 1</b>
                                            <asp:DropDownList ID="DropDownListSpecs1" runat="server" class="form-control show-tick">
                                                <asp:ListItem>Intel i3</asp:ListItem>
                                                <asp:ListItem>AMD Ryzen</asp:ListItem>
                                                <asp:ListItem>Intel i5</asp:ListItem>
                                                
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 2</b>
                                            <asp:DropDownList ID="DropDownListSpecs2" runat="server" class="form-control show-tick">
                                                <asp:ListItem>DDR4 4GB</asp:ListItem>
                                                <asp:ListItem>DDR3 4GB</asp:ListItem>
                                                <asp:ListItem>DDR4 8GB</asp:ListItem>
                                                
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 3</b>
                                            <asp:DropDownList ID="DropDownListSpecs3" runat="server" class="form-control show-tick">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>500</asp:ListItem>
                                                <asp:ListItem>300</asp:ListItem>
                                                
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Unit</b>
                                            <asp:DropDownList ID="DropDownListSpecs3Unit" runat="server" class="form-control show-tick">
                                                <asp:ListItem>TB</asp:ListItem>
                                                <asp:ListItem>GB</asp:ListItem>
                                                <asp:ListItem>Mt.</asp:ListItem>
                                                
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Description</b>
                                            <asp:TextBox ID="TxtDesc" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Description"></asp:TextBox>
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
                                    <label for="config_itemCode">Item Code</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="config_brand">Brand</label>
                                    <select class="form-control show-tick">
                                        <option>Mustard</option>
                                        <option>Ketchup</option>
                                        <option>Relish</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="config_specs1">Specification 1</label>
                                    <select class="form-control show-tick">
                                        <option>Intel i3</option>
                                        <option>AMD Ryzen</option>
                                        <option>Intel i5</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="config_specs2">Specification 2</label>
                                    <select class="form-control show-tick">
                                        <option>DDR4 4GB</option>
                                        <option>DDR3 4GB</option>
                                        <option>DDR4 8GB</option>
                                    </select>
                                </div>

                                <div class="col-md-4">
                                    <label for="config_specs3">Specification 3</label>
                                    <select class="form-control show-tick">
                                        <option>1</option>
                                        <option>500</option>
                                        <option>300</option>
                                    </select>
                                </div>

                                <div class="col-md-2">
                                    <label for="config_specs3Unit">Unit</label>
                                    <select class="form-control show-tick">
                                        <option>GB</option>
                                        <option>TB</option>
                                        <option>Mt.</option>
                                    </select>
                                </div>

                                

                                <div class="col-md-6">
                                    <label for="config_descript">Description</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <input type="text" id="config_descript" class="form-control" placeholder="Description">
                                        </div>
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


</asp:Content>

