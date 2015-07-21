<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" ng-app="store">
   <head>
      <base href="/School/" />
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <meta name="description" content="">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="resources/css/bootstrap.css"
         type="text/css" media="screen">
      <link rel="stylesheet" href="resources/css/main.css" type="text/css"
         media="screen">
      <link rel="stylesheet" href="resources/css/plus.css" type="text/css"
         media="screen">
      <style type="text/css">
         .nav, .pagination, .carousel, .panel-title a {
         cursor: pointer;
         }
      </style>
      <link href="resources/images/favicon.ico" rel="shortcut icon"
         type="image/x-icon" />
      <script src="resources/js/jquery.min.js" type="text/javascript"></script>
      <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="resources/js/angular.js" type="text/javascript"></script>
      <script src="resources/js/ui-bootstrap-tpls-0.13.0.js" type="text/javascript"></script>	
      <script src="resources/js/store.js" type="text/javascript"></script>
      <script src="resources/js/jplugins.js" type="text/javascript"></script>
      <script src="resources/js/main.js" type="text/javascript"></script>
      <script src="resources/js/modernizr-2.8.3.min.js" type="text/javascript"></script>
      <title>Shop</title>
   </head>
   <body>
      <div class="jumbotron">
         <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse"
                     data-target="#myNavbar">
                  <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                     class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="cart"><span class="glyphicon glyphicon-star"></span>Cart</a>
               </div>
               <div class="collapse navbar-collapse" id="myNavbar">
                  <div>
                     <ul class="nav navbar-nav navbar-right">
                        <li><a href="shop"><span
                           class="glyphicon glyphicon-chevron-left"></span>Back to shop</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </nav>
         <div align="center">
            <br /> <img src="resources/images/Webshop.png"
               class="img-responsive slika" alt="Webshop" />
         </div>
      </div>
      <div class="container">
         <div class="panel panel-default">
            <div class="panel-heading panelH">
               <h2>Products in your cart:</h2>
            </div>
            <div class="panel-body panelB">
               <div class="row">
              
                  <c:set var="TotPrice" value="0" scope="page" />
                   <c:forEach items="${ProductsList}" var="product">
                     <div class="col-sm-4">
                         <img class="pull-left img-responsive"
                              src="resources/images/${product.photo}" alt="slika">
                        <h3>${product.name}</h3>
                        <h4>Quantity: ${product.oquantity}</h4>
                        <h4>Price: ${product.price*product.oquantity} rsd.</h4>
                         <c:set var="TotPrice" value="${ TotPrice+product.price*product.oquantity}" scope="page" />
                        <form class="form-inline" role="form" action="remove" method="post">
                              <button type="submit" class="btn btn-primary">Remove</button>   
                              <input type="hidden" name="id" value="${product.productId}" />
                           </form>			
                     </div>
                  </c:forEach>
               </div>
                  <h3>Your total price is : ${TotPrice} rsd.</h3>
                  <h3>${msg}</h3>
                 <form class="form-inline" role="form" action="confirmorder" method="post">
                     <button type="submit" class="btn btn-primary  btn-lg btn-block confirmo">Confirm Order</button>
                              <input type="hidden" name="total" value="${TotPrice}" />
                           </form>		
            </div>
         </div>
      </div>
   </body>
</html>