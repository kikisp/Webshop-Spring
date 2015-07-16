
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <base href="/School/" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/bootstrap.css"
              type="text/css" media="screen">
        <link rel="stylesheet" href="resources/css/plus.css"
              type="text/css" media="screen">	

        <link href="resources/images/favicon.ico" rel="shortcut icon"
              type="image/x-icon" />
        <script src="resources/js/jquery.min.js" type="text/javascript"></script>
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Shop</title>
    </head>
    <body>

        <div class="container">
            <div class="jumbotron">
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="shop">Welcome,${user}</a>
                        </div>
                        <div>
                            <ul class="nav navbar-nav navbar-right">

                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-list-alt"></span>Categories
                                        <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="shop">All</a></li>
                                            <c:forEach items="${CategoryList}" var="category">
                                            <li><a href="./shop/${category.categoryId}">${category.name}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <li><a href="#"><span class="glyphicon 	glyphicon-shopping-cart"></span>Cart</a></li>
                                <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
                            </ul>
                            <form class="navbar-form navbar-right" role="form"  action="shop/search/" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search" name="search">
                                </div>
                                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                            </form>
                        </div>
                    </div>
                </nav>
                <div align="center">
                    <img src="resources/images/Webshop.png" class="img-responsive" alt="Webshop" />
                </div>
            </div>
            <div class="well">
                <div class="row">
                    <c:forEach items="${ProductList}" var="product">
                        <div class="col-sm-4">
                            <h3>${product.name}</h3>
                            <h4> Currentlly in stock: ${product.squantity} pieces.</h4>
                            <p style="height: 150px">
                            <img class="pull-left" src="resources/images/${product.photo}" alt="slika">
                                ${product.description}
                                <br class="clearfix"/>
                            <h4>Packaging: ${product.packaging}</h4>        
                            <h4>Price is: ${product.price} rsd.</h4>
                            <div><button type="button" class="btn btn-primary btn-md" id="myBtn">Add to cart</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </body>
</html>
