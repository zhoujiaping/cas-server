<!DOCTYPE html>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="zh">
<head>
<meta charset="UTF-8" />

<title>政法系统单点登录</title>

</head>
<body id="cas">
	<div id="container">
		<header>
			<h1>政法系统</h1>
		</header>
		<div id="content">
  <div id="msg" class="success">
    <h2><spring:message code="screen.logout.header" /></h2>
    <p><spring:message code="screen.logout.success" /></p>
    <p><spring:message code="screen.logout.security" /></p>
  </div>
</div>
	<!-- END #container -->

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

	<!-- <script type="text/javascript"
		src="https://github.com/cowboy/javascript-debug/raw/master/ba-debug.min.js"></script> -->

	<spring:theme code="cas.javascript.file" var="casJavascriptFile"
		text="" />
	<script type="text/javascript"
		src="<c:url value="${casJavascriptFile}" />"></script>
</body>
</html>