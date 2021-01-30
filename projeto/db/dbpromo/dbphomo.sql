
-- drop database dbphomo;
create database dbphomo;
use dbphomo;
create table usuario(
idusuario int auto_increment primary key,
nomeusuario varchar(20) not null unique,
senha varchar(200) not null,
foto varchar(200) not null
);

create table endereco(
idendereco int auto_increment primary key,
tipo varchar(10) not null,
logradouro varchar(100) not null,
numero varchar(10) not null,
complemento varchar(20) not null,
bairro varchar(50) not null,
cep varchar(10) not null
);

create table contato(
idcontato int auto_increment primary key,
email varchar(100) not null,
telefone varchar(20) not null
);

create table cliente(
idcliente int auto_increment primary key,
nomecliente varchar(50) not null,
cpf varchar(13) not null unique,
sexo char(5) not null,
idcontato int not null,
idendereco int not null,
idusuario int not null
);

create table produto(
idproduto int auto_increment primary key,
nomeproduto varchar(50) not null,
descricao text not null,
preco decimal(10,2) not null,
idfoto int not null
);

create table foto(
idfoto int auto_increment primary key,
foto1 varchar(200) not null,
foto2 varchar(200) not null,
foto3 varchar(200) not null,
foto4 varchar(200) not null
);

create table pedido(
idpedido int auto_increment primary key,
idcliente int not null,
datapedido timestamp default current_timestamp()
);

create table itenspedido(
iditens int auto_increment primary key,
idpedido int not null,
idproduto int not null,
quantidade int default 1 not null 
);

create table pagamento(
idpagamento int auto_increment primary key,
idpedido int not null,
tipo varchar(20) not null,
descricao varchar(200) not null,
valor decimal(10,2) not null,
parcelas int default 1 not null,
valorparcela decimal(10,2) not null
);



