<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 채용공고 등록</title>
<link rel="stylesheet" href="./css/common.css"> 
<link rel="stylesheet" href="./css/postJobOpening.css"> 
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<section>
		<p>기업정보</p>
		<form name="jobFrm" method="post" action="postJobOpeningProc.jsp">
			<table>
				<tr class="tr1">
					<th>기업명</th>
					<td></td>
					<th>홈페이지</th>
					<td></td>
				</tr>
				
				<tr class="tr2">
					<th>대표자</th>
					<td></td>
					<th>업종</th>
					<td><input type="text" name="sectors"></td>
				</tr>
				
				<tr class="tr3">
					<th>설립시기</th>
					<td><input type="text" name="founded"></td>
					<th>사업내용</th>
					<td><input type="text" name="businessInfo"></td>
				</tr>
				
				<tr class="tr4">
					<th>주소</th>
					<td></td>
					<th>규모</th>
					<td><input type="text" name="size"></td>
				</tr>
			</table>
			
			<p>채용정보</p>
			<table>
				<tr class="tr5">
					<th>모집직종</th>
					<td><input type="text" name="position"></td>
					<th>모집인원</th>
					<td><input type="number" name="people"></td>
				</tr>
				
				<tr class="tr6">
					<th>직무내용</th>
					<td><input type="text" name="task"></td>
					<th>근무지역</th>
					<td><input type="text" name="workArea"></td>
				</tr>
				
				<tr class="tr7">
					<th>학력</th>
					<td><input type="text" name="education"></td>
					<th>경력</th>
					<td><input type="text" name="career"></td>
				</tr>
				
				<tr class="tr8">
					<th>고용형태</th>
					<td><input type="text" name="employType"></td>
					<th>근무형태</th>
					<td><input type="text" name="workType"></td>
				</tr>
				
				<tr class="tr9">
					<th>급여조건</th>
					<td><input type="text" name="pay"></td>
					<th>사회보험</th>
					<td><input type="text" name="insurance"></td>
				</tr>
				
				<tr class="tr10">
					<th>퇴직금</th>
					<td><input type="text" name="severancePay"></td>
					<th>상여금</th>
					<td><input type="text" name="bonus"></td>
				</tr>
				
				<tr class="tr11">
					<th>근무시간</th>
					<td><input type="text" name="officeHours"></td>
					<th>잔업</th>
					<td><input type="text" name="overtime"></td>
				</tr>
				
				<tr class="tr12">
					<th>기타조건</th>
					<td colspan="3"><input type="text" name="etc"></td>
				</tr>
			</table>
			
			<p>우대사항 및 복리후생</p>
			<table>
				<tr class="tr11">
					<th>전공</th>
					<td><input type="text" name="major"></td>
					<th>자격증</th>
					<td><input type="text" name="certificate"></td>
				</tr>
				
				<tr class="tr12">
					<th>컴퓨터활용</th>
					<td><input type="text" name="computerLevel"></td>
					<th>편의시설</th>
					<td><input type="text" name="facilities"></td>
				</tr>
				
				<tr class="tr13">
					<th>복리후생</th>
					<td><input type="text" name="welfare"></td>
					<th>우대사항</th>
					<td><input type="text" name="preferred"></td>
				</tr>	
			</table>
			
		<aside class="sideBar">
			<fieldset>
				<legend>사이드 메뉴</legend>
				<a href="javascript:" role="button">미리보기</a>
				<a href="javascript:" role="button">채용공고 저장</a>
			</fieldset>
		</aside>
		
		</form>
	</section>

</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
</html>