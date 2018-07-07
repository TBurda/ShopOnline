<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

    <security:authorize  access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
        <li>
            <a href="${pageContext.request.contextPath}/orderList">
                <i class="fa fa-list"></i>
                <span>Order List</span>
            </a>
        </li>
    </security:authorize>

    <security:authorize  access="hasRole('ROLE_MANAGER')">
        <li>
            <a href="${pageContext.request.contextPath}/product">
                <i class="fa fa-archive"></i>
                <span>Create Product</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/settings">
                <i class="fa fa-gears"></i>
                <span>Settings</span>
            </a>
        </li>
    </security:authorize>

