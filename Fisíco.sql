CREATE SCHEMA dimensional;

CREATE  TABLE dimensional.dim_cliente ( 
	sk_cliente           INT  NOT NULL    PRIMARY KEY,
	nk_id_cliente        VARCHAR(20)      ,
	nm_cliente           VARCHAR(100)      ,
	by_aceita_campanha   BINARY(1)      ,
	nm_cidade_cliente    VARCHAR(50)      ,
	desc_cep             VARCHAR(20)      
 ) engine=InnoDB;

CREATE  TABLE dimensional.dim_localidade ( 
	sk_localidade        INT  NOT NULL    PRIMARY KEY,
	nk_id_localidade     VARCHAR(20)      ,
	nm_localidade        VARCHAR(20)      ,
	nm_cidade_localidade VARCHAR(50)      ,
	nm_regiao_localidade VARCHAR(20)      
 ) engine=InnoDB;

CREATE  TABLE dimensional.dim_produto ( 
	sk_produto           INT  NOT NULL    PRIMARY KEY,
	nk_id_produto        VARCHAR(20)      ,
	desc_sku             VARCHAR(20)      ,
	nm_produto           VARCHAR(50)      ,
	nm_categoria_produto VARCHAR(50)      ,
	nm_marca_produto     VARCHAR(50)      
 ) engine=InnoDB;

CREATE  TABLE dimensional.dim_temp ( 
	sk_data              INT  NOT NULL    PRIMARY KEY,
	data                 DATE      ,
	desc_data_completa   VARCHAR(50)      ,
	nr_ano               INT      ,
	nm_trimestre         INT      ,
	nm_mes               INT      ,
	nm_semana            INT      ,
	nr_dia               INT      ,
	nm_dia_semana        VARCHAR(30)      ,
	flag_feriado         CHAR(5)      ,
	nm_feriado           VARCHAR(20)      
 ) engine=InnoDB;

CREATE  TABLE dimensional.dim_tempo ( 
	sk_tempo             INT      ,
	data                 VARCHAR(50)      ,
	data_completa        DATE      ,
	ano                  VARCHAR(20)      ,
	trimestre            INT      ,
	mes                  INT      ,
	semana               INT      ,
	dia                  INT      
 ) engine=InnoDB;

CREATE  TABLE dimensional.fato_venda ( 
	sk_cliente           INT  NOT NULL    ,
	sk_produto           INT  NOT NULL    ,
	sk_temp              INT  NOT NULL    ,
	sk_localidade        INT  NOT NULL    ,
	valor_venda          DECIMAL(5,2)      ,
	quantidade_venda     INT      ,
	CONSTRAINT pk_fato_venda PRIMARY KEY ( sk_cliente, sk_produto, sk_temp, sk_localidade )
 ) engine=InnoDB;

