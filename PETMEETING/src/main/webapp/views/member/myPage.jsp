<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp" />


 <section>
    <article id="member_info">
	<hr>
    <div style="text-align: center;">
   		<h3 style="text-align: center;">사용자 정보</h3>
	    <table id="memberInfoTable" style="text-align: center;">
	        <tr>
	            <td width="150px">
	                아이디
	            </td>
	            <td id="memberId">
	                ${ loginMember.id }
	            </td>
	        </tr>
	        <tr>
	            <td>
	                이름
	            </td>
	            <td>
	                ${ loginMember.name }
	            </td>
	        </tr>
	        <tr>
	            <td>
	                닉네임
	            </td>
	            <td>
	                ${ loginMember.nickname }
	            </td>
	        </tr>
	        <tr>
	            <td>
	                주소
	            </td>
	            <td>
	                ${ loginMember.address }
	            </td>
	        </tr>
	        <tr>
	            <td>
	                핸드폰 번호
	            </td>
	            <td>
	                ${ loginMember.phone }
	            </td>
	        </tr>
	        <tr>
	            <td>
	                이메일
	            </td>
	            <td>
	                ${ loginMember.email }
	            </td>
	        </tr>
	        <tr>
	            <td>
	                성별
	            </td>
	            <td>
	                <c:if test="${ loginMember.gender == 'M' }">
		        		남자
		        	</c:if>
		        	<c:if test="${ loginMember.gender == 'F' }">
		        		여자
		        	</c:if>
	            </td>
	        </tr>
	     </table>
	     <input type="button" id="memberUpdate_btn" value="수정" style="margin-top: 10px">
    </div>
	<br>
	<hr>
    </article>
    <article id="dog_info">
        <h3 style="text-align: center;">강아지 정보</h3>

        <!-- 탭 메뉴 만들기 -->
        <!-- 비동기로 수정, 저장할 수 있도록 구현 -->
        <form class="dogInfo" method="post">
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
                    <div class="form-div">
                        <label for="dogName" class="form-label"><b>이름</b></label> <br>
                        <input type="text" class="form-control" name="dogName1" id="dogName" value="${ name }" readonly>
                    </div>
                    <div class="form-div">
                        <label class="form-label"><b>종류</b></label><br>
                        <p>${ kind }</p>
                    </div>
                    <div class="form-div">
                        <label class="form-label"><b>크기</b></label><br>
                        <p>${ size }</p>
                    </div>
                    <br>
                    <div class="form-div">
                        <label class="form-label"><b>성별</b></label> <br>
                        <c:if test="${ gender == 'M' }">
                        	<p>남자 아이</p>
                        </c:if>
                        <c:if test="${ gender == 'F' }">
                        	<p>여자 아이</p>
                        </c:if>
                    </div>
                    <br>
                    <div>
                   	<label><b>중성화 여부</b></label> <br>
		                <c:if test="${ neutered == 'Y' }">
	                      	<p>중성화 한 친구</p>
	                    </c:if>
	                    <c:if test="${ neutered == 'N' }">
	                      	<p>중성화 하지 않은 친구</p>
	                    </c:if>
                    </div> 
                    <br>
                    <div class="form-div">
                         <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
                         <p>${ vaccine }</p>
                    </div>
	        	</div>
	        </div>
      	</form>
	        <div style="text-align: center; margin-top: 10px">
	   			<input type="button" id="dogUpdate_btn" value="추가">
	   			<input type="button" id="dogDelete_btn" value="삭제">
	        </div>
    </article>
</section>

<script>
	$(document).ready(() => {
		
		$('#memberUpdate_btn').on('click', () => {
			location.replace('${ path }/views/member/update.jsp');
			
			if($('#tab-1 input[name=dogName1]').val() === null) {
					 		
				$('#tab-1 input[name=dogName1]').attr('name', 'dogName11');
				$('#tab-1 select[name=dogKind1]').attr('name', 'dogKind1');
				$('#tab-1 select[name=dogSize1]').attr('name', 'dogSize1');
				$('#tab-1 input[name=dogGender1]').attr('name', 'dogGender1');
				$('#tab-1 input[name=neutered1]').attr('name', 'neutered1');
				$('#tab-1 input[name=vaccine1]').attr('name', 'vaccine1');
	 			
	 			$('#tab_title'+(num - 1)).css('display', 'inline-block');
			 } else {
				let num = 2;
		 		let tabContent = $('#tab-1').clone().prop('id', 'tab-' + num);
		 			
		 		$('#dog_infos').append(tabContent);
				$('#tab-'+num).attr('class', 'tab-content');
				
		 		
				while($('#tab-1 input[name=dogName1]')) {
					
				}
				
				$('#tab-'+num+' input[name=dogName1]').attr('name', 'dogName'+num);
				$('#tab-'+num+' select[name=dogKind1]').attr('name', 'dogKind'+num);
				$('#tab-'+num+' select[name=dogSize1]').attr('name', 'dogSize'+num);
				$('#tab-'+num+' input[name=dogGender1]').attr('name', 'dogGender'+num);
				$('#tab-'+num+' input[name=neutered1]').attr('name', 'neutered'+num);
				$('#tab-'+num+' input[name=vaccine1]').attr('name', 'vaccine'+num);
				
				num++;
	            num = 6;
	            alert('마지막 페이지입니다.')
	        }
			
			
		});
		
		$('#dogUpdate_btn').on('click', () => {
			location.replace('${ path }/views/member/dogUpdate.jsp');
		});
		
		// 텝 메뉴 js 파일
	    $('ul.tabs li').click(function(){
	        var tab_id = $(this).attr('data-tab');
	    
	        $('ul.tabs li').removeClass('current');
	        $('.tab-content').removeClass('current');
	    
	        $(this).addClass('current');
	        $("#"+tab_id).addClass('current');
	    })

	    
	    
	    $('#dogUpdate_btn').click(function() {
			 
			 
	    });
	    
	    $('#dogDelete_btn').on('click', function() {
	         
	         if(num > 1) {
		  	 $('div#tab-'+(num)).remove()
	         $('#tab_title' + (num-1)).css('display', 'none');
	         num--;
	        
	         } else {
	             alert('더 이상 제거 할 수 없습니다.')
	             num = 1;
	         }

	    });
	
	});

</script>	

<jsp:include page="/views/common/footer.jsp" /> 
	