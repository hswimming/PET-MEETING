<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<style>
	div {
		display:block;
	}

	#sendAuthMail, btnCheckAuthCode {
		display: inline-flex;
	}

</style>

<body>
	<div>
		<label>가입시 입력한 아이디를 입력해주세요.</label>
	</div>
	<div>
		<input type="text" id="inputId">
	</div>
	<div>
		<label>가입시 입력한 이메일을 입력해주세요.</label>
	</div>
	<div>
		<input type="text" id="inputEmail">
	</div>
		<button id="sendAuthMail">인증하기</button>
	<div>
	<input type="text" id="inputAuthCode" style="display: none">
	</div>		
	<button id="btnCheckAuthCode">확인</button>		
	<div>
	<input type="text" id="inputPwd" style="display: none">
	</div>		
</body>
<script type="text/javascript" src="${ path }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(() => {
	$('#sendAuthMail').on('click', () => {
		let inputEmail = $('#inputEmail').val().trim();
		console.log(inputEmail);
				
		$.ajax({
			type: 'POST',
			url: '${ path }/sendAuthMail',
			dataType: 'json',
			data: {
				inputEmail
			},
					
			success: (obj) => {
				console.log(obj);

				if(obj.checkAuthCode != null) {
					alert("인증메일을 발송하였습니다.");
					$('#checkAuthCode_Box').show();
					
					$('#btnCheckAuthCode').on('click', () => {
						var inputAuthCode = $('#checkAuthCode').val();
						
						if(obj.checkAuthCode == inputAuthCode) {
							alert("인증에 성공하셨습니다.");
							$('#checkAuthCode').attr("readonly", true);
							$('#checkAuthCode').attr("value", true);
							$('#btnCheckAuthCode').attr("disabled", true);
						} else {
							console.log(obj.checkAuthCode);
							console.log(inputAuthCode);
							alert("인증에 실패하였습니다. 입력한 값을 다시 확인해주세요.");
							$('#checkAuthCode').attr("value", "");
						}
					});
					
				} else {
					alert("인증메일 발송에 실패하였습니다. 다시 확인해주세요.");
				}
							
			},
					
			error: (error) => {
				console.log(error);
			}
		});
	});
	});
</script>
</html>
