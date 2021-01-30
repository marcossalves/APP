# Nome para o banco de dados será loja

-- exclui base de dados DROP database dbloja;
-- exclui tabela  DROP TABLE nometabela;
create database dbloja;
use dbloja;
create table usuario(
idusuario int auto_increment primary key,
nomeusuario varchar(20) not null unique,
senha varchar(200) not null,
foto varchar (200) not null
)engine Innodb;

create table endereco(
idendereco int auto_increment primary key,
tipo varchar (10) not null,
logradouro varchar(100) not null,
numero varchar (10) not null,
complemento varchar (20) not null,
bairro varchar (50) not null,
cep varchar (10) not null

)engine Innodb;


create table contato (
idcontato int auto_increment primary key,
email varchar (100) not null,
telefone varchar (20) not null

)engine Innodb;

create table cliente (
idcliente int auto_increment primary key,
nomecliente varchar (50) not null,
cpf varchar (13) not null unique,
sexo char  (5) not null,
idcontato int not null,
idendereco int not null,
idusuario int not null

)engine Innodb;


create table produto (
idproduto int auto_increment primary key,
nomeproduto varchar(50) not null,
descricao text not null,
preco decimal(10,2) not null,
idfoto int not null
)engine Innodb;

create table foto (
idfoto int auto_increment primary key,
foto1 varchar (200) not null,
foto2 varchar (200) not null,
foto3 varchar (200) not null,
foto4 varchar (200) not null

) engine innodb;

create table pedido (
idpedido int auto_increment primary key,
idcliente int not null,
datapedido timestamp default current_timestamp()
)engine innodb;


create table itenspedido (
iditens int auto_increment primary key,
idpedido int not null,
idproduto int not null,
quantidade int default 1 not null
)engine innodb;


create table pagamento (
idpagamento int auto_increment primary key,
idpedido int not null,
tipo varchar (20) not null,
descricao varchar (200) not null,
valor decimal (10,2) not null,
parcelas int default 1 not null,
valorparcela decimal (10,2) not null
)engine innodb;



ALTER TABLE `dbloja`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_contato`
  FOREIGN KEY (`idcontato`)
  REFERENCES `dbloja`.`contato` (`idcontato`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `dbloja`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_endereco`
  FOREIGN KEY (`idendereco`)
  REFERENCES `dbloja`.`endereco` (`idendereco`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
    ALTER TABLE `dbloja`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_usuario`
  FOREIGN KEY (`idusuario`)
  REFERENCES `dbloja`.`usuario` (`idusuario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  
      ALTER TABLE `dbloja`.`produto` 
ADD CONSTRAINT `fk_produto_pk_foto`
  FOREIGN KEY (`idfoto`)
  REFERENCES `dbloja`.`foto` (`idfoto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
   ALTER TABLE `dbloja`.`pedido` 
ADD CONSTRAINT `fk_pedido_pk_cliente`
  FOREIGN KEY (`idcliente`)
  REFERENCES `dbloja`.`cliente` (`idcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
     ALTER TABLE `dbloja`.`itenspedido` 
ADD CONSTRAINT `fk_itens_pk_cliente`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbloja`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
    
     ALTER TABLE `dbloja`.`itenspedido` 
ADD CONSTRAINT `fk_itens_pk_produto`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbloja`.`produto` (`idproduto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  

         ALTER TABLE `dbloja`.`pagamento` 
ADD CONSTRAINT `fk_pagamento_pk_pedido`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbloja`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  --  criação das tabelas usuario, enderecp e contatp
   insert into usuario (nomeusuario, senha, foto) values('admin',md5('123'),'admin.png');
   insert into endereco(tipo,logradouro,numero, complemento, bairro, cep) values ('Rua','Flores','123','Casa dos fundos','Jardim','08523100');
   insert into  contato(email, telefone) values('martha@terra.com.br','11995872344');
   
   -- criando o cliente e unindo com as tabelas anteriores usuario, endereco e contato   1=idcontato , 1= idendereco, 1= idusuario
   insert into cliente (nomecliente, cpf, sexo,idcontato,idendereco, idusuario) values ('Martha Oliveira','2013205548621','F',1,1,1);
   
   
   -- cadastro foto dos produtos
   insert into foto(foto1 ,foto2, foto3, foto4) values ('monitor1.png','monitor2.png','monitor3.png','monitor4.png');
  
  -- cadastro produto
  insert into produto(nomeproduto, descricao, preco,idfoto) values('Monitor','Monitor de 23 polegas led',856.90,1);
  
-- numero do pedido realizado pela Martha
insert into pedido(idcliente)values (1);
  
  -- itenspedido Martha  idpedido= 1, identificação do produto=2 e quantidade do produto=2
  insert into itenspedido(idpedido,idproduto,quantidade ) values(1,2,2);
  
  -- pagamento 
 insert into pagamento(idpedido,tipo,descricao,valor,parcelas,valorparcela) values (1,'cartão','Nº 2225|Nome:Martha|codigo:745',1713.80,4,428.45);
 
  
  
  
  