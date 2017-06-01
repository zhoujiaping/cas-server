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
			<c:if test="${not pageContext.request.secure}">
				<div id="msg" class="errors">
					<h2>不安全的链接</h2>
					<p>您当前使用不安全的链接，单点登录将不会起作用，请使用安全的https链接</p>
				</div>
			</c:if>
			<div class="box" id="login">
				<form:form method="post" id="fm1" commandName="${commandName}"
					htmlEscape="true">
					<form:errors path="*" id="msg" cssClass="errors" element="div"
						htmlEscape="false" />
					<h2>
						<spring:message code="screen.welcome.instructions" />
					</h2>
					<section class="row">
						<label for="username"><spring:message
								code="screen.welcome.label.netid" /></label>
						<c:choose>
							<c:when test="${not empty sessionScope.openIdLocalId}">
								<strong>${sessionScope.openIdLocalId}</strong>
								<input type="hidden" id="username" name="username"
									value="${sessionScope.openIdLocalId}" />
							</c:when>
							<c:otherwise>
								<spring:message code="screen.welcome.label.netid.accesskey"
									var="userNameAccessKey" />
								<form:input cssClass="required" cssErrorClass="error"
									id="username" size="25" tabindex="1"
									accesskey="${userNameAccessKey}" path="username"
									autocomplete="off" htmlEscape="true" />
							</c:otherwise>
						</c:choose>
					</section>

					<section class="row">
						<label for="password"><spring:message
								code="screen.welcome.label.password" /></label>
						<spring:message code="screen.welcome.label.password.accesskey"
							var="passwordAccessKey" />
						<form:password cssClass="required" cssErrorClass="error"
							id="password" size="25" tabindex="2" path="password"
							accesskey="${passwordAccessKey}" htmlEscape="true"
							autocomplete="off" />
					</section>

					<section class="row check">
						<input id="warn" name="warn" value="true" tabindex="3"
							accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />"
							type="checkbox" /> <label for="warn"><spring:message
								code="screen.welcome.label.warn" /></label>
					</section>

					<section class="row btn-row">
						<input type="hidden" name="lt" value="${loginTicket}" /> <input
							type="hidden" name="execution" value="${flowExecutionKey}" /> <input
							type="hidden" name="_eventId" value="submit" /> <input
							class="btn-submit" name="submit" accesskey="l"
							value="<spring:message code="screen.welcome.button.login" />"
							tabindex="4" type="submit" /> <input class="btn-reset"
							name="reset" accesskey="c"
							value="<spring:message code="screen.welcome.button.clear" />"
							tabindex="5" type="reset" />
					</section>
				</form:form>
			</div>
		</div>
		<!-- END #content -->
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
