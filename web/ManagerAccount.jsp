<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a class="btn btn-success" href="home">Home</a>
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a>
                            <!--                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>					-->
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>user</th>
                            <th>password</th>
                            <th>name</th>
                            <th>email</th>
                            <th>phone</th>
                            <th>address</th>
                            <th>role_id</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.list}" var="o">
                            <tr>
                                <td>${o.user}</td>
                                <td>${o.pass}</td>
                                <td>${o.name}</td>
                                <td>${o.email}</td>
                                <td>${o.phone}</td>
                                <td>${o.address}</td>
                                <td>${o.role_id}</td>
                                <td>
                                    <a href="editAccount?user=${o.user}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <c:choose>
                                        <c:when test="${o.deleted eq false}">
                                            <a href="#" onclick="doDelete('${o.user}')" class="delete" data-toggle="modal">
                                                <i class="material-icons" data-toggle="tooltip" title="lock">&#xE897;</i>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#" onclick="doUnlock('${o.user}')" class="delete" data-toggle="modal">
                                                <i class="material-icons" data-toggle="tooltip" title="unlock">lock_open</i>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!--                <div class="clearfix">
                                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>-->
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form action="addNewAccount">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>username</label>
                                <input name="user" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>password</label>
                                <input name="pass" type="pass" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>name</label>
                                <input name="name" type="text" class="form-control">
                            </div>

                            <div class="form-group">
                                <label>email</label>
                                <input name="email" type="text" class="form-control"></input>
                            </div>
                            <div class="form-group">
                                <label>phone</label>
                                <input name="phone" type="text" class="form-control"></input>
                            </div>
                            <div class="form-group">
                                <label>address</label>
                                <input name="address" type="text" class="form-control"></input>
                            </div>
                            <div class="form-group">
                                <label>role id</label>
                                <input name="role_id" type="number" min="1" class="form-control"></input>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->

        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
                                                function doDelete(user) {
                                                    if (confirm('are U sure to lock user ' + user + ' ?')) {
                                                        window.location = 'deleteAccount?user=${o.user}' + user;
                                                    }
                                                }
                                                function doUnlock(user) {
                                                    if (confirm('are U sure to unlock user ' + user + ' ?')) {
                                                        window.location = 'unlockAccount?user=${o.user}' + user;
                                                    }
                                                }
        </script>
    </body>
</html>