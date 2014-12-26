# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table records (
  id                        bigint not null,
  date_punch_in             timestamp,
  note1                     varchar(255),
  date_punch_out            timestamp,
  note2                     varchar(255),
  user_id                   bigint,
  constraint uq_records_date_punch_in unique (date_punch_in),
  constraint uq_records_date_punch_out unique (date_punch_out),
  constraint pk_records primary key (id))
;

create table token (
  token                     varchar(255) not null,
  user_id                   bigint,
  type                      varchar(8),
  date_creation             timestamp,
  email                     varchar(255),
  constraint ck_token_type check (type in ('password','email')),
  constraint pk_token primary key (token))
;

create table users (
  id                        bigint not null,
  email                     varchar(255),
  fullname                  varchar(255),
  username                  varchar(255),
  confirmation_token        varchar(255),
  password_hash             varchar(255),
  date_creation             timestamp,
  validated                 boolean,
  isadmin                   boolean,
  status                    boolean,
  constraint uq_users_email unique (email),
  constraint uq_users_username unique (username),
  constraint pk_users primary key (id))
;

create sequence records_seq;

create sequence token_seq;

create sequence users_seq;

alter table records add constraint fk_records_user_1 foreign key (user_id) references users (id);
create index ix_records_user_1 on records (user_id);



# --- !Downs

drop table if exists records cascade;

drop table if exists token cascade;

drop table if exists users cascade;

drop sequence if exists records_seq;

drop sequence if exists token_seq;

drop sequence if exists users_seq;

