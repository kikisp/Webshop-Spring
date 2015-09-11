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
<script src="resources/js/ui-bootstrap-tpls-0.13.0.js"
	type="text/javascript"></script>
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
					<a class="navbar-brand" href="shop"><span
						class="glyphicon glyphicon-user"></span> Welcome,${user}</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<div>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown" dropdown on-toggle="toggled(open)"><a
								href class="dropdown-toggle" dropdown-toggle><span
									class="glyphicon glyphicon-list-alt"></span>Categories <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="shop">All</a></li>
									<c:forEach items="${CategoryList}" var="category">
										<li><a href="./shop/${category.categoryId}">${category.name}</a></li>
									</c:forEach>
								</ul></li>
							<li><a href="cart"><span
									class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
							<li><a href="logout"><span
									class="glyphicon glyphicon-log-out"></span>Logout</a></li>
						</ul>
						<form class="navbar-form navbar-right" role="form"
							action="shop/search/" method="post">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search"
									name="search">
							</div>
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</form>
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
			<div class="panel-body panelB">
				<div class="row">
					<c:forEach items="${ProductList}" var="product">
						<div class="col-sm-4">
							<h3>${product.name}</h3>
							<h4>Currentlly in stock: ${product.squantity} pieces.</h4>
							<p class="textheight">
								<img class="pull-left img-responsive"
									src="resources/images/${product.photo}" alt="slika">
								${product.description} <br class="clearfix" />
							</p>
							<br />
							<div id="info">
								<h4>Packaging: ${product.packaging}</h4>
								<h4>Price is: ${product.price} rsd.</h4>
							</div>
							<div class="cartB">
								<form class="form-inline" role="form" action="addtobasket"
									method="post">
									<button type="submit" class="btn btn-primary btn-sm">Add
										to cart</button>
									<input type="hidden" name="id" value="${product.productId}" />
									<div class="form-group">
										<label id="cartL" for="txt">Quantity:</label> <input
											type="text" class="form-control qty" id="txt" name="qty">
									</div>
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>