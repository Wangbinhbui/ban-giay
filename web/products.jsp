<%-- 
    Document   : products
    Created on : Jan 26, 2024, 2:07:35 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/home.css"/>
        <link rel="stylesheet" href="assets/css/home.css"/>

    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container" style="margin-top: 20px">
            <div class="navbar navbar-expand bg-light justify-content-center" id="navigation" style="margin-top: -40px" >
                <ul class="navbar-nav" style="margin-left: 80px">
                    <li class="nav-item">
                        <a href="home" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="products" class="nav-link">All</a>
                    </li>
                    <c:set var="cat" value="${requestScope.data1}"/>
                    <c:set var="cid" value="${requestScope.cid}"/>
                    <c:forEach items="${requestScope.data1}" var="c">
                        <li class="nav-item">
                            <a href="products?cid=${c.id}" class="nav-link">${c.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div>
                <c:set var="data" value="${requestScope.data2}"/>

                <%--             <div class="row" style="display: flex;justify-content: space-between">

                                   <h3 style="margin-left: 100px">List Of Products (${data.size()})</h3>                    
                                   <form style="margin-top: 10px" action="orderbyprice">
                                       Giá: <select class="form-select" name="price" onchange="this.form.submit()">
                                           <option ${param.price eq '2'?'selected':''} value="2">-----</option>
                                           <option ${param.price eq '0' ? 'selected':''} value="0">Giảm dần</option>
                                           <option ${param.price eq '1' ? 'selected':''} value="1">Tăng dần</option>
                                       </select>
                                   </form>
                               </div>  --%>
                <div class="row">
                    <div class="row col-3" id="tab1" style="display: block">   
                        <c:set var="child" value="${requestScope.child}"/>
                        <h5 style="color: chocolate; margin-top: 20px">Tên Loại Sản Phẩm</h5>
                        <hr style="border-top: 1px solid chocolate"/>
                        <form action="product1" id="f1">
                            <input type="checkbox" id="c0" name="cidd"
                                   ${chid[0]?"checked":""} 
                                   value="${0}" onclick="setCheck(this)"/>All<br/>
                            <c:forEach begin="0" end="${cat.size()-1}" var="i">
                                <input type="checkbox" id="cm" name="cidd" ${cat.get(i).getId() == cid?"checked":""}
                                       value="${cat.get(i).getId()}"
                                       ${chid[i+1]?"checked":""} onclick="setCheck(this)"/>
                                ${cat.get(i).getName()}
                                <br/>
                            </c:forEach> 
                        </form>
                        <h5 style="color: chocolate; margin-top: 20px">Giá</h5>
                        <hr style="border-top: 1px solid chocolate"/>
                        <c:set var="pp" value="${requestScope.pp}"/>
                        <c:set var="pb" value="${requestScope.pb}"/>
                        <form id="f2" action="product1">
                            <input type="checkbox" id="g0" name="price" 
                                   ${pb[0]?"checked":""}
                                   value="0" onclick="setCheck1(this)"/>All<br/>
                            <c:forEach begin="0" end="${4}" var="i">
                                <input type="checkbox" id="g1" name="price"
                                       ${pb[i+1]?"checked":""}
                                       value="${(i+1)}" onclick="setCheck1(this)"/>${pp[i]}<br/>
                            </c:forEach>
                        </form>

                    </div>
                    <div class="row col-9">
                        <c:forEach items="${data}" var="p">
                            <div class="card col-4 " >
                                <img src="${p.image}" class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title">${p.name}</h5>
                                    <p class="card-text">Price: ${p.price} $</p>
                                    <a href="detailproduct?id=${p.id}" class="btn btn-primary">Detail</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
            <br/>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>

<style>
    #tab1{
        background: #138496;
        height: 500px;
    }

    ul.tab{
        list-style: none;
    }
    ul.tab li{
        display: block;
        margin-top: 10px;
    }
    ul.tab li a{
        text-decoration: none;
        font-size: 16px;
    }
    ul.tab li a:hover{
        background-color: #F90;

    }
    ul.tab li a.active{
        background-color: #F90;
        color: white;
    }
</style>

<script type="text/javascript">
    function setCheck(obj) {
        var fries = document.getElementsByName('cidd');
        if ((obj.id == 'c0') && (fries[0].checked == true)) {
            for (var i = 1; i < fries.length; i++) {
                fries[i].checked = false;
            }
        } else {
            for (var i = 1; i < fries.length; i++) {
                if (fries[i].checked == true) {
                    fries[0].checked = false;
                    break;
                }
            }
        }
        document.getElementById('f1').submit();
    }
</script>

<script type="text/javascript">
    function setCheck1(obj) {
        var fries = document.getElementsByName('price');
        if ((obj.id == 'g0') && (fries[0].checked == true)) {
            for (var i = 1; i < fries.length; i++) {
                fries[i].checked = false;
            }
        } else {
            for (var i = 1; i < fries.length; i++) {
                if (fries[i].checked == true) {
                    fries[0].checked = false;
                    break;
                }
            }
        }
        document.getElementById('f2').submit();
    }
</script>
