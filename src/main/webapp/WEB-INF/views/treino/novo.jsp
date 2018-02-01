<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Novo Treino">
	<div class="container ">
			<h2>Ficha de Treino</h2>
			<hr>
					
			<form:form action="/meutreino/salvar" method="post"  >
				<div class="form-group row">
					<label for="nome" class="col-sm-1 col-form-label">
						Descrição:
					</label>
					<div class="col-sm-11">
						<input type="text" class="form-control" id="descricao" name="descricao"
							placeholder="Treino A">
					</div>
				</div>				
				
				<br>
				<br>
				<hr>
				<button type="submit" class="btn btn-info btn-lg btn-block" >Salvar</button>
				<button type="reset" class="btn btn-primary btn-lg btn-block">Limpar</button>
			</form:form>
	</div>
</tags:pageTemplate>