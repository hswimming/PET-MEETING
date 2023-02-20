<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp" />


 <section>
    <article id="member_info">
     <hr>
     <table id="memberInfoTable">
         <tr>
             <td width="150px">
                 아이디
             </td>
             <td>
                 leenabro
             </td>
         </tr>
         <tr>
             <td>
                 이름
             </td>
             <td>
                 이정환
             </td>
         </tr>
         <tr>
             <td>
                 닉네임
             </td>
             <td>
                 이나브로
             </td>
         </tr>
         <tr>
             <td>
                 주소
             </td>
             <td>
                 서울 송파구 잠실동
             </td>
         </tr>
         <tr>
             <td>
                 핸드폰 번호
             </td>
             <td>
                 010-1234-5678
             </td>
         </tr>
         <tr>
             <td>
                 이메일
             </td>
             <td>
                 leenabro.be@gamil.com
             </td>
         </tr>
         <tr>
             <td>
                 성별
             </td>
             <td>
                 남자
             </td>
         </tr>
     </table>

     </article>
    <article id="dog_info">
        <h3>강아지 정보</h3>
        <div style="padding-left: 10%; margin-bottom: 10px;">
            <button id="btn_add">추가</button>
            <button id="btn_del">제거</button>
        </div>

        <!-- 탭 메뉴 만들기 -->
        <!-- 비동기로 수정, 저장할 수 있도록 구현 -->
        <form class="dogInfo" action="${ path }/member/update" method="post">
        	<div class="container" id="dog_infos">
            	<ul class="tabs">
                	<li class="tab-link current" id="tab_std" data-tab="tab-1">강아지</li>
                	<li class="tab-link" id="tab_title1" data-tab="tab-2">강아지</li>
	                <li class="tab-link" id="tab_title2" data-tab="tab-3">강아지</li>
                	<li class="tab-link" id="tab_title3" data-tab="tab-4">강아지</li>
                	<li class="tab-link" id="tab_title4" data-tab="tab-5">강아지</li>
                	<li class="tab-link" id="tab_title5" data-tab="tab-6">강아지</li>
            	</ul>
	            <div id="tab-1" class="tab-content current">
	                <!-- 강아지 정보 삽입 -->
	                <img src="https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png" alt="사진을 올려주세요.">
	                <div style="text-align: center; margin-top: 10px;">
	                    <button>사진 선택</button>
	                </div>
                    <div class="form-div">
                        <label for="dogName" class="form-label"><b>이름</b></label> <br>
                        <input type="text" class="form-control" name="dogName1" id="dogName" value="${ dog.name }">
                    </div>
                    <div class="form-div">
                        <label class="form-label"><b>종류</b></label><br>
                        <p>${ dog.kind }</p>
                    </div>
                    <div class="form-div">
                        <label class="form-label"><b>크기</b></label><br>
                        <p>${ dog.size }</p>
                    </div>
                    <br>
                    <div class="form-div">
                        <label class="form-label"><b>성별</b></label> <br>
                        <c:if test="${ dog.gender == 'M' }">
                        	<p>수컷</p>
                        </c:if>
                        <c:if test="${ dog.gender == 'F' }">
                        	<p>암컷</p>
                        </c:if>
                    </div>
                    <br>
                    <div>
                   	<label><b>중성화 여부</b></label> <br>
		                <c:if test="${ dog.neutered == 'Y' }">
	                      	<p>중성화 O</p>
	                    </c:if>
	                    <c:if test="${ dog.neutered == 'N' }">
	                      	<p>중성화 X</p>
	                    </c:if>
                    </div> 
                    <br>
                    <div class="form-div">
                         <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
                         <p>${ dog.vaccine }</p>
                    </div>
	        	</div>
	        </div>
	        <div style="text-align: center; margin-top: 10px">
	   			<button type="submit">수정</button>
	        </div>
      	</form>
    </article>
</section>
	
	
	<jsp:include page="/views/common/footer.jsp" /> 
	