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
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">update Product</h4>
                                <button onclick="window.location.href = 'manager' type ="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${requestScope.detail.id}" name="id" type="text" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${requestScope.detail.title}" name="name" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Image</label><br/>
                                    <img src="${requestScope.detail.image}" alt="image"/>
                                    <input value="${requestScope.detail.image}" name="image" type="file" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    
                                    <input value="${requestScope.detail.price}" name="price" type="text" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <input value="${requestScope.detail.description}" name="description" type="text" class="form-control">
                                </div>

                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="c_id" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.id}" <c:if test="${o.id eq requestScope.detail.c_id}">selected</c:if>>${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Brand</label>
                                    <select name="b_id" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listB}" var="b">
                                            <option value="${b.id}" <c:if test="${b.id eq requestScope.detail.b_id}">selected</c:if>>${b.name}</option>
                                        </c:forEach>
                                    </select>
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