<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/view.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>

</head>

<body>
    <header style="border: 1px solid;">
        <h1 style="text-align: center;">PETMEETING</h1>
    </header>
    
<script>
	$(document).ready(() => {
		$('#btnMyPage').on('click', () => {
			location.replace("${ path }/views/member/myPage.jsp");	
		});
		
		
		
	});

</script>
