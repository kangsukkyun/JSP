<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="length" type="java.lang.Integer" required="false" %>
<%@ attribute name="color" type="java.lang.String" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	length = length == null ? 20 : length;
%> --%>


<%-- length 속성이 없을 경우 length 기본값 20으로 표현하기 --%>


<c:set var="length" value="${length == null? 20:length }"/>


<%-- length : ${length} <br> --%>

<font color="${color}">

<c:forEach	begin="1" end="${length}">
<c:out value="="/>
</c:forEach>
logging
<c:forEach begin="1" end="${length}">
=</c:forEach>

</font>



<%-- length : 5 

=====logging=====

--%>
