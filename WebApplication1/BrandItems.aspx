<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="BrandItems.aspx.cs" Inherits="BrandItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function delete_id(BrandId) {
            if (confirm('Sure To Remove This Complain ?')) {
                window.location.href = 'BrandItems.aspx?delete_id=' + BrandId
            }
        }

    </script>

     <div class="modal fade" id="defaultModal_1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 700px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="defaultModalLabel">UPDATE BRAND</h4>
                </div>
                <div class="modal-body">
                    <div class="row clearfix">
                        <div class="col-sm-2" style=" width: 153px";>
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
                        <div class="col-sm-10" style=" width:220px";>
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Company Name:</b>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="TxtBrand" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Brand Name" OnClick="Edit"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"  style="margin-top: -50px";>
                    <asp:Button ID="Button2" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSubmit_Click" />
                    <button type="button" class="btn btn-primary m-t-15 waves-effect" data-dismiss="modal">CLOSE</button>
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
                    <h2>Add Brand
                    </h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons" style="color:blue";>edit</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="#" data-toggle="modal" data-target="#defaultModal_1">Edit</a></li>
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
                            <asp:Label ID="Message" runat="server"></asp:Label>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                            <br />
                            <div class="row clearfix">
                                <div class="col-md-12">
                                    <label for="company_name">Brand Name</label>
                                    <div class="form-group">
                                        <div class="form-line">
                                            <asp:TextBox ID="txtBrandName" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Brand Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="SAVE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSave_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>