ALTER TABLE `dbphomo`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_contato`
  FOREIGN KEY (`idcontato`)
  REFERENCES `dbphomo`.`contato` (`idcontato`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `dbphomo`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_endereco`
  FOREIGN KEY (`idendereco`)
  REFERENCES `dbphomo`.`endereco` (`idendereco`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `dbphomo`.`cliente` 
ADD CONSTRAINT `fk_cliente_pk_usuario`
  FOREIGN KEY (`idusuario`)
  REFERENCES `dbphomo`.`usuario` (`idusuario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  ALTER TABLE `dbphomo`.`produto` 
ADD CONSTRAINT `fk_produto_pk_foto`
  FOREIGN KEY (`idfoto`)
  REFERENCES `dbphomo`.`foto` (`idfoto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `dbphomo`.`pedido` 
ADD CONSTRAINT `fk_pedido_pk_cliente`
  FOREIGN KEY (`idcliente`)
  REFERENCES `dbphomo`.`cliente` (`idcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `dbphomo`.`itenspedido` 
ADD CONSTRAINT `fk_itens_pk_pedido`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbphomo`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `dbphomo`.`itenspedido` 
 ADD CONSTRAINT `fk_itens_pk_produto`
   FOREIGN KEY (`idproduto`)
   REFERENCES `dbphomo`.`produto` (`idproduto`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION;
  
  
  ALTER TABLE `dbphomo`.`pagamento` 
ADD CONSTRAINT `fk_pagamento_pk_pedido`
  FOREIGN KEY (`idpedido`)
  REFERENCES `dbphomo`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  

  
  
  -- cadastro produto
   
insert into foto(foto1 ,foto2, foto3, foto4) values ('Canon1.png','Canon2.png','Canon3.png','Canon4.png');
insert into produto(nomeproduto, descricao, preco,idfoto) values('Canon EOS250D','Câmera Fotográfica EOS 250D 18-55mm Canon..Tipo de sensor: CMOS de 22,3 mm x 14,9 mm.Pixels Efetivos: Aprox. 24,10 megapixels.Total pixels: Aprox. 25,80 megapixels.Relação de aspeto: 3:2.Processador de imagem: DIGIC 8.Encaixe da objetiva: Encaixe EF e EF-S.Distância Focal: Aprox. 1,6x da distância focal da objetiva.Estabilização de Imagem: Estabilizador ótico de imagem em objetivas compatíveis.Tipo de focagem: Através do visor ótico: sistema de deteção de diferença de fase com formação de imagem secundária TTL e sensor AF dedicado. Através da visualização direta na tela LCD: sistema Dual Pixel CMOS AF. Pixels de deteção de fase incorporados no sensor de imagem.Modos AF: AI Focus, One-Shot, AI Servo (algoritmo AI Servo II).Obturador de plano focal, controlado eletronicamente.Tipo de visor: Obturador de plano focal, controlado eletronicamente.Tela de Focagem: Fixo (Tela LCD translúcido para sobreposição de informações).Tipo de monitor LCD: Tela tátil Clear View II TFT 3:2 de ângulo variável de 7,7 cm (3,0") e aprox. 1040 mil pontos sRGB.Wi-Fi: Canais de Wi-Fi (2,4 GHz): IEEE802.11b, IEEE802.11g, IEEE802.11n.Bluetooth: BLE (tecnologia Bluetooth de baixo consumo de energia).Tipo de armazenamento: SD, SDHC, SDXC (compatíveis com a UHS Speed Class 1)..Dimensões (L x A x P): 122,4 x 92,6 x 69,8 mm.Peso (só o corpo): aprox. 449 g..Venda condicionada à existência de produto em estoque.',1500.00,1);


insert into foto(foto1 ,foto2, foto3, foto4) values ('Canonsx5001.jpg','Canonsx5002.jpg','Canonsx5003.jpg','Canonsx5004.jpg');
insert into produto(nomeproduto, descricao, preco,idfoto) values('Canon SX500','O poderoso Zoom Óptico 30x com lente grande angular 24mm e Estabilizador Óptico de Imagem reduz tremor da câmera para que consiga imagens magníficas.
',300.00,2);
  
  insert into foto(foto1 ,foto2, foto3, foto4) values ('canonpowershot1.jpg','canonpowershot2.jpg','canonpowershot3.jpg','canonpowershot4.jpg');
insert into produto(nomeproduto, descricao, preco,idfoto) values('Canon PowerShot','Canon PowerShot SX700 HS. Tipo de câmera: Câmara compacta, Megapixel: 16,1 MP, Dimensão do sensor de imagem: 1/2.3", Tipo de sensor: CMOS',600.00,3);

    insert into foto(foto1 ,foto2, foto3, foto4) values ('bolsa1.jpg','bolsa2.jpg','bolsa3.jpg','bolsa4.jpg');
insert into produto(nomeproduto, descricao, preco,idfoto) values('Bolsa','Bolsa reforçada',100.00,4);


    insert into foto(foto1 ,foto2, foto3, foto4) values ('bolsacanon1.jpg','bolsacanon2.jpg','bolsacanon3.jpg','bolsacanon4.jpg');
insert into produto(nomeproduto, descricao, preco,idfoto) values('Bolsa Sony','Bolsa com suporte',100.00,5);

insert into usuario(nomeusuario, senha, foto)values('admin',md5('123'),'admin.png');

insert into endereco(tipo, logradouro, numero, complemento,bairro, cep)values('Rua',' Nilza','12','apt05','Vila Matilde','564858925');
                                                                                   
insert into contato(email, telefone) values('macos@terra.com.br','11995872344');

insert into cliente(nomecliente, cpf, sexo, idcontato,idendereco,idusuario)values('Marcos','2252664556','M',1,1,1);
  
insert into pedido(idcliente) values(1);
insert into itenspedido(idpedido,idproduto,quantidade)values(1,1,2);
insert into pagamento(idpedido,tipo,descricao,valor,parcelas,valorparcela)values(1,'cartão','Nº 25132456456|Nome:Marcos|Codigo: 76545',3000.00,4,750.00);

  




-- cliente 2

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
   
   -- cliente 3
   insert into  contato(email, telefone) values('aline@gmail.com','1185988565');
insert into endereco(tipo,logradouro,numero,complemento, bairro, cep) values ('Rua',' alegria','1','casa','Vila','55846952');
insert into usuario (nomeusuario, senha, foto) values('aline',md5('123'),'aline.png');
  --  idcontato = 1, idendereco= 1, idusuario=1 
insert into cliente (nomecliente, cpf, sexo,idcontato,idendereco, idusuario) values ('Aline','859548545','F',3,3,3);
   -- solicitação pedido simone
insert into pedido(idcliente)values (3);
   -- itenspedido  marcos idpedido= 2, identificação do produto=2 e quantidade do produto=1
insert into itenspedido(idpedido,idproduto,quantidade ) values(3,3,1);
insert into pagamento (idpedido,tipo,descricao,valor,parcelas,valorparcela) values(3,'boleto','Nº 88546682|Nome: Aline|codigo: 5645',600.00,1,600.00);
   
  
   



-- excluir do quarto contato em diante
delete from contato where idcontato > 3;

-- excluiu o contato informado
delete from contato where idcontato = 2;
  
/*
cliente - Nome;
pedido - DataPedido;
ItensPedido -  Quantidade;
produto - Nomeproduto,Preco;
Pagamento - valor;
*/
 /* tabela com relacionamento indicando as informações da compra 
 nome cliente, data pedido, nome produto, quantidade, preço, total  e pagamento */
  
  select c.nomecliente,pe.datapedido,pr.nomeproduto,it.quantidade,pr.preco,pr.preco*it.quantidade as total, pg.valor  as 'pagamento'
  from produto pr inner join itenspedido it on pr.idproduto=it.idproduto
  inner join pedido pe on it.idpedido=pe.idpedido inner join pagamento pg 
  on pg.idpedido = pe.idpedido inner join cliente c on
  
  c.idcliente = pe.idcliente where c.idcliente=1;
  
  
select p.idproduto, p.nomeproduto, p.descricao, p.preco,p.idfoto,f.foto1,f.foto2,f.foto3,f.foto4 
from produto p inner join foto f on p.idfoto=f.idfoto where idproduto=idproduto;


select * from foto order by idfoto desc  limit 0,1; 
 
 select * from foto;
 

-- consulta
select * from usuario; 
  select * from cliente; 
  select * from contato;
  select * from endereco;

    
    
    
    
    update cliente set nomecliente='Marco',cpf= '5568954852', sexo='M', idcontato='1',idendereco='1',idusuario='1' where idcliente=1;
    update contato set email='marcoss@gmail.com', telefone='1195895826' where idcontato=1;
    update endereco set tipo='casa',logradouro='jaguaribe',numero='250', complemento='Ap 03',bairro='Santa Cecília',cep='25486235' where idendereco='1';
    update usuario set nomeusuario='admin', senha= md5('123') where idusuario='1';
    
    
    -- teste login
    
	select ct.idcontato,en.idendereco,us.idusuario,us.nomeusuario,us.foto,cl.idcliente,cl.nomecliente,
cl.cpf,cl.sexo,ct.email,ct.telefone,en.tipo,en.logradouro,en.numero,en.complemento,en.bairro,en.cep from usuario us inner join cliente cl on us.idusuario=cl.idusuario 
        inner join contato ct on ct.idcontato = cl.idcontato inner join endereco en on en.idendereco = cl.idendereco;
     
     
     
       update contato set email='marcos@teste00.com.br', telefone= '"11995872344"' where idcontato='1';
       
       
       
       
       
         -- criação tabela acessorios
  
  create table acessorio(
idacessorio int auto_increment primary key,
nomeacessorio varchar(50) not null,
descricao text not null,
preco decimal(10,2) not null,
idfoto int not null
);
  
  insert into foto(foto1 ,foto2, foto3, foto4) values ('lentef50mmcanon1.jpg','lentef50mmcanon2.jpg','lentef50mmcanon3.jpg','lentef50mmcanon4.jpg');
  insert into acessorio(nomeacessorio, descricao, preco,idfoto) values('Lente Canon 50mm','pequena, leve, nítida, rápida e silenciosa',1000.00,6);
  
    insert into foto(foto1 ,foto2, foto3, foto4) values ('lentef40mmcanon1.jpg','lentef40mmcanon2.jpg','lentef40mmcanon3.jpg','lentef40mmcanon4.jpg');
  insert into acessorio(nomeacessorio, descricao, preco,idfoto) values('Lente Canon 40mm','pequena, leve, nítida, rápida e silenciosa',500.00,7);
  
      insert into foto(foto1 ,foto2, foto3, foto4) values ('LenteCanonEF24105mm1.jpg','LenteCanonEF24105mm2.jpg','LenteCanonEF24105mm3.jpg','LenteCanonEF24105mm4.jpg');
  insert into acessorio(nomeacessorio, descricao, preco,idfoto) values('Lente Canon EF 24-105mm f/4L IS II USM','Lente excelente',9500.00,8);
  
  
  select * from acessorio; 
       
select a.idacessorio, a.nomeacessorio, a.descricao, a.preco, f.foto1,f.foto2,f.foto3,foto4 from acessorio a inner join foto f on a.idfoto=f.idfoto;
       

/* 

       /*
       Cliente -> Nomecliente,
       Produto -> NomeProduto, Preco
	   Pedido ->  datapedido
       Itens ->   quantidade
	   Pagamento -> *
       */
       
       select 
       cli.nomecliente,
       pro.nomeproduto,
       pro.preco,
       ped.datapedido,
       it.quantidade,
       pag.*
       from pagamento pag inner join pedido ped on pag.idpedido=ped.idpedido
       inner join cliente cli on cli.idcliente=ped.idcliente
       inner join itenspedido it on it.idpedido = ped.idpedido
       inner join produto pro on pro.idproduto = it.idproduto where cli.idcliente=1;
       
       
       select pe.idpedido,
        pe.idcliente,
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
        
        where pe.idcliente=1;
     
  
	
     
       
      select * from usuario;
select * from contato;
select * from endereco; 
select * from cliente; 
select * from pedido;
select * from itenspedido;
select * from pagamento;
select * from produto;
select * from foto;
select * from pedido; 
select * from acessorio; 