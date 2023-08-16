<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pt1.BrandDAO" %>
<%@ page import="pt1.BrandDTO" %>
<%@ page import="java.util.List" %>

<%
	//관리자 여부 체크
	String admId = (String)session.getAttribute("admId");
	String level_num = (String)session.getAttribute("level_num");
	if(!(level_num.equals("3"))){%>
	<script>
		alert("잘못된 경로입니다.");
		location="/pt1/main/main.jsp";
	</script>
<%}
	String brandNo=request.getParameter("brandNo");
	String pageNum = request.getParameter("pageNum");
	
	//브랜드 정보 불러오기
	BrandDAO dao = BrandDAO.getInstance();
	BrandDTO brand = dao.getBrand(Integer.parseInt(brandNo));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 입점 신청서</title>
<link rel="stylesheet" type="text/css" href="/pt1/resources/css/listTable.css">
</head>
<%@ include file="../header/listAdmin.jsp" %>
<body>
	<h1>브랜드 입점 신청</h1>
		<table border="1">
			<tr>
				<td>점주아이디</td>
				<td><%=brand.getStore_id()%></td>
			</tr>
			<tr>
				<td>브랜드번호</td>
				<td><%=brand.getBrandNo()%></td>
			</tr>
			<tr>
				<td>브랜드명</td>
				<td><%=brand.getBrand()%></td>
			</tr>
			<tr>
				<td>대표자</td>
				<td><%=brand.getRepresentative()%></td>
			</tr>
			<tr>
				<td>사업자등록번호</td>
				<td><%=brand.getBNumber()%></td>
			</tr>
			<tr>
				<td>업종</td>
				<td><%=brand.getSectors()%></td>
			</tr>
			<tr>
				<td>소재지</td>
				<td><%=brand.getBLocation()%></td>
			</tr>
			<tr>
				<td>사업자등록증</td>
				<td>
					<%=brand.getBFile()%>
					<a href="/pt1/admin/brandLaunchPermitPDF.jsp">다운로드</a>
				</td>
			</tr>
			<tr>
				<td>신청일</td>
				<td><%=brand.getApplication_date()%></td>
			</tr>
			<%if(brand.getPermit()==0){ %>
			<tr>
				<td colspan="2">
					<!-- <input type="button" value="거 절"> -->
					<form method="post" action="brandLaunchPermitPro.jsp">
						<input type="hidden" name="brandNo" value="<%=brand.getBrandNo()%>">
						<input type="hidden" name="pageNum" value="<%=pageNum%>">
						<input type="submit" value="수 락">
					</form>
					<input type="button" value="목록으로 돌아가기" onclick="location='brandList.jsp?pageNum=<%=pageNum%>'">					
				</td>
			</tr>
			<%} %>
		</table>
	</form>
</body>
</html>