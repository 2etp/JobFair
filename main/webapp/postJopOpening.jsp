<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 채용공고 등록</title>
<link rel="stylesheet" href="./css/common.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<main>
	<section>
		<form name="jobFrm" method="post" action="postJobOpeningProc.jsp">
			<table>
				<tr>
					<td>기업명</td>
					<td></td>
					<td>홈페이지</td>
					<td></td>
				</tr>
				
				<tr>
					<td>대표자</td>
					<td></td>
					<td>업종</td>
					<td><input type="text" name="sectors"></td>
				</tr>
				
				<tr>
					<td>설립시기</td>
					<td><input type="text" name="founded"></td>
					<td>사업내용</td>
					<td><input type="text" name="businessInfo"></td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td></td>
					<td>규모</td>
					<td><input type="text" name="size"></td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>모집직종</td>
					<td><input type="text" name="categoryOfOccupation"></td>
					<td>모집인원</td>
					<td><input type="text" name="numberOfPeople"></td>
				</tr>
				
				<tr>
					<td>직무내용</td>
					<td><input type="text" name="task"></td>
					<td>근무지역</td>
					<td><input type="text" name="workArea"></td>
				</tr>
				
				<tr>
					<td>학력</td>
					<td><input type="text" name="education"></td>
					<td>경력</td>
					<td><input type="text" name="career"></td>
				</tr>
				
				<tr>
					<td>고용형태</td>
					<td><input type="text" name="employmenType"></td>
					<td>근무형태</td>
					<td><input type="text" name="workType"></td>
				</tr>
				
				<tr>
					<td>급여조건</td>
					<td><input type="text" name="pay"></td>
					<td>사회보험</td>
					<td><input type="text" name="insurance"></td>
				</tr>
				
				<tr>
					<td>근무시간</td>
					<td><input type="text" name="officeHours"></td>
					<td>기타</td>
					<td><input type="text" name="etc"></td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>전공</td>
					<td><input type="text" name="major"></td>
					<td>자격증</td>
					<td><input type="text" name="certificate"></td>
				</tr>
				
				<tr>
					<td>컴퓨터활용</td>
					<td><input type="text" name="computerLevel"></td>
					<td>편의시설</td>
					<td><input type="text" name="facilities"></td>
				</tr>
				
				<tr>
					<td>복리후생</td>
					<td><input type="text" name="welfare"></td>
					<td>우대사항</td>
					<td><input type="text" name="preferred"></td>
				</tr>
				
			</table>
			
		<aside class="sideBar">
			<a href="javascript:" role="button">미리보기</a>
			<a href="javascript:" role="button">채용공고 저장</a>
		</aside>
		
		</form>
	</section>

</main>

<jsp:include page="footer.jsp"/>

</body>
</html>