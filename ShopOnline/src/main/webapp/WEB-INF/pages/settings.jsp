<%--
  Created by IntelliJ IDEA.
  User: Adam
  Date: 7. 7. 2018
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
    <title>Settings</title>

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
    <div class="content-wrapper" style="min-height: 230px;">
        <div class="container">
            <section class="content-header">
                <h1>
                    <strong>Settings<strong>
                </h1>
                <br>
                <jsp:include page="_menu.jsp" />
            </section>

            <section class="content col-md-6">
                <div class="row">
                    <h2>
                        Product Categories
                    </h2>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label>Available Categories</label>
                            <select multiple="" class="form-control" disabled="">
                                <c:forEach items="${productCategories}" var="productCategories">
                                    <option>${productCategories.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <form:form modelAttribute="categoryForm" class="form-horizontal" method="post" enctype="multipart/form-data">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="inputCategory" class="col-lg-12 control-label">New Product Category</label>

                                    <div class="col-lg-12">
                                        <form:input path="name" type="text" class="form-control" id="inputCategory" placeholder="Category Name"/>
                                    </div>
                                </div>

                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-default">Save</button>
                            </div>
                        </form:form>
                    </div>
                </div>
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