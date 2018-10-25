<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%-- jstl 사용하기위한 절차 
1. dependency 추가(이미 했음)
2. jsp 파일에서 지시자 추가(taglib : preifx. uri)
3. prefix를 이용하여 jstl 태크 사용
--%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>times tables jstl</h2>

<c:import url="timesTablesJstl.jsp">
	<c:param name="number" value="5"></c:param>
</c:import>

<h2>naver search</h2>
<c:import url="https://search.naver.com/search.naver?">
	<c:param name="query" value="html5"></c:param>
</c:import>


</body>
</html>