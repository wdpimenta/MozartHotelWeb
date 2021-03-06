<%@ page contentType="text/html;charset=iso-8859-1"%>
<%@taglib uri="http://marcioduques.com/duquesLib" prefix="duques"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<script>
    function init(){
        
    }

    function prepararInclusao(){
		vForm = document.forms[0];
		vForm.action = '<s:url action="manterTipoDiaria!prepararInclusao.action" namespace="/app/rede" />';
		submitForm( vForm );
    }
	    
    function prepararAlteracao(){
		vForm = document.forms[0];
		vForm.action = '<s:url action="manterTipoDiaria!prepararAlteracao.action" namespace="/app/rede" />';
		submitForm( vForm );
    }

	function pesquisar(){
		vForm = document.forms[0];
		submitForm( vForm );
     }
	
	currentMenu = "tipoDiaria";
	with(milonic=new menuname("tipoDiaria")){
	margin=3;
	style=contextStyle;
	top="offset=2";
	aI("image=imagens/btnAlterar.png;text=Alterar;url=javascript:prepararAlteracao();");
	drawMenus();  
	} 
    
</script>

  <s:form action="pesquisarTipoDiaria!pesquisar.action" namespace="/app/rede" theme="simple" >
  	
  	<s:hidden name="entidade.idTipoDiaria" id="idAlteracao"/>
  	
    <div class="divFiltroPaiTop">Tipo Di�ria</div>    
    <div id="divFiltroPai" class="divFiltroPai">
        <div id="divFiltro" class="divFiltro"  >
            <duques:filtro tableName="TIPO_DIARIA_WEB" titulo="" />
        </div>
    </div>
    <div id="divMeio" class="divMeio">
        <div id="divOutros" class="divOutros">
            
        </div>
        
        <div id="divBotao" class="divBotao">
            <duques:botao label="Pesquisar"  imagem="imagens/iconic/png/magnifying-glass-3x.png" onClick="pesquisar();" />    
    	    <duques:botao label="Novo" imagem="imagens/iconic/png/plus-3x.png" onClick="prepararInclusao();" />
        </div>
    
    </div>
    
 <!-- grid -->
    
    <duques:grid colecao="listaPesquisa" titulo="Relat�rio Tipo de Di�ria" 
    			 condicao="idTipoDiaria;eq;-1;reservaSemCheckin" 
    			 current="obj" 
    			 idAlteracao="idAlteracao" 
    			 idAlteracaoValue="idTipoDiaria" 
    			 urlRetorno="pages/modulo/rede/tipoDiaria/pesquisar.jsp">
    			
    		 
        <duques:column labelProperty="Descri��o"       propertyValue="descricao" 		style="width:200px;" />
        <duques:column labelProperty="Padr�o"     	   propertyValue="padrao"        	style="width:80px;" />
        
    </duques:grid>
    
</s:form>
