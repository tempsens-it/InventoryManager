<%@ Page Title="Dashboard-User" Language="C#" MasterPageFile="UserMasterPage.master" AutoEventWireup="true" CodeFile="Dashboard_User.aspx.cs"
    Inherits="Main_Dashboard_User" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type='text/javascript'>
        function delete_id(id) {
            if (confirm('Sure To Remove This Complain ?')) {
                window.location.href = 'Dashboard_User.aspx?delete_id=' + id
            }
        }
        function Edit_id(id) {
            if (confirm('Sure To Verified This Complain ?')) {
                window.location.href = 'Dashboard_User.aspx?veri_id=' + id
            }
        }
    </script>

    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/5ae30294227d3d7edc24c8b3/default';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>
    <!--End of Tawk.to Script-->


    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script type="text/javascript" src="jquery-1.6.1.min.js"></script>
    <div class="block-header">
        <h2>DASHBOARD</h2>
    </div>

    <!-- Widgets -->
    <div class="row clearfix">
        <a href="#home" data-toggle="tab">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="info-box bg-pink hover-expand-effect">
                    <div class="icon">
                        <i class="material-icons">forum</i>
                    </div>
                    <div class="content">
                        <div class="text">OPEN COMPLAIN</div>
                        <div>
                            <asp:Label ID="lblTotalComplain" runat="server" Font-Size="XX-Large"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        <a href="#profile" data-toggle="tab">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="info-box bg-light-green hover-expand-effect">
                    <div class="icon">

                        <i class="material-icons">help</i>
                    </div>
                    <div class="content">
                        <div class="text">PENDING COMPLAIN</div>
                        <div>
                            <asp:Label ID="lblPendingComplain" runat="server" Text="" Font-Size="XX-Large"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        <a href="#messages" data-toggle="tab">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="info-box bg-cyan hover-expand-effect">
                    <div class="icon">

                        <i class="material-icons">playlist_add_check</i>
                    </div>
                    <div class="content">
                        <div class="text">CLOSED COMPLAIN</div>
                        <div>
                            <asp:Label ID="lblsolveComplain" runat="server" Text="" Font-Size="XX-Large"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-orange hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">person_add</i>
                </div>
                <div class="content">
                    <div class="text">COMPLAIN ASSIGN</div>
                    <asp:Label ID="lbltaskAssign" runat="server" Text="" Font-Size="XX-Large"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Widgets -->
    <div class="modal fade" id="defaultModal_1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 1300px;">
            <div class="block-header">
            </div>
            <!-- Basic Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>EDIT COMPLAIN DETAILS</h2>

                        </div>

                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Ticket No:</b>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlticketno" runat="server" class="form-control show-tick" OnSelectedIndexChanged="ddlticketno_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line" runat="server" id="Divcate">
                                            <b>Category:</b>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="DDLCAT" runat="server" class="form-control show-tick" OnSelectedIndexChanged="DDLCAT_SelectedIndexChanged" AutoPostBack="true" Visible="false">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlticketno" EventName="SelectedIndexChanged" />
                                                </Triggers>


                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line" runat="server" id="DivSubcate">
                                            <b>SubCategory:</b>

                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="DDLSUBCAT" runat="server" class="form-control show-tick" Visible="false" AutoPostBack="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlticketno" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="DDLCAT" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>


                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line" runat="server" id="Divpriority">
                                            <b>Priority:</b>
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlpriority" runat="server" class="form-control show-tick" Visible="false">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlticketno" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="form-line" runat="server" id="Divdiscreption">
                                            <b>Complain Descriptions:</b>
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="Txtdescription" runat="server" TextMode="MultiLine" class="form-control no-resize" required Visible="false"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlticketno" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group"></div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group"></div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <asp:Button ID="btnSubmit" runat="server" Text="Update" class="btn bg-deep-orange waves-effect" OnClick="btnSubmit_Click" Visible="true" />
                                        <button type="button" class="btn bg-yellow waves-effect" data-dismiss="modal">Close</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>COMPLAIN DETAILS
                              </h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);" data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons'>mode_edit</i>Edit Complain</a></li>
                                <%-- <li><a href="javascript:void(0);" data-toggle='modal' data-target='#defaultModal_2'> Complain Tracking</a></li>--%>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs tab-nav-right" role="tablist">
                        <li role="presentation"><a href="#home" data-toggle="tab">Open Complains</a></li>
                        <li role="presentation"><a href="#profile" data-toggle="tab">Pending Complains 
                                    <span class="badge bg-orange">
                                        <asp:Label ID="lblpending" runat="server" Text="20" ForeColor="White"></asp:Label></span>
                            <span class="badge bg-lime">
                                <asp:Label ID="lblsolve" runat="server" Text="20" ForeColor="White"></asp:Label></span>
                        </a></li>
                        <li role="presentation"><a href="#messages" data-toggle="tab">Closed Complains</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                            <div class="table-responsive">
                                <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    <thead>
                                        <tr>
                                            <th>Ticket No</th>
                                            <th>Category</th>
                                            <th>Subcategory</th>
                                            <th>Complain Date</th>
                                            <th>Remarks</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%=getSourceData() %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile">
                            <div class="table-responsive">
                                <table id="table1" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    <thead>
                                        <tr>
                                            <th>Ticket No</th>
                                            <th>Category</th>
                                            <th>Subcategory</th>
                                            <th>Complain Date</th>
                                            <th>Remarks</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%=getSourceData_1() %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="messages">
                            <div class="table-responsive">
                                <table id="table2" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    <thead>
                                        <tr>
                                            <th>Ticket No</th>
                                            <th>Category</th>
                                            <th>Subcategory</th>
                                            <th>Complain Date</th>
                                            <th>Remarks</th>
                                            <th>Status</th>
                                            <th>Tracking</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%=getSourceData_2() %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="defaultModal_2" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 1300px;">
            <div class="block-header">
            </div>
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>COMPLAIN TRAKING</h2>

                        </div>

                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Ticket No:</b>
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddltick" runat="server" class="form-control show-tick" OnSelectedIndexChanged="ddltick_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group" runat="server" id="divACTIVE" visible="false">
                                        <i class='btn bg-green btn-block btn-xs waves-effect'>
                                            <asp:Label ID="lblcomplainclose" runat="server" Text="Complain Closed.." Visible="false"></asp:Label></i>
                                    </div>
                                </div>
                            </div>

                            <div class="row clearfix">
                                <div class="col-sm-12">
                                    <div class="form-group">



                                        <div class="table-responsive">
                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <table id="table3" class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                                        <thead>
                                                            <tr>
                                                                <th>Ticket No</th>
                                                                <th>Complain Date</th>
                                                                <th>Assign From</th>
                                                                <th>Assign To</th>
                                                                <th>Resolution Date</th>
                                                                <th>Remarks</th>
                                                                <th>Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%= getTraking()%>
                                                        </tbody>
                                                    </table>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddltick" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row clearfix">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group"></div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group"></div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <button type="button" class="btn bg-yellow waves-effect" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
