<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2022 부산 장애인 온라인 채용 박람회 | 채용공고 등록</title>
<link rel="stylesheet" href="./css/common.css"> 
<link rel="stylesheet" href="./css/postJobOpening.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
</head>
<body>

<jsp:include page="commonJSP/header.jsp"/>

<main>
	<div id="container">
		<h1>
			<textarea name="title" placeholder="제목을 입력하세요" maxlength="40" cols="20" rows="2" onkeypress="javascript:noEnter()"></textarea>
		</h1>
		<section id="comInfo">
			<h2>
				<img class="icons" src="./image/building.svg" aria-hidden="true">
				<span class="secTitle">기업정보</span>
			</h2>
			<div class="logo-wrap">
				<img class="logo" src="image/에스지씨앤씨 주식회사.png" alt="에스지씨앤씨 주식회사 로고">
			</div>
			<table>
				<tr>
					<th>기업명</th>
					<td><span>에스지씨앤씨 주식회사</span></td>
					<th>대표자</th>
					<td><span>최준완</span></td>
				</tr>
				<tr>
					<th>업종</th>
					<td><span>정보통신업</span></td>
					<th>사업내용</th>
					<td><span>소프트웨어 개발</span></td>
				</tr>
				<tr>
					<th>설립시기</th>
					<td><span>2016년 8월 30일</span></td>
					<th>규모</th>
					<td><span>5~49인</span></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><span>부산 수영구 민락로 19번길 21, 3층(민락동)</span></td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td colspan="3">
						<a href="http://sgcnc.kr" tabindex="-1">
							<span aria-hidden="true">http://sgcnc.kr</span>
							<span class="offscreen">에스지씨앤씨 주식회사 홈페이지</span>
						</a>
					</td>
				</tr>
			</table>
		</section>
		<section id="recruitInfo">
			<h2>
				<img class="icons" src="./image/recruit.svg" aria-hidden="true">
				채용정보
			</h2>
			<table>
				<tr>
					<th>모집직종</th>
					<td>
						<select id="position" name="position" title="모집직종">
							<option value="position" class="select-holder" aria-hidden="true" selected>모집직종을 선택해 주세요.</option>
							<option value="제조업">제조업</option>
							<option value="서비스">서비스</option>
							<option value="도소매업">도소매업</option>
							<option value="보건업">보건업</option>
							<option value="숙박업">숙박업</option>
							<option value="사회복지">사회복지</option>
							<option value="교욱서비스업">교육 서비스업</option>
							<option value="외식업">외식업</option>
						</select>
					</td>
					<th>근무지역</th>
					<td>
						<select id="workArea" name="workArea" title="근무지역">
							<option value="workArea" class="select-holder" aria-hidden="true" selected>근무지역을 선택해 주세요.</option>
							<option value="강서구">강서구</option>
							<option value="금정구">금정구</option>
							<option value="기장군">기장군</option>
							<option value="남구">남구</option>
							<option value="동구">동구</option>
							<option value="동래구">동래구</option>
							<option value="부산진구">부산진구</option>
							<option value="북구">북구</option>
							<option value="사상구">사상구</option>
							<option value="사하구">사하구</option>
							<option value="서구">서구</option>
							<option value="수영구">수영구</option>
							<option value="연제구">연제구</option>
							<option value="영도구">영도구</option>
							<option value="해운대구">해운대구</option>
							<option value="김해시">김해시</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>모집인원</th>
					<td><input type="number" name="people"></td>
					<th>근무형태</th>
					<td>
						<select id="workType" name="workType" title="근무형태">
							<option value="workType" class="select-holder" aria-hidden="true" selected>근무형태를 선택해 주세요.</option>
							<option value="주5일">주5일</option>
							<option value="주3~4일">주3~4일</option>
							<option value="협의">협의</option>	
						</select>
					</td>
				</tr>
				<tr>
					<th>직무내용</th>
					<td>
						<textarea name="task" title="직무내용" maxlength="40"></textarea>
					</td>
					<th>고용형태</th>
					<td>
						<textarea name="employType" title="고용형태" maxlength="30"></textarea>
					</td>
					
				</tr>
				<tr>
					<th>학력</th>
					<td>
						<textarea name="education" title="학력" maxlength="30"></textarea>
					</td>
					<th>경력</th>
					<td>
						<textarea name="career" title="경력" maxlength="30"></textarea>
					</td>
				</tr>
				<tr>
					<th>급여조건</th>
					<td>
						<textarea name="pay" title="급여조건" maxlength="30"></textarea>
					</td>
					<th>사회보험</th>
					<td>
						<textarea name="insurance" title="사회보험" maxlength="50"></textarea>
					</td>
				</tr>
				<tr>
					<th>퇴직금</th>
					<td>
						<textarea name="severancePay" title="퇴직금" maxlength="128"></textarea>
					</td>
					<th>상여금</th>
					<td>
						<textarea name="bonus" title="상여금" maxlength="128"></textarea>
					</td>
				</tr>
				<tr>
					<th>근무시간</th>
					<td>
						<textarea name="officeHours" title="근무시간" maxlength="40"></textarea>
					</td>
					<th>잔업</th>
					<td>
						<textarea name="overtime" title="잔업" maxlength="128"></textarea>
					</td>
				</tr>
				<tr>
					<th>기타조건</th>
					<td colspan="3">
						<textarea name="etc" title="기타조건" maxlength="255"></textarea>
					</td>
				</tr>
			</table>
		</section>
		<section id="welfare">
			<h2>
				<img class="icons" src="./image/wing.svg" aria-hidden="true">
				우대사항 및 복리후생
			</h2>
			<table>
				<tr>
					<th>전공</th>
					<td>
						<textarea name="major" title="전공" maxlength="30"></textarea>
					</td>
					<th>자격면허</th>
					<td>
						<textarea name="certificate" title="자격면허" maxlength="50"></textarea>
					</td>
				</tr>
				<tr>
					<th>컴퓨터활용</th>
					<td>
						<textarea name="computerLevel" title="컴퓨터활용" maxlength="30"></textarea>
					</td>
					<th>편의시설</th>
					<td>
						<textarea name="facilities" title="편의시설" maxlength="255"></textarea>
					</td>
				</tr>
				<tr>
					<th>복리후생</th>
					<td>
						<textarea name="welfare" title="복리후생" maxlength="255"></textarea>
					</td>
					<th>우대사항</th>
					<td>
						<textarea name="preferred" title="우대사항" maxlength="255"></textarea>
					</td>
				</tr>
			</table>
		</section>
		<div class="div-sideNav">
			<aside id="sideNav" role="navigation">
				<div id="sideNav-container">
					<h3>채용공고 편집 메뉴</h3>
					<a href="" id="bookmark">
						<img src="image/bookmark_off.svg" aria-hidden="true">
						<span>관심기업 등록</span>
					</a>
					<section id="quickLink">
						<h4>
							<img class="small-icons" src="image/thunder.svg" aria-hidden="true">
							<span>빠른 이동</span>
						</h4>
						<ul>
							<li><a href="javascript:scrollUnderHeader('#comInfo')">
								<img class="small-icons" src="./image/building.svg" aria-hidden="true">
								기업정보
							</a></li>
							<li><a href="javascript:scrollUnderHeader('#recruitInfo')">
								<img class="small-icons" src="./image/recruit.svg" aria-hidden="true">
								채용정보
							</a></li>
							<li><a href="javascript:scrollUnderHeader('#welfare')">
								<img class="small-icons" src="./image/wing.svg" aria-hidden="true">
								우대사항 및 복리후생
							</a></li>
						</ul>
					</section>
					
					<hr style="margin:10px;">
					
					<section id="postEmp">
						<h4>
							<img class="small-icons" src="image/apply.svg" aria-hidden="true">
							<span>채용공고 등록</span>
						</h4>
						<!-- 이력서 제출 폼 -->
						<form name="postFrm">
							<a href="" class="btn" id="postPreview">미리보기</a>
							<br>
							<input type="button" class="btn" id="postEmpSubmit" value="등록" role="button">
						</form>
						<!-- 이력서 제출 폼 끝 -->
					</section>
				</div> <!-- sideNav-container -->
			</aside>		
		</div> <!-- div-sideNav -->
	</div> <!-- container -->
</main>

<jsp:include page="commonJSP/footer.jsp"/>

</body>
<script>
	autosize($('td textarea'));
	function noEnter()
	{
	   if(event.keyCode == 13)
	      event.returnValue=false;
	}
</script>
</html>