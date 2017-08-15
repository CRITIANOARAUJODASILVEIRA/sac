--
-- TABELAS
--
--(**** NOVA ****)
create table operador
(
  id serial not null,
  pessoa_id int not null,
  login varchar(50) not null,
  senha char(32) not null
)
;
--(**** NOVA ****)
create table pessoa 
(
  id serial not null,
  nome varchar(120) not null,
  data_nascimento date not null  
)
;
--(**** NOVA ****)
create table pessoa_endereco
(
  id serial not null,
  pessoa_id int not null,
  cep int not null,
  ativo boolean default true
)
;
--(**** NOVA ****)
create table contato
(
  id serial not null,
  pessoa_id int,
  forma_contato_id int not null,
  cotato varchar(255) not null,
  ativo boolean default true
)
;

--
-- PRIMARY KEY
--
--(**** NOVA ****)
ALTER TABLE operador ADD 
	CONSTRAINT pk_operador PRIMARY KEY 
	(
		id
	)
;
--(**** NOVA ****)
ALTER TABLE pessoa ADD 
	CONSTRAINT pk_pessoa PRIMARY KEY 
	(
		id
	)
;
--(**** NOVA ****)
ALTER TABLE contato ADD 
	CONSTRAINT pk_contato PRIMARY KEY 
	(
		id
	)
;
--(**** NOVA ****)
ALTER TABLE pessoa_endereco ADD 
	CONSTRAINT pk_pessoa_endereco PRIMARY KEY 
	(
		id
	)
;
--
-- FOREIGN KEY
--
--(**** NOVA ****)
ALTER TABLE operador ADD
	CONSTRAINT FK_operador_pessoa FOREIGN KEY
	(
		pessoa_id
	)
	REFERENCES pessoa
	(
		id
	)
;
--(**** NOVA ****)
ALTER TABLE contato ADD
	CONSTRAINT FK_contato_pessoa FOREIGN KEY
	(
		pessoa_id
	)
	REFERENCES pessoa
	(
		id
	)
;

--
-- INDEX
--
--(**** NOVO ****)
create unique index ix_operador_login on operador (login)
;
--(**** NOVO ****)
create unique index ix_operador_pessoa on operador (pessoa_id)
;
