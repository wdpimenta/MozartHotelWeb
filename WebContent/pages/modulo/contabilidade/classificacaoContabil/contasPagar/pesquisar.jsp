<%@ page contentType="text/html;charset=iso-8859-1"%>
<%@taglib uri="http://marcioduques.com/duquesLib" prefix="duques"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<script>
	$('#linhaMovimentoContabil').css('display','block');

    function init(){
        
    }

    function onEnter(){
        
    }

	
	function prepararAlteracao(){
		vForm = document.forms[0];
		vForm.action = '<s:url action="manterClassificacaoContabilCPagar!prepararAlteracao.action" namespace="/app/contabilidade" />';
		submitForm( vForm );
	}

    function pesquisar(){
		vForm = document.forms[0];
		submitForm( vForm );
     }
	

	function prepararInclusao(){
		vForm = document.forms[0];
		vForm.action = '<s:url action="manterClassificacaoContabilCPagar!prepararInclusao.action" namespace="/app/contabilidade" />';
		submitForm( vForm );
	}
		
    with(milonic=new menuname("cPagar")){
        margin=3;
        style=contextStyle;
        top="offset=2";
       // aI("image=imagens/iconic/png/x-3x.png;text=Excluir;url=javascript:prepararExclusao();");
        aI("image=imagens/btnAlterar.png;text=Alterar;url=javascript:prepararAlteracao();");
        drawMenus(); 
    }
   
    
    </script>

 	<%
       String titulo = "Configura��o Classifica��o Cont�bil Contas a Pagar";
       String requestvalue = request.getParameter("filtro.filtroTipoPesquisa");
       
    %>
    <script>
    currentMenu = "cPagar"; 
    </script>
  <s:form action="manterClassificacaoContabilCPagar!pesquisar.action" namespace="/app/contabilidade" theme="simple" >

    <div class="divFiltroPaiTop">Contas a Pagar</div>   
    <div id="divFiltroPai" class="divFiltroPai">
        <div id="divFiltro" class="divFiltro"  >
            <duques:filtro tableName="CLASSIFICACAO_FATURAMENTO_WEB" titulo="" />
        </div>
    </div> 
    <div id="divMeio" class="divMeio">
        <div id="divBotao" class="divBotao">
            <duques:botao label="Pesquisar" 	imagem="imagens/iconic/png/magnifying-glass-3x.png" onClick="pesquisar();"/>
            <s:if test="%{#session.listaPesquisa.size() == 0}">
            	<duques:botao label="Novo" 			imagem="imagens/iconic/png/plus-3x.png" onClick="prepararInclusao();" />
            </s:if>
        </div>
    </div>
    
 <!-- grid -->     
    <duques:grid colecao="listaPesquisa" titulo="<%=titulo%>"
    			 condicao="" current="obj" 
    			 idAlteracaoValue="idClassificacaoContabil" idAlteracao="idAlteracao"
				 urlRetorno="pages/modulo/contabilidade/classificacaoContabil/contasPagar/pesquisar.jsp">

    	<duques:column labelProperty="Classifica��o Contabil"  	propertyValue="idClassificacaoContabil" />		 
    	<duques:column labelProperty="Descricao"       			propertyValue="descricao"  				style="width:350px;" />		 
       	<duques:column labelProperty="Conta D�bito"      		propertyValue="nmContaDebito"			style="width:200px;" />
        <duques:column labelProperty="Centro de Custo D�bito" 	propertyValue="nmCentroCustoDebito"     />
        <duques:column labelProperty="Conta Cr�dito"      		propertyValue="nmContaCredito"			style="width:200px;"/>
        <duques:column labelProperty="Centro de Custo Cr�dito" 	propertyValue="nmCentroCustoCredito"    />
        <duques:column labelProperty="PIS"		 				propertyValue="pis"       				style="width:80px;"/>
        
    </duques:grid>
    
</s:form>