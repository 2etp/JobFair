<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = null;
	String sex = null;
	String mobile = null;
	String birthDay = null;
	String address = null;
	String typeOfDisability = null;
	String gradeOfDisability= null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 이력서 등록</title>
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/postResume.css?after">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script lang="javascript" src="./js/xlsx.full.min.js"></script>
<script defer src="js/postResume.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section style="margin-top: 10px;">
		
		<form name="resumeFrm" method="post" action="postResumeProc.jsp">
		
			<caption>입사지원서</caption>
			<div class="div-table">
			<table class="table1" id="table">
				<tr class="tr1">
					<td rowspan="4">
						<div class="div-profileImage">				
							<label for="profileUpload">이력서에 사용할 사진을 등록해주세요</label>
							<input type="file" id="profileUpload" accept="image/*" style="display: none;">
						</div>
						<a href="javascript:void();" role="button" onclick="imageRegister();">등록하기</a>
					
					</td>
					<th>성명</th>
					<td><%=name%></td>
					<th>성별</th>
					<td><%=sex%></td>
				</tr>
				
				<tr class="tr2">
					<th>연락처</th>
					<td><%=mobile%></td>
					<th>생년월일</th>
					<td><%=birthDay%></td>
				</tr>
				
				<tr class="tr3">
					<th>주소</th>
					<td colspan="3"><%=address%></td>
					
				</tr>
				
				<tr class="tr4">
					<th>병역</th>
					<td colspan="3">
						<label><input type="radio" name="militaryService" value="finished">필</label>
						<label><input type="radio" name="militaryService" value="yet">미필</label>
						<label><input type="radio" name="militaryService" value="exemption">면제</label>
						<label><input type="radio" name="militaryService" value="none">해당사항 없음</label>
					</td>
				</tr>
				
				<tr class="tr5">
					<th>장애유형</th>
					<td><%=typeOfDisability%></td>
					<th>보장구 유/무</th>
					<td colspan="2">
						<label><input type="radio" name="assistive" value="existence">유</label>
						<label><input type="radio" name="assistive" value="nonexistence">무</label>
					</td>
				</tr>
				
				<tr class="tr6">
					<th>장애등급</th>
					<td><%=gradeOfDisability%></td>
					<th>보장구 종류</th>
					<td colspan="2">
						<input type="text" name="assistiveDevice">
					</td>
					
				</tr>
				
				<tr class="tr7">
					<th rowspan="2">최종학력</th>
					<td><input type="text" name="schoolName">학교</td>
					<td rowspan="2" colspan="3">
						<label><input type="radio" name="education" value="attending">재학</label>
						<label><input type="radio" name="education" value="takingOff">휴학</label>
						<label><input type="radio" name="education" value="graduate">졸업</label>
						<label><input type="radio" name="education" value="dropOut">중퇴</label>
					</td>
				</tr>
				
				<tr class="tr8">
					<td><input type="text" name="major">학과</td>
				</tr>
				
			</table>
				
			<table class="table2" id="mytable2">
				<tr class="tr10">
					<th rowspan="4">경력<br> 및<br> 교육사항</th>
					<th>사업체명 및 교육기관</th>
					<th>기간</th>
					<th>담당업무 및 교육내용</th>
					<th colspan="2">비고</th>
				</tr>
				
				<tr class="tr11">
					<td><input type="text" name="institutionName1"></td>
					<td><input type="text" name="period1"></td>
					<td><input type="text" name="content1"></td>
					<td colspan="2"><input type="text" name="note1"></td>
				</tr>
							
				<tr class="tr12">
					<td><input type="text" name="institutionName2"></td>
					<td><input type="text" name="period2"></td>
					<td><input type="text" name="content2"></td>
					<td colspan="2"><input type="text" name="note2"></td>
				</tr>
				
				<tr class="tr13">
					<td><input type="text" name="institutionName3"></td>
					<td><input type="text" name="period3"></td>
					<td><input type="text" name="content3"></td>
					<td colspan="2"><input type="text" name="note3"></td>
				</tr>
			</table>
				
			<table class="table3" id="mytable3">
				<tr class="tr15">
					<th rowspan="4" style="border-bottom-left-radius: 5px;">자격면허</th>
					<th>자격종목</th>
					<th>급수</th>
					<th>등록번호</th>
					<th>발행처</th>
					<th>발급일자</th>
				</tr>
				
				<tr class="tr16">
					<td><input type="text" name="certificate1"></td>
					<td><input type="text" name="certificateNum1"></td>
					<td><input type="text" name="registration1"></td>
					<td><input type="text" name="issuer1"></td>
					<td><input type="text" name="issueDate1"></td>
				</tr>
				
				<tr class="tr17">
					<td><input type="text" name="certificate2"></td>
					<td><input type="text" name="certificateNum2"></td>
					<td><input type="text" name="registration2"></td>
					<td><input type="text" name="issuer2"></td>
					<td><input type="text" name="issueDate2"></td>
				</tr>
				
				<tr class="tr18">
					<td><input type="text" name="certificate3"></td>
					<td><input type="text" name="certificateNum3"></td>					
					<td><input type="text" name="registration3"></td>
					<td><input type="text" name="issuer3"></td>
					<td><input type="text" name="issueDate3"></td>
				</tr>
			</table>
			</div>
			
		<aside class="sideBar">
			<fieldset>
				<legend>사이드 메뉴</legend>
					<a href="#" role="button" onclick="fnExcelReport('table','mytable2','mytable3','title');">다운로드</a>
					<a href="javascript:" role="button">미리보기</a>
					<a href="javascript:" role="button">이력서 저장</a>
			</fieldset>
		</aside>
			
		</form>
			
	</section>
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>