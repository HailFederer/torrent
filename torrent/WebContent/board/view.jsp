<%@page import="com.board.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script> /* daum API */
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; 
                var extraAddr = '';              
                if (data.userSelectedType === 'R') { 
                    fullAddr = data.roadAddress;
                } else { 
                    fullAddr = data.jibunAddress;
                }            
                if(data.userSelectedType === 'R'){              
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }              
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }                
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                } 
                document.getElementById('sample6_postcode').value = data.zonecode; 
                document.getElementById('sample6_address').value = fullAddr;        
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

<script type="text/javascript" src="<%=cp %>/member/js/util.js"></script>

<script type="text/javascript">

	function sendIt(){
			
		var f = document.myForm1;
		
 		str = f.userId.value;
		str = str.trim();
		if(!str){
			alert("아이디를 입력하세요!");
			f.userId.focus();
			return;	
		}
		f.userId.value = str;
		
 		str = f.userPwd.value;
		str = str.trim();
		if(!str){
			alert("비밀번호를 입력하세요!");
			f.userPwd.focus();
			return;	
		}
		f.userPwd.value = str;
				
		if(f.userPwd.value!=f.userPwd2.value){
			alert("비밀번호를 정확하게 입력하세요!");
			f.userPwd2.focus();
			return;	
		} 
				        
 		str = f.userName.value;
		str = str.trim();
		if(!str){
			alert("이름을 입력하세요!");
			f.userName.focus();
			return;	
		}
		f.userName.value = str;
		
        if(!isValidKorean(str))  {
            alert("이름을 정확하게 입력하세요!");
            f.userName.focus();
            return;
        } 
        
		str = f.userTel.value;
		str = str.trim();
		if(!str){
			alert("전화번호를 입력하세요!");
			f.userTel.focus();
			return;	
		}
		f.userTel.value = str;
	        
	    year = f.year.value;
        month= f.month.value;
        day	 = f.day.value;
        if(!isValidDate(year,month,day)){
            alert("생년월일을 정확하게 입력하세요!");
            f.year.focus();
            return;
        }
        str = year+"-"+month+"-"+day;
        f.userBirth.value = str;    
        
        
		f.action = "<%=cp%>/join/memupdate_ok.do";
		f.submit();
	}
	
	function payIt(){
		
		var p = document.payForm;
		
		phone1 = p.phone1.value;
		phone2 = p.phone2.value;
		phone3 = p.phone3.value;
		
		str = phone1+phone2+phone3;
		p.userTel.value = str;
		
		if(p.userTel.value!=p.userTel1.value){
			alert("전화번호가 일치하지 않습니다!!");
			p.userPwd.focus();
			return;	
		} 
			
		
		if(p.userPwd.value!=p.userPwd2.value){
			alert("비밀번호가 일치하지 않습니다!!");
			p.userPwd.focus();
			return;	
		} 
					
		p.action = "<%=cp%>/join/pay_ok.do";
		p.submit();
		alert("포인트 충전이 완료 되었습니다!!");
	}
	
function pass(){
		
		var pass = "${pass}";
		if(pass!="")
			alert("${pass}");
		
		var nopass = "${message}";
		if(nopass!="")
			alert("${message}");
	} 
	
	
function sendR(){
	
	var f = document.myForm3;
	
	str = f.content.value;
	str = str.trim();
	if(!str){
		alert("내용을 입력하세요!");
		f.content.focus();
		return;	 
	}
       	
	f.action = "<%=cp%>/sboard/reply_ok.do";
	f.submit();
}
	
function deletereply(rnum,board,num) {
    
    if(confirm("삭제하시겠습니까?")){
       javascript:location.href="<%=cp%>/sboard/replydelete.do?board="+board+"&num="+num+"&rnum="+rnum;
    }
           
 }
	
	
</script>


<style type="text/css">

