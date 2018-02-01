<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<tags:pageTemplate titulo="Novo Usuário">
	<div class="container ">
		<div class="container-fluid ">
			<h1>Cadastro de Usuário</h1>
			<hr>
		
		<tags:msgSucesso sucesso="${sucesso }" />
		<tags:msgErro erro="${erro }" />
			
			<form:form action="/usuario/salvar" method="post"  >
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						Nome:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome"
							placeholder="Nome">
					</div>
				</div>
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						Usuário:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="usuario" name="username"
							placeholder="Usuário">
					</div>
				</div> 
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						CPF:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cpf" name="cpf"
							placeholder="CPF do usuário">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">
						Email:
					</label>
					<div class="col-sm-10">
						<input  type="email" class="form-control" id="email"  name="email"
							placeholder="Informe o email do usuário">
					</div>
				</div>
				<div class="form-group row">
					<label for="nome" class="col-sm-2 col-form-label">
						Telefone:
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="celular" name="celular"
							placeholder="Telefone">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="senha" class="col-sm-2 col-form-label">
						Senha:
					</label>
					<div class="col-sm-10">
						<input  type="password" class="form-control" id="senha"  name="senha"
							placeholder="Informe a senha">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="senha_validacao" class="col-sm-2 col-form-label">
						Repita a senha:
					</label>
					<div class="col-sm-10">
						<input  type="password" class="form-control" id="senha_validacao"  name="senha_validacao"
							placeholder="Repita a senha">
					</div>
				</div>
				
				
				<br>
				<br>
				<button type="submit" class="btn btn-success btn-lg btn-block" >Cadastrar</button>
				<button type="reset" class="btn btn-primary btn-lg btn-block">Limpar</button>
			</form:form>
		</div>
	</div>
</tags:pageTemplate>