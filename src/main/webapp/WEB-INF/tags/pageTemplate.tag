<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="titulo" required="true"%>
<%@ attribute name="bodyClass" required="false"%>
<%@ attribute name="extraScripts" fragment="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<!doctype html>
<html lang="pt_BR">
<head>
<spring:url value="/resources/css/bootstrap.min.flaty.css"
	var="bootstrap" />
<spring:url value="/resources/css/loading-spin.svg" var="loading-spin" />
<spring:url value="/resources/css/gymob.css" var="gymobcss" />
<spring:url value="/resources/js/bootstrap.min.js" var="bootstrapjs" />
<spring:url value="/resources/js/jquery-3.2.1.slim.min.js" var="jquery" />
<spring:url value="/resources/js/popper.min.js" var="popper" />
<spring:url value="/resources/js/gymob.js" var="docejs" />
<spring:url value="/resources/js/fontawesome-all.min.js"
	var="fonteawesome" />
<spring:url value="/resources/js/imgur/imgur.js" var="imgur" />
<spring:url value="/resources/js/imgur/upload.js" var="imgur_upload" />
<spring:url value="/resources/img/loading.gif" var="loadinggif" />

<title>GyMoB - ${titulo }</title>
<link rel="icon" type="image/svg+xml"
	href="data:image/svg+xml;base64,
PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMS45ODggNTExLjk4OCIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTExLjk4OCA1MTEuOTg4OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjUxMiIgaGVpZ2h0PSI1MTIiPjxnPjxyZWN0IHg9IjQyLjY1NSIgeT0iMTAuNjYzIiBzdHlsZT0iZmlsbDojRTZFOUVEOyIgd2lkdGg9IjI5OC42NyIgaGVpZ2h0PSI0MTUuOTgiIGRhdGEtb3JpZ2luYWw9IiNFNkU5RUQiPjwvcmVjdD48cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTM0MS4zMiwwSDQyLjY1NWMtNS44OTEsMC0xMC42NTYsNC43NzMtMTAuNjU2LDEwLjY2NHY0MTUuOTgzYzAsNS45MDYsNC43NjYsMTAuNjg4LDEwLjY1NiwxMC42ODggIEgzNDEuMzJjNS44OSwwLDEwLjY3MS00Ljc4MSwxMC42NzEtMTAuNjg4VjEwLjY2M0MzNTEuOTkxLDQuNzczLDM0Ny4yMSwwLDM0MS4zMiwweiBNMzMwLjY0OCw0MTUuOTlINTMuMzI3VjIxLjMzNWgyNzcuMzIyVjQxNS45OSAgSDMzMC42NDh6IiBkYXRhLW9yaWdpbmFsPSIjNDM0QTU0Ij48L3BhdGg+PHBvbHlnb24gc3R5bGU9ImZpbGw6I0ZGQ0U1NDsiIHBvaW50cz0iMjY2LjY0OSw1My4zMzQgMTE3LjMyNSw1My4zMzQgOTUuOTk3LDAgMjg3Ljk5MywwICIgZGF0YS1vcmlnaW5hbD0iI0ZGQ0U1NCI+PC9wb2x5Z29uPjxwYXRoIHN0eWxlPSJmaWxsOiNGNkJCNDI7IiBkPSJNMjEzLjMyMywxMC42NjNoLTQyLjY3MWMtNS44OTEsMC0xMC42NTYsNC43ODEtMTAuNjU2LDEwLjY3MXM0Ljc2NiwxMC42NjQsMTAuNjU2LDEwLjY2NGg0Mi42NzEgIGM1Ljg5LDAsMTAuNjcxLTQuNzczLDEwLjY3MS0xMC42NjRTMjE5LjIxMywxMC42NjMsMjEzLjMyMywxMC42NjN6IiBkYXRhLW9yaWdpbmFsPSIjRjZCQjQyIj48L3BhdGg+PGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTI4Ny41MDksMjU1Ljk5NEg5Ni40NjZjLTUuODkxLDAtMTAuNjU2LTQuNzczLTEwLjY1Ni0xMC42NjRzNC43NjYtMTAuNjcyLDEwLjY1Ni0xMC42NzJoMTkxLjA0MiAgIGM1Ljg5MSwwLDEwLjY3Miw0Ljc4MSwxMC42NzIsMTAuNjcyUzI5My4zOTksMjU1Ljk5NCwyODcuNTA5LDI1NS45OTR6IiBkYXRhLW9yaWdpbmFsPSIjNDM0QTU0Ij48L3BhdGg+Cgk8cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTI4Ny41MDksMjk4LjY0OUg5Ni40NjZjLTUuODkxLDAtMTAuNjU2LTQuNzY2LTEwLjY1Ni0xMC42NTZzNC43NjYtMTAuNjU2LDEwLjY1Ni0xMC42NTZoMTkxLjA0MiAgIGM1Ljg5MSwwLDEwLjY3Miw0Ljc2NiwxMC42NzIsMTAuNjU2UzI5My4zOTksMjk4LjY0OSwyODcuNTA5LDI5OC42NDl6IiBkYXRhLW9yaWdpbmFsPSIjNDM0QTU0Ij48L3BhdGg+Cgk8cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTE5MS45OTUsMzQxLjMzNkg5Ni40NjZjLTUuODkxLDAtMTAuNjU2LTQuNzgxLTEwLjY1Ni0xMC42ODhjMC01Ljg3NSw0Ljc2Ni0xMC42NTYsMTAuNjU2LTEwLjY1NiAgIGg5NS41MjljNS44OSwwLDEwLjY1Niw0Ljc4MSwxMC42NTYsMTAuNjU2QzIwMi42NTEsMzM2LjU1NSwxOTcuODg2LDM0MS4zMzYsMTkxLjk5NSwzNDEuMzM2eiIgZGF0YS1vcmlnaW5hbD0iIzQzNEE1NCI+PC9wYXRoPgo8L2c+PGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojREE0NDUzOyIgZD0iTTIwMi42NTEsMTkxLjk5NWMtMi43MTksMC01LjQ1My0xLjAzOS03LjUzMS0zLjEyNWMtNC4xNzEtNC4xNjQtNC4xNzEtMTAuOTIxLDAtMTUuMDg1ICAgbDYzLjk5OC02My45OTljNC4xNTYtNC4xNjQsMTAuOTA2LTQuMTY0LDE1LjA3OCwwczQuMTcyLDEwLjkyMiwwLDE1LjA4NmwtNjMuOTk4LDYzLjk5OCAgIEMyMDguMTIsMTkwLjk1NiwyMDUuMzg2LDE5MS45OTUsMjAyLjY1MSwxOTEuOTk1eiIgZGF0YS1vcmlnaW5hbD0iI0RBNDQ1MyI+PC9wYXRoPgoJPHBhdGggc3R5bGU9ImZpbGw6I0RBNDQ1MzsiIGQ9Ik0yMDIuNjUxLDE5MS45OTVjLTEuOTM4LDAtMy44OTEtMC41MjMtNS42NTYtMS42MjVsLTg1LjMyNi01My4zMjcgICBjLTUtMy4xMjUtNi41MTUtOS43MDMtMy4zOTEtMTQuNzAzYzMuMTI1LTQuOTkyLDkuNzAzLTYuNTE2LDE0LjcwMy0zLjM5MWw4NS4zMjYsNTMuMzM1YzUsMy4xMTcsNi41MTUsOS43MDMsMy4zOTEsMTQuNjk0ICAgQzIwOS42ODIsMTkwLjIyMiwyMDYuMTk4LDE5MS45OTUsMjAyLjY1MSwxOTEuOTk1eiIgZGF0YS1vcmlnaW5hbD0iI0RBNDQ1MyI+PC9wYXRoPgo8L2c+PGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojRUQ1NTY0OyIgZD0iTTExNy4zMjUsOTUuOTk3Yy0xNy42NCwwLTMxLjk5OSwxNC4zNTEtMzEuOTk5LDMyYzAsMTcuNjQsMTQuMzU5LDMxLjk5OSwzMS45OTksMzEuOTk5ICAgczMyLTE0LjM1OSwzMi0zMS45OTlDMTQ5LjMyNSwxMTAuMzQ4LDEzNC45NjUsOTUuOTk3LDExNy4zMjUsOTUuOTk3eiIgZGF0YS1vcmlnaW5hbD0iI0VENTU2NCI+PC9wYXRoPgoJPHBhdGggc3R5bGU9ImZpbGw6I0VENTU2NDsiIGQ9Ik0yMDIuNjUxLDE0OS4zMzJjLTE3LjY0LDAtMzEuOTk5LDE0LjM1Mi0zMS45OTksMzJjMCwxNy42NCwxNC4zNTksMzIsMzEuOTk5LDMyICAgYzE3LjY1NiwwLDMyLTE0LjM1OSwzMi0zMkMyMzQuNjUxLDE2My42ODMsMjIwLjMwNywxNDkuMzMyLDIwMi42NTEsMTQ5LjMzMnoiIGRhdGEtb3JpZ2luYWw9IiNFRDU1NjQiPjwvcGF0aD4KCTxwYXRoIHN0eWxlPSJmaWxsOiNFRDU1NjQ7IiBkPSJNMjY2LjY0OSw4NS4zMzRjLTE3LjY0LDAtMzEuOTk5LDE0LjM1MS0zMS45OTksMzEuOTk5YzAsMTcuNjQsMTQuMzU5LDMxLjk5OSwzMS45OTksMzEuOTk5ICAgYzE3LjY1NiwwLDMyLTE0LjM1OSwzMi0zMS45OTlDMjk4LjY0OSw5OS42ODUsMjg0LjMwNiw4NS4zMzQsMjY2LjY0OSw4NS4zMzR6IiBkYXRhLW9yaWdpbmFsPSIjRUQ1NTY0Ij48L3BhdGg+CjwvZz48cGF0aCBzdHlsZT0iZmlsbDojNjU2RDc4OyIgZD0iTTQ2OS4zMTcsMzczLjMzNUg4NS4zMjZjLTUuODkxLDAtMTAuNjcyLDQuNzY2LTEwLjY3MiwxMC42NTZ2NDIuNjU1ICBjMCw1LjkwNiw0Ljc4MSwxMC42ODgsMTAuNjcyLDEwLjY4OGgzODMuOTkxYzUuODkxLDAsMTAuNjcyLTQuNzgxLDEwLjY3Mi0xMC42ODh2LTQyLjY1NSAgQzQ3OS45ODksMzc4LjEsNDc1LjIwOCwzNzMuMzM1LDQ2OS4zMTcsMzczLjMzNXoiIGRhdGEtb3JpZ2luYWw9IiM2NTZENzgiPjwvcGF0aD48cGF0aCBzdHlsZT0iZmlsbDojREE0NDUzOyIgZD0iTTE0OS4zMjUsMzMwLjY0OGMtMTcuNjQxLDAtMzIsMTQuMzc1LTMyLDMydjg1LjM0MmMwLDE3LjY1NSwxNC4zNTksMzEuOTk4LDMyLDMxLjk5OCAgYzE3LjY0LDAsMzEuOTk5LTE0LjM0MywzMS45OTktMzEuOTk4di04NS4zNDJDMTgxLjMyNCwzNDUuMDIzLDE2Ni45NjUsMzMwLjY0OCwxNDkuMzI1LDMzMC42NDh6IiBkYXRhLW9yaWdpbmFsPSIjREE0NDUzIj48L3BhdGg+PHBhdGggc3R5bGU9ImZpbGw6I0VENTU2NDsiIGQ9Ik0yMDIuNjUxLDI5OC42NDljLTE3LjY0LDAtMzEuOTk5LDE0LjM3NC0zMS45OTksMzEuOTk5djE0OS4zNGMwLDE3LjY1NiwxNC4zNTksMzIsMzEuOTk5LDMyICBjMTcuNjU2LDAsMzItMTQuMzQ0LDMyLTMydi0xNDkuMzRDMjM0LjY1MSwzMTMuMDIzLDIyMC4zMDcsMjk4LjY0OSwyMDIuNjUxLDI5OC42NDl6IiBkYXRhLW9yaWdpbmFsPSIjRUQ1NTY0Ij48L3BhdGg+PHBhdGggc3R5bGU9ImZpbGw6I0RBNDQ1MzsiIGQ9Ik00MDUuMzE5LDMzMC42NDhjLTE3LjY0MSwwLTMyLDE0LjM3NS0zMiwzMnY4NS4zNDJjMCwxNy42NTUsMTQuMzU5LDMxLjk5OCwzMiwzMS45OTggIGMxNy42NCwwLDMxLjk5OC0xNC4zNDMsMzEuOTk4LTMxLjk5OHYtODUuMzQyQzQzNy4zMTcsMzQ1LjAyMyw0MjIuOTU5LDMzMC42NDgsNDA1LjMxOSwzMzAuNjQ4eiIgZGF0YS1vcmlnaW5hbD0iI0RBNDQ1MyI+PC9wYXRoPjxwYXRoIHN0eWxlPSJmaWxsOiNFRDU1NjQ7IiBkPSJNMzUxLjk5MSwyOTguNjQ5Yy0xNy42NTUsMC0zMS45OTgsMTQuMzc0LTMxLjk5OCwzMS45OTl2MTQ5LjM0YzAsMTcuNjU2LDE0LjM0MywzMiwzMS45OTgsMzIgIGMxNy42NDEsMCwzMi0xNC4zNDQsMzItMzJ2LTE0OS4zNEMzODMuOTkxLDMxMy4wMjMsMzY5LjYzMiwyOTguNjQ5LDM1MS45OTEsMjk4LjY0OXoiIGRhdGEtb3JpZ2luYWw9IiNFRDU1NjQiPjwvcGF0aD48Zz4KCTxwYXRoIHN0eWxlPSJmaWxsOiM0MzRBNTQ7IiBkPSJNNDc5Ljk4OSwzOTQuNjQ2Yy0yLjczNCwwLTUuNDY5LDEuMDYyLTcuNTQ3LDMuMTI1Yy00LjE3Miw0LjE3Mi00LjE3MiwxMC45MzgsMCwxNS4wOTQgICBjMi4wNzgsMi4wOTQsNC44MTIsMy4xMjUsNy41NDcsMy4xMjVWMzk0LjY0NnoiIGRhdGEtb3JpZ2luYWw9IiM0MzRBNTQiPjwvcGF0aD4KCTxwYXRoIHN0eWxlPSJmaWxsOiM0MzRBNTQ7IiBkPSJNNzQuNjU0LDM5NC42NDZ2MjEuMzQ0YzIuNzM0LDAsNS40NjktMS4wMzEsNy41NDctMy4xMjVjNC4xNzEtNC4xNTYsNC4xNzEtMTAuOTIyLDAtMTUuMDk0ICAgQzgwLjEyMywzOTUuNzA5LDc3LjM4OSwzOTQuNjQ2LDc0LjY1NCwzOTQuNjQ2eiIgZGF0YS1vcmlnaW5hbD0iIzQzNEE1NCI+PC9wYXRoPgo8L2c+PC9nPiA8L3N2Zz4=" />
<link rel="manifest" href="/manifest">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link href="${bootstrap}" rel="stylesheet" />
<link href="${gymobcss}" rel="stylesheet" />
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="/">
				<h2>
					<img width="60" height="60" class="d-inline-block  "
						src="data:image/svg+xml;base64,
PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMS45ODggNTExLjk4OCIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTExLjk4OCA1MTEuOTg4OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjUxMiIgaGVpZ2h0PSI1MTIiPjxnPjxyZWN0IHg9IjQyLjY1NSIgeT0iMTAuNjYzIiBzdHlsZT0iZmlsbDojRTZFOUVEOyIgd2lkdGg9IjI5OC42NyIgaGVpZ2h0PSI0MTUuOTgiIGRhdGEtb3JpZ2luYWw9IiNFNkU5RUQiPjwvcmVjdD48cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTM0MS4zMiwwSDQyLjY1NWMtNS44OTEsMC0xMC42NTYsNC43NzMtMTAuNjU2LDEwLjY2NHY0MTUuOTgzYzAsNS45MDYsNC43NjYsMTAuNjg4LDEwLjY1NiwxMC42ODggIEgzNDEuMzJjNS44OSwwLDEwLjY3MS00Ljc4MSwxMC42NzEtMTAuNjg4VjEwLjY2M0MzNTEuOTkxLDQuNzczLDM0Ny4yMSwwLDM0MS4zMiwweiBNMzMwLjY0OCw0MTUuOTlINTMuMzI3VjIxLjMzNWgyNzcuMzIyVjQxNS45OSAgSDMzMC42NDh6IiBkYXRhLW9yaWdpbmFsPSIjNDM0QTU0Ij48L3BhdGg+PHBvbHlnb24gc3R5bGU9ImZpbGw6I0ZGQ0U1NDsiIHBvaW50cz0iMjY2LjY0OSw1My4zMzQgMTE3LjMyNSw1My4zMzQgOTUuOTk3LDAgMjg3Ljk5MywwICIgZGF0YS1vcmlnaW5hbD0iI0ZGQ0U1NCI+PC9wb2x5Z29uPjxwYXRoIHN0eWxlPSJmaWxsOiNGNkJCNDI7IiBkPSJNMjEzLjMyMywxMC42NjNoLTQyLjY3MWMtNS44OTEsMC0xMC42NTYsNC43ODEtMTAuNjU2LDEwLjY3MXM0Ljc2NiwxMC42NjQsMTAuNjU2LDEwLjY2NGg0Mi42NzEgIGM1Ljg5LDAsMTAuNjcxLTQuNzczLDEwLjY3MS0xMC42NjRTMjE5LjIxMywxMC42NjMsMjEzLjMyMywxMC42NjN6IiBkYXRhLW9yaWdpbmFsPSIjRjZCQjQyIj48L3BhdGg+PGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTI4Ny41MDksMjU1Ljk5NEg5Ni40NjZjLTUuODkxLDAtMTAuNjU2LTQuNzczLTEwLjY1Ni0xMC42NjRzNC43NjYtMTAuNjcyLDEwLjY1Ni0xMC42NzJoMTkxLjA0MiAgIGM1Ljg5MSwwLDEwLjY3Miw0Ljc4MSwxMC42NzIsMTAuNjcyUzI5My4zOTksMjU1Ljk5NCwyODcuNTA5LDI1NS45OTR6IiBkYXRhLW9yaWdpbmFsPSIjNDM0QTU0Ij48L3BhdGg+Cgk8cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTI4Ny41MDksMjk4LjY0OUg5Ni40NjZjLTUuODkxLDAtMTAuNjU2LTQuNzY2LTEwLjY1Ni0xMC42NTZzNC43NjYtMTAuNjU2LDEwLjY1Ni0xMC42NTZoMTkxLjA0MiAgIGM1Ljg5MSwwLDEwLjY3Miw0Ljc2NiwxMC42NzIsMTAuNjU2UzI5My4zOTksMjk4LjY0OSwyODcuNTA5LDI5OC42NDl6IiBkYXRhLW9yaWdpbmFsPSIjNDM0QTU0Ij48L3BhdGg+Cgk8cGF0aCBzdHlsZT0iZmlsbDojNDM0QTU0OyIgZD0iTTE5MS45OTUsMzQxLjMzNkg5Ni40NjZjLTUuODkxLDAtMTAuNjU2LTQuNzgxLTEwLjY1Ni0xMC42ODhjMC01Ljg3NSw0Ljc2Ni0xMC42NTYsMTAuNjU2LTEwLjY1NiAgIGg5NS41MjljNS44OSwwLDEwLjY1Niw0Ljc4MSwxMC42NTYsMTAuNjU2QzIwMi42NTEsMzM2LjU1NSwxOTcuODg2LDM0MS4zMzYsMTkxLjk5NSwzNDEuMzM2eiIgZGF0YS1vcmlnaW5hbD0iIzQzNEE1NCI+PC9wYXRoPgo8L2c+PGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojREE0NDUzOyIgZD0iTTIwMi42NTEsMTkxLjk5NWMtMi43MTksMC01LjQ1My0xLjAzOS03LjUzMS0zLjEyNWMtNC4xNzEtNC4xNjQtNC4xNzEtMTAuOTIxLDAtMTUuMDg1ICAgbDYzLjk5OC02My45OTljNC4xNTYtNC4xNjQsMTAuOTA2LTQuMTY0LDE1LjA3OCwwczQuMTcyLDEwLjkyMiwwLDE1LjA4NmwtNjMuOTk4LDYzLjk5OCAgIEMyMDguMTIsMTkwLjk1NiwyMDUuMzg2LDE5MS45OTUsMjAyLjY1MSwxOTEuOTk1eiIgZGF0YS1vcmlnaW5hbD0iI0RBNDQ1MyI+PC9wYXRoPgoJPHBhdGggc3R5bGU9ImZpbGw6I0RBNDQ1MzsiIGQ9Ik0yMDIuNjUxLDE5MS45OTVjLTEuOTM4LDAtMy44OTEtMC41MjMtNS42NTYtMS42MjVsLTg1LjMyNi01My4zMjcgICBjLTUtMy4xMjUtNi41MTUtOS43MDMtMy4zOTEtMTQuNzAzYzMuMTI1LTQuOTkyLDkuNzAzLTYuNTE2LDE0LjcwMy0zLjM5MWw4NS4zMjYsNTMuMzM1YzUsMy4xMTcsNi41MTUsOS43MDMsMy4zOTEsMTQuNjk0ICAgQzIwOS42ODIsMTkwLjIyMiwyMDYuMTk4LDE5MS45OTUsMjAyLjY1MSwxOTEuOTk1eiIgZGF0YS1vcmlnaW5hbD0iI0RBNDQ1MyI+PC9wYXRoPgo8L2c+PGc+Cgk8cGF0aCBzdHlsZT0iZmlsbDojRUQ1NTY0OyIgZD0iTTExNy4zMjUsOTUuOTk3Yy0xNy42NCwwLTMxLjk5OSwxNC4zNTEtMzEuOTk5LDMyYzAsMTcuNjQsMTQuMzU5LDMxLjk5OSwzMS45OTksMzEuOTk5ICAgczMyLTE0LjM1OSwzMi0zMS45OTlDMTQ5LjMyNSwxMTAuMzQ4LDEzNC45NjUsOTUuOTk3LDExNy4zMjUsOTUuOTk3eiIgZGF0YS1vcmlnaW5hbD0iI0VENTU2NCI+PC9wYXRoPgoJPHBhdGggc3R5bGU9ImZpbGw6I0VENTU2NDsiIGQ9Ik0yMDIuNjUxLDE0OS4zMzJjLTE3LjY0LDAtMzEuOTk5LDE0LjM1Mi0zMS45OTksMzJjMCwxNy42NCwxNC4zNTksMzIsMzEuOTk5LDMyICAgYzE3LjY1NiwwLDMyLTE0LjM1OSwzMi0zMkMyMzQuNjUxLDE2My42ODMsMjIwLjMwNywxNDkuMzMyLDIwMi42NTEsMTQ5LjMzMnoiIGRhdGEtb3JpZ2luYWw9IiNFRDU1NjQiPjwvcGF0aD4KCTxwYXRoIHN0eWxlPSJmaWxsOiNFRDU1NjQ7IiBkPSJNMjY2LjY0OSw4NS4zMzRjLTE3LjY0LDAtMzEuOTk5LDE0LjM1MS0zMS45OTksMzEuOTk5YzAsMTcuNjQsMTQuMzU5LDMxLjk5OSwzMS45OTksMzEuOTk5ICAgYzE3LjY1NiwwLDMyLTE0LjM1OSwzMi0zMS45OTlDMjk4LjY0OSw5OS42ODUsMjg0LjMwNiw4NS4zMzQsMjY2LjY0OSw4NS4zMzR6IiBkYXRhLW9yaWdpbmFsPSIjRUQ1NTY0Ij48L3BhdGg+CjwvZz48cGF0aCBzdHlsZT0iZmlsbDojNjU2RDc4OyIgZD0iTTQ2OS4zMTcsMzczLjMzNUg4NS4zMjZjLTUuODkxLDAtMTAuNjcyLDQuNzY2LTEwLjY3MiwxMC42NTZ2NDIuNjU1ICBjMCw1LjkwNiw0Ljc4MSwxMC42ODgsMTAuNjcyLDEwLjY4OGgzODMuOTkxYzUuODkxLDAsMTAuNjcyLTQuNzgxLDEwLjY3Mi0xMC42ODh2LTQyLjY1NSAgQzQ3OS45ODksMzc4LjEsNDc1LjIwOCwzNzMuMzM1LDQ2OS4zMTcsMzczLjMzNXoiIGRhdGEtb3JpZ2luYWw9IiM2NTZENzgiPjwvcGF0aD48cGF0aCBzdHlsZT0iZmlsbDojREE0NDUzOyIgZD0iTTE0OS4zMjUsMzMwLjY0OGMtMTcuNjQxLDAtMzIsMTQuMzc1LTMyLDMydjg1LjM0MmMwLDE3LjY1NSwxNC4zNTksMzEuOTk4LDMyLDMxLjk5OCAgYzE3LjY0LDAsMzEuOTk5LTE0LjM0MywzMS45OTktMzEuOTk4di04NS4zNDJDMTgxLjMyNCwzNDUuMDIzLDE2Ni45NjUsMzMwLjY0OCwxNDkuMzI1LDMzMC42NDh6IiBkYXRhLW9yaWdpbmFsPSIjREE0NDUzIj48L3BhdGg+PHBhdGggc3R5bGU9ImZpbGw6I0VENTU2NDsiIGQ9Ik0yMDIuNjUxLDI5OC42NDljLTE3LjY0LDAtMzEuOTk5LDE0LjM3NC0zMS45OTksMzEuOTk5djE0OS4zNGMwLDE3LjY1NiwxNC4zNTksMzIsMzEuOTk5LDMyICBjMTcuNjU2LDAsMzItMTQuMzQ0LDMyLTMydi0xNDkuMzRDMjM0LjY1MSwzMTMuMDIzLDIyMC4zMDcsMjk4LjY0OSwyMDIuNjUxLDI5OC42NDl6IiBkYXRhLW9yaWdpbmFsPSIjRUQ1NTY0Ij48L3BhdGg+PHBhdGggc3R5bGU9ImZpbGw6I0RBNDQ1MzsiIGQ9Ik00MDUuMzE5LDMzMC42NDhjLTE3LjY0MSwwLTMyLDE0LjM3NS0zMiwzMnY4NS4zNDJjMCwxNy42NTUsMTQuMzU5LDMxLjk5OCwzMiwzMS45OTggIGMxNy42NCwwLDMxLjk5OC0xNC4zNDMsMzEuOTk4LTMxLjk5OHYtODUuMzQyQzQzNy4zMTcsMzQ1LjAyMyw0MjIuOTU5LDMzMC42NDgsNDA1LjMxOSwzMzAuNjQ4eiIgZGF0YS1vcmlnaW5hbD0iI0RBNDQ1MyI+PC9wYXRoPjxwYXRoIHN0eWxlPSJmaWxsOiNFRDU1NjQ7IiBkPSJNMzUxLjk5MSwyOTguNjQ5Yy0xNy42NTUsMC0zMS45OTgsMTQuMzc0LTMxLjk5OCwzMS45OTl2MTQ5LjM0YzAsMTcuNjU2LDE0LjM0MywzMiwzMS45OTgsMzIgIGMxNy42NDEsMCwzMi0xNC4zNDQsMzItMzJ2LTE0OS4zNEMzODMuOTkxLDMxMy4wMjMsMzY5LjYzMiwyOTguNjQ5LDM1MS45OTEsMjk4LjY0OXoiIGRhdGEtb3JpZ2luYWw9IiNFRDU1NjQiPjwvcGF0aD48Zz4KCTxwYXRoIHN0eWxlPSJmaWxsOiM0MzRBNTQ7IiBkPSJNNDc5Ljk4OSwzOTQuNjQ2Yy0yLjczNCwwLTUuNDY5LDEuMDYyLTcuNTQ3LDMuMTI1Yy00LjE3Miw0LjE3Mi00LjE3MiwxMC45MzgsMCwxNS4wOTQgICBjMi4wNzgsMi4wOTQsNC44MTIsMy4xMjUsNy41NDcsMy4xMjVWMzk0LjY0NnoiIGRhdGEtb3JpZ2luYWw9IiM0MzRBNTQiPjwvcGF0aD4KCTxwYXRoIHN0eWxlPSJmaWxsOiM0MzRBNTQ7IiBkPSJNNzQuNjU0LDM5NC42NDZ2MjEuMzQ0YzIuNzM0LDAsNS40NjktMS4wMzEsNy41NDctMy4xMjVjNC4xNzEtNC4xNTYsNC4xNzEtMTAuOTIyLDAtMTUuMDk0ICAgQzgwLjEyMywzOTUuNzA5LDc3LjM4OSwzOTQuNjQ2LDc0LjY1NCwzOTQuNjQ2eiIgZGF0YS1vcmlnaW5hbD0iIzQzNEE1NCI+PC9wYXRoPgo8L2c+PC9nPiA8L3N2Zz4=" />
					<strong class="align-middle">GyMoB</strong>
				</h2>
			</a>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<sec:authorize access="isAuthenticated()">
						<a class="nav-link" href="/meutreino"> <strong>Meus
								Treinos</strong> <span class="sr-only">(current)</span>
						</a>
					</sec:authorize>


					<li class="nav-item printaCEL"><sec:authorize
							access="isAuthenticated()">
							<a class="nav-link" href="/logout"> <strong>Sair</strong> <span
								class="sr-only">(current)</span>
							</a>
						</sec:authorize></li>

				</ul>
				<span class="printaPC float-right">
					<div class="collapse navbar-collapse" id="navbarColor01">
						<ul class="navbar-nav mr-auto">

							<sec:authorize access="isAuthenticated()">
								<li class="nav-item"><a class="nav-link" href="/logout">
										<strong>Sair </strong> <span class="sr-only">(current)</span>
								</a></li>
							</sec:authorize>
						</ul>
					</div>
				</span>
			</div>
		</nav>

	</header>

	<p class="bg-secondary posheader"></p>
	<tags:msgSucesso sucesso="${sucesso }" />
	<tags:msgErro erro="${erro }" />
	<br>

	<jsp:doBody />

	<!-- FOOTER -->
	<br>
	<br>
	<footer class="footer table-primary">

		<div class=" navbar-dark table-primary ">

			<div class="container  table-primary ">
				<p>
					© 2018 GyMoB <br> <span class=""> Desenvolvido por <a
						href="https://www.facebook.com/leorochaz">Leonardo Rocha</a></span>
					<!--  <div>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div> -->
				</p>
			</div>

		</div>

	</footer>

	<!-- Modal -->
	<div class="modal fade" id="modalCarregar" tabindex="-1" role="dialog" data-backdrop="static"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
				<div style="width: 100%">
					<div align="center">
						<img alt="Carregando" src="${loadinggif }" style="width: 100px;height: 100px">
					</div>
				</div>
				
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="${jquery}"></script>
	<script src="${popper}"></script>
	<script src="${bootstrapjs}"></script>
	<script src="${fonteawesome}"></script>
	<script src="${imgur}"></script>
	<script src="${imgur_upload}"></script>
	<script src="${docejs}"></script>
</body>
</html>

