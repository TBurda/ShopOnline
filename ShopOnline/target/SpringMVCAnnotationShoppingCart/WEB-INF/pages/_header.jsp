<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container">

            <div class="header-container">

                <div class="navbar-header">
                    <a href="${pageContext.request.contextPath}/" class="navbar-brand"><b>Shop</b>Online</a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>

                <div class="collapse navbar-collapse pull-left">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/productList">Product List</a></li>
                    </ul>
                </div>

                <div class="collapse navbar-collapse pull-right" id="navbar-collapse">

                    <ul class="nav navbar-nav">

                        <li><a href="${pageContext.request.contextPath}/shoppingCart">My Cart</a></li>

                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li><a href="${pageContext.request.contextPath}/accountInfo">${pageContext.request.userPrincipal.name} </a></li>
                            <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>

                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li><a href="${pageContext.request.contextPath}/login" id="login">Login</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>
