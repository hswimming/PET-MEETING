<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<style>
	.modal {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0, 0, 0, 0.5);
	  display: none;
	  justify-content: center;
	  align-items: center;
	}

	.modal-content {
	  background-color: white;
	  padding: 20px;
	  width: 80%;
	  max-width: 800px;
	  border-radius: 5px;
	}

	.agree-section {
	  margin-bottom: 20px;
	}
	
	.agree-section h3 {
	  margin-bottom: 10px;
	}
	
	.agree-checkbox {
	  margin-top: 10px;
	}
	
	.agree-checkbox label {
	  margin-left: 5px;
	}
	
	.modal-buttons {
	  margin-top: 20px;
	  display: flex;
	  justify-content: space-between;
	}
</style>
	<section>
		<div id="agree-modal" class="modal">
		  <div class="modal-content">
		    <h2>약관 동의</h2>
		    <p>이용 약관에 동의하시면 아래 버튼을 눌러주세요.</p>
		    <button id="agree-all">전체 동의</button>
		    <div class="agree-section">
		      <h3>서비스 이용약관</h3>
		      <textarea class="agree-text">
		      
		      
		      
		      
		      
		      
		      
		      </textarea>
		      <div class="agree-checkbox">
		        <input type="checkbox" class="agree-check" id="agree-service" name="agree-service" value="false">
		        <label for="agree-service">동의합니다.</label>
		      </div>
		    </div>
		    <div class="agree-section">
		      <h3>개인정보 처리방침</h3>
		      <textarea class="agree-text">
		      
		      
		      
		      
		      
		      </textarea>
		      <div class="agree-checkbox">
		        <input type="checkbox" class="agree-check" id="agree-privacy" name="agree-privacy" value="false">
		        <label for="agree-privacy">동의합니다.</label>
		      </div>
		    </div>
		    <div class="agree-section">
		      <h3>이메일 광고 수신 동의</h3>
		      <textarea class="agree-text">
		      
		      
		      
		      
		      </textarea>
		      <div class="agree-checkbox">
		        <input type="checkbox" class="agree-check" id="agree-email" name="agree-email" value="false">
		        <label for="agree-email">동의합니다.</label>
		      </div>
		    </div>
		    <div class="modal-buttons">
		      <button id="cancel-agree">취소</button>
		      <button id="confirm-agree">확인</button>
		    </div>
		  </div>
		</div>
	</section>

<script type="text/javascript">
	const agreeModal = document.getElementById("agree-modal");
	const agreeAllBtn = document.getElementById("agree-all");
	const agreeCheckboxes = document.querySelectorAll(".agree-check");
	const agreeTextareas = document.querySelectorAll(".agree-text");
	const cancelAgreeBtn = document.getElementById("cancel-agree");
	const confirmAgreeBtn = document.getElementById("confirm-agree");
	
	// 모달 열기
	function openAgreeModal() {
	  agreeModal.style.display = "flex";
	}
	
	// 모달 닫기
	function closeAgreeModal() {
	  agreeModal.style.display = "
</script>

<jsp:include page="/views/common/footer.jsp" /> 


