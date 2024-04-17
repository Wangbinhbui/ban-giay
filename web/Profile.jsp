<%-- 
    Document   : Profile
    Created on : Feb 22, 2024, 3:36:30 PM
    Author     : VIET HOANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
    href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    rel="stylesheet" id="bootstrap-css">
<script
src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css" />
        <title>Edit Profile</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div id="logreg-forms">
                <form class="form-signin" action="updateProfile" method="post">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Edit Profile</h1>
                    <label for="user">Username</label>
                    <input name="user" type="text" id="user" readonly class="form-control" value="${sessionScope.acc.user }" required="" autofocus="">
                <label for="email">Email</label>
                <input name="email" type="text" id="email" class="form-control" value="${sessionScope.acc.email }" required="" autofocus="">
                <label for="phone">Phone numbers</label>
                <input name="phone" type="text" id="phone" class="form-control" value="${sessionScope.acc.phone }" required="" autofocus="">
                <label for="name">Name</label>
                <input name="name" type="text" id="name" class="form-control" value="${sessionScope.acc.name }" required="" autofocus="">
                <label for="address">Address</label>
                <input name="address" type="text" id="address" class="form-control" value="${sessionScope.acc.address }" required="" autofocus="">
                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Edit</button> 
            </form>

        </div>
    </body>
</html>
