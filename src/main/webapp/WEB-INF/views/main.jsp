<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈페이지</title>
</head>
<style>

</style>
<body>

		<jsp:include page="common/nav.jsp" flush="true" />
		
		 <div class="row">
        <div class="col-md-4 offset-md-8">
            <table class="table table-striped" style="font-family: 'KBO-Dia-Gothic_bold';">
                <thead>
                    <tr>
                        <th scope="col">순위</th>
                        <th scope="col">팀명</th>
                        <th scope="col">경기</th>
                        <th scope="col">승</th>
                        <th scope="col">패</th>
                        <th scope="col">무</th>
                        <th scope="col">승률</th>
                        <th scope="col">연속</th>
                        <th scope="col">최근 10경기</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="team" items="${teamDataList}">
                    <tr>
                        <th scope="row">${team.rank}</th>
                        <td><img src="images/logo/${team.image}.png" width="25" height="25">   ${team.title}</td>
                        <td>${team.match}</td>
                        <td>${team.victory}</td>
                        <td>${team.defeat}</td>
                        <td>${team.draw}</td>
                        <td>${team.rate}</td>
                        <td>${team.winning}</td>
                        <td>${team.recent}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>