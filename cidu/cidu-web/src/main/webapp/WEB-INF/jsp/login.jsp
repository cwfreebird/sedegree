<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${pageContext.request.contextPath}/resource/dist/images/favicon.ico">
<title>登录</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resource/assets/styles.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/resource/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
</head>
<body id="login">
	<div class="container">
	  <c:url value="/login.do" var="loginUrl"/>
      <form class="form-signin" name="form" action="${loginUrl}" method="post">
        <h2 class="form-signin-heading">请登录</h2>
        <c:if test="${param.error != null}">
            <div class="alert alert-error">
                Invalid username and password.
            </div>
        </c:if>
        <c:if test="${param.logout != null}">
            <div class="alert alert-success">
                You have been logged out.
            </div>
        </c:if>
        <input type="text" id="username" name="username" class="input-block-level" placeholder="请输入用户名">
        <input type="password" type="password" id="password" name="password" class="input-block-level" placeholder="请输入密码">
        <!-- <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label> -->
        <button class="btn btn-large btn-primary" type="submit">登录</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </form>

    </div> <!-- /container -->
	
	<script src="${pageContext.request.contextPath}/resource/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/vendors/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/vendors/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/assets/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resource/assets/DT_bootstrap.js"></script>
    <script>
    $(function() {
        
    });
    </script>
</body>
</html>