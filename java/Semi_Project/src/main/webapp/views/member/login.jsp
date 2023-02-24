<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<style>
    #container {
         margin-top: 5%; 
         margin-right: 65px;  
    }
    
    .btn_login {
        display: inline-block;
        top: 70px;
        width: 320px;
        height: 40px;
        border-radius: 6px;
        border: solid 1px rgba(0, 0, 0, .15);
        background-color: #03c75a;
        box-sizing: border-box;
    }

    
    div #wrap.wrap {
        letter-spacing: -.5px;
    }
    
	div { 
       display: block;
    } 
    
    .login_wrap {
        box-sizing: border-box;
        width: 400px;
        margin: 0 auto;
    }
    
    .find_wrap {
        padding: 20px 0 20px;
        list-style: none;
        display: inline-flex;
	}

    .find_text {
        font-size: 14px;
        line-height: 17px;
        text-decoration: none;
        font: bolder;
        color: black;
        
    }
    
    .input_text {
    	width: 80%;
        border: solid 1px;
        border-radius: 6px;
    }
    
    #login_text {
    margin-top: 30px;
    }

</style>
    <section>
            <h1 id="login_text" style="text-align: center;">Login</h1>
        <div id="container" class="container">
            <div class="content">
                <div class="login_wrap">
                    <form action="${ path }/member/login" method="POST">
                        <div>
                            <input type="text" id="id" name="id" class="input_text" placeholder="아이디" maxlength="16">
                        </div>
                        <br>
                        <div>
                            <input type="password" id="password" name="password" class="input_text" placeholder="비밀번호" maxlength="16">
                        </div>
                        <br>
                        <div class="btn_login_wrap"> 
                            <button type="submit" class="btn_login" id="btn_login">
                                <span class="btn_login_text">로그인</span>
                            </button>
                        </div>
                        <br>
                        <div>
                            <label for="saveid">
                                <input type="checkbox" id="saveid" name="saveid" class="input_save">
                                <span style="font-size: small;">아이디 저장</span>
                            </label>
                        </div>
                    </form>
                    
                    <ul class="find_wrap" id="find_wrap">
                        <li><a href="${ path }/member/findid" class="find_text">아이디 찾기</a></li>
                        <li><a href="${ path }/member/findpwd" class="find_text" style="padding: 50px;">비밀번호 찾기</a></li>
                        <li><a href="${ path }/member/signup" class="find_text">회원가입</a></li>
                    </div>
                    </ul>
            </div>
        </div>
    </section>
<script type="text/javascript">
	$(document).ready(() => {
		$('#saveid').on('click', () => {
			var svid = $('')
		});
		
	});
	
</script>


<jsp:include page="/views/common/footer.jsp" /> 