<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Shop online</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bower_components/morris.js/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bower_components/jvectormap/jquery-jvectormap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="skin-blue layout-top-nav" style="height: auto; min-height: 100%;">
<div class="wrapper" style="height: auto; min-height: 100%;">

    <jsp:include page="_header.jsp" />

    <div class="content-wrapper" style="min-height: 230px;">
        <div class="container">
            <section class="content-header">
                <h1>
                    <b>Shop</b>Online
                </h1>
            </section>

            <section class="content">
                <div class="row">
                    <h2 class="h2 col-lg-4 page-header">Top Selling</h2>
                </div>
                <div class="box box-solid">
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
                <div class="row">
                    <div class="col-lg-6">
                        <div class="tab-pane active" id="tab_1-1">
                            <b>How to use:</b>

                            <p>Exactly like the original bootstrap tabs except you should use
                                the custom wrapper <code>.nav-tabs-custom</code> to achieve this style.</p>
                            A wonderful serenity has taken possession of my entire soul,
                            like these sweet mornings of spring which I enjoy with my whole heart.
                            I am alone, and feel the charm of existence in this spot,
                            which was created for the bliss of souls like mine. I am so happy,
                            my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
                            that I neglect my talents. I should be incapable of drawing a single stroke
                            at the present moment; and yet I feel that I never was a greater artist than now.
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="tab-pane active" id="tab_1-1">
                            <b>How to use:</b>

                            <p>Exactly like the original bootstrap tabs except you should use
                                the custom wrapper <code>.nav-tabs-custom</code> to achieve this style.</p>
                            A wonderful serenity has taken possession of my entire soul,
                            like these sweet mornings of spring which I enjoy with my whole heart.
                            I am alone, and feel the charm of existence in this spot,
                            which was created for the bliss of souls like mine. I am so happy,
                            my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
                            that I neglect my talents. I should be incapable of drawing a single stroke
                            at the present moment; and yet I feel that I never was a greater artist than now.
                        </div>

                    </div>
                </div>
                <div class="row">
                    <h2 class="h2  col-lg-4 page-header">Top Favourite</h2>
                </div>
                <div class="box box-solid">
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
                <div class="row">
                    <div class="col-lg-8">
                        <div class="tab-pane active" id="tab_1-1">
                            <b>Top Favourite</b>

                            <p>Exactly like the original bootstrap tabs except you should use
                                the custom wrapper <code>.nav-tabs-custom</code> to achieve this style.</p>
                            A wonderful serenity has taken possession of my entire soul,
                            like these sweet mornings of spring which I enjoy with my whole heart.
                            I am alone, and feel the charm of existence in this spot,
                            which was created for the bliss of souls like mine. I am so happy,
                            my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
                            that I neglect my talents. I should be incapable of drawing a single stroke
                            at the present moment; and yet I feel that I never was a greater artist than now.
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="tab-pane active" id="tab_1-1">
                            <b>How to use:</b>

                            <p>Exactly like the original bootstrap tabs except you should use
                                the custom wrapper <code>.nav-tabs-custom</code> to achieve this style.</p>
                            A wonderful serenity has taken possession of my entire soul,
                            like these sweet mornings of spring which I enjoy with my whole heart.
                            I am alone, and feel the charm of existence in this spot,
                            which was created for the bliss of souls like mine. I am so happy,
                            my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
                            that I neglect my talents. I should be incapable of drawing a single stroke
                            at the present moment; and yet I feel that I never was a greater artist than now.
                        </div>

                    </div>
                </div>
            </section>
        </div>
    </div>

    <jsp:include page="_footer.jsp" />

</div>

<script src="AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/AdminLTE/dist/js/demo.js"></script>
</body>
</html>
