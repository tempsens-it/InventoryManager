<%@ Page Title="Home" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="block-header">
        <h2>HOME</h2>
    </div>

    <div class="row clearfix">
                <!-- Task Info -->
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                    <div class="card">
                        <div class="header">
                            <h2>Avaliable Inventary</h2>
                        </div>

                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover dashboard-task-infos">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Part Name</th>
                                            <th>Description</th> <%--Contains all 3 specification in same column with br--%>
                                            <th>Company</th>
                                            <th>Quntity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%=getSourceData() %>
                                        <%=getSourceData() %>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Task Info -->
               
            </div>

    
</asp:Content>
