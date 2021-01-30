<?php

class Cliente{
public $idcliente;
public $nomecliente;
public $cpf;
public $sexo;
public $idcontato;
public $idendereco;
public $idusuario;

    public function __construct($db){
        $this->conexao = $db;
    }

    /*
    Função para listar todos os usuários cadastrados no banco de dados
    */
    public function listar(){
        $query = "select * from cliente";
        /*
        Será criada a variável stmt(Statement - Sentença)
        para guardar a preparação da consulta select que será executada
        posteriormente
        */
        $stmt = $this->conexao->prepare($query);

        //executar a consulta e retornar seus dados
        $stmt->execute();

        return $stmt;

    }

    public function cliente(){


        $contato = "SELECT * FROM contato order by idcontato desc limit 0,1;";
        $stmt = $this->conexao->prepare($contato);
        $rs = $stmt->execute();

        while($linha = $rs->fetch(PDO::FETCH_ASSOC)){
            $this->idcontato=$linha["idcontato"];
        }


        $endereco = "SELECT * FROM endereco order by idendereco desc limit 0,1;";
        $stmt = $this->conexao->prepare($endereco);
        $rs = $stmt->execute();

        while($linha = $rs->fetch(PDO::FETCH_ASSOC)){
            $this->idendereco=$linha["idendereco"];
        }


        $usuario = "SELECT * FROM usuario order by idusuario desc limit 0,1;";
        $stmt = $this->conexao->prepare($usuario);
        $rs = $stmt->execute();

        while($linha = $rs->fetch(PDO::FETCH_ASSOC)){
            $this->idusuario=$linha["idusuario"];
        }



        $query = "insert into cliente set nomecliente=:n,cpf=:c,sexo=:s,idcontato=:ic,idendereco=:ie,idusuario=:iu";

        $stmt = $this->conexao->prepare($query);

        /*Vamos vincular os dados que veem do app ou navegador com os campos de
        banco de dados
        */

$stmt->bindParam(":n",$this->nomecliente);
$stmt->bindParam(":c",$this->cpf);
$stmt->bindParam(":s",$this->sexo);
$stmt->bindParam(":ic",$this->idcontato);
$stmt->bindParam(":ie",$this->idendereco);
$stmt->bindParam(":iu",$this->idusuario);



        if($stmt->execute()){
            return true;
        }
        else{
            return false;
        }

    }
//-----------------------UPDATE CLIENTE--------------------------------------------------
//----------------------update contato------------------
    public function atualizarcadastro(){
        $consultacontato = "update contato set email=:e,telefone=:taq where idcontato=:ic";
       
        $stmtcontato = $this->conexao->prepare($consultacontato);

        /*Vamos vincular os dados que veem do app ou navegador com os campos de
        banco de dados
        */
$stmtcontato->bindParam(":t",$this->telefone);
$stmtcontato->bindParam(":e",$this->email);
$stmtcontato->bindParam(":ic",$this->idcontato);


//------------update endereço

$updateendereco = "update endereco set tipo=:tp,logradouro=:lg,numero=:n,complemento=:cp,bairro=:ba,cep=:cep where idendereco=:ie";

$stmtendereco = $this->conexao->prepare($updateendereco);

/*Vamos vincular os dados que veem do app ou navegador com os campos de
banco de dados
*/

$stmtendereco->bindParam(":tp",$this->tipo);
$stmtendereco->bindParam(":lg",$this->logradouro);
$stmtendereco->bindParam(":nu",$this->numero);
$stmtendereco->bindParam(":cp",$this->complemento);
$stmtendereco->bindParam(":ba",$this->bairro);
$stmtendereco->bindParam(":cep",$this->cep);
$stmtendereco->bindParam(":ie",$this->idendereco);




//-------------------- update usuario -----------------------

$updateusuario = "update usuario set nomeusuario=:n, senha=:s  where idusuario=:iu";

$stmtusuario = $this->conexao->prepare($updateusuario);

/*Vamos vincular os dados que veem do app ou navegador com os campos de
banco de dados
*/
$stmtusuario->bindParam(":n",$this->nomeusuario);
$stmtusuario->bindParam(":s",$this->senha);
$stmtusuario->bindParam(":iu",$this->idusuario);
$stmtusuario->execute();




        if($stmtusuario->execute()){
            return true;
        }
        else{
            return false;
        }
    }


    public function apagarcliente(){
        $query = "delete from cliente where idcliente=:id";

        $stmt = $this->conexao->prepare($query);

        /*Vamos vincular os dados que veem do app ou navegador com os campos de
        banco de dados
        */
        $stmt->bindParam(":id",$this->idcliente);
      

        if($stmt->execute()){
            return true;
        }
        else{
            return false;
        }

    }


    

}


?>