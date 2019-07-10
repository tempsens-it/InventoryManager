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
            <div class="block-header">
            </div>
            <!-- Basic Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>UPDATE EMPLOYEE</h2>

                        </div>
                        <div class="body">
                            <div class="row clearfix">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Employee Name:</b>
                                            <asp:TextBox ID="TxtEmployee" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Company Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Department</b>
                                            <asp:DropDownList ID="DropDepartment" runat="server" class="form-control show-tick">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Company</b>
                                            <asp:DropDownList ID="DropCompany" runat="server" class="form-control show-tick">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Designation</b>
                                            <asp:TextBox ID="TextBoxDesignation" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Designation"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Contact Number</b>
                                            <asp:TextBox ID="TextBoxContact" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Contact Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Internal Mail ID</b>
                                            <asp:TextBox ID="TextBoxIntMail" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Internal Mail ID"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>External Mail ID</b>
                                            <asp:TextBox ID="TextBoxExtMail" runat="server" Style="text-transform: capitalize" class="form-control" required placeholder="Internal Mail ID"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">

                                        <%--<b>Is Active</b>--%>
                                        <asp:CheckBox ID="CheckBoxIsActive" runat="server" class="form-control filled-in" Text="Is Active" />
                                        <%-- Check Box inActive --%>
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
        <h2>Employee Master </h2>
    </div>


    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Employee
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
                                            <%--<input type="text" id="emp_name" class="form-control" placeholder="Enter Employee name">--%>
                                            <b>Employee Name:</b>
                                            <asp:TextBox ID="TextBoxName" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Company Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">

                                    <b>Department</b>
                                    <asp:DropDownList ID="DropDepartment2" runat="server" class="form-control show-tick">
                                    </asp:DropDownList>
                                </div>

                                <div class="col-md-6">
                                    <b>Company</b>
                                    <asp:DropDownList ID="DropCompany2" runat="server" class="form-control show-tick">
                                    </asp:DropDownList>
                                </div>

                                <div class="col-md-6">

                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Designation:</b>
                                            <asp:TextBox ID="TextBoxDesignation2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Designation"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Contact:</b>
                                            <asp:TextBox ID="TextBoxContact2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Contact Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Internal Email Address:</b>
                                            <asp:TextBox ID="TextBoxIntMail2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Internal Mail"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>External Email Address:</b>
                                            <asp:TextBox ID="TextBoxExtMail2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="External Mail"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="input-group input-group-lg">
                                        <asp:CheckBox ID="CheckBoxActive1" runat="server" class="form-control filled-in" Text="Is Active" />
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

