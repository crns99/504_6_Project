<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	String title = (String) request.getParameter("title");
%> 

<div class="container">
    <div class="fl">
        <h1 class="h2-title"><%= title %></h1>
    </div>
</div>

