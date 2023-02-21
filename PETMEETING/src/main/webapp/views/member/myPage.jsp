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
                            <input type="text" class="form-control" id="dogName">
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>종류</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="골든리트리버">골든리트리버</option><option value="닥스훈트">닥스훈트</option><option value="도베르만핀셔">도베르만핀셔</option><option value="래브라도 리트리버">래브라도 리트리버</option><option value="몰티즈">몰티즈</option><option value="미니어처 슈나우저">미니어처 슈나우저</option><option value="미니어처 푸들">미니어처 푸들</option>
                                <option value="미니어처 핀셔">미니어처 핀셔</option><option value="">버니즈마운틴도그</option><option value="">베들링턴 테리어</option><option value="">보더 콜리</option><option value="">보스턴 테리어</option><option value="">비글</option><option value="">비숑 프리제</option><option value="">사모예드</option>
                                <option value="">살루키</option><option value="">셰블랜드 쉽독</option><option value="">스탠더드 푸들</option><option value="">시바 이누</option><option value="">시베리안 허스키</option><option value="">시츄</option><option value="">아메리칸 코카 스파니엘</option><option value="">알레스칸맬러뮤트</option>
                                <option value="">요크셔 테리어</option><option value="">웰시 코기</option><option value="">이탈리안 그레이하운드</option><option value="">제페니스 스피츠</option><option value="">진돗개</option><option value="">치와와</option><option value="">카바리에 킹찰스 스파니</option><option value="">코커 스패니얼</option>
                                <option value="">토이 푸들</option><option value="">파피용</option><option value="">퍼그</option><option value="">페키니즈</option><option value="">펨브록 웰시 코기</option><option value="">포메라니안</option><option value="">푸들</option><option value="">풍산개</option>
                                <option value="">프렌치 불도그</option><option value="">믹스견</option><option value="">기타</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>크기</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="대형견">대형견</option>
                                <option value="중형견">중형견</option>
                                <option value="소형견">소형견</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>성별</b></label>
                            <label class="gender">
                                <input type="radio" id="male" name="gender" value="M" checked> 남자
                            </label>
                            <label class="gender">
                                <input type="radio" id="female" name="gender" value="F">여자
                            </label>

                        </div>
                        <div class="form-div">
	                            <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
	                            <table>
	                                <tr>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 종합백신(DHPPL)
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 코로나백신(Corona Virus)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 캔넬코프(Kennel Cough)
	                                        </label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <label> 
	                                            <input type="checkbox" name="vaccine" value=""> 인플루엔자(신종플루)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 광견병
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 접종 안함
	                                        </label>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                </div>
	                <div id="tab-2" class="tab-content">
	                    <img src="https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png">
	                    <div style="text-align: center; margin-top: 10px;">
	                        <button>사진 선택</button>
	                    </div>
                        <div class="form-div">
                            <label for="dogName" class="form-label"><b>이름</b></label> <br>
                            <input type="text" class="form-control" id="dogName">
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>종류</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="골든리트리버">골든리트리버</option><option value="닥스훈트">닥스훈트</option><option value="도베르만핀셔">도베르만핀셔</option><option value="래브라도 리트리버">래브라도 리트리버</option><option value="몰티즈">몰티즈</option><option value="미니어처 슈나우저">미니어처 슈나우저</option><option value="미니어처 푸들">미니어처 푸들</option>
                                <option value="미니어처 핀셔">미니어처 핀셔</option><option value="">버니즈마운틴도그</option><option value="">베들링턴 테리어</option><option value="">보더 콜리</option><option value="">보스턴 테리어</option><option value="">비글</option><option value="">비숑 프리제</option><option value="">사모예드</option>
                                <option value="">살루키</option><option value="">셰블랜드 쉽독</option><option value="">스탠더드 푸들</option><option value="">시바 이누</option><option value="">시베리안 허스키</option><option value="">시츄</option><option value="">아메리칸 코카 스파니엘</option><option value="">알레스칸맬러뮤트</option>
                                <option value="">요크셔 테리어</option><option value="">웰시 코기</option><option value="">이탈리안 그레이하운드</option><option value="">제페니스 스피츠</option><option value="">진돗개</option><option value="">치와와</option><option value="">카바리에 킹찰스 스파니</option><option value="">코커 스패니얼</option>
                                <option value="">토이 푸들</option><option value="">파피용</option><option value="">퍼그</option><option value="">페키니즈</option><option value="">펨브록 웰시 코기</option><option value="">포메라니안</option><option value="">푸들</option><option value="">풍산개</option>
                                <option value="">프렌치 불도그</option><option value="">믹스견</option><option value="">기타</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>크기</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="대형견">대형견</option>
                                <option value="중형견">중형견</option>
                                <option value="소형견">소형견</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>성별</b></label>
                            <label class="gender">
                                <input type="radio" id="male" name="gender" value="M" checked> 남자
                            </label>
                            <label class="gender">
                                <input type="radio" id="female" name="gender" value="F">여자
                            </label>

                        </div>
                        <div class="form-div">
	                            <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
	                            <table>
	                                <tr>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 종합백신(DHPPL)
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 코로나백신(Corona Virus)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 캔넬코프(Kennel Cough)
	                                        </label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <label> 
	                                            <input type="checkbox" name="vaccine" value=""> 인플루엔자(신종플루)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 광견병
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 접종 안함
	                                        </label>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                </div>
	                <div id="tab-3" class="tab-content">
	                    <img src="https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png">
	                    <div style="text-align: center; margin-top: 10px;">
	                        <button>사진 선택</button>
	                    </div>
                        <div class="form-div">
                            <label for="dogName" class="form-label"><b>이름</b></label> <br>
                            <input type="text" class="form-control" id="dogName">
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>종류</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="골든리트리버">골든리트리버</option><option value="닥스훈트">닥스훈트</option><option value="도베르만핀셔">도베르만핀셔</option><option value="래브라도 리트리버">래브라도 리트리버</option><option value="몰티즈">몰티즈</option><option value="미니어처 슈나우저">미니어처 슈나우저</option><option value="미니어처 푸들">미니어처 푸들</option>
                                <option value="미니어처 핀셔">미니어처 핀셔</option><option value="">버니즈마운틴도그</option><option value="">베들링턴 테리어</option><option value="">보더 콜리</option><option value="">보스턴 테리어</option><option value="">비글</option><option value="">비숑 프리제</option><option value="">사모예드</option>
                                <option value="">살루키</option><option value="">셰블랜드 쉽독</option><option value="">스탠더드 푸들</option><option value="">시바 이누</option><option value="">시베리안 허스키</option><option value="">시츄</option><option value="">아메리칸 코카 스파니엘</option><option value="">알레스칸맬러뮤트</option>
                                <option value="">요크셔 테리어</option><option value="">웰시 코기</option><option value="">이탈리안 그레이하운드</option><option value="">제페니스 스피츠</option><option value="">진돗개</option><option value="">치와와</option><option value="">카바리에 킹찰스 스파니</option><option value="">코커 스패니얼</option>
                                <option value="">토이 푸들</option><option value="">파피용</option><option value="">퍼그</option><option value="">페키니즈</option><option value="">펨브록 웰시 코기</option><option value="">포메라니안</option><option value="">푸들</option><option value="">풍산개</option>
                                <option value="">프렌치 불도그</option><option value="">믹스견</option><option value="">기타</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>크기</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="대형견">대형견</option>
                                <option value="중형견">중형견</option>
                                <option value="소형견">소형견</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>성별</b></label>
                            <label class="gender">
                                <input type="radio" id="male" name="gender" value="M" checked> 남자
                            </label>
                            <label class="gender">
                                <input type="radio" id="female" name="gender" value="F">여자
                            </label>

                        </div>
                        <div class="form-div">
	                            <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
	                            <table>
	                                <tr>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 종합백신(DHPPL)
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 코로나백신(Corona Virus)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 캔넬코프(Kennel Cough)
	                                        </label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <label> 
	                                            <input type="checkbox" name="vaccine" value=""> 인플루엔자(신종플루)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 광견병
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 접종 안함
	                                        </label>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                </div>
	                <div id="tab-4" class="tab-content">
	                    <img src="https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png">
	                    <div style="text-align: center; margin-top: 10px;">
	                        <button>사진 선택</button>
	                    </div>
                        <div class="form-div">
                            <label for="dogName" class="form-label"><b>이름</b></label> <br>
                            <input type="text" class="form-control" id="dogName">
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>종류</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="골든리트리버">골든리트리버</option><option value="닥스훈트">닥스훈트</option><option value="도베르만핀셔">도베르만핀셔</option><option value="래브라도 리트리버">래브라도 리트리버</option><option value="몰티즈">몰티즈</option><option value="미니어처 슈나우저">미니어처 슈나우저</option><option value="미니어처 푸들">미니어처 푸들</option>
                                <option value="미니어처 핀셔">미니어처 핀셔</option><option value="">버니즈마운틴도그</option><option value="">베들링턴 테리어</option><option value="">보더 콜리</option><option value="">보스턴 테리어</option><option value="">비글</option><option value="">비숑 프리제</option><option value="">사모예드</option>
                                <option value="">살루키</option><option value="">셰블랜드 쉽독</option><option value="">스탠더드 푸들</option><option value="">시바 이누</option><option value="">시베리안 허스키</option><option value="">시츄</option><option value="">아메리칸 코카 스파니엘</option><option value="">알레스칸맬러뮤트</option>
                                <option value="">요크셔 테리어</option><option value="">웰시 코기</option><option value="">이탈리안 그레이하운드</option><option value="">제페니스 스피츠</option><option value="">진돗개</option><option value="">치와와</option><option value="">카바리에 킹찰스 스파니</option><option value="">코커 스패니얼</option>
                                <option value="">토이 푸들</option><option value="">파피용</option><option value="">퍼그</option><option value="">페키니즈</option><option value="">펨브록 웰시 코기</option><option value="">포메라니안</option><option value="">푸들</option><option value="">풍산개</option>
                                <option value="">프렌치 불도그</option><option value="">믹스견</option><option value="">기타</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>크기</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="대형견">대형견</option>
                                <option value="중형견">중형견</option>
                                <option value="소형견">소형견</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>성별</b></label>
                            <label class="gender">
                                <input type="radio" id="male" name="gender" value="M" checked> 남자
                            </label>
                            <label class="gender">
                                <input type="radio" id="female" name="gender" value="F">여자
                            </label>

                        </div>
                        <div class="form-div">
	                            <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
	                            <table>
	                                <tr>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 종합백신(DHPPL)
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 코로나백신(Corona Virus)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 캔넬코프(Kennel Cough)
	                                        </label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <label> 
	                                            <input type="checkbox" name="vaccine" value=""> 인플루엔자(신종플루)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 광견병
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 접종 안함
	                                        </label>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                </div>
	                <div id="tab-5" class="tab-content">
	                    <img src="https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png">
	                    <div style="text-align: center; margin-top: 10px;">
	                        <button>사진 선택</button>
	                    </div>
                        <div class="form-div">
                            <label for="dogName" class="form-label"><b>이름</b></label> <br>
                            <input type="text" class="form-control" id="dogName">
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>종류</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="골든리트리버">골든리트리버</option><option value="닥스훈트">닥스훈트</option><option value="도베르만핀셔">도베르만핀셔</option><option value="래브라도 리트리버">래브라도 리트리버</option><option value="몰티즈">몰티즈</option><option value="미니어처 슈나우저">미니어처 슈나우저</option><option value="미니어처 푸들">미니어처 푸들</option>
                                <option value="미니어처 핀셔">미니어처 핀셔</option><option value="">버니즈마운틴도그</option><option value="">베들링턴 테리어</option><option value="">보더 콜리</option><option value="">보스턴 테리어</option><option value="">비글</option><option value="">비숑 프리제</option><option value="">사모예드</option>
                                <option value="">살루키</option><option value="">셰블랜드 쉽독</option><option value="">스탠더드 푸들</option><option value="">시바 이누</option><option value="">시베리안 허스키</option><option value="">시츄</option><option value="">아메리칸 코카 스파니엘</option><option value="">알레스칸맬러뮤트</option>
                                <option value="">요크셔 테리어</option><option value="">웰시 코기</option><option value="">이탈리안 그레이하운드</option><option value="">제페니스 스피츠</option><option value="">진돗개</option><option value="">치와와</option><option value="">카바리에 킹찰스 스파니</option><option value="">코커 스패니얼</option>
                                <option value="">토이 푸들</option><option value="">파피용</option><option value="">퍼그</option><option value="">페키니즈</option><option value="">펨브록 웰시 코기</option><option value="">포메라니안</option><option value="">푸들</option><option value="">풍산개</option>
                                <option value="">프렌치 불도그</option><option value="">믹스견</option><option value="">기타</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>크기</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="대형견">대형견</option>
                                <option value="중형견">중형견</option>
                                <option value="소형견">소형견</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>성별</b></label>
                            <label class="gender">
                                <input type="radio" id="male" name="gender" value="M" checked> 남자
                            </label>
                            <label class="gender">
                                <input type="radio" id="female" name="gender" value="F">여자
                            </label>

                        </div>
                        <div class="form-div">
	                            <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
	                            <table>
	                                <tr>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 종합백신(DHPPL)
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 코로나백신(Corona Virus)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 캔넬코프(Kennel Cough)
	                                        </label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <label> 
	                                            <input type="checkbox" name="vaccine" value=""> 인플루엔자(신종플루)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 광견병
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 접종 안함
	                                        </label>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                </div>
	                <div id="tab-6" class="tab-content">
	                    <img src="https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png">
	                    <div style="text-align: center; margin-top: 10px;">
	                        <button>사진 선택</button>
	                    </div>
                        <div class="form-div">
                            <label for="dogName" class="form-label"><b>이름</b></label> <br>
                            <input type="text" class="form-control" id="dogName">
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>종류</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="골든리트리버">골든리트리버</option><option value="닥스훈트">닥스훈트</option><option value="도베르만핀셔">도베르만핀셔</option><option value="래브라도 리트리버">래브라도 리트리버</option><option value="몰티즈">몰티즈</option><option value="미니어처 슈나우저">미니어처 슈나우저</option><option value="미니어처 푸들">미니어처 푸들</option>
                                <option value="미니어처 핀셔">미니어처 핀셔</option><option value="">버니즈마운틴도그</option><option value="">베들링턴 테리어</option><option value="">보더 콜리</option><option value="">보스턴 테리어</option><option value="">비글</option><option value="">비숑 프리제</option><option value="">사모예드</option>
                                <option value="">살루키</option><option value="">셰블랜드 쉽독</option><option value="">스탠더드 푸들</option><option value="">시바 이누</option><option value="">시베리안 허스키</option><option value="">시츄</option><option value="">아메리칸 코카 스파니엘</option><option value="">알레스칸맬러뮤트</option>
                                <option value="">요크셔 테리어</option><option value="">웰시 코기</option><option value="">이탈리안 그레이하운드</option><option value="">제페니스 스피츠</option><option value="">진돗개</option><option value="">치와와</option><option value="">카바리에 킹찰스 스파니</option><option value="">코커 스패니얼</option>
                                <option value="">토이 푸들</option><option value="">파피용</option><option value="">퍼그</option><option value="">페키니즈</option><option value="">펨브록 웰시 코기</option><option value="">포메라니안</option><option value="">푸들</option><option value="">풍산개</option>
                                <option value="">프렌치 불도그</option><option value="">믹스견</option><option value="">기타</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>크기</b></label><br>
                            <select>
                                <option autofocus>----------------</option>
                                <option value="대형견">대형견</option>
                                <option value="중형견">중형견</option>
                                <option value="소형견">소형견</option>
                            </select>
                        </div>
                        <div class="form-div">
                            <label class="form-label"><b>성별</b></label>
                            <label class="gender">
                                <input type="radio" id="male" name="gender" value="M" checked> 남자
                            </label>
                            <label class="gender">
                                <input type="radio" id="female" name="gender" value="F">여자
                            </label>

                        </div>
                        <div class="form-div">
	                            <label class="form-label"><b>예방 접종 여부(접종한 항목을 체크하세요.)</b></label> <br>
	                            <table>
	                                <tr>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 종합백신(DHPPL)
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 코로나백신(Corona Virus)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 캔넬코프(Kennel Cough)
	                                        </label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        <label> 
	                                            <input type="checkbox" name="vaccine" value=""> 인플루엔자(신종플루)
	                                        </label>
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 광견병
	                                        </label> 
	                                    </td>
	                                    <td>
	                                        <label>
	                                            <input type="checkbox" name="vaccine" value=""> 접종 안함
	                                        </label>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                </div>
	            </div>
	            <div style="text-align: center; margin-top: 10px">
		        <button type="submit">수정</button>
	            </div>
           	</form>
        </article>
    </section>
	
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

	        $('#tab_title' + (num++)).css('display', 'inline-block');

	        if(num > 6) {
	            num = 5;
	            alert('마지막 페이지입니다.')
	        }

	    });
	    
	    $('#btn_del').on('click', function() {
	        
	        $('#tab_title' + (num)).css('display', 'none');

	        num--;

	        if(num < 0) {
	            alert('더 이상 제거 할 수 없습니다.')
	            num = 1;
	        }

	        // 데이터 삭제하는 쿼리문 짜기

	    });

	});
	</script>
	
	<jsp:include page="/views/common/footer.jsp" /> 
	