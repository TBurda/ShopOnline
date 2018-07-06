<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html>
<head>

    <title>Product List</title>

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
                    Product List
                </h1>
            </section>

            <section class="content">

   <div class="row">

<c:forEach items="${paginationProducts.list}" var="prodInfo">

    <div class="col-md-3">

            <div class="box box-solid">
                <div class="container-fluid no-padding">
                    <div class="row">
                        <div class="col-md-12">
                            <img src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" alt="placeholder 960" class="img-responsive"/>
                        </div>
                    </div>
                </div>

                <div class="box-header with-border">
                    <h3 class="box-title"><strong>${prodInfo.name}</strong></h3>
                </div>
                <div class="box-body">
                    ${prodInfo.description}
                </div>
                <div class="box-body">
                    <dl class="dl-horizontal">
                        <dt>Code:</dt>
                        <dd>${prodInfo.code}</dd>
                        <dt>Price:</dt>
                        <dd>${prodInfo.price}</dd>
                    </dl>
                </div>
                <div class="box-footer">
                    <a href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}" class="btn btn-block btn-success btn-sm" id="buy">Buy now</a>
                    <security:authorize  access="hasRole('ROLE_MANAGER')">
                        <a href="${pageContext.request.contextPath}/product?code=${prodInfo.code}" class="btn btn-block btn-danger btn-sm">Edit</a>

                    </security:authorize>

                       </div>

            </div>
        </div>
</c:forEach>
        </div>


<c:if test="${paginationProducts.totalPages > 1}">
    <div class="col-xs-12 text-center">
    <div class="page-navigator">
        <c:forEach items="${paginationProducts.navigationPages}" var = "page">
            <c:if test="${page != -1 }">
                <a href="productList?page=${page}" class="nav-item">${page}</a>
            </c:if>
            <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
            </c:if>
        </c:forEach>

    </div>
                </div>
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