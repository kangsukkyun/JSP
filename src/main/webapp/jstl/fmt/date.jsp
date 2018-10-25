<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="date" value="<%=new Date() %>"/>
date : ${date }<br>
format date : <fmt:formatDate value="${date }"/> <br>
format date(pattern) : <fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/> <br>
date : <fmt:formatDate value="${date }" type="date" dateStyle="full"/> <br>
date : <fmt:formatDate value="${date }" type="date" dateStyle="medium"/> <br>
date : <fmt:formatDate value="${date }" type="date" dateStyle="short"/> <br>
time : <fmt:formatDate value="${date }" type="time" /> <br>

<c:set var="parseDate" value="2018-10-25"/>
parse date : <fmt:parseDate var="dt" value="${parseDate }" pattern="yyyy-MM-dd"/>
<!-- 값이 출력되지 않고 var="dt" 에 값이 저장됨  -->
${dt }



</body>
</html>