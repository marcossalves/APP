     # Nome para o banco de dados será loja

-- exclui base de dados DROP database dbapnoramic;
-- exclui tabela  DROP TABLE nometabela;
create database dbapnoramic;
use dbapnoramic;
create table usuario(
idusuario int auto_increment primary key,
nomeusuario varchar(20) not null unique,
senha varchar(200) not null,
foto varchar (200) not null
)engine Innodb;

create table endereco(
idendereco int auto_increment primary key,
tipo varchar(100) not null,
logradouro varchar(100) not null,
numero varchar (10) not null,
complemento varchar (20) not null,
bairro varchar (50) not null,
cep varchar (10) not null

)engine Innodb;


create table contato (
idcontato int auto_increment primary key,
telefone varchar (20) not null,
email varchar (100) not null

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



ALTER TABLE `dbapnoramic`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_contato`
  FOREIGN KEY (`idcontato`)
  REFERENCES `dbapnoramic`.`contato` (`idcontato`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `dbapnoramic`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_endereco`
  FOREIGN KEY (`idendereco`)
  REFERENCES `dbapnoramic`.`endereco` (`idendereco`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
    ALTER TABLE `dbapnoramic`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_usuario`
  FOREIGN KEY (`idusuario`)
  REFERENCES `dbapnoramic`.`usuario` (`idusuario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  
      ALTER TABLE `dbapnoramic`.`produto` 
ADD CONSTRAINT `fk_produto_pk_foto`
  FOREIGN KEY (`idfoto`)
  REFERENCES `dbapnoramic`.`foto` (`idfoto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
   ALTER TABLE `dbapnoramic`.`pedido` 
ADD CONSTRAINT `fk_pedido_pk_cliente`
  FOREIGN KEY (`idcliente`)
  REFERENCES `dbapnoramic`.`cliente` (`idcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
     ALTER TABLE `dbapnoramic`.`itenspedido` 
ADD CONSTRAINT `fk_itens_pk_cliente`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbapnoramic`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
    
     ALTER TABLE `dbapnoramic`.`itenspedido` 
ADD CONSTRAINT `fk_itens_pk_produto`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbapnoramic`.`produto` (`idproduto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  

         ALTER TABLE `dbapnoramic`.`pagamento` 
ADD CONSTRAINT `fk_pagamento_pk_pedido`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbapnoramic`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  -- cadastro produto
   
insert into foto(foto1 ,foto2, foto3, foto4) values ('Canon1.png','Canon2.png','Canon3.png','Canon4.png');
insert into produto(nomeproduto, descricao, preco,idfoto) values('Canon EOS250D','Câmera Semi-profissional',1500.00,1);
  
  --  criação das tabela contato,endereco e usuario  Marcos
 
insert into  contato(email, telefone) values('marcos@gmail','119858758');
insert into endereco(tipo,logradouro,numero,complemento, bairro, cep) values ('Rua',' timbiras','1','apt02','Santa efigenia','08523100');
insert into usuario (nomeusuario, senha, foto) values('admin',md5('123'),'admin.png');
  --  idcontato = 1, idendereco= 1, idusuario=1 
insert into cliente (nomecliente, cpf, sexo,idcontato,idendereco, idusuario) values ('Marcos','8565857485','M',1,1,1);
   -- solicitação pedido marcos
insert into pedido(idcliente)values (1);
   -- itenspedido  marcos idpedido= 1, identificação do produto=2 e quantidade do produto=1
insert into itenspedido(idpedido,idproduto,quantidade ) values(1,1,1);
insert into pagamento (idpedido,tipo,descricao,valor,parcelas,valorparcela) values(1,'Cartão','Nº 2205|Nome: Marcos|codigo: 74',1500.00,1,1500.00);
   
   
   
   
   -- cadastro produto
   
insert into foto(foto1 ,foto2, foto3, foto4) values ('Canonsx5001.jpg','Canonsx5002.jpg','Canonsx5003.jpg','Canonsx5004.jpg');
insert into produto(nomeproduto, descricao, preco,idfoto) values('Canon SX500','Câmera amadora',300.00,2);
  
  --  criação das tabela contato,endereco e usuario  simone
 
insert into  contato(email, telefone) values('simone@gmail.com','119858758');
insert into endereco(tipo,logradouro,numero,complemento, bairro, cep) values ('Rua',' Nilza','12','apt05','Vila Matilde','564858925');
insert into usuario (nomeusuario, senha, foto) values('simone',md5('123'),'simone.png');
  --  idcontato = 1, idendereco= 1, idusuario=1 
insert into cliente (nomecliente, cpf, sexo,idcontato,idendereco, idusuario) values ('Simone','027888523','F',2,2,2);
   -- solicitação pedido simone
insert into pedido(idcliente)values (2);
   -- itenspedido  marcos idpedido= 2, identificação do produto=2 e quantidade do produto=1
insert into itenspedido(idpedido,idproduto,quantidade ) values(2,2,1);
insert into pagamento (idpedido,tipo,descricao,valor,parcelas,valorparcela) values(2,'Cartão','Nº 15365|Nome: Simone|codigo: 564',300.00,1,300.00);
   
   
   
   select * from cliente;
  
  -- select para visualizar as compras
  select
  idcliente,
  pe.idpedido,
  pe.datapedido,
  pr.nomeproduto,
  pr.preco,
  ip.quantidade,
  pg.tipo,
  pg.valor,
  pg.parcelas,
  pg.valorparcela
  
  from pedido pe inner join itenspedido ip on pe.idpedido = ip.idpedido
  inner join produto pr on ip.idproduto=pr.idproduto
  inner join pagamento pg on pg.idpedido = pe.idpedido
  
  where pe.idcliente = 1;
  
   -- relacionamento descrição do produto
  select p.idproduto, p.nomeproduto, p.descricao, p.preco, f.foto1,f.foto2,f.foto3,foto4
  from produto p inner join foto f on p.idfoto=f.idfoto where idproduto=2;

   
   
   
 