.dot > li {border-bottom: 1px dotted; margin: 15px 5px 15px 5px;"}


</style>
</head>

<body>

<table style="width: 1200px; " cellspacing="0" align="center">
	<tr height="80px;" style="background-color: #242424;">
		<td style="border-top-left-radius:10px; padding-left: 0px;" colspan="3" >
		<img alt="" src="../images/torrentname.png" height="80px;" width="500px;" 
		style="margin-left: 20px;" onclick="javascripte:location.href='<%=cp%>/sboard/main.do'"></td>
		<td style=" width: 300px; border-top-right-radius:10px;">
			<table style="width: 280px;">
				<tr style="height: 40px;">
					<td align="left" valign="bottom" colspan="2" style="padding-left: 10px;">
						<font style="font-size: 20px;font-weight: bold; color: #ffffff"> ${dto1.userName}</font>
						<font style="font-size: 15px;font-weight: bold; color: #ffffff">님 기다렸어요! ^_^</font></td>
					<td></td></tr>
				<tr style="height: 40px;">
					<td align="left" style="width: 120px; padding-left: 10px">
						<font style="font-size: 15px;font-weight: bold; color: #ffffff">
						<span class="glyphicon glyphicon-star"></span>:
						<span style="font-size: 20px;font-weight: bold; color: #FFBB00">${dto1.userPoint}</span>점</font></td>
					<td align="right" style="width: 160px;">
					<button type="button" class="btn btn-success" style="padding: 5px;" 
						data-target="#pay" data-toggle="modal"><span class="glyphicon glyphicon-usd"></span></button>
					<button type="button" class="btn btn-warning" style="padding: 5px;" 
						data-target="#layerpop" data-toggle="modal"><span class="glyphicon glyphicon-edit">Edit</span></button>
					<button type="button" class="btn btn-danger" style="padding: 5px;" 
						onclick="javascript:location.href='<%=cp%>/sboard/logout.do'">
						<span class="glyphicon glyphicon-log-out">Out</span></button></td></tr>
			</table></td></tr>
	<tr>
		<td colspan="4" height="70px;" style="margin-bottom: 0px;" >
			<table width="100%">
				<tr>
					<td height="70px" style="background-color: #242424;border-bottom-right-radius:10px;border-bottom-left-radius:10px;">
	 					<div class="navbar navbar-inverse" style="border-top-left-radius:0px;
	 					border-top-right-radius:0px;margin:auto; border: 0px;">
	  						
						  <div class="container-fluid" style="padding: 0px; padding-left: 20px; background-color: #242424;">
						    <div>
						      <ul class="nav navbar-nav">
						        <li style="width: 100px;padding-left:8px;"><a href="/torrent/sboard/board.do?board=notice"">
						        	<font style="font-size: 18px; margin-left: 0px;"><b>Notice</b></font></a></li>
						        <li style="width: 100px;padding-left:0px;"><a href="/torrent/sboard/board.do?board=TOP100">
									<font style="font-size: 18px; margin-left: 0px;"><b>TOP100</b></font></a></li>
						        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
									<font style="font-size: 18px; margin-left: 0px;"><b>Movie</b></font><span class="caret"></span></a>
							          <ul class="dropdown-menu">
										<li><a href="/torrent/sboard/board.do?board=newMovie">최신외국영화</a></li>
										<li><a href="/torrent/sboard/board.do?board=oldMovie">지난외국영화</a></li>
										<li><a href="/torrent/sboard/board.do?board=korMovie">한국 영화</a></li>
										<li><a href="/torrent/sboard/board.do?board=hdMovie">DVD 고화질 영화</a></li>
										<li><a href="/torrent/sboard/board.do?board=threeDMovie">3D 영화</a></li>
							          </ul>
						        </li>
						        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
									<font style="font-size: 18px; margin-left: 0px;"><b>TV</b></font><span class="caret"></span></a>
							          <ul class="dropdown-menu">
										<li><a href="/torrent/sboard/board.do?board=korTV">한국 TV</a></li>
										<li><a href="/torrent/sboard/board.do?board=forTV">외국 TV</a></li>
							          </ul>
						        </li>
						        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
									<font style="font-size: 18px; margin-left: 0px;"><b>Ani</b></font><span class="caret"></span></a>
							          <ul class="dropdown-menu">
										<li><a href="/torrent/sboard/board.do?board=aniOver">종방</a></li>
										<li><a href="/torrent/sboard/board.do?board=aniOn">방영중</a></li>
							          </ul>
						        </li>
						        <li style="width: 80px;padding-left:0px;"><a href="/torrent/sboard/board.do?board=game">
									<font style="font-size: 18px; margin-left: 0px;"><b>Game</b></font></a></li>
						        <li style="width: 140px;padding-left:0px;"><a href="/torrent/sboard/board.do?board=comnov">
									<font style="font-size: 18px; margin-left: 0px;"><b>Comic/Novel</b></font></a></li>
						        <li style="width: 60px;padding-left:0px;"><a href="/torrent/sboard/board.do?board=util">
									<font style="font-size: 18px; margin-left: 0px;"><b>Util</b></font></a></li>
						        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
									<font style="font-size: 18px; margin-left: 0px;"><b>Music</b></font><span class="caret"></span></a>
							          <ul class="dropdown-menu">
										<li><a href="/torrent/sboard/board.do?board=korMusic">한국 음악</a></li>
										<li><a href="/torrent/sboard/board.do?board=forMusic">외국 음악</a></li>
							          </ul>
						        </li>
						        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
									<font style="font-size: 18px; margin-left: 0px;"><b>Forum</b></font><span class="caret"></span></a>
							          <ul class="dropdown-menu">
										<li><a href="/torrent/sboard/board.do?board=reviewForum">감상 후기</a></li>
										<li><a href="/torrent/sboard/board.do?board=requestForum">요청 게시판</a></li>
										<li><a href="/torrent/sboard/board.do?board=freeForum">자유 게시판</a></li>
							          </ul>
						        </li>
						      </ul>
						       <ul class="nav navbar-nav navbar-right">
  			<c:if test="${dto1.userGrade==5}">
        			<li style="padding-right: 15px;"><a href="javascript:location.href='<%=cp%>/sboard/control.do';"><font style="font-size: 15px; font-family: 돋움;"><b>관리자모드</b></font></a></li>
 			</c:if>
      </ul>
						    </div>
						  </div>
  						</div>
					</td>
				</tr>
			</table></td></tr></table>

<table width="1000px;" height="15" align="center">
	<tr height="20"></tr>
	<tr>
		<td align="center" style="font-size: 25px;"><b>${boardTitle}</b></td></tr>		
</table>

<table border="0" align="center" style="width: 1000px;;">
	<tr>
		<td colspan="4" height="10"></td></tr>
	<tr bgcolor="#242424" style="color: #B7B7B7; height: 40px; font-size: 16px;">
		<td colspan="4" style="width: 1000px;" class="subject" align="center">${dto.subject }</td></tr>
	<tr>
		<td class="subject" width="100" align="center">
		<font>카테고리&nbsp;:&nbsp;${dto.category }</font></td>
		<td style="" class="name" width="100" align="center">
		<font>글쓴이&nbsp;:&nbsp;${dto.userId }</font></td>
		<td style="" class="created" width="100" align="center">
		<font>작성일&nbsp;:&nbsp;${dto.created }</font></td>
		<td style="padding-top: 3px; padding-bottom: 3px;" class="hitCount" width="100" align="center">
		<font>조회&nbsp;:&nbsp;${dto.hitCount }</font></td></tr>
	<tr>
		<td colspan="4" style="width: 1000px; " bgcolor="#E1E1E1" height="1" colspan="4"></td></tr>
	<tr align="center">
		<td style="" class="hitCount" width="100" align="center">첨부파일</td>
		<td colspan="3" style="padding-top: 2px;" align="center" width="250"><a href="${downloadPath }${params}&num=${dto.num}">
		${dto.saveFileName }</a></td></tr>
	<tr style="height: 5px;">
		<td colspan="4" ></td></tr>
	<tr>
		<td style="width: 1000px; " bgcolor="#E1E1E1" height="1" colspan="4"></td></tr>

</table>
	
<table align="center" style="width: 1000px; table-layout:fixed;word-break:break-all;" 
	border="0">
		
	<tr height="5">
	</tr>
	<tr>
      <td style="padding-left: 20px;" height="150px;">
        <c:if test="${dto.savePicture!=null}">
      <img src="${imagePath}/${dto.savePicture}" style="max-width: 950px;">
      </c:if>
      <c:if test="${dto.savePicture==null}">
      <img alt="" src="<%= cp %>/images/punch.png" style="width: 100px; height: 100px;">
      </c:if>
      </td>
      </tr>
	
	
	<tr>		
		<td style="padding-left: 20px;" height="50">${dto.content }</td>
	</tr>
	<tr height="200"><td>
	<c:choose>
				<c:when test="${virtualBoard!='TOP100'}"> 
					<a href="javascript:location.href='<%=cp%>/sboard/cu.do?board=${board}&category=${category}
						&pageNum=${pageNum}&searchKey=${searchKey}&searchValue=${searchValue}
						&num=${dto.num}';">
						<button type="button" class="btn btn-default" style="height: 35px; width: 80px;">
						추천</button></a></c:when>
				<c:otherwise>
					<a href="javascript:location.href='<%=cp%>/sboard/cu.do?board=${board}&category=${category}
						&pageNum=${pageNum}&searchKey=${searchKey}&searchValue=${searchValue}
						&num=${dto.num}&virtualBoard=${virtualBoard}';">
						<button type="button" class="btn btn-default" style="height: 35px; width: 80px;">
						추천</button></a></c:otherwise>
						
	</c:choose>
	
	
	<c:choose>
				<c:when test="${virtualBoard!='TOP100'}"> 
					<a href="javascript:location.href='<%=cp%>/sboard/report.do?board=${board}&category=${category}
						&pageNum=${pageNum}&searchKey=${searchKey}&searchValue=${searchValue}
						&num=${dto.num}';">
						<button type="button" class="btn btn-default" style="height: 35px; width: 80px;">
						신고</button></a></c:when>
				<c:otherwise>
					<a href="javascript:location.href='<%=cp%>/sboard/report.do?board=${board}&category=${category}
						&pageNum=${pageNum}&searchKey=${searchKey}&searchValue=${searchValue}
						&num=${dto.num}&virtualBoard=${virtualBoard}';">
						<button type="button" class="btn btn-default" style="height: 35px; width: 80px;">
						신고</button></a></c:otherwise>
						
	</c:choose>
	
	
	
	
	
	
	
	

	</td>
	</tr>
	
</table>
<!-- -------------------------------------------------------------------------------------------- -->

<form action="" method="post" name="myForm3">
<table border="0" align="center" style="width: 1000px;">
   
   <tr><td width="150">전체 댓글 수 ${totalCount}개</td></tr>
   
   <tr><td style="height: 5px;"></td></tr>
      
   <tr><td style="width: 1000px; " bgcolor="#E1E1E1" height="1" colspan="6"></td></tr>
   
   <tr><td style="height: 5px;"></td></tr>
      
   <c:forEach var="dto" items="${lists}">
      <tr height="30">
         <td width="150">${dto.userId}</td>
         <td>${dto.content}</td>
         <td><font style="font-size: 8pt; color: #BDBDBD">${dto.created}</font></td>
         <td>
         <c:if test="${dto1.userId==dto.userId}">
         <%-- <a href="http://localhost:8080/torrent/sboard/replyDelete?rnum=${dto.rnum}&board=${board}&num=${dto.num}">삭제</a> / --%> 
         <%-- <button onclick="deletereply(${dto.rnum},${board},${dto.num});">삭제</button> --%> 
         </c:if>
         </td>
      </tr>
   </c:forEach>
   
   
   <%-- <td align="left" width="30"><input type="button" value="삭제" size="60"
            onclick="deleteData(<%=dto.getNum()%>,<%=currentPage%>);"></td> --%>
   
   
   
   <tr><td style="height: 5px;"></td></tr>
   <tr><td style="width: 1000px; " bgcolor="#E1E1E1" height="1" colspan="6"></td></tr>
   <tr><td style="height: 5px; "></td></tr>
   
   <!-- -------------------------------- -->
   <tr height="30">
   <td width="150"><input type="hidden" value="${dto1.userId}" name="userId">${dto1.userId}</td>
   <td colspan="2"><textarea name="content" rows="3" cols="120" ></textarea>
   <input type="hidden" name="num" value="${dto.num}">
   <input type="hidden" name="category" value="${board}"></td>
   <td><input type="button" class="btn btn-default" style="height: 50px; width: 80px;" value="등록" onclick="sendR();"></td></tr>
   <!-- -------------------------------- -->
   
   <tr><td style="height: 5px;"></td></tr>   
   <tr><td style="width: 1000px; " bgcolor="#E1E1E1" height="1" colspan="6"></td></tr>
   <tr><td style="height: 5px;"></td></tr>

</table>
</form>
<!-- -------------------------------------------------------------------------------------------- -->
<table border="0" align="center" style="width: 1000px;">
	<tr>
		<td align="right" style="width: 1200px;"></td>
	</tr>	
		<tr>
			<td style="width: 1000px; " bgcolor="#E1E1E1" height="1" colspan="6"></td>		
		</tr>
		<tr>
			<td style="height: 5px;"></td>
		</tr>
		
		<tr>
		<td>	
			<a href="/torrent/sboard/board.do${params}">
			 <button type="button" class="btn btn-default" style="height: 35px; width: 80px;">목록보기</button></a></td>
			
		<td style="width: 10px;"></td>
		<td>
		
		<c:choose>
			<c:when test="${dto1.userId==dto.userId && virtualBoard!='TOP100'}">
			<a href="/torrent/sboard/updated.do${params}&num=${dto.num}">						
			<button type="button" class="btn btn-default" style="height: 35px; width: 80px;">수정하기</button></a>
			</c:when>
			<c:when test="">
			
			
			</c:when>
			
		</c:choose>
			</td>
				
			
		<td style="width: 10px;"></td>	
		<td>
		
		<c:if test="${dto1.userId==dto.userId && virtualBoard!='TOP100' || dto1.userGrade==5 && virtualBoard!='TOP100' }">
			<c:choose>
				<c:when test="${virtualBoard!='TOP100'}"> 
					<a href="${deletePath }?board=${board}&category=${category}
						&pageNum=${pageNum}&searchKey=${searchKey}&searchValue=${searchValue}
						&num=${dto.num}">
						<button type="button" class="btn btn-default" style="height: 35px; width: 80px;">
						삭제하기</button></a></c:when>
				<c:otherwise>
					<a href="${deletePath }?board=${board}&category=${category}
						&pageNum=${pageNum}&searchKey=${searchKey}&searchValue=${searchValue}
						&num=${dto.num}&virtualBoard=${virtualBoard}">
						<button type="button" class="btn btn-default" style="height: 35px; width: 80px;">
						삭제하기</button></a></c:otherwise></c:choose>
						
						
		</c:if>
						</td>
	</tr>
</table>

<table style="width: 1200px; height: 100px;" cellspacing="0" align="center">
	<tr height="20"></tr>
	<tr style="height: 100px;">
		<td colspan="3" style="background-color:#242424; border-radius:10px;" align="center">
			<font style="font-size: 13px; font-family: 고딕;color: #242424">Copyright (c) 2015 
			<span style="font-size: 15px;color: #00D8FF; font-weight: bold;">PUNCH TORRENT</span> 
			All rights reserved .  <span style="font-size: 15px;color: #00D8FF;">DMCA</span><br/>
		 	<span style="font-size: 15px;color: #00D8FF;">광고제휴문의</span> 
		 	<span style="font-size: 13px;color: #00D8FF;"> contact us</span> 
		 	dung8758@naver.com</font></td></tr>
</table>




<!-- 회원정보수정 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

<div class="modal fade" id="layerpop" style="width: 200;">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title" align="center" style="font-weight: bold; font-size: 25pt;">회원정보 수정</h4>
      	</div>
      	<!-- body -->
      	<div class="modal-body">
            <form action="" method="post" name="myForm1">
		
			<table align="center" cellpadding="0" cellspacing="0" border="0" style="width: 400px;">
						
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
				
				<tr height="40">
					<td width="110" style="padding-left: 5px;" colspan="2">
						<input type="text" readonly class="form-control" value="${dto1.userId }" name="userId" placeholder="※아이디" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
					</td>
				</tr>
				
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
				
				<tr height="40">
					<td width="110" style="padding-left: 5px;" colspan="2">
					<input type="text" readonly class="form-control"  value="${dto1.userEmail }" name="userEmail" placeholder="※이메일" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
					</td>
				</tr>
				
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
						
				<tr height="40">
					<td width="140" style="padding-left: 5px;" colspan="2">
					<input type="password" class="form-control" value="${userPwd}" name="userPwd" placeholder="※변경할 비밀번호" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
					</td>
				</tr>
				
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
						
				<tr height="40">
					<td width="140" style="padding-left: 5px;" colspan="2">
					<input type="password" class="form-control" value="${userPwd2 }" name="userPwd2" placeholder="※변경할 비밀번호 확인" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
					</td>
				</tr>
				
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
								
				<tr height="40">
					<td width="140" style="padding-left: 5px;" colspan="2">
					<input type="text" class="form-control" value="${dto1.userName}" name="userName" placeholder="※이름" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
					</td>
				</tr>		
						
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
					
				<tr height="40">
					<td width="140" style="padding-left: 5px;" colspan="2">
					<input type="text" class="form-control" value="${dto1.userTel}" name="userTel" placeholder="※전화" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
					</td>
				</tr>
						
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
				
				<tr height="40">
					<td width="70" style="padding-left: 5px;" colspan="2">
					<font style="height: 50px; font-size: 20px; font-family: 고딕;">&nbsp;&nbsp;※성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
					
					<c:if test="${dto1.userSex=='man'}">
						<input type="radio" name="userSex" checked="checked" value="man"><font style="height: 50px; font-size: 20px; font-family: 고딕;">&nbsp;남</font>
					</c:if>
					<c:if test="${dto1.userSex=='girl'}">
						<input type="radio" name="userSex" value="girl" checked="checked"><font style="height: 50px; font-size: 20px; font-family: 고딕;">&nbsp;여</font>
					</c:if>

					</td>
				</tr>
				
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
			
				<tr height="40">
					<td width="140" style="padding-left: 5px;" colspan="2">
						<font style="height: 50px; font-size: 20px; font-family: 고딕;">&nbsp;&nbsp;※생년월일&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="year" title="1992">
								<%for(int i=80; i>=1; i--) {%>
									<option value="<%=i+1935%>"><%=i+1935%></option>
								<%} %>
							</select>년
							<select name="month">
								<%for(int i=1; i<=12; i++) {%>
									<option value="<%=i%>"><%=i%></option>
								<%} %>
							</select>월
							<select name="day">
								<%for(int i=1; i<=31; i++) {%>
									<option value="<%=i%>"><%=i%></option>
								<%} %>
						</select>일</font>
						
						<input type="hidden" name="userBirth" value="userBirth">
					</td>
				</tr>
					
				<!-- font-weight : normal or bold or 100 ~ 900 (폰트 굵기 설정) -->
				
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
				
				<tr height="40">
					<td width="110" style="padding-left: 5px;">
						<input type="text" readonly class="form-control" id="sample6_postcode" name="addr1" value="${dto1.addr1}" placeholder="※우편번호" style="height: 50px; font-size: 20px; font-family: 고딕; width: 250px;">
					</td>
					<td>	
						<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width: 150px; height: 50px; font-size: 15px; font-family: 고딕; font-weight: bold; background-color: #FCFCFC;" class="btn btn-default">
					</td>			
				</tr>
				
				<tr height="3"><td colspan="2" bgcolor="#ffffff"></td></tr>
				
				<tr height="40">
					<td width="110" style="padding-left: 5px;">
						<input type="text" readonly class="form-control" id="sample6_address" name="addr2" value="${dto1.addr2}" placeholder="※주소" style="height: 50px; font-size: 20px; font-family: 고딕; width: 250px;">
					</td>
					<td>	
						<input type="text" class="form-control" id="sample6_address2" name="addr3" value="${dto1.addr3}" placeholder="※상세주소" style="width: 150px; height: 50px; font-size: 20px; font-family: 고딕;">
					</td>			
				</tr>
						
				<tr height="10"><td colspan="2" bgcolor="#ffffff"></td></tr>		
		
			</table>
		
		</form>                            
      </div>
      <!-- Footer -->
      <div class="modal-footer" align="center">
        <button type="button" style="width: 120px;" class="btn btn-default" onclick="sendIt();">정보수정</button>
		<button type="reset" style="width: 120px;" class="btn btn-default" onclick="document.myForm1.userPwd.focus();">다시입력</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<!-- 회원정보수정 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>

<div class="modal fade" id="pay" style="width: 200;">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header" >
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title" align="center" style="font-weight: bold; font-size: 25pt;">펀치토렌트 포인트 결제</h4>
      	</div>
      	<!-- body -->
      	<div class="modal-body" >
        	        	 
        	
        	<c:if test="${dto1.userPoint!=null}" >
        		<font style="font-size: 20pt;">&nbsp;&nbsp;&nbsp;&nbsp;${dto1.userName} 님 보유중인 포인트 </font> <font style="font-weight: bold; font-size: 20pt; color: red;"> ${dto1.userPoint} </font> <font style="font-size: 20pt;">point</font>
        	</c:if>
        	
        	<form action="" method="post" name="payForm">
		
			<table align="center" cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
						
				<tr height="3"><td colspan="4" bgcolor="#8C8C8C"></td></tr>
				
				<tr height="40">
					<td style="border-right: 1px solid;" width="40" bgcolor="#EAEAEA">&nbsp;&nbsp;&nbsp;결제금액</td>
					<td width="70">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="pay" checked="checked" value="money1">
					<input type="text" size="6" name="money1" placeholder="직접입력">원
					
					<input type="radio" name="pay" value="money2">
					<select name="money2">
						<option value="150000">150,000</option>
						<option value="100000">100,000</option>
						<option value="50000">50,000</option>
						<option value="30000">30,000</option>
						<option value="10000">10,000</option>
						<option value="5000">5,000</option>
						<option value="1000">1,000</option>
					</select>원
					
					<input type="hidden" name="userId" value="${dto1.userId}">
					</td>
				</tr>
								
				<tr height="1"><td colspan="4" bgcolor="#8C8C8C"></td></tr>
	
				<tr height="40">
					<td style="border-right: 1px solid;" width="40" bgcolor="#EAEAEA">&nbsp;&nbsp;&nbsp;결제수단</td>
					<td width="70">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="payPhone" checked="checked">
					휴대폰결제
					</td>
					<td width="70"></td>
				</tr>
														
				<tr height="1"><td colspan="4" bgcolor="#8C8C8C"></td></tr>

				<tr height="30">
					
					<td colspan="4" align="center">
						<font style="color: #8C8C8C; font-size: 9pt" >휴대폰 결제는 휴대폰 인증절차 없이 비밀번호만으로 쉽게 사용 가능합니다.</font>
					</td>
					
				</tr>		
				
				<tr height="10"><td colspan="4" bgcolor="#ffffff"></td></tr>
				
				<tr height="30">
					<td></td>
					<td	align="center" width="120" >
						<font style="font-size: 10pt" >휴대폰번호&nbsp;&nbsp;</font>
						<select name="phone1" title="010">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="070">070</option>
						</select>-
						<input type="text" name="phone2" size="1" maxlength="4">-
						<input type="text" name="phone3" size="1" maxlength="4">
						<input type="hidden" name="userTel">
						<input type="hidden" name="userTel1" value="${dto1.userTel}">
					</td>
					
				</tr>
				
				<tr height="5"><td colspan="4" bgcolor="#ffffff"></td></tr>
				
				<tr height="30">
					<td></td>
					<td	align="center" width="120" >
						<font style="font-size: 10pt" >&nbsp;&nbsp;비밀번호&nbsp;&nbsp;</font>
						<input type="password" name="userPwd" size="18">
						<input type="hidden" name="userPwd2" value="${dto1.userPwd }">
					</td>
					<td></td>
				</tr>		
																
				<tr height="15"><td colspan="4" bgcolor="#ffffff"></td></tr>
																										
				<tr height="3"><td colspan="4" bgcolor="#8C8C8C"></td></tr>
				
			</table>
			</form>
      	</div>
      	<!-- Footer -->
      	<div class="modal-footer" align="center">
        	<button type="button" style="width: 120px; background-color: #8C8C8C;" class="btn btn-default" onclick="payIt();">충전하기!</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
      	</div>
    </div>
  </div>
</div>

</body>
</html>