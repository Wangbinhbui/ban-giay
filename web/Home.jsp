<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>

                                <li class="breadcrumb-item active" aria-current="#">Product</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <p style="color: red;text-align: center; font-size: 50px">${requestScope.mess}</p>
        <c:set var="page" value="${requestScope.page}"/>
        <div class="pagination">
            

        </div>
        <div class="container">
            <div style="display: flex; justify-content: center;">
                <c:forEach begin="${1}" end="${requestScope.num}" var="i"> 
                    <a href="home?page=${i}" style="margin: 0 10px; font-size: 30px">${i}</a>
                </c:forEach>
            </div>
            <div class="row">

                <jsp:include page="Left.jsp"></jsp:include>

                    <div class="col-sm-9">
                        <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <form action="buy" method="post">
                                    <div class="card">
                                        <img class="card-img-top" src="${o.image}" width="200" height="150" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.title}</a></h4>
                                            <input type="hidden" name="quantity" value="1"/>
                                            <input type="hidden" name="pid" value="${o.id}"/>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${o.price} $</p>
                                                </div>
                                                <div class="col">
                                                    <input type="submit" class="btn btn-success btn-block" onclick="buy('${o.id}')" value="Add to cart"/>                                             
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                            
                    </div>
                        
                </div>


            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
<script type="text/javascript">
    function buy(id) {
        document.buy.action = "buy?pid=" + id;
        document.buy.submit();
    }
</script>

