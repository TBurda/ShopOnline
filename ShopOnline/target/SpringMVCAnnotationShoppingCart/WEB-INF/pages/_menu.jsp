<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

    <security:authorize  access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
        <a class="btn  btn-info btn-sm" href="${pageContext.request.contextPath}/orderList">Order List</a>
    </security:authorize>

    <security:authorize  access="hasRole('ROLE_MANAGER')">
        <a class="btn  btn-info btn-sm" href="${pageContext.request.contextPath}/product">Create Product</a>
        <a class="btn  btn-info btn-sm" href="${pageContext.request.contextPath}/settings">Settings</a>

    </security:authorize>

