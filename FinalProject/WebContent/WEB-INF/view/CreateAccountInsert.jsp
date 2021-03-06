<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CreateAccountInsert.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/CreateAccountInsert.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
crossorigin="anonymous">
<style type="text/css">
   p { font-size: small; color: red; }
   #flagMsg { color: red; }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

   $(function()
   {
      // 아이디 중복 flag 변수 선언
      var idFlag1 = false;
      var idFlag2 = false;
      
      // 닉네임 중복 flag 변수 선언
      var nickFlag1 = false;
      var nickFlag2 = false;
      
      // 전화번호 중복 flag 변수 선언
      var telFlag1 = false;
      var telFlag2 = false;
      
      
      // 가입하기 버튼을 눌렀을 때!
      
      // ① 버튼이 있는 항목(아이디, 닉네임, 휴대폰번호) ↔  ② 버튼이 없는 항목(나머지)
      // 유효성검사를 다르게 진행함
      
      // ① 아이디, 닉네임, 휴대폰번호
      // flag1 : 버튼을 눌렀는지, flag2 : 버튼 누른 결과 양식에 맞는지
      // - 버튼을 눌렀을 때 : 필수항목 입력했는지, 항목 형식에 대한 검사 후 → ajax → flag2 true
      // 해당 항목 val()이 바뀔 때마다 flag1 false
      
      // 가입하기 버튼을 누르면 flag1, flag2 변수가 true인지만 검사한다
      // flag1 = false면 → "(해당항목)중복확인을 진행해주세요."
      // flag2 = false면 → "사용할 수 없는 (해당항목)입니다."
      
      
      
      // ② 나머지
      // 모든 유효성검사는 가입하기 버튼 눌렀을때 진행된다
      // 1. 필수항목 입력했는지
      // 2. 항목 형식에 대한 검사(n자 이상, 영문 숫자 어쩌구) → 1, 2번 같이 검사
      
      
      // ※ 아이디 유효성검사
      $("#id").on("change keyup paste", function()
      {
         idFlag1 = false;
      });
      
      $("#idCheckBtn").click(function()
      {
         idFlag1 = true;   // 일단 중복확인 버튼을 누르면 1번 플래그는 true
         
         var RegExp = /^[a-zA-Z0-9]{4,12}$/;
         var id = $("#id").val();
         
         if (id == "")
         {
            $("#idErrMsg").css("color", "red");
            $("#idErrMsg").html("아이디를 입력해 주세요.");
            idFlag2 = false;
            return;
         }
         
         if (!RegExp.test(id))
         {
            $("#idErrMsg").css("color", "red");
            $("#idErrMsg").html("아이디를 4~12자의 영문 대소문자와 숫자로 입력해 주세요.");
            idFlag2 = false;
            return;
         }
         
         $("#idErrMsg").css("display", "inline");   // ★ 이거 왜 있는거임?
         confirmId();   // 사용 가능한 아이디일 경우 idFlag2 = true
      });
      
      
      // ※ 닉네임 유효성검사
      $("#nickName").on("change keyup paste", function()
      {
         nickFlag1 = false;
      });
      
      $("#nickCheckBtn").click(function()
      {
         nickFlag1 = true;
         
         var ni_RegExp = /^[가-힣a-zA-Z0-9._-]{2,10}\$/;
                        // /^[가-힣a-zA-Z0-9._-] 언더스코어 뺌
         var nickName = $("#nickName").val();
         
         // value값이 없을경우
         if (nickName == "")
         {
            $("#nickErrMsg").css("color", "red");
            $("#nickErrMsg").html("닉네임을 입력해 주세요.");
            nickFlag2 = false;
            return;
         }
                        
         if (!ni_RegExp.test(nickName))
         {
            $("#nickErrMsg").css("color", "red");
            $("#nickErrMsg").html("닉네임을 2~10자로 입력해 주세요. (특수문자 제외)");
            nickFlag2 = false;
            return;
         }
         
         confirmNick(); // 사용 가능한 닉네임일 경우 nickFlag2 = true
      });
      
      
      // ※ 휴대폰 유효성검사
      $("#tel").on("change keyup paste", function()
      {
         telFlag1 = false;
      });
      
      $("#phoneCheckBtn").click(function()
      {
    	  
    	 $("#telErrMsg").html("");
         telFlag1 = true;
         
         var tel = $("#tel").val();
         
         // value값이 없을경우
         if (tel == "")
         {
            $("#telErrMsg").css("color", "red");
            $("#telErrMsg").html("휴대폰 번호를 입력해 주세요.");
            telFlag2 = false;
            return;
         }

         confirmTel(); // 사용 가능한 번호일 경우 telFlag2 = true
      });
      
      
      $("#submitBtn").click(function()
      {
         // flagMsg 초기화
         $("#flagMsg").html("");
         
         var n_RegExp = /^[가-힣]{2,10}$/; //이름 유효성검사 정규식
         var name = $("#name").val();
         if (name=="" || !n_RegExp.test(name))   // 이름 1, 2번
         {
            $("#flagMsg").html("이름을 2~10자의 한글로 입력해 주세요.");
            $("#name").focus();
            return;
         }
         
         var pw_RegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
         var pw = $("#password").val();
         if (pw=="" || !pw_RegExp.test(pw))   // 비밀번호 1, 2번
         {
            $("#flagMsg").html("비밀번호는 8~12자의 하나 이상의 문자와 숫자 및 특수문자를 포함하여 입력해 주세요.");
            $("#password").focus();
            return;
         }
         
         // ※ 비밀번호확인은 비밀번호와 같은지만 확인
         if (pw != $("#password2").val())
         {
            $("#flagMsg").html("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            $("#password2").focus();
            return;
         }
         
         var e_RegExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
         var email = $("#email").val();
         if (email=="" || !e_RegExp.test(email))   // 이메일 1, 2번
         {
            $("#flagMsg").html("이메일을 바른 형식으로 입력해 주세요.");
            $("#email").focus();
            return;
         }
         
         // 주소는 1번에 대한 검사만 함
         if ($("#roadAddr").val()=="" || $("#detailAddr").val()=="")
         {
            $("#flagMsg").html("우편번호 찾기를 통해 주소를 입력해 주세요. (상세주소 포함)");
            $("#roadAddr").focus();
            return;
         }
         
         
         
         
         // 아이디, 닉네임, 휴대폰번호 flag 검사
         if (!idFlag1)
         {
            $("#flagMsg").html("아이디 중복검사를 진행해주세요");
            return;
         }
         
         if (!nickFlag1)
         {
            $("#flagMsg").html("닉네임 중복검사를 진행해주세요");
            return;
         }
         
         if (!telFlag1)
         {
            $("#flagMsg").html("휴대폰 번호 중복검사를 진행해주세요");
            return;
         }
         
         if (!idFlag2)
         {
            $("#flagMsg").html("사용할 수 없는 아이디입니다.");
            return;
         }
         
         if (!nickFlag2)
         {
            $("#flagMsg").html("사용할 수 없는 닉네임입니다.");
            return;
         }
         
         if (!telFlag2)
         {
            $("#flagMsg").html("사용할 수 없는 휴대폰 번호입니다.");
            return;
         }
         
         
         
         $("#personalInsertForm").submit(); 
      });
      
      
      
      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      /* // 아이디 유효성검사 ID는 (4~12자의 영문 대소문자와 숫자로만 입력)
      $("#id").on("change keyup paste", function()
      {
         var RegExp = /^[a-zA-Z0-9]{4,12}$/; //id와 유효성 검사 정규식
         var id = $("#id").val();         
         
         // value값이 없을경우
         if ($("#id").val() == "")
         {
            $("#idErrMsg").html("");
            return;
         }
         
           if(!RegExp.test(id)){ //아이디 유효성검사
            $("#idErrMsg").html("4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
            $("#idErrMsg").css("color", "red");
               return;
           }
           $("#idErrMsg").html("");
      });
      
      // 이름 유효성 검사 (특수문자,영어,숫자는 사용할수 없음. 최소 2~10자 이상)
      $("#name").on("change keyup paste", function()
      {
         var n_RegExp = /^[가-힣]{2,10}$/; //이름 유효성검사 정규식
         var name = $("#name").val();   
         
         // value값이 없을경우
         if ($("#name").val() == "")
         {
            $("#nameErrMsg").html("");
            return;
         }
         
           if(!n_RegExp.test(name)){  //아이디 유효성검사
            $("#nameErrMsg").html("2~10자의 한글만 입력하여주세요.");
            $("#nameErrMsg").css("color", "red");
               return;
           }
           $("#nameErrMsg").html("");
        
      });
      
      // 닉네임 유효성 검사 (숫자, 영어, 한국어와 최소 2~10자 이상)
      $("#nickName").on("change keyup paste", function()
      {
         var ni_RegExp = /^[가-힣a-zA-Z0-9._-]{2,10}\$/;
                        // /^[가-힣a-zA-Z0-9._-] 언더스코어 뺌
         var nickName = $("#nickName").val()
         
         // value값이 없을경우
         if ($("#nickName").val() == "")
         {
            $("#nickErrMsg").html("");
            return;
         }
                        
         if (!ni_RegExp.test(nickName))
         {
            $("#nickErrMsg").html("2~10자의 숫자,영어,한국어로만 입력하여 주세요.");
            $("#nickErrMsg").css("color", "red");
            $("#nickOkMsg").html("");
            return;
         }
         
         $("#nickErrMsg").html("");
         $("#nickOkMsg").html("");
         
         confirmNick();
      });
      
      // 비밀번호 유효성 검사 (8~12자의 하나 이상의 문자와 숫자 및 특수문자를 포함)
      $("#password").on("change keyup paste", function()
      {
         var pw_RegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,12}$/;
         var pw = $("#password").val();
         
         // value값이 없을경우
         if ($("#password").val() == "")
         {
            $("#pwErrMsg").html("");
            return;
         }
         
         if (!pw_RegExp.test(pw))
         {
            $("#pwErrMsg").html("8~12자의 하나 이상의 문자와 숫자 및 특수문자를 포함하여 입력하여 주세요");
            $("#pwErrMsg").css("color", "red");
            return;
         }
         $("#pwErrMsg").html("");

      });
      
      // 이메일 유효성 검사 (이메일 형식)
      $("#email").on("change keyup paste", function()
      {      
         var e_RegExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
         var email = $("#email").val();
         
         // value값이 없을경우
         if ($("#email").val() == "")
         {
            $("#emailErrMsg").html("");
            return;
         }
         
         if (!e_RegExp.test(email))
         {
            $("#emailErrMsg").html("이메일 형식이 올바르지 않습니다.");
            $("#emailErrMsg").css("color", "red");
            return;
         }
         $("#emailErrMsg").html("");            
         


         
      });
      
      // 전화번호 유효성 검사
      $("#tel").on("change keyup paste", function()
      {
         $("#telErrMsg").html("");
         //전화번호 중복확인
         confirmTel();
         
      });
   
      
      // 아이디 중복확인 ajax
      $("#idCheckBtn").click(function()
      {
                  
         //$("#idErrMsg").html("");
         if ($("#id").val() == "")
         {
            $("#idErrMsg").css("color", "red");
            $("#idErrMsg").html("아이디를 입력해 주세요.");
            return;
         }
         
         $("#idErrMsg").css("display", "inline");
         confrimId();
         
         // 아이디 중복 버튼 클릭 확인
         idFlag = true;
         
      
      });
         
      
      // 인증번호 전송
      $("#idnBtn").click(function()
      {
         if ($("#name").val()=="" || $("#tel").val()=="")
         {
            $("#idnErrMsg").html("이름과 휴대폰번호를 입력해주세요.");
            return;
         }
         
         $("#idnNumber").removeAttr("disabled");
         $("#idnErrMsg").html("입력한 휴대폰번호로 인증번호가 발송되었습니다. 번호를 입력해주세요.");
         flagIdn = false;
      });
      
      // 인증번호 확인 (인증번호는 1234로 가정)
      $("#idnNumber").on("change keyup paste", function()
      {
         if ($("#idnNumber").val()=="1234")
         {
            $("#idnErrMsg").html("");
            $("#idnOkMsg").html("인증번호를 정확히 입력했습니다.");
            flagIdn = true;
         }
         else if ($("#idnNumber").val()!="1234")
         {
            $("#idnOkMsg").html("");
            $("#idnErrMsg").html("인증번호를 정확히 입력해주세요.");
            flagIdn = false;
         }
      });
      

      // 비밀번호 확인
      $("#password2").on("change keyup paste", function()
      {
         if ($("#password2").val() != $("#password").val())
         {
            $("#pw2ErrMsg").html("비밀번호가 일치하지 않습니다.");
         }
         else if ($("#password2").val() == $("#password").val())
         {
            $("#pw2ErrMsg").html("");
         }
      })
      
      
      
      // submit 전 유효성검사 → submit
      $("#submitBtn").click(function()
      {

         if ($("#nickErrMsg").text()!="" || $("#idnErrMsg").text()!="" || $("#pw2ErrMsg").text()!="" )
         // ①닉네임 중복일 때, ②인증번호 입력 안했는데/잘못 입력했는데,  ③비밀번호 확인 제대로 입력 안했을 때
         // 가입 못하게 막음
         {
            return;
         }
         
         $(".errMsg").html("");   // 에러 메세지 초기화
         
         if ($("#id").val()=="")
         {
            $("#idErrMsg").html("아이디를 입력해주세요.");
            $("#id").focus();
            return;
         }
         
         if ($("#name").val()=="")
         {
            $("#nameErrMsg").html("이름을 입력해주세요.");
            $("#name").focus();
            return;
         }
         
         if ($("#nickName").val()=="")
         {
            $("#nickErrMsg").html("닉네임을 입력해주세요.");
            $("#nickName").focus();
            return;
         }
         
         if ($("#password").val()=="")
         {
            $("#pwErrMsg").html("비밀번호를 입력해주세요.");
            $("#password").focus();
            return;
         }
         
         if ($("#password2").val()=="")
         {
            $("#pw2ErrMsg").html("비밀번호를 입력해주세요.");
            $("#password2").focus();
            return;
         }
         
         if ($("#email").val()=="")
         {
            $("#emailErrMsg").html("이메일을 입력해주세요.");
            $("#email").focus();
            return;
         }
         
         if ($("#tel").val()=="")
         {
            $("#telErrMsg").html("휴대폰 번호를 입력해주세요.");
            $("#tel").focus();
            return;
         }

               
         if ($("#upun").val()=="" || $("#roadAddr").val()=="" || $("#detailAddr").val()=="" || $("#dong").val()=="")
         {
            $("#addrErrMsg").html("상세주소 포함 주소를 입력해주세요.");
            $("#detailAddr").focus();
            return;
         }
         
         // 인증번호 제대로 정확히 입력 안되어있으면
         if (!flagIdn)
         {
            $("#idnOkMsg").html("");
            $("#idnErrMsg").html("인증번호를 정확히 입력해주세요.");
            return;
         }
         
         // 아이디 중복확인 클릭 안했을 경우
         if (!idFlag)
         {
            $("#idErrMsg").css("color", "red");
            $("#idErrMsg").html("아이디 중복확인이 필요합니다.");      
            $("#id").focus();
            return;   
         }
         
         $("#personalInsertForm").submit(); 
      });*/
      
      
      // 아이디 ajax함수
      function confirmId()
      {
         $.post("confirmId.action", {id : $("#id").val() }, function(data)
         {
            let result = data;
            
            if (result == 1)
            {
               $("#idErrMsg").html("사용할 수 없는 아이디입니다.");
               $("#idErrMsg").css("color", "red");
               idFlag2 = false;
            }            
            else
            {
               $("#idErrMsg").html("사용 가능한 아이디입니다.");
               $("#idErrMsg").css("color", "blue");
               idFlag2 = true;
            }
            
         });
      }
      
      // 전화번호 ajax함수
      function confirmTel()
      {
         tel = $("#tel").val();
         tel = tel.replaceAll("-","");
         
         $.post("confirmtel.action", {tel : tel}, function(data)
         {
            var result = data;
            
            if (result == 1)
            {
               $("#telErrMsg").text("이미 가입했거나, 현재 가입이 불가능한 번호입니다.");
               $("#telErrMsg").css("color", "red");
               telFlag2 = false;
               
            }
            else
            {
                $("#telErrMsg").text("가입이 가능한 번호입니다.");
                $("#telErrMsg").css("color", "blue");    
                telFlag2 = true;
            }
            
         });
      }
      
      
      // 닉네임 ajax함수
      function confirmNick()
      {
         $.post("confirmnickname.action", {nickName : $("#nickName").val()}, function(data)
         {
            var result = data;

            if (data == 1)
            {
               $("#nickErrMsg").html("사용할 수 없는 닉네임입니다.");
               $("#nickErrMsg").css("color", "red");
               nickFlag2 = false;
            }
            else
            {
               $("#nickErrMsg").html("사용 가능한 닉네임입니다.");
               $("#nickErrMsg").css("color", "blue");
               nickFlag2 = true;
            }
            
         });
      }
      
   });
   
   
   
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("dong").value = extraAddr;
                
                } else {
                    document.getElementById("dong").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('upun').value = data.zonecode;
                document.getElementById("roadAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
   
</script>



</head>
<body>

   <!-- 메뉴 영역 -->
   <div>
   <c:import url="/nav.action"></c:import>
   </div>

   <!-- 콘텐츠 영역 -->
   <div class="wrap wd668">
   <!-- <div class="container" style="width:50%; text-align: left;"> -->
        <div class="form_txtInput">
        <br>
          <h2 class="sub_tit_txt">회원가입</h2>
          <div class="exform_txt" style="margin-bottom: 30px;"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
          
          <div class="join_form">
          <form action="personalinsert.action" method="post" id="personalInsertForm">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <!-- 
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" id="id" name="id" class="id" placeholder="ID를 입력하세요."></td>
                </tr>
                <tr>
                 -->
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" class="send_number" placeholder="4~12자의 영문 대소문자와 숫자로만 입력해주세요." id="id" name="id" maxlength="12">
                      <button type="button" class="btn btn-secondary" id="idCheckBtn"><font size="2.5">중복확인</font>
                      </button>
                      <span id="idErrMsg" class="errMsg"></span>
                  </td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td><input type="text" id="name" name="name" class="name" placeholder="2~10자의 한글만 입력해주세요." maxlength="10"></td>
                </tr>
                <tr>
                   <th></th>
                   <td><span id="nameErrMsg" class="errMsg"></span></td>
                </tr>
                <!-- ★ 소연 수정 -->
                <tr>
                  <th><span>닉네임</span></th>
                  <td>
               <input type="text" class="send_number" placeholder="2~10자의 숫자,영어,한국어로만 입력해주세요." id="nickName" name="nickName" maxlength="10">
               <button type="button" class="btn btn-secondary" id="nickCheckBtn"><font size="2.5">중복확인</font>
                    </button>
                  </td>
                </tr>
                <tr>
                   <th></th>
                   <td><span id="nickErrMsg" class="errMsg"></span></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="password" id="password" name="password" class="password" placeholder="8~12자의 하나 이상의 문자와 숫자 및 특수문자를 포함하여 입력해주세요." maxlength="12"></td>
                </tr>
                <tr>
                   <th></th>
                   <td><span id="pwErrMsg" class="errMsg"></span></td>
                </tr>
                <tr>
                  <th><span>비밀번호<br>확인</span></th>
                  <td><input type="password" id="password2" class="password2" placeholder="비밀번호를 한번 더 입력해주세요." maxlength="12"></td>
                </tr>
                 <tr>
                   <th></th>
                   <td><span id="pw2ErrMsg" class="errMsg"></span></td>
                </tr>
                <tr class="email">
                  <th><span>이메일</span></th>
                  <td>
                    <input type="email" id="email" name="email" class="email" placeholder="이메일을 입력하세요.">
                  </td>
                <tr>
                   <th></th>
                   <td><span id="emailErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" id="tel" name="tel" class="send_number" placeholder="- 없이 전화번호를 입력하세요." maxlength="11"
                  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                  <button type="button" class="btn btn-secondary" id="phoneCheckBtn"><font size="2.5">중복확인</font>
                  </button>
                  </td>
                </tr>
                <tr>
                   <th></th>
                   <td><!-- <p>이미 가입했거나, 현재 가입이 불가능한 번호입니다.</p> -->
                  <span id="telErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
                  <th><span>주소</span></th>
                  <td>               
               <input type="text" id="upun" name="upun" placeholder="우편번호" readonly="readonly">
               <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
               <input type="text" id="roadAddr" name="roadAddr" placeholder="주소" readonly="readonly"><br>
               <input type="text" id="detailAddr" name="detailAddr" placeholder="상세주소">
               <input type="text" id="dong" name="dong" placeholder="참고항목" readonly="readonly"></td>
                </tr>
                <tr>
                   <th></th>
                   <td><span id="addrErrMsg" class="errMsg"></span></td>
                </tr>  
                <tr>
              </tbody>
            </table>
            </form>
            <hr />
           
          </div><!-- join_form E  -->
          <div class="text-center">
             <span id="flagMsg" class="errMsg"></span>
          </div>
          <div class="btn_wrap">
            <button type="button" class="btn btn-secondary">취소하기</button>
         <button type="button" id="submitBtn" class="btn btn-primary">가입하기</button>
          </div>
          <br>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->

</body>
</html>