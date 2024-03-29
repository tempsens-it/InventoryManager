﻿<%@ Page Title="Supplier Master" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="SupplierMaster.aspx.cs" Inherits="SupplierMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function delete_id(supCntId) {
            if (confirm('Sure To Remove This Employee ?')) {
                window.location.href = 'SupplierMaster.aspx?delete_id=' + supCntId
            }
        }
    </script>

    <div class="modal fade" id="defaultModal_1" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width: 1300px;">

            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="defaultModalLabel">UPDATE</h4>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#edit_with_icon_title_supplier" data-toggle="tab">
                                <i class="material-icons">edit</i> UPDATE SUPPLIER
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#edit_with_icon_title_supplier_person" data-toggle="tab">
                                <i class="material-icons">edit</i> UPDATE SUPPLIER PERSON
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="edit_with_icon_title_supplier">
                            <br />
                            <div class="row clearfix">
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Id:</b>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlIdSupplier" runat="server" class="form-control show-tick" AutoPostBack="true" OnSelectedIndexChanged="ddlIdSupplier_SelectedIndexChanged"></asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-10">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Name</b>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbSupplierName" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Address</b>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbSupAdd" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>State</b>
                                            <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlState" runat="server" class="form-control show-tick" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AppendDataBoundItems="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>City</b>
                                            <asp:UpdatePanel ID="UpdatePanel14" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlSupCity" runat="server" class="form-control show-tick"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlState" EventName="SelectedIndexChanged" />
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>PinCode</b>
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbSupPincode" runat="server" class="form-control" placeholder="Pincode"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Landline Number</b>
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbSupLandline" runat="server" class="form-control" placeholder="Landline Number"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Email Address</b>
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbSupEmail" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>GST Number</b>
                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbGST" runat="server" class="form-control" placeholder="GST Number"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplier" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="Button2" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSubmit_Click" />
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect" data-dismiss="modal">CLOSE</button>
                                </div>
                            </div>
                        </div>


                        <div role="tabpanel" class="tab-pane fade" id="edit_with_icon_title_supplier_person">
                            <br />
                            <div class="row clearfix">
                                <div class="col-sm-2">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Id:</b>
                                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlIdSupplierCnt" runat="server" class="form-control show-tick" AutoPostBack="true" OnSelectedIndexChanged="ddlIdSupplierCnt_SelectedIndexChanged"></asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Name</b>
                                            <asp:UpdatePanel ID="UpdatePanel15" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbSupplier" runat="server" class="form-control" placeholder="Supplier's Name"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplierCnt" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Name:</b>
                                            <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbName" runat="server" class="form-control" placeholder="Person's Name"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplierCnt" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Designation</b>
                                            <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbDesignation" runat="server" class="form-control" placeholder="Designation"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplierCnt" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Mobile Number</b>
                                            <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbMobNum" runat="server" class="form-control" placeholder="Mobile Number"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplierCnt" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Email Address</b>
                                            <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="tbEmail" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlIdSupplierCnt" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="Button1" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSubmit_Click" />
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect" data-dismiss="modal">CLOSE</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="block-header">
        <h2>Supplier Master </h2>
    </div>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>Supplier
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
                            <a href="#view_with_icon_title" data-toggle="tab">
                                <i class="material-icons">view_comfy</i> VIEW
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#addBox_with_icon_title" data-toggle="tab">
                                <i class="material-icons">add_box</i> ADD
                            </a>
                        </li>
                        <li role="presentation">
                            <a href="#personAdd_with_icon_title" data-toggle="tab">
                                <i class="material-icons">person_add</i> ADD CONTACT PERSON
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
                                            <table id="table_1" class="table table-bordered table-striped table-hover js-basic-example dataTable" style="width: auto;">
                                                <thead>
                                                    <tr>
                                                        <th>Supplier No.</th>
                                                        <th>Name</th>
                                                        <th>City</th>
                                                        <th>State</th>
                                                        <th>Pincode</th>
                                                        <th>Landline Number</th>
                                                        <th>Email id</th>
                                                        <th>GST Number</th>
                                                        <th>Contact Person</th>
                                                        <th>Designation</th>
                                                        <th>Mobile Number</th>
                                                        <th>Email id</th>
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
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Name</b>
                                            <asp:TextBox ID="tbSupplierName2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Address</b>
                                            <asp:TextBox ID="tbSupAdd2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Address"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                                <%--If dropdown is Required --%>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>State</b>
                                            <asp:UpdatePanel ID="UpdatePanel16" runat="server">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlState2" runat="server" class="form-control show-tick" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="ddlState2_SelectedIndexChanged"></asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>City</b>
                                            <asp:UpdatePanel ID="UpdatePanel17" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlSupCity2" runat="server" class="form-control show-tick" AppendDataBoundItems="true"></asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlState2" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>PinCode</b>
                                            <asp:TextBox ID="tbSupPincode2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Pincode"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Landline Number</b>
                                            <asp:TextBox ID="tbSupLandline2" runat="server" Style="text-transform: capitalize" class="form-control" placeholder="Landline Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Supplier Email Address</b>
                                            <asp:TextBox ID="tbSupEmail2" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>GST Number</b>
                                            <asp:TextBox ID="tbGST2" runat="server" class="form-control" placeholder="GST Number"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="BtnSave" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSave_Click" />

                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="personAdd_with_icon_title">
                            <br />

                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <b>Supplier Name</b>
                                    <asp:DropDownList ID="ddlSupplier2" runat="server" class="form-control show-tick"></asp:DropDownList>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Name:</b>
                                            <asp:TextBox ID="tbName2" runat="server" class="form-control" placeholder="Person's Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Designation</b>
                                            <asp:TextBox ID="tbDesignation2" runat="server" class="form-control" placeholder="Designation"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Mobile Number</b>
                                            <asp:TextBox ID="tbMobNum2" runat="server" class="form-control" placeholder="Mobile Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="form-line">
                                            <b>Email Address</b>
                                            <asp:TextBox ID="tbEmail2" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btnSave2" runat="server" Text="UPDATE" class="btn btn-primary m-t-15 waves-effect" OnClick="btnSave2_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <%--Payment Terms--%>
    <%--<div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Payment Terms
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_payment_term">Payment Terms</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_payment_term" class="form-control" placeholder="Enter Payment Terms">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <label for="sup_payment_desc">Payment Terms Description</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_payment_desc" class="form-control" placeholder="Enter Payment terms description">
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                </div>
            </div>
        </div>
    </div>--%>

    <%--Documentation Type--%>
    <%-- <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Document Type
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_document_type">Document Typer</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_document_type" class="form-control" placeholder="Enter Document Type">
                                </div>
                            </div>
                        </div>
                    </div>   
 
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>--%>

    <%--Catagory--%>
    <%--<div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Category
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_category">Category</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_category" class="form-control" placeholder="Enter Category">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>--%>

    <%--Brand--%>
    <%--<div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Add Brand
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <label for="sup_brand">Brand</label>
                            <div class="form-group">
                                <div class="form-line">
                                    <input type="text" id="sup_brand" class="form-control" placeholder="Enter Brand">
                                </div>
                            </div>
                        </div>
                    </div>   

                    
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                    &ensp;
                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                    
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>

