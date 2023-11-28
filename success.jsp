<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Success Page</title>
    <style>
        .center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .link {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="center">
        <c:if test="${requestScope.msg!=null}">
            <h3><c:out value="${requestScope.msg}"></c:out></h3>
        </c:if>
    </div>
    <div class="center">
        <c:if test="${sessionScope.fileName!=null}">
            <c:set var="file" scope="session" value="${sessionScope.fileName}"/>  
        </c:if>
        <a class="link" href="<c:url value='DownloadServlet?fileName=${file}'/>">Download</a>
        <a class="link" href="<c:url value='file-list.jsp'/>">View List</a>
    </div>
</body>
</html>
