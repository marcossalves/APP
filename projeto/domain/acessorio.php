<?php

class Acessorio{

public $idacessorio;
public $nomeacessorio;
public $descricao;
public $preco;
public $idfoto;


public function __construct($db){
    $this->conexao = $db;
}

public function listar(){
    $query = "select * from acessorio";

    $stmt = $this->conexao->prepare($query);

    $stmt->execute();

    return $stmt;
}

public function detalheAcessorio($id){
    $query = "select a.idacessorio, a.nomeacessorio, a.descricao, a.preco, f.foto1,f.foto2,f.foto3,foto4 from acessorio a inner join foto f on a.idfoto=f.idfoto where idacessorio=:id";
    $stmt=$this->conexao->prepare($query);

    $stmt->bindParam(":id",$id);

    $stmt->execute();

    return $stmt;
}


public function listarTelaInicial(){
    $query = "select a.idacessorio,a.nomeacessorio, a.preco, f.foto1 from acessorio a inner join foto f on a.idfoto=f.idfoto";
    $stmt = $this->conexao->prepare($query);

    $stmt->execute();

    return $stmt;
}


public function carrinho($id){
    $query = "select a.idacessorio,a.nomeacessorio, a.preco, f.foto1 from acessorio a inner join foto f on a.idfoto=f.idfoto where idacessorio in(".$id.")";
    $stmt = $this->conexao->prepare($query);

    $stmt->execute();

    return $stmt;
}



public function cadastro(){
    $query = "insert into acessorio set nomeacessorio=:na, descricao=:d, preco=:p, idfoto=:if";

    $stmt = $this->conexao->prepare($query);

    /*Vamos vincular os dados que veem do app ou navegador com os campos de
    banco de dados
    */
    $stmt->bindParam(":na",$this->nomeacessorio);
    $stmt->bindParam(":d",$this->descricao);
    $stmt->bindParam(":p",$this->preco);
    $stmt->bindParam(":if",$this->idfoto);

    if($stmt->execute()){
        return true;
    }
    else{
        return false;
    }

}
}

?>