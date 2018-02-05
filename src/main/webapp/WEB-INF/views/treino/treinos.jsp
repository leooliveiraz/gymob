<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tags:pageTemplate titulo="Meus Treinos">

	<div class="container">
		<div class="titulo">
			<div class="float-left">
				<h2>Meus Treinos</h2>
			</div>
			<div class="float-right">
				<a href="/meutreino/novo" class="btn btn-lg btn-primary">+</a>
			</div>
		</div>
		<hr>
		<div class="row">
			<c:forEach items="${listaTreino }" var="t">
				<a href="/meutreino/${t.id}" class="col-4 cardtreino" id="link${t.id}"
					onclick="carregarModal()">
					<div class="card text-white bg-info mb-3  cardtreino">
						<div class="card-header">
							<strong>${t.descricao} </strong>
						</div>
						<div class="card-body">
							<p class="card-text">Exercicio 1.</p>
							<p class="card-text">Exercicio 2.</p>
							<p class="card-text">Exercicio 3.</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>


	</div>

</tags:pageTemplate>