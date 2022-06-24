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
</head>
<body>

<jsp:include page="header.jsp"/>

<main>
	<seciton>
		<form name="resumeFrm" method="post" action="postResumeProc.jsp">
			<table>
				<tr>
					<td>성명</td>
					<td><%=name%></td>
					<td colspan="2">성별</td>
					<td colspan="2"><%=sex%></td>
				</tr>
				
				<tr>
					<td>연락처</td>
					<td><%=mobile%></td>
					<td colspan="2">생년월일</td>
					<td colspan="2"><%=birthDay%></td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td colspan="3"><%=address%></td>
				</tr>
				
				<tr>
					<td>병역</td>
					<td colspan="5">
						<label><input type="checkbox" name="finished" value="finished">필</label>
						<label><input type="checkbox" name="yet" value="yet">미필</label>
						<label><input type="checkbox" name="exemption" value="exemption">미필</label>
						<label><input type="checkbox" name="none" value="none">해당사항 없음</label>
					</td>
				</tr>
				
				<tr>
					<td>장애유형</td>
					<td><%=typeOfDisability%></td>
					<td>보장구 유/무</td>
					<td colspan="3">
						<label><input type="checkbox" name="existence" value="existence">유</label>
						<label><input type="checkbox" name="nonexistence" value="nonexistence">무</label>
					</td>
				</tr>
				
				<tr>
					<td>장애등급</td>
					<td><%=gradeOfDisability%></td>
					<td>보장구 종류</td>
					<td colspan="3">
						<input type="text" name="assistiveDevice">
					</td>
				</tr>
				
				<tr>
					<td rowspan="2">최종학력</td>
					<td><input type="text" name="schoolName">학교</td>
					<td rowspan="2" colspan="4">
						<label><input type="checkbox" name="attending" value="attending">재학</label>
						<label><input type="checkbox" name="takingOff" value="takingOff">휴학</label>
						<label><input type="checkbox" name="graduate" value="graduate">졸업</label>
						<label><input type="checkbox" name="dropOut" value="dropOut">중퇴</label>
					</td>
				</tr>
				
				<tr>
					<td><input type="text" name="major">학과</td>
				</tr>
				
				<tr>
					<td rowspan="5">경력 및 교육사항</td>
				</tr>
				
				<tr>
					<td>사업체명 및 교육기관</td>
					<td>기간</td>
					<td>담당업무 및 교육내용</td>
					<td colspan="2">비고</td>
				</tr>
				
				<tr>
					<td><input type="text" name="institutionName1"></td>
					<td><input type="text" name="period1"></td>
					<td><input type="text" name="content1"></td>
					<td colspan="2"><input type="text" name="note1"></td>
				</tr>
							
				<tr>
					<td><input type="text" name="institutionName2"></td>
					<td><input type="text" name="period2"></td>
					<td><input type="text" name="content2"></td>
					<td colspan="2"><input type="text" name="note2"></td>
				</tr>
				
				<tr>
					<td><input type="text" name="institutionName3"></td>
					<td><input type="text" name="period3"></td>
					<td><input type="text" name="content3"></td>
					<td colspan="2"><input type="text" name="note3"></td>
				</tr>
				
				<tr>
					<td rowspan="5">자격면허</td>
				</tr>
				
				<tr>
					<td>자격종목</td>
					<td>급수</td>
					<td>등록번호</td>
					<td>발행처</td>
					<td>발급일자</td>
				</tr>
				
				<tr>
					<td><input type="text" name="certificate1"></td>
					<td><input type="text" name="certificateNum1"></td>
					<td><input type="text" name="issuer1"></td>
					<td><input type="text" name="issueDate1"></td>
				</tr>
				
				<tr>
					<td><input type="text" name="certificate2"></td>
					<td><input type="text" name="certificateNum2"></td>
					<td><input type="text" name="issuer2"></td>
					<td><input type="text" name="issueDate2"></td>
				</tr>
				
				<tr>
					<td><input type="text" name="certificate3"></td>
					<td><input type="text" name="certificateNum3"></td>					
					<td><input type="text" name="issuer3"></td>
					<td><input type="text" name="issueDate3"></td>
				</tr>
			</table>
			
		<aside class="saveResume">
			<a href="javascript:" role="button">미리보기</a>
			<a href="javascript:" role="button">이력서 저장</a>
		</aside>
			
		</form>
			
	</seciton>
</main>

<jsp:include page="footer.jsp"/>

</body>
</html>