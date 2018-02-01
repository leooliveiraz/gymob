<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="sucesso" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<c:if test="${sucesso != null && !sucesso.isEmpty() }">
	<div class="alert alert-dismissible alert-success">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <strong>Sucesso!</strong> ${sucesso }
	</div>
</c:if>