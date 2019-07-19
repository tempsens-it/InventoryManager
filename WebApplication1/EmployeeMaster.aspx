<%@ Page Title="Employee Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EmployeeMaster.aspx.cs" Inherits="EmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function delete_id(empId) {
            if (confirm('Sure To Remove This Employee ?')) {
                window.location.href = 'EmployeeMaster.aspx?delete_id=' + empId
            }
        }
    </script>

    <div class="modal fade" id="defaultModal_1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 1300px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="defaultModalLabel">UPDATE EMPLOYEE</h4>
                </div>
                <div class="modal-body">
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

                        <div class="col-md-10">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Employee Name:</b>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="tbEmpName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Company</b>
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlCompany" runat="server" class="form-control show-tick" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Department</b>
                                    
                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                           <asp:DropDownList ID="ddlDepartment" runat="server" class="form-control show-tick" AutoPostBack="true"></asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="ddlCompany" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Designation</b>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="tbDesig" runat="server" class="form-control" placeholder="Designation"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Contact Number</b>
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="tbContact" runat="server" class="form-control" placeholder="Contact Number"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>Internal Mail ID</b>
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="tbIntMail" runat="server" class="form-control" placeholder="Internal Mail ID"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="form-line">
                                    <b>External Mail ID</b>
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="tbExtMail" runat="server" class="form-control" placeholder="Internal Mail ID"></asp:TextBox>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:CheckBox ID="cbIsActive" runat="server" class="form-control filled-in" Text="Is Active" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlId" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer"  style="margin-top: -50px;">
                        <asp:Button ID="Button2" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnUpdate_Click" />
                        <button type="button" class="btn btn-primary m-t-15 waves-effect" data-dismiss="modal">CLOSE</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="block-header">
        <h2>Employee Master </h2>
    </div>


    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Employee
                    </h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
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
                                                        <th>Employee No.</th>
                                                        <th>Name</th>
                                                        <th>Designation</th>
                                                        <th>Department</th>
                                                        <th>Company</th>
                                                        <th>Contact No.</th>
                                                        <th>Internal Email id</th>
                                                        <th>External Email id</th>
                                                        <th>Is Active</th>
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
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Employee Name:</b>
                                            <asp:TextBox ID="tbEmpName2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Company Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <b>Company</b>
                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlCompany2" runat="server" class="form-control show-tick" OnSelectedIndexChanged="ddlCompany2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="col-md-6">
                                    <b>Department</b>
                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlDepartment2" runat="server" class="form-control show-tick" AutoPostBack="true"></asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlCompany2" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="col-md-6">

                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Designation:</b>
                                            <asp:TextBox ID="tbDesig2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Designation"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Contact:</b>
                                            <asp:TextBox ID="tbContact2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Contact Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Internal Email Address:</b>
                                            <asp:TextBox ID="tbIntMail2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Internal Mail"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>External Email Address:</b>
                                            <asp:TextBox ID="tbExtMail2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="External Mail"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="input-group input-group-lg">
                                        <asp:CheckBox ID="cbIsActive2" runat="server" class="form-control filled-in" Text="Is Active" />
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

