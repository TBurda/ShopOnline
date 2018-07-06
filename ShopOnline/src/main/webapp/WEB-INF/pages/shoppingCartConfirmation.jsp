<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart Confirmation</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="AdminLTE/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="AdminLTE/bower_components/morris.js/morris.css">
    <link rel="stylesheet" href="AdminLTE/bower_components/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="AdminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="AdminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>
<body class="skin-blue layout-top-nav" style="height: auto; min-height: 100%;">
<div class="wrapper" style="height: auto; min-height: 100%;">

    <jsp:include page="_header.jsp" />

    <fmt:setLocale value="en_US" scope="session"/>

    <div class="content-wrapper" style="min-height: 230px;">
        <div class="container">
            <section class="content-header">
                <h1>
                    Confirmation
                </h1>
                <jsp:include page="_menu.jsp" />
            </section>

            <section class="content">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <i class="fa fa-text-width"></i>
                        <h3 class="box-title">Customer Information</h3>
                    </div>
                    <div class="box-body">
                        <dl class="dl-horizontal">
                            <dt>Name:</dt>
                            <dd>${myCart.customerInfo.name}</dd>
                            <dt>Email:</dt>
                            <dd>${myCart.customerInfo.email}</dd>
                            <dt>Phone:</dt>
                            <dd>${myCart.customerInfo.phone}</dd>
                            <dt>Address:</dt>
                            <dd>${myCart.customerInfo.address}</dd>
                        </dl>
                    </div>

                    <div class="box-header with-border">
                        <i class="fa fa-text-width"></i>

                        <h3 class="box-title">Cart Summary:</h3>
                    </div>
                    <div class="box-body">
                        <dl class="dl-horizontal">
                            <dt>Quantity:</dt>
                            <dd>${myCart.quantityTotal}</dd>
                            <dt>Total:</dt>
                            <dd> <span class="total"><fmt:formatNumber value="${myCart.amountTotal}" type="currency"/></span></dd>
                        </dl>
                    </div>

                    <div class="box-body">
                        <div class="col-xs-12 text-center">
                    <form method="POST" action="${pageContext.request.contextPath}/shoppingCartConfirmation">
                        <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/shoppingCart">Edit Cart</a>
                        <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/shoppingCartCustomer">Edit Customer Info</a>
                        <input type="submit" value="Send" class="btn btn-success btn-sm" />
                    </form>
                    </div>
                    </div>

                    <div class="box-body">

                        <c:forEach items="${myCart.cartLines}" var="cartLineInfo">


                            <div class="col-md-3">
                                <div class="box box-solid">

                                    <div class="container-fluid no-padding">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <img  src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" alt="placeholder 960" class="img-responsive"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="box-header with-border">
                                        <i class="fa fa-text-width"></i>

                                        <h3 class="box-title">${cartLineInfo.productInfo.name}</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <dl class="dl-horizontal">
                                            <dt>Code:</dt>
                                            <dd>${cartLineInfo.productInfo.code} <input
                                                    type="hidden" name="code" value="${cartLineInfo.productInfo.code}" /></dd>
                                            <dt>Price:</dt>
                                            <dd><span class="price">

                         <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>

                       </span></dd>
                                            <dt>Quantity:</dt>
                                            <dd>${cartLineInfo.quantity}</dd>
                                            <dt>Subtotal:</dt>
                                            <dd>  <span class="subtotal">
                       <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                    </span></dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </section>
        </div>
    </div>

                <jsp:include page="_footer.jsp" />
        </div>

        <script async="" src="//www.google-analytics.com/analytics.js"></script>
        <script src="AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="AdminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
        <script src="AdminLTE/dist/js/adminlte.min.js"></script>
        <script src="AdminLTE/dist/js/demo.js"></script>