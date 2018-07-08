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
                    <h2 class="h2 col-lg-4 page-header"><strong>Top Selling</strong></h2>
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
                    <div class="col-lg-12">
                        <div class="tab-pane active" id="tab_1-1">
                            <b>Top Selling</b>
                            <p>Nam vel nulla quis nulla luctus accumsan et a lacus. Ut quis facilisis enim, vel luctus tortor. Vestibulum non nunc nisl. Morbi scelerisque imperdiet diam, id sodales urna ornare sit amet. Praesent rutrum justo neque,
                                quis aliquam massa ornare venenatis. Phasellus gravida quis velit a consequat. Nulla eleifend et arcu a porttitor.
                                Curabitur nec tortor eu felis egestas iaculis. Proin ac tempus erat. Donec rutrum elit mi, nec fermentum dui sollicitudin eget.
                                Aliquam auctor neque vestibulum tincidunt sodales. Duis et orci at arcu tincidunt suscipit. Vivamus ac elit suscipit,
                                dapibus sem at, porta nunc. Pellentesque vulputate placerat malesuada. Orci varius natoque penatibus et magnis dis parturient montes,
                                nascetur ridiculus mus. Donec sem tellus, semper vel ornare eget, condimentum at libero.</p>
                            <p>Suspendisse gravida iaculis congue. Proin quis enim mattis, ornare nulla nec, dictum tellus.
                                Nulla eu fermentum metus. Sed turpis orci, ornare et mollis fermentum, euismod non felis.
                                Vivamus tortor tortor, malesuada eget blandit nec, cursus eu felis. Maecenas congue urna quis libero placerat,
                                non dictum dui dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                Cras eros risus, consequat et elementum in, laoreet eget enim. Aenean consequat ut metus sit amet interdum.
                                Sed posuere eleifend rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed condimentum sem.
                                Etiam vel nisi dapibus, convallis mauris eget, ornare orci.</p>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <h2 class="h2  col-lg-4 page-header"><strong>Top Favourite</strong></h2>
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
                    <div class="col-lg-12">
                        <div class="tab-pane active" id="tab_1-1">
                            <b>Top Favourite</b>

                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin imperdiet metus quis risus porta bibendum. Aliquam tempus mauris lobortis consequat porta. Mauris sed justo ac tellus semper lacinia. Ut scelerisque neque ex, ac accumsan felis varius ac. Mauris eu nisl erat. Quisque ut malesuada urna. Vestibulum scelerisque auctor lobortis. Sed congue vestibulum dolor. Donec nec nisi augue. Praesent sollicitudin magna sit amet sapien viverra vestibulum. Donec sodales eros vitae tellus gravida, ac fermentum lacus luctus. Aenean iaculis et erat at maximus. Donec vel maximus urna, non porttitor erat.</p>
                            <p>Pellentesque aliquam quis eros sed fringilla. Mauris convallis sapien nec dolor pharetra hendrerit. Phasellus ante lacus, pulvinar et est et, interdum imperdiet massa. Phasellus eget ligula sed velit vulputate iaculis ut ut orci. Ut mollis, magna ut luctus facilisis, est neque iaculis lacus, fringilla lacinia est dui sed magna. Nullam ac magna non velit porttitor scelerisque ut in ipsum. Nullam tincidunt mattis enim, eu dictum dui consectetur non.</p>
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
