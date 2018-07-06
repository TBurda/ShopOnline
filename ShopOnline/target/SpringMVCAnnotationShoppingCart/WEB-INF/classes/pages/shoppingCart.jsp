<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>

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
                    My Cart
                </h1>
            </section>

            <section class="content">



            <c:if test="${empty cartForm or empty cartForm.cartLines}">

                <div class="callout callout-info">
                    <h4>Tip!</h4>

                    <p>There is no items in Cart. <a href="${pageContext.request.contextPath}/productList">Show
                        Product List</a></p>
                </div>
            </c:if>

                <div class="row">

<c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
    <form:form method="POST" modelAttribute="cartForm"
               action="${pageContext.request.contextPath}/shoppingCart">

        <c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
                   varStatus="varStatus">

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
                    <div class="box-body">
                        <dl class="dl-horizontal">
                            <dt>Code:</dt>
                            <dd>${cartLineInfo.productInfo.code} <form:hidden
                                    path="cartLines[${varStatus.index}].productInfo.code" /></dd>
                            <dt>Price:</dt>
                            <dd><span class="price">

                         <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>

                       </span></dd>
                            <dt>Quantity:</dt>
                            <dd><form:input
                                    path="cartLines[${varStatus.index}].quantity" class="form-control"/></dd>
                            <dt>Amount:</dt>
                            <dd>   <span class="subtotal">

                            <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>

                         </span></dd>
                        </dl>
                    </div>
                    <div class="box-footer">
                        <a href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}" class="btn btn-block btn-danger btn-sm">Delete</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>

        <div class="col-xs-12 text-center">
            <input class="btn  btn-success btn-sm" type="submit" value="Update Quantity" />
            <a class="btn  btn-success btn-sm navi-item" href="${pageContext.request.contextPath}/shoppingCartCustomer">Enter Customer Info</a>
            <a class="btn  btn-success btn-sm navi-item" href="${pageContext.request.contextPath}/productList">Continue Buy</a>
        </div>
  </form:form>


</c:if>

            </section>
        </div>
    </div>

<jsp:include page="_footer.jsp" />

</div>
<script src="AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
<script src="AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="AdminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
<script src="AdminLTE/dist/js/adminlte.min.js"></script>
<script src="AdminLTE/dist/js/demo.js"></script>
</body>
</html>
