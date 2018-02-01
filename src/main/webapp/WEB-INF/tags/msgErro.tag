<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="erro" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:if test="${erro != null && !erro.isEmpty() }">
	<div class="alert alert-dismissible alert-danger">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <strong>Erro!</strong> ${erro }
	</div>
</c:if>