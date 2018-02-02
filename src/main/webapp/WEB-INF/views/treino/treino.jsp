<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Novo Treino">
	<div class="container ">
			<h2>Ficha de Treino</h2>
			<hr>
					
				<input type="hidden" class="form-control" id="id" name="id"
						value="${treino.id }">
				<div class="form-group row">
					<label for="nome" class="col-sm-1 col-form-label">
						Descrição:
					</label>
					<div class="col-sm-12">
						<input type="text" class="form-control" id="descricao" name="descricao" disabled
						value="${treino.descricao }"
							placeholder="Ex: Treino A">
					</div>
				</div>	
				<hr>		
			<form:form action="/meutreino/salvar" method="post"  >
				<h4>Exercícios:</h4>	
					<div class="form-group row">
						<label for="nome" class="col-sm-1 col-form-label">
							Exercício:
						</label>
						<div class="col-sm-11">
							<input type="text" class="form-control" id="nome" name="nome"
								placeholder="Ex: Supino Inclinado">
						</div>
						
					</div>	
					<div class="form-group row">
						<label for="nome" class="col-sm-1 col-form-label">
							Repetições:
						</label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="repeticao" name="repeticao"
								placeholder="Ex: 3">
						</div>
						<label for="nome" class="col-sm-1 col-form-label">
							Peso:
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="peso" name="peso"
								placeholder="10">
						</div>
					</div>	
				<hr>
				<button type="submit" class="btn btn-info btn-lg btn-block" >Adicionar</button>
			</form:form>
	</div>
</tags:pageTemplate>