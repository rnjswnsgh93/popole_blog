<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="css/jquery.bxslider.css">
  <link rel="stylesheet" href="css/header_nav_footer.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&family=Sunflower:wght@300&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
<style>
 /* 전체 wrap */
#wrap_global{
  width: 1024px;
  margin: 0 auto;
  min-height:1500px ;

}
/* 회원가입 테두리 */
.joinform{ 
  width: 580px;
  height: 850px;
  border: 0.5px solid #aaa9a9;
  margin: 0 auto;
  border-radius: 10px;
  text-align: center;
  font-size: 25px;
  color:  #7c7c7c;

  
}
/* 회원가입 안 텍스트*/
.joinAction{
 border:none; text-align: left;
  margin-left:50px; margin-bottom: 50px;

}
/* text 테두리 */
input{
 border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
}
/* input태그 위 글씨 */
.join_text{
  text-align: left
}
/* 회원가입,취소 버튼 */
.bt{
  width: 500px;
}
.joinform_img{
  display: inline;
  float:right; 
  margin-right: 10px;
}

</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
function checkValue()
		{
			if(!document.userInfo.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!document.userInfo.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			var idChecked = $('#check_hidden').val();
			if( idChecked != "yes") {
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
		}
		
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="/";
		}
		function idCheck() {
			var user_id = $('#input_userId').val();
			
			if(!user_id){
				alert("아이디를 입력하세요.");
				return false;
			}
	
			
			// ajax 용도 : 화면 갱신(reload,redirect)가 없이
			//            부분화면 갱신(통신)을 js에서 한다.
			//           예)네이버 - 실시간검색어, 실시간날씨
			
			// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
			$.ajax({
				/* url : 'http://localhost:8080/servlet3_LoginJoinDB/IdCheckAction.do?id='+ user_id, */
				url : '${pageContext.request.contextPath}/IdCheckAction?id='+ user_id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복됨, 0 = 중복안됨 : "+ data);							
					
					if (data > 0) {
						// 1 : 아이디가 중복되는 문구
						alert("아이디가 중복됩니다.");
						$('#check_hidden').val("no");
					} else {
						// 0 : 아이디가 안됨.
						alert("아이디가 사용가능합니다.");
						$('#check_hidden').val("yes");
					}
				}, 
				error : function() {
						console.log("실패");
				}
			});
		}
			
		
	</script>

</head>

<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
    <jsp:include page="navi.jsp" />

    <br>
    <br>
    <jsp:include page="top_ad.jsp" />
    <br><br>
    <p><a href="/">home</a>> 회원가입</p> 
    <br><br>
    <div class="joinform">
      <h2 style="background-color:#e7e5e2; border-radius:10px;color:#5e5e5e;"><b>회원가입</b></h2>
    <div>
      <form method="post" action="MemberJoinAction" 
      name="userInfo" onsubmit="return checkValue()" class="joinAction">
        <div><br><br>
          <h6 class="join_text">아이디<h6>
          <span><input id="input_userId" type="text" name="id" size="30">
          <input id="input_userId_check" type="button" value="중복확인" onclick="idCheck()">
           <input id="check_hidden" type="hidden"	value="no" />
          </span>
          
        </div><br>
        <div class="joinform_img">
          <img src="images/join2.jpg" style="width: 200px; height: 300px;">
        </div>
        <div>
          <h6 class="join_text">비밀번호<h6>
          <span><input type="password" name="password" size="30"></span>
        </div><br>
        <div>
          <h6 class="join_text">비밀번호 확인<h6>
          <span><input type="password" name="passwordcheck" size="30"></span>
        </div><br>
        <div>
          <h6 class="join_text">이름<h6>
          <span><input type="text" name="name" size="30"></span>
        </div><br>
        <div>
          <h6 class="join_text">생년월일<h6>
          <span><input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6"></span>
          <select name="birthmm" >
            <option value="">월</option>
            <option value="01" >1</option>
            <option value="02" >2</option>
            <option value="03" >3</option>
            <option value="04" >4</option>
            <option value="05" >5</option>
            <option value="06" >6</option>
            <option value="07" >7</option>
            <option value="08" >8</option>
            <option value="09" >9</option>
            <option value="10" >10</option>
            <option value="11" >11</option>
            <option value="12" >12</option>
          </select>
          <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
        </div><br>
        <div>
          <h6 class="join_text">이메일<h6>
          <span><input type="text" name="mail1" maxlength="50">@
						<select name="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>						
						</select></span>
        </div><br>
        <div><br>
          <span><input type="submit" value="회원가입" class="bt btn btn-secondary"></span>
        </div>
        <div>
          <span><input type="button" value="취소" onclick="goFirstForm()" class="bt btn btn-secondary"></span>
        </div><br>
       
      </form>
    
  </div>
 
  </div>
    </div>
  <footer></footer>
</body>
</html>