<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/common/basicLib.jsp" %>
<c:set var="lang" value="${param.lang == null? 'ko' : param.lang}"/>

<script>
$(function(){
	$("#lang").val("${lang}");
	$("#lang").on("change",function(){
		$("#frm").submit();
	});	
})

</script>

<%-- <%
 	//1. lang 파라미터 받기
 	String lang = request.getParameter("lang");
 
 	//2. lang 파라미터 값이 없을 경우 ko 기본갑으로 설정
 	if(lang == null)
 		lang = "ko";
 	
 	lang = lang == null ? "ko" : lang;
 %> --%>



<%-- <script>
$(document).ready(function(){
	//select box value set
	//$("#lang").val(ja);   -->  //$("#lang").val("ja");
    $("#lang").val("<%=lang%>"); 	
})
 --%>

</script>



</head>
<body>
<%--
	1. lang 이라고 이름지어진 파라미터로 locale을 설정
	2. 만약 lang 파라미터가 없을 경우 ko를 기본값으로 사용
	
	3. select box가 변경될때 해당 언어로 페이지 재요청
	4. select box는 현재 요청된 lang 파라미터 언어값이 선택되어져 있어야 함
	   (lang 파라미터가 없을 경우 기본 값 ko)
	   
	최초접속: http://localhost:8081/jstl/fmt/selectLang.jsp
	그 이후 : select box를 변경하여 페이지 재요청   

 --%>
 
 
 <%-- lang: ${param.lang }<br> --%>
 
<form id="frm" action="selectLang.jsp" method="post">
	<select id="lang" name="lang">
		<option value="ko"> 한국어 </option>
		<option value="en"> english </option>
		<option value="ja"> 日本語  </option>
	</select>
</form>

<!-- <form id="frm" action="selectLang.jsp">
	<select id="lang" name="lang">
		<option value="ko"> 한국어 </option>
		<option value="en"> english </option>
		<option value="ja"> 日本語  </option>
	</select>
	<button type="sumbit">전송</button>
</form> -->



<fmt:setLocale value="${lang }"/>
<fmt:bundle basename="kr.or.ddit.resource.msg.msg">
	<fmt:message key="hello"></fmt:message>
	<fmt:message key="visitor">
		<fmt:param value="brown"></fmt:param>
	</fmt:message>
</fmt:bundle>

<%-- <fmt:setLocale value="<%=lang %>"/>
<fmt:bundle basename="kr.or.ddit.resource.msg.msg">
	<fmt:message key="hello"></fmt:message>
	<fmt:message key="visitor">
		<fmt:param value="brown"></fmt:param>
	</fmt:message>
</fmt:bundle>
 --%>
</body>
</html>