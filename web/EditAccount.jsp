<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
                            <h2>Edit <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="updateAccount" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">update Account</h4>
                                <button onclick="window.location.href = 'manager';" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <input value="${requestScope.acc.id}" name="id" type="hidden" class="form-control" readonly >
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input value="${requestScope.acc.user}" name="user" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Password</label><br/>
                                    <input value="${requestScope.acc.pass}" name="pass" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${requestScope.acc.name}" name="name" type="text" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${requestScope.acc.email}" name="email" type="text" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>Phone</label>
                                    <input value="${requestScope.acc.phone}" name="phone" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input value="${requestScope.acc.address}" name="address" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Role_id</label>
                                    <input value="${requestScope.acc.role_id}" name="role_id" type="number" class="form-control" min="1">
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>