<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
<style>
@charset "UTF-8";

#title {
    text-align: center;
    font-size: 2em;
    border: 1px solid white;
}

.join {
    text-align: right;
}

.s_wrapper {
    text-align: center;
    border: 1px solid white;
}

#walk {
    font-size: 1.2em;
    padding: 5%;
    border: 1px solid white;
}

#search-box {
    width: 250px;
    height: 25px;
}

#d-option {
    width: 50%;
    height: 50%;
    margin: 0 auto;
    padding: 5%;
    background-color: blanchedalmond;
}

.select {
    width: 100%;
    height: 30px;
}

#btn {
    width: 300px;
    height: 40px;
    font-size: 1.2em;
    margin: 0 auto;
    margin-top: 3%;
    display: block;
}
</style>

    <section>
        <div class="s_wrapper">
            <div id="walk">
                <h2>오늘은 어떤 강아지와 달려볼까요?</h2>
            </div>

           	<div style="text-align: center;">
                <button type="submit" id="search_button">산책 게시판으로 이동</button>
           	</div>
        </div>
        <br>
        <!-- 카테고리 선택 옵션 -->
        <div id="test">
            <form>
                <fieldset id="d-option">
                    <legend style="text-align: center; font-size: 1.5em;">&nbsp;같이 산책하고 싶은 친구의 유형을 선택해 주세요!&nbsp;</legend>
                <!-- 강아지 옵션 -->
                <label>크기 분류</label><br><br>
                <select name="size" id="size" class="select">
                    <optgroup label="크기 선택">
                        <option selected>----------</option>
                        <option value="small">소형</option>
                        <option value="medium">중형</option>
                        <option value="large">대형</option>
                    </optgroup>
                </select>

                <br><br>

                <label>강아지 성별</label><br><br>
                <select name="gender" id="gender" class="select">
                    <optgroup label="성별 선택">
                        <option selected>----------</option>
                        <option value="dm">수컷</option>
                        <option value="dw">암컷</option>
                    </optgroup>
                </select>
                
                <br><br>

                <label>품종</label><br><br>
                <select name="kind" id="kind" class="select">
                    <optgroup label="품종 선택">
                        <option selected>----------</option>
                        <option value="poodle">푸들</option>
                        <option value="jindo">진돗개</option>
                        <option value="maltese">미니핀</option>
                        <option value="pomeranian">포메라니안</option>
                    </optgroup>
                </select>
                
                <br><br>
                
                <label for="vaccine">예방접종 여부 (중복 선택 가능)</label><br><br>
                <input type="checkbox" name="vaccine" id="vc1">&nbsp;DHPPL 종합 백신
                <input type="checkbox" name="vaccine" id="vc2">&nbsp;코로나 장염 백신
                <input type="checkbox" name="vaccine" id="vc3">&nbsp;켄넬 코프 백신
                <input type="checkbox" name="vaccine" id="vc4">&nbsp;신종 플루 백신
                <input type="checkbox" name="vaccine" id="vc5">&nbsp;광견병 백신
                <input type="checkbox" name="vaccine" id="vn">&nbsp;미접종
                
                <br><br>
                
                <label>중성화 여부</label><br><br>
                <select name="neuter" id="neuter" class="select">
                    <optgroup label="중성화 여부 선택">
                        <option selected>----------</option>
                        <option value="ny">O</option>
                        <option value="nn">X</option>
                    </optgroup>
                </select>

                <br><br>
                
                <!-- 주인 옵션 -->
                <label>현재 거주하는 지역</label><br><br>
                <select name="area" id="area" class="select">
                    <optgroup label="현재 거주지 선택">
                        <option selected>----------</option>
                        <option value="gangnam-gu">강남구</option>
                        <option value="jongno-gu">종로구</option>
                        <option value="mapo-gu">마포구</option>
                        <option value="guro-gu">구로구</option>
                    </optgroup>
                </select>

                <br><br>
                
                <label>주인 성별</label><br><br>
                <label>
                    <input type="radio" name="gender" id="gender" checked>&nbsp;남자
                </label>
                <label>
                    <input type="radio" name="gender" id="gender">&nbsp;여자
                </label>
                </fieldset>
            </form>
        </div>
        <!-- 게시글 검색 버튼 -->
        <footer class="search-btn">
            <div>
                <button type="submit" id="btn">검색 조건으로 친구 찾기</button>
            </div>
        </footer>
    </section>
    
    <script>
		$(document).ready(() => {
			$('#search_button').on('click', () => {
				location.replace('${ path }/walkboard/list')
			});
		});
	</script>

<jsp:include page="/views/common/footer.jsp" />