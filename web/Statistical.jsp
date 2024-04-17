<%-- 
    Document   : Statistical
    Created on : Mar 12, 2024, 4:16:37 AM
    Author     : VIET HOANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Top 5 Best Selling Products</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>Top 5 Best Selling Products</h2>
<table>
    <thead>
        <tr>
            <th>Product ID</th>
            <th>Title</th>
            <th>Image</th>
            <th>Price</th>
            <th>Total Sold</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${list}">
            <tr>
                <td>${product.getProduct().id}</td>
                <td>${product.getProduct().title}</td>
                <td><img style="width: 20%" src="${product.getProduct().image}" alt="alt"/></td>
                <td>${product.getProduct().price}</td>
                <td>${product.totalSold}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
