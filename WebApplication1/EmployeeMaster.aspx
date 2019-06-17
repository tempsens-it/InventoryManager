<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EmployeeMaster.aspx.cs" Inherits="EmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                TABS WITH ICON TITLE
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#home_with_icon_title" data-toggle="tab">
                                        <i class="material-icons">home</i> HOME
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#profile_with_icon_title" data-toggle="tab">
                                        <i class="material-icons">face</i> PROFILE
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#messages_with_icon_title" data-toggle="tab">
                                        <i class="material-icons">email</i> MESSAGES
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#settings_with_icon_title" data-toggle="tab">
                                        <i class="material-icons">settings</i> SETTINGS
                                    </a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home_with_icon_title">
                                    <b>Home Content</b>
                                   
                                    <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                               COMPLAIN DETAILS
                              </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);"  data-toggle='modal' data-target='#defaultModal_1'><i class='material-icons' >mode_edit</i>Edit Complain</a></li>
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
                            <%--<%=getSourceData_2() %>--%>
                            </tbody>
                                </table>
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="profile_with_icon_title">
                                    <b>Profile Content</b>
                                     <div class="row clearfix">
                                   
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Employee Master
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <h2 class="card-inside-title">Employee Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">person</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Employee Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Department">
                                        </div>
                                       <span class="input-group-addon">
                                            <i class="material-icons">send</i>
                                        </span>
                                  </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">business</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Designation">
                                        </div>
                                        <span class="input-group-addon">
                                            <i class="material-icons">send</i>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <h2 class="card-inside-title">Employee Contact Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_phone</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Contact No.">
                                        </div>
                                       </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_mail</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Internal email">
                                        </div>                                        
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">email</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="External email">
                                        </div>                                        
                                    </div>
                                </div>                               
                            </div>                            

                            <h2 class="card-inside-title">Radio &amp; Checkbox</h2>
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <div class="input-group input-group-lg">                                        
                                        <input type="checkbox" id="remember_me_2" class="filled-in">
                                        <label for="remember_me_2">Is Active</label>                                      
                                    </div>
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>                                    
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>

</div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
    <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Employee Master
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Another action</a></li>
                                        <li><a href="javascript:void(0);" class=" waves-effect waves-block">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <h2 class="card-inside-title">Employee Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">person</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Employee Name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Department">
                                        </div>
                                        <%--<span class="input-group-addon">
                                            <i class="material-icons">send</i>
                                        </span>--%>
                                   <%--<%-- </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">business</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Designation">
                                        </div>
                                        <%--<span class="input-group-addon">
                                            <i class="material-icons">send</i>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <h2 class="card-inside-title">Employee Contact Details</h2>
                            <div class="row clearfix">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_phone</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Contact No.">
                                        </div>
                                       </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">contact_mail</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="Internal email">
                                        </div>                                        
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">email</i>
                                        </span>
                                        <div class="form-line">
                                            <input type="text" class="form-control date" placeholder="External email">
                                        </div>                                        
                                    </div>
                                </div>                               
                            </div>                            

                            <h2 class="card-inside-title">Radio &amp; Checkbox</h2>
                            <div class="row clearfix">
                                <div class="col-md-6">
                                    <div class="input-group input-group-lg">                                        
                                        <input type="checkbox" id="remember_me_2" class="filled-in">
                                        <label for="remember_me_2">Is Active</label>                                      
                                    </div>
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">ADD</button>                                    
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">UPDATE</button>
                                    <button type="button" class="btn btn-primary m-t-15 waves-effect">DELETE</button>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>--%>


</asp:Content>

