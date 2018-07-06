<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                    Order Info
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
                                <dd>${orderInfo.customerName}</dd>
                                <dt>Email:</dt>
                                <dd>${orderInfo.customerEmail}</dd>
                                <dt>Phone:</dt>
                                <dd>${orderInfo.customerPhone}</dd>
                                <dt>Address:</dt>
                                <dd>${orderInfo.customerAddress}</dd>
                            </dl>
                        </div>

                        <div class="box-header with-border">
                            <i class="fa fa-text-width"></i>

                            <h3 class="box-title">Order Summary</h3>
                        </div>
                        <div class="box-body">
                            <dl class="dl-horizontal">
                                <dt>Total:</dt>
                                <dd> <span class="total"><fmt:formatNumber value="${orderInfo.amount}" type="currency"/></span></dd>
                            </dl>
                        </div>

                        <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div><div class="row"><div class="col-sm-12"><table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
                            <thead>
                            <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">Product Code</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">Product Name</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">Quantity</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending">Price</th><th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">Amount</th></tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderInfo.details}" var="orderDetailInfo">
                                <tr>
                                    <td>${orderDetailInfo.productCode}</td>
                                    <td>
                                            ${orderDetailInfo.productName}
                                    </td>
                                    <td>${orderDetailInfo.quanity}</td>
                                    <td>  <fmt:formatNumber value="${orderDetailInfo.price}" type="currency"/></td>
                                    <td><fmt:formatNumber value="${orderDetailInfo.amount}" type="currency"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table></div></div><div class="row"><div class="col-sm-5"></div></div></div>
                </div>
            </section>


            <c:if test="${paginationResult.totalPages > 1}">
                <div class="col-xs-12 text-center">
                <div class="page-navigator">
                    <c:forEach items="${paginationResult.navigationPages}" var = "page">
                        <c:if test="${page != -1 }">
                            <a href="orderList?page=${page}" class="nav-item">${page}</a>
                        </c:if>
                        <c:if test="${page == -1 }">
                            <span class="nav-item"> ... </span>
                        </c:if>
                    </c:forEach>
                </div>
                </div>
            </c:if>
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