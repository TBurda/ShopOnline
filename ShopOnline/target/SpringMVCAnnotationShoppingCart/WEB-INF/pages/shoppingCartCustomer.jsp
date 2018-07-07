<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Enter Customer Information</title>

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
                    <strong>Customer Information</strong>
                </h1>
            </section>

            <section class="content col-md-6">


                <div class="box">

                    <form:form method="POST" modelAttribute="customerForm"
                               action="${pageContext.request.contextPath}/shoppingCartCustomer">

                        <table>
                            <tr>
                                <td><label class="col-sm-3 control-label">Name</label></td>
                                <td><form:input path="name" required="required" /></td>
                                <td><form:errors path="name" class="error-message" /></td>
                            </tr>

                            <tr>
                                <td><label class="col-sm-3 control-label">Email</label></td>
                                <td><form:input  path="email" type="email" required="required"/></td>
                                <td><form:errors path="email" cssclass="error-message" /></td>
                            </tr>

                            <tr>
                                <td><label class="col-sm-3 control-label">Phone</label></td>
                                <td><form:input path="phone" required="required"/></td>
                                <td><form:errors path="phone" class="error-message" /></td>
                            </tr>

                            <tr>
                                <td><label class="col-sm-3 control-label">Address</label></td>
                                <td><form:input path="address" required="required"/></td>
                                <td><form:errors path="address" class="error-message" /></td>
                            </tr>

                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <input type="submit" value="Submit" class="btn btn-info"/>
                                    <input type="reset" value="Reset" class="btn btn-default"/>
                                </td>
                            </tr>
                        </table>
                    </form:form>
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


