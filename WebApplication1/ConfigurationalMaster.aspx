<%@ Page Title="Configurational Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="ConfigurationalMaster.aspx.cs" Inherits="ConfigurationalMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function delete_id(PartConfigId) {
            if (confirm('Sure To Remove This  ?')) {
                window.location.href = 'ConfigurationalMaster.aspx?delete_id=' + PartConfigId
            }
        }
    </script>

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
                                            <b>Part Name</b>
                                            <asp:DropDownList ID="ddlPartName" runat="server" class="form-control show-tick">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 1</b>
                                            <asp:DropDownList ID="ddlSpecs1" runat="server" class="form-control show-tick">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 2</b>
                                            <asp:DropDownList ID="ddlSpecs2" runat="server" class="form-control show-tick">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Specification 3</b>
                                            <asp:DropDownList ID="ddlSpecs3" runat="server" class="form-control show-tick">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Description</b>
                                            <asp:TextBox ID="TxtDesc" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Description"></asp:TextBox>
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
                                                        <th>Part Config ID</th>
                                                        <th>Part Name</th>
                                                        <th>Specification 1</th>
                                                        <th>Specification 2</th>
                                                        <th>Specification 3</th>
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
                        <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-6">
                                  
                                     <div class="form-group">
                                        <div class="form-line">
                                          <label for="config_specs1">Part Name</label>  
                                      <asp:DropDownList ID="ddlPart" runat="server" class="form-control show-tick"></asp:DropDownList>
                                </div>
                                         </div>
                                    </div>

                                <div class="col-md-6">
                                    <label for="config_specs1">Specification 1</label>
                                    <asp:DropDownList ID="ddlSpec1" runat="server" class="form-control show-tick"></asp:DropDownList>
                                </div>
                                 </div>
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <label for="config_specs2">Specification 2</label>
                                    <asp:DropDownList ID="ddlSpec2" runat="server" class="form-control show-tick"></asp:DropDownList>
                                </div>

                                <div class="col-md-6">
                                    <label for="config_specs3">Specification 3</label>
                                    <asp:DropDownList ID="ddlSpec3" runat="server" class="form-control show-tick"></asp:DropDownList>
                                </div>
                                </div>
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <label for="config_descript">Description</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <asp:TextBox ID="txtDesc2" runat="server" class="form-control" placeholder="Description"></asp:TextBox>
                                        </div>
                                       
                                    </div>
                                </div>
                        </div>
                             <asp:Button ID="BtnSave" runat="server" Text="SAVE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSave_Click"  />
                       
               
                    
                </div>

            </div>
        </div>
    </div>
            </div>
        </div>


</asp:Content>

