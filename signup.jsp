<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<style>
    body {
        font-family: '돋움';
    }

    div {
        display: block;
        margin-top: 10px;
    }

    label {
        cursor: pointer;
    }
    
    #container {
    	margin-top: 50px;
    }

    .box {
        display: block;
        position: relative;
        width: 40%;
        height: 51px;
        border: solid 1px #dadada;
        /* border: none; */
        padding: 10px 110px 10px 14px;
        vertical-align: top;
        padding-right: 14px;
        box-sizing: border-box;
    }

    .info {
        display: block;
        position: relative;
        width: 100%;
        height: 29px;
        padding-right: 25px;
        line-height: 29px;
        border: none;
        font-size: 15px;
        box-sizing: border-box;
        z-index: 10;
    }

    .signup_content {
        padding-left: 35%;
    }

    .infotitle {
        font-size: medium;
        font-family: ;
    }

	.box {
		border: solid 1px;
		border-radius: 5px;
	}

	.selectbtn{
        display: inline-block;
        top: 70px;
        width: 195px;
        height: 40px;
        border-radius: 6px;
        border: solid 1px rgba(0, 0, 0, .15);
        background-color: #03c75a;
        box-sizing: border-box;
	}
	
	.btntext {
		color: white;
	}
	
	.btncontaint {
		text-decoration: none;
	}
	
	#findAddress, #checkDuplicate {
		border: solid 1px rgba(0, 0, 0, .15);
		border-radius: 5px;
		background-color: silver;
		text-decoration: none;
		display: inline-block;
		box-sizing: border-box;
	}
	
	#getAddress, #getId , #getEmail{
		display: inline-flex;
		width: 100%;
	}

</style>

<section>

    <div id="container" >
    <h1 style="text-align: center;">회원가입</h1>
        <form action="${ path }/member/signup" id="signup_form" method="POST">
            <div id="content">
                <div class="signup_content">
                    <div class="">
                            <h3 class="infotitle">
                                <label for="getid">아이디</label>
                            </h3>
                        <div id="getId">
                            <span class="box" id="idbox" name="idbox">
                                <input type="text" id="id" name="id" class="info" maxlength="16" required>
                            </span>
                            	<input type="button" id="checkDuplicate" value="중복 검사" >
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getpwd">비밀번호</label>
                            </h3>
                            <span class="box">
                                <input type="password" id="password" name="password" class="info" maxlength="16" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getpwd2">비밀번호 확인</label>
                            </h3>
                            <span class="box"> 
                                <input type="password" id="ckpassword" name="ckpassword" class="info" maxlength="16" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getname">이름</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="name" name="name" class="info" maxlength="16" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getnickname">닉네임</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="nickname" name="nickname" class="info" maxlength="8" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getphone">전화번호</label>
                            </h3>
                            <span class="box">
                                <input type="tel" id="phone" name="phone" class="info" maxlength="12" required>
                            </span>
                        </div>
                            <h3 class="infotitle">
                                <label for="getaddress">주소</label>
                            </h3>
                        <div id="getAddress">
                            <span class="box">
                                <input type="text" id="address" name="address" class="info" maxlength="50" required>
                            </span>
                        <input id="findAddress" type="button" value="주소 찾기" onclick="popup();" />
                        </div>
                            <h3 class="infotitle">
                                <label for="getemail">이메일</label>
                            </h3>
                        <div id="getEmail">
                            <span class="box">
                                <input type="email" id="email" name="email" class="info" maxlength="40" required>
                            </span>
                            <input type="button" id="checkDuplicate" value="중복검사" >
                            <input type="button" id="checkDuplicate" value="중복검사" >
                            
                            
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getbirth">생년월일</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="birth" name="birth" class="info" maxlength="8" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getgender">성별</label>
                            </h3>
                                <label for="male">남</label>
                                <input type="radio" id="male" name="gender" value="M" required>
                                <label for="female">녀</label>
                                <input type="radio" id="female" name="gender" value="F" required>
                        </div>
                        
                    	</div>
                    	<div class="btncontainer">
			            <button type="submit" id="signup" class="selectbtn">
			            <span class="btntext">가입하기</span>
			            </button>
			            <button id="cancel" class="selectbtn"
			            onclick="location.href='${ path }/'">
			            <span class="btntext">취소</span>
			            </button>
                    	</div>
                </div>
            </div>
        </form>
    </div>
</section>
<script type="text/javascript">
	function popup() { 
		
		window.open("${ path }/views/member/jusopopup.jsp","pop","width=400,height=450,scrollbars=yes,resizable=yes"); 
		}
	
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPare2,engAddr,JibunAddr,zipNo) {
		
		document.getElementById("address").value = roadFullAddr;
		
	}

	
	
	
	
function checkId(event) {
    if(idbox) return true;

    var id = $("#id").val();
    var oMsg = $("#idMsg");
    var oInput = $("#id");

    if ( id == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        setFocusToInputObject(oInput);
        return false;
    }

    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    if (!isID.test(id)) {
        showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
        setFocusToInputObject(oInput);
        return false;
    }

    idFlag = false;
    var key = $("#token_sjoin").val();
            
    $.ajax({
        type:"GET",
        url: "/user2/joinAjax?m=checkId&id=" + id + "&key=" + key,
        success : function(data) {
            var result = data.substr(4);

            if (result == "Y") {
                if (event == "first") {
                    showSuccessMsg(oMsg, "멋진 아이디네요!");
                } else {
                    hideMsg(oMsg);
                }
                idFlag = true;
            } else {
                showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
                setFocusToInputObject(oInput);
            }
        }
    });
    return true;
    
    function isCellPhone(p) {
        var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
        return regPhone.test(p);
    }
}
	
	
	
function checkName() {
    var oMsg = $("#nameMsg");
    var nonchar = /[^가-힣a-zA-Z0-9]/gi;

    var name = $("#name").val();
    var oInput = $("#name");
    if (name == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        setFocusToInputObject(oInput);
        return false;
    }
    if (name != "" && nonchar.test(name)) {
        showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
        setFocusToInputObject(oInput);
        return false;
    }

    hideMsg(oMsg);
    return true;
}
	
function checkEmail() {
    var id = $("#id").val();
    var email = $("#email").val();
    var oMsg = $("#emailMsg");

    if (email == "") {
        hideMsg(oMsg);
        return true;
    }

    var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var isHan = /[ㄱ-ㅎ가-힣]/g;
    if (!isEmail.test(email) || isHan.test(email)) {
        showErrorMsg(oMsg,"이메일 주소를 다시 확인해주세요.");
        return false;
    }
    if (email == id + "@naver.com") {
        showErrorMsg(oMsg,"가입중인 아이디는 사용하실 수 없습니다.");
        return false;
    }

    hideMsg(oMsg);
    return true;
}
	
	
$(document).ready(() => {
	$('#checkDuplicate').on('click', () => {
		let userId = $('#id').val().trim();
		
		$.ajax({
			type: 'POST',
			url: '${ path }/member/idCheck',
			dataType: 'json',
			data: {
				userId
			},
			success: (obj) => {
				console.log(obj);
				
				if(obj.duplicate) {
					alert("이미 사용중인 아이디 입니다.");
				} else {
					alert("사용 가능한 아이디 입니다.");
				}
			},
			error: (error) => {
				console.log(error);	
			}
		});
	});
});
	
	
	
	
	
	
	
	
	
	
	
	
</script>

<jsp:include page="/views/common/footer.jsp" /> 