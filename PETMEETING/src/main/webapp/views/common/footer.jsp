<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer>
    <ul>
        <li>Copyright ©2023 Pet Meeting</li>
        <li>강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F
        </li>
    </ul>
</footer>
	
	<!-- 탭 메뉴 작동 js -->
	<script>
	$(document).ready(function() {
		// 텝 메뉴 js 파일
	    $('ul.tabs li').click(function(){
	        var tab_id = $(this).attr('data-tab');
	    
	        $('ul.tabs li').removeClass('current');
	        $('.tab-content').removeClass('current');
	    
	        $(this).addClass('current');
	        $("#"+tab_id).addClass('current');
	    })

	    let num = 1;
	    
	    $('#btn_add').click(function() {
			 if(num < 6) {
				num++;
	 			
	 			let tabContent = $('#tab-1').clone().prop('id', 'tab-' + num);
	 			
	 			$('#dog_infos').append(tabContent);
				$('#tab-'+ num).attr('class', 'tab-content');	 		
				$('#tab-'+num+' input[name=dogName1]').attr('name', 'dogName'+num);
				$('#tab-'+num+' select[name=dogKind1]').attr('name', 'dogKind'+num);
				$('#tab-'+num+' select[name=dogSize1]').attr('name', 'dogSize'+num);
				$('#tab-'+num+' input[name=dogGender1]').attr('name', 'dogGender'+num);
				$('#tab-'+num+' input[name=neutered1]').attr('name', 'neutered'+num);
				$('#tab-'+num+' input[name=vaccine1]').attr('name', 'vaccine'+num);
	 			
	 			$('#tab_title'+(num - 1)).css('display', 'inline-block');
			 } else {
	            num = 6;
	            alert('마지막 페이지입니다.')
	        }
			 
	    });
	    
	    $('#btn_del').on('click', function() {
	        
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
	<!-- <script src="main.js"></script> -->
	<%-- JavaScript Bundle with Popper --%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>