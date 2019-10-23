create database if not exists db_tarefas;
use db_tarefas;

create table usuarios(
  id      int             not null  auto_increment,
  email   varchar(200)    not null,  
  senha   varchar(200)    not null,
  primary key (id)
);
insert into usuarios (id, email, senha) values
  (1, 'suporte@gmail.com', '$2b$10$6ZbT4sKq5St91o5bgpJpReNDHci.a3lQ18ObJAE97ljgApqFLyvNW');

create table categorias(
  id        int           not null  auto_increment,
  descricao varchar(200)  not null,
  cor     varchar(9),
  primary key (id)
);
insert into categorias (id, descricao, cor) values
  (1, "Pessoal", "#27AE60"),
  (2, "Escola", "#2F80ED"),
  (3, "Trabalho de Conclusão", "#F2C94C"),
  (4, "Trabalho", "#EB5757");

create table tarefas(
  id            int           not null  auto_increment,
  descricao     varchar(255)  not null,
  data          datetime      not null  default         now(),
  realizado     boolean       not null  default         false,
  categoria_id  int           not null,
  primary key (id),
  foreign key (categoria_id) references categorias (id)
);
insert into tarefas (descricao, data, realizado, categoria_id) values 
  ('Pagar conta de energia', '2018-10-03 10:00:00', false, 1),
  ('Inciar o trabalho de ED', '2018-10-03 12:00:00', false, 2),
  ('Abastecer o carro', '2018-10-04 00:00:00', true, 1),
  ('Pagar conta de água', '2018-11-12 10:00:00', true, 1),
  ('Entregar trabalho de ED', '2018-11-14 19:00:00', false, 2),
  ('Entregar trabalho de Meio Ambiente', '2018-11-15 19:00:00', false, 2),
  ('Verificar folha de ponto', '2018-12-13 19:00:00', false, 4),
  ('Entregar capítulo introducao', '2018-11-28 19:00:00', false, 3);
