--
-- PostgreSQL database cluster dump
--

\connect postgres

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE laitkor;
ALTER ROLE laitkor WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5f36a862604afbbed43df54d256dc790c';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5b50a89b251068a9fb1948d3f23a068ff';






--
-- Database creation
--

CREATE DATABASE saral WITH TEMPLATE = template0 OWNER = laitkor;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect saral

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: holder; Type: TYPE; Schema: public; Owner: laitkor
--

CREATE TYPE holder AS (
	departmentid integer,
	totalsalary bigint
);


ALTER TYPE public.holder OWNER TO laitkor;

--
-- Name: add_stage(character varying, character varying, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION add_stage(character varying, character varying, integer, integer, integer, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$  declare 

ruid_id integer;

abc text;

BEGIN

insert into saral_new_update_stage (s_name,created_on,created_by,opening_id) values($1,$2,$3,$4);

select currval('saral_new_update_stage_su_id_seq'::regclass) INTO ruid_id ;

insert into saral_stage_user_assign(su_id,opening_id,user_id,cmp_id) values(ruid_id ,$4,$5,$6);

return abc;

END;$_$;


ALTER FUNCTION public.add_stage(character varying, character varying, integer, integer, integer, integer) OWNER TO laitkor;

--
-- Name: create_opening(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_opening(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

ropening_id integer;

created_by integer;

crtd_by integer;

BEGIN

select id INTO created_by from saral_user where fname=$8;

select id INTO crtd_by from saral_user where uname=$8;

select departmentid INTO did from saral_user where id=$9;

select cmp_id INTO cid from saral_user where id=$10;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,dept_id,assign_to,cmp_id,req_id) values($1,$2,$3,$4,$5,$6,$7,crtd_by ,did,$9,$10,$11);

select currval('"opening_opening_Id_seq"'::regclass) INTO ropening_id ;

insert into saral_new_update_stage(s_name, opening_id,created_by)

select stagename,ropening_id,crtd_by  from saral_stage;

update saral_launch set status = 2 where id=$11;

Return '';

END; $_$;


ALTER FUNCTION public.create_opening(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer) OWNER TO laitkor;

--
-- Name: create_opening1(text, text, text, text, text, text, integer, text, text, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_opening1(text, text, text, text, text, text, integer, text, text, integer, OUT text) RETURNS text
    LANGUAGE plpgsql
    AS $_$

declare 

cid integer;

did integer;

uid integer;

created_by text;

BEGIN

SELECT id INTO created_by  FROM saral_user where fname=$8  ;

select id INTO uid from saral_user where fname=$9;

select departmentid INTO did from saral_user where id=$10;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,did,Assign_to) values($1,$2,$3,$4,$5,$6,$7,created_by,did,uid);

RAISE EXCEPTION 'Opning not ctreated';

END;

$_$;


ALTER FUNCTION public.create_opening1(text, text, text, text, text, text, integer, text, text, integer, OUT text) OWNER TO laitkor;

--
-- Name: create_opening2(text, text, text, text, text, text, integer, text, text, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_opening2(text, text, text, text, text, text, integer, text, text, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

created_by integer;

BEGIN

SELECT id INTO created_by  FROM saral_user where fname=$8  ;

select id INTO uid from saral_user where id=$10;

select departmentid INTO did from saral_user where id=$10;

select cmp_id INTO cid from saral_user where id=$10;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,dept_id,assign_to,cmp_id) values($1,$2,$3,$4,$5,$6,$7,created_by,did,uid,cid);

Return '';

END;$_$;


ALTER FUNCTION public.create_opening2(text, text, text, text, text, text, integer, text, text, integer) OWNER TO laitkor;

--
-- Name: create_opening3(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_opening3(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, character varying, integer, integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

created_by integer;

BEGIN

SELECT id INTO created_by  FROM saral_user where fname=$8  ;

select id INTO uid from saral_user where id=$10;

select departmentid INTO did from saral_user where id=$10;

select cmp_id INTO cid from saral_user where id=$11;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,dept_id,assign_to,cmp_id) values($1,$2,$3,$4,$5,$6,$7,created_by,did,uid,cid);

Return '';

END;$_$;


ALTER FUNCTION public.create_opening3(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, character varying, integer, integer) OWNER TO laitkor;

--
-- Name: create_opening_old_fun(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_opening_old_fun(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $_$declare 

cid integer;

did integer;

uid integer;

ropening_id integer;

created_by integer;

crtd_by integer;

BEGIN

select id INTO created_by from saral_user where fname=$8;

select id INTO crtd_by from saral_user where uname=$8;

select departmentid INTO did from saral_user where id=$9;

select cmp_id INTO cid from saral_user where id=$10;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,dept_id,assign_to,cmp_id,req_id) values($1,$2,$3,$4,$5,$6,$7,crtd_by ,did,$9,$10,$11);

select currval('"opening_opening_Id_seq"'::regclass) INTO ropening_id ;

insert into saral_new_update_stage(s_name, opening_id,created_by)

select stagename,ropening_id,crtd_by  from saral_stage;

update saral_launch set status = 2 where id=$11;

Return '';

END;

$_$;


ALTER FUNCTION public.create_opening_old_fun(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer) OWNER TO laitkor;

--
-- Name: create_openings(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_openings(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer, character varying) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

ropening_id integer;

created_by integer;

crtd_by integer;

oid integer;

BEGIN

select id INTO created_by from saral_user where fname=$8;

select id INTO crtd_by from saral_user where uname=$8;

select departmentid INTO did from saral_user where id=$9;

select cmp_id INTO cid from saral_user where id=$10;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,dept_id,assign_to,cmp_id,req_id,enddate) values($1,$2,$3,$4,$5,$6,$7,crtd_by ,did,$9,$10,$11,$12) returning opening_id INTO oid    ;

select currval('"opening_opening_Id_seq"'::regclass) INTO ropening_id ;

insert into saral_new_update_stage(s_name, opening_id,created_by)

select stagename,ropening_id,crtd_by  from saral_stage ss  order by ss.order;
update saral_launch set status = 2 where id=$11;

Return oid;

END;

$_$;


ALTER FUNCTION public.create_openings(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer, character varying) OWNER TO laitkor;

--
-- Name: create_openings_old(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_openings_old(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

ropening_id integer;

created_by integer;

crtd_by integer;

oid integer;

BEGIN

select id INTO created_by from saral_user where fname=$8;

select id INTO crtd_by from saral_user where uname=$8;

select departmentid INTO did from saral_user where id=$9;

select cmp_id INTO cid from saral_user where id=$10;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,dept_id,assign_to,cmp_id,req_id) values($1,$2,$3,$4,$5,$6,$7,crtd_by ,did,$9,$10,$11) returning opening_id INTO oid    ;

select currval('"opening_opening_Id_seq"'::regclass) INTO ropening_id ;

insert into saral_new_update_stage(s_name, opening_id,created_by)

select stagename,ropening_id,crtd_by  from saral_stage ss  order by ss.order;
update saral_launch set status = 2 where id=$11;

Return oid;

END;

$_$;


ALTER FUNCTION public.create_openings_old(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer) OWNER TO laitkor;

--
-- Name: create_openings_old_anshika(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_openings_old_anshika(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

ropening_id integer;

created_by integer;

crtd_by integer;

oid integer;

BEGIN

select id INTO created_by from saral_user where fname=$8;

select id INTO crtd_by from saral_user where uname=$8;

select departmentid INTO did from saral_user where id=$9;

select cmp_id INTO cid from saral_user where id=$10;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by,dept_id,assign_to,cmp_id,req_id) values($1,$2,$3,$4,$5,$6,$7,crtd_by ,did,$9,$10,$11) returning opening_id INTO oid    ;

select currval('"opening_opening_Id_seq"'::regclass) INTO ropening_id ;

insert into saral_new_update_stage(s_name, opening_id,created_by)

select stagename,ropening_id,crtd_by  from saral_stage ss  order by ss.order;
update saral_launch set status = 2 where id=$11;

Return oid;

END;

$_$;


ALTER FUNCTION public.create_openings_old_anshika(character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying, integer, integer, integer) OWNER TO laitkor;

--
-- Name: create_saral_opening(text, text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION create_saral_opening(text, text, text, text, text, text, integer, text) RETURNS void
    LANGUAGE plpgsql
    AS $_$declare created_by integer;

BEGIN

  SELECT id INTO created_by  FROM saral_user where fname=$8  ;

insert into saral_opening(position,city,state,country,job_discription,created_on,stage_id,created_by) values($1,$2,$3,$4,$5,$6,$7,created_by);

END;$_$;


ALTER FUNCTION public.create_saral_opening(text, text, text, text, text, text, integer, text) OWNER TO laitkor;

--
-- Name: dept(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION dept(p integer, OUT res character varying) RETURNS SETOF character varying
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

return QUERY select department_name from saral_department where cmp_id=cid ORDER BY 1;

END;

$_$;


ALTER FUNCTION public.dept(p integer, OUT res character varying) OWNER TO laitkor;

--
-- Name: down_stage(integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION down_stage(integer, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$ declare 

nid integer;

cid integer;

nsorder integer;

csorder integer;

tmp integer;

BEGIN

select saral_new_update_stage.sorder INTO csorder from saral_new_update_stage  where su_id=$1;

select su_id INTO nid from saral_new_update_stage  where saral_new_update_stage.sorder > csorder and saral_new_update_stage.opening_id=$2 order by sorder limit 1;

if nid <> 0 then

select saral_new_update_stage.sorder INTO nsorder from saral_new_update_stage  where saral_new_update_stage.su_id=nid ;

update saral_new_update_stage  set sorder=0 where su_id=$1;

update saral_new_update_stage  set sorder=csorder where su_id=nid;

update saral_new_update_stage  set sorder=nsorder where su_id=$1;

end if;

Return '';

END;$_$;


ALTER FUNCTION public.down_stage(integer, integer) OWNER TO laitkor;

--
-- Name: dummy(); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION dummy() RETURNS text
    LANGUAGE plpgsql
    AS $$

DECLARE

result text;

BEGIN

PERFORM 'SELECT 1+1';

RETURN 'ok';

END;

$$;


ALTER FUNCTION public.dummy() OWNER TO laitkor;

--
-- Name: fetch_department(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetch_department(OUT result character varying, posi integer) RETURNS SETOF character varying
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

return QUERY select department_name from saral_department where cmp_id=cid ORDER BY 1;

END;

$_$;


ALTER FUNCTION public.fetch_department(OUT result character varying, posi integer) OWNER TO laitkor;

--
-- Name: fetch_saral_department(text, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetch_saral_department(id text, cmp_name text) RETURNS text
    LANGUAGE plpgsql
    AS $_$

declare 

cid integer;

did integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

select department_name INTO dept_name from saral_department where cmp_id=cid;

return dept_name;

END;

$_$;


ALTER FUNCTION public.fetch_saral_department(id text, cmp_name text) OWNER TO laitkor;

--
-- Name: fetch_saral_department1(integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetch_saral_department1(id integer, cmp_name text) RETURNS text
    LANGUAGE plpgsql
    AS $$declare 

cid integer;

did integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=1;

select department_name INTO dept_name from saral_department where cmp_id=cid;

return dept_name;

END;

$$;


ALTER FUNCTION public.fetch_saral_department1(id integer, cmp_name text) OWNER TO laitkor;

--
-- Name: fetch_saral_department2(integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetch_saral_department2(integer, text) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

select department_name INTO dept_name from saral_department where cmp_id=cid ORDER BY 1;

return dept_name;

END;$_$;


ALTER FUNCTION public.fetch_saral_department2(integer, text) OWNER TO laitkor;

--
-- Name: fetch_saral_department2_1(integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetch_saral_department2_1(compid integer, compname text) RETURNS TABLE(deptname character varying)
    LANGUAGE plpgsql
    AS $_$

declare 

cid integer;

did integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

return QUERY select department_name from saral_department where cmp_id=cid ORDER BY 1;

END;

$_$;


ALTER FUNCTION public.fetch_saral_department2_1(compid integer, compname text) OWNER TO laitkor;

--
-- Name: fetch_saral_department6(integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetch_saral_department6(integer, text) RETURNS SETOF refcursor
    LANGUAGE plpgsql
    AS $_$DECLARE

cid integer;

did integer;

uid integer;

dept_name text;

customerRC refcursor;

orderRC refcursor;

BEGIN

open customerRC FOR

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

select department_name INTO dept_name from saral_department where cmp_id=cid;

RETURN NEXT customerRC;

open orderRC FOR

SELECT * FROM orders;

RETURN NEXT orderRC;

RETURN;

END;$_$;


ALTER FUNCTION public.fetch_saral_department6(integer, text) OWNER TO laitkor;

--
-- Name: fetch_user(character varying, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetch_user(dept_name character varying, cid integer) RETURNS SETOF character varying
    LANGUAGE plpgsql
    AS $_$declare

sdept_id integer;

srole_id integer;

user_name character varying;

BEGIN

select dept_id INTO sdept_id from saral_department where department_name=$1 and cmp_id=$2;

select role_id INTO srole_id from saral_user_role where dept_id=sdept_id;

return QUERY  select fname,id  from saral_user where userroleid=srole_id;

END;

$_$;


ALTER FUNCTION public.fetch_user(dept_name character varying, cid integer) OWNER TO laitkor;

--
-- Name: fetchdata(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION fetchdata(aa integer) RETURNS SETOF character varying
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

did integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

return QUERY select department_name from saral_department where cmp_id=$1 ORDER BY 1;

END;$_$;


ALTER FUNCTION public.fetchdata(aa integer) OWNER TO laitkor;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: person; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    first_name text,
    last_name text
);


ALTER TABLE public.person OWNER TO laitkor;

--
-- Name: format_person(person); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION format_person(person) RETURNS text
    LANGUAGE sql
    AS $_$

SELECT $1.last_name || ', ' || $1.first_name;

$_$;


ALTER FUNCTION public.format_person(person) OWNER TO laitkor;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE employee (
    id integer NOT NULL,
    name text,
    salary integer,
    departmentid integer
);


ALTER TABLE public.employee OWNER TO laitkor;

--
-- Name: getemployees(); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION getemployees() RETURNS SETOF employee
    LANGUAGE sql
    AS $$select * from employee;$$;


ALTER FUNCTION public.getemployees() OWNER TO laitkor;

--
-- Name: insert_person(text, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION insert_person(text, text) RETURNS void
    LANGUAGE sql
    AS $_$INSERT INTO person (first_name, last_name)

VALUES ($1, $2);

$_$;


ALTER FUNCTION public.insert_person(text, text) OWNER TO laitkor;

--
-- Name: insert_saral_user(text, text, text, integer, integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION insert_saral_user(text, text, text, integer, integer, text) RETURNS void
    LANGUAGE plpgsql
    AS $_$declare id integer;

BEGIN

select cmp_id INTO id from saral_company where cmp_name=$6;

IF  id IS NULL THEN

      insert into saral_company(cmp_name)values($6);

      select cmp_id INTO id from saral_company where cmp_name=$6;

      insert into saral_user( uname,email,pasword, UserRoleID,ativationid,cmp_id)values($1,$2,$3,$4,$5,id);

ELSE

   select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,ativationid,cmp_id)values($1,$2,$3,$4,$5,id);

END IF;

END;$_$;


ALTER FUNCTION public.insert_saral_user(text, text, text, integer, integer, text) OWNER TO laitkor;

--
-- Name: insert_saral_user1(text, text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION insert_saral_user1(uname text, cmp_name text, email text, pasword text, userroleid text, ativationid text) RETURNS void
    LANGUAGE plpgsql
    AS $_$

declare id integer;

BEGIN

SELECT cmp_id INTO id FROM saral_company WHERE  cmp_name=$2;

IF  id IS NULL THEN

      insert into saral_company(cmp_name)values($3);

      select cmp_id INTO id from saral_company where cmp_name=$2;

      insert into saral_user( uname,email,pasword, UserRoleID,ativationid,cmp_id)values($1,$2,$3,$4,$5,id);

ELSE

   select cmp_id INTO id from saral_user where cmp_name=$3;

insert into saral_user( uname,email,pasword, UserRoleID,ativationid,cmp_id)values($1,$2,$3,$4,$5,id);

END IF;

END;

$_$;


ALTER FUNCTION public.insert_saral_user1(uname text, cmp_name text, email text, pasword text, userroleid text, ativationid text) OWNER TO laitkor;

--
-- Name: insert_saral_user6(text, text, text, integer, integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION insert_saral_user6(text, text, text, integer, integer, text) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$declare id integer;

BEGIN

select cmp_id INTO id from saral_company where cmp_name=$6;

IF  id IS NULL THEN

      insert into saral_company(cmp_name)values($6);

      select cmp_id INTO id from saral_company where cmp_name=$6;

      insert into saral_user( uname,email,pasword, UserRoleID,ativationid,cmp_id)values($1,$2,$3,$4,$5,id);

ELSE

   select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,ativationid,cmp_id)values($1,$2,$3,$4,$5,id);

END IF;

END;$_$;


ALTER FUNCTION public.insert_saral_user6(text, text, text, integer, integer, text) OWNER TO laitkor;

--
-- Name: insert_saral_user7(text, text, text, integer, integer, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION insert_saral_user7(text, text, text, integer, integer, text) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare id integer;

did integer;

BEGIN

select cmp_id INTO id from saral_company where cmp_name=$6;

select dept_id INTO did from saral_user_role where  role_id = $4;

IF  id IS NULL THEN

      insert into saral_company(cmp_name)values($6);

      select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,departmentid,activationid,fname,perminsion,cmp_id)values($1,$2,$3,$4,did,$5,$1,1,id);

RETURN '';

ELSE

   select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,departmentid,ativationid,fname,perminsion,cmp_id)values($1,$2,$3,$4,did,$5,$1,1,id);

RETURN '';

END IF;

END;$_$;


ALTER FUNCTION public.insert_saral_user7(text, text, text, integer, integer, text) OWNER TO laitkor;

--
-- Name: insert_saral_user8(text, text, text, integer, integer, text, text, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION insert_saral_user8(text, text, text, integer, integer, text, text, text) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare id integer;

did integer;

BEGIN

select cmp_id INTO id from saral_company where cmp_name=$6;

select dept_id INTO did from saral_user_role where  role_id = $4;

IF  id IS NULL THEN

      insert into saral_company(cmp_name,displayname)values($6,$6);

      select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,departmentid,activationid,fname,perminsion,cmp_id,lname)values($1,$2,$3,$4,did,$5,$7,1,id,$8);

RETURN '';

ELSE

   select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,departmentid,ativationid,fname,perminsion,cmp_id,lname)values($1,$2,$3,$4,did,$5,$7,1,id,$8);

RETURN '';

END IF;

END;$_$;


ALTER FUNCTION public.insert_saral_user8(text, text, text, integer, integer, text, text, text) OWNER TO laitkor;

--
-- Name: insert_saral_user8(text, text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION insert_saral_user8(text, text, text, integer, integer, text, text, text, text) RETURNS text
    LANGUAGE plpgsql
    AS $_$declare id integer;

did integer;

BEGIN

select cmp_id INTO id from saral_company where cmp_name=$6;

select dept_id INTO did from saral_user_role where  role_id = $4;

IF  id IS NULL THEN

      insert into saral_company(cmp_name,displayname)values($6,$6);

      select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,departmentid,activationid,fname,perminsion,cmp_id,lname,phonenumber)values($1,$2,$3,101,64,$5,$7,1,id,$8,$9);

RETURN '';

ELSE

   select cmp_id INTO id from saral_company where cmp_name=$6;

insert into saral_user( uname,email,pasword, UserRoleID,departmentid,ativationid,fname,perminsion,cmp_id,lname,phonenumber)values($1,$2,$3,$4,did,$5,$7,1,id,$8,$9);

RETURN '';

END IF;

END;$_$;


ALTER FUNCTION public.insert_saral_user8(text, text, text, integer, integer, text, text, text, text) OWNER TO laitkor;

--
-- Name: saral_department2(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_department2(aa integer, OUT bb character varying) RETURNS SETOF character varying
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

uid integer;

dept_name text;

BEGIN

SELECT cmp_id INTO cid FROM saral_user WHERE  id=$1;

return QUERY select department_name from saral_department where cmp_id=cid ORDER BY 1;

END;

$_$;


ALTER FUNCTION public.saral_department2(aa integer, OUT bb character varying) OWNER TO laitkor;

--
-- Name: saral_fetch_user(character varying, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_fetch_user(name character varying, cmpid integer) RETURNS TABLE(fname character varying, uid integer)
    LANGUAGE plpgsql
    AS $_$

declare

sdept_id integer;

srole_id integer;

user_name character varying;

BEGIN

select dept_id INTO sdept_id from saral_department where department_name=$1 and cmp_id=$2;

select role_id INTO srole_id from saral_user_role where dept_id=sdept_id;

return QUERY  select fname,id  from saral_user where userroleid=srole_id and id=$2 ;

END;

$_$;


ALTER FUNCTION public.saral_fetch_user(name character varying, cmpid integer) OWNER TO laitkor;

--
-- Name: saral_fetch_user2(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_fetch_user2(cmpid integer) RETURNS TABLE(fname character varying, id integer)
    LANGUAGE plpgsql
    AS $_$

declare

sdept_id integer;

srole_id integer;

user_name character varying;

BEGIN

select dept_id INTO sdept_id from saral_department where department_name=$1 and cmp_id=$2;

select role_id INTO srole_id from saral_user_role where dept_id=sdept_id;

return QUERY  select fname,id  from saral_user where userroleid=srole_id;

END;

$_$;


ALTER FUNCTION public.saral_fetch_user2(cmpid integer) OWNER TO laitkor;

--
-- Name: saral_fetch_user3(character varying, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_fetch_user3(dept_name character varying, cid integer) RETURNS TABLE(fname character varying, id integer)
    LANGUAGE plpgsql
    AS $_$

declare

sdept_id integer;

srole_id integer;

user_name character varying;

BEGIN

select dept_id INTO sdept_id from saral_department where department_name=$1 and cmp_id=$2;

select role_id INTO srole_id from saral_user_role where dept_id=sdept_id;

return QUERY  select fname,id  from saral_user where userroleid=srole_id;

END;

$_$;


ALTER FUNCTION public.saral_fetch_user3(dept_name character varying, cid integer) OWNER TO laitkor;

--
-- Name: saral_fetch_user4(character varying, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_fetch_user4(name character varying, cmpid integer) RETURNS TABLE(ame character varying, uid integer)
    LANGUAGE plpgsql
    AS $_$

declare

sdept_id integer;

srole_id integer;

user_name character varying;

BEGIN

select dept_id INTO sdept_id from saral_department where department_name=$1 and cmp_id=$2;

select role_id INTO srole_id from saral_user_role where dept_id=sdept_id;

return QUERY  select fname,id  from saral_user where userroleid=srole_id and id=$2 ;

END;

$_$;


ALTER FUNCTION public.saral_fetch_user4(name character varying, cmpid integer) OWNER TO laitkor;

--
-- Name: saral_fetch_user6(character varying, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_fetch_user6(name character varying, cmpid integer) RETURNS TABLE(ame character varying, uid integer)
    LANGUAGE plpgsql
    AS $_$

declare

sdept_id integer;

srole_id integer;

user_name character varying;

BEGIN

select dept_id INTO sdept_id from saral_department where department_name=$1 and cmp_id=$2;

select role_id INTO srole_id from saral_user_role where dept_id=sdept_id;

return QUERY  select fname,id  from saral_user where userroleid=srole_id and cmp_id=$2 ;

END;

$_$;


ALTER FUNCTION public.saral_fetch_user6(name character varying, cmpid integer) OWNER TO laitkor;

--
-- Name: saral_manage_opening(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_manage_opening(cmpid integer) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

BEGIN

RETURN QUERY select so.opening_id,so.position,so.city, ss.stagename,sd.department_name,su.fname from saral_opening so left outer join saral_stage ss on so.stage_id=ss.stage_id  left outer join saral_department sd on so.dept_id=sd.dept_id left outer join saral_user su on su.id=so.assign_to where su.cmp_id=$1;

End;

$_$;


ALTER FUNCTION public.saral_manage_opening(cmpid integer) OWNER TO laitkor;

--
-- Name: saral_user; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_user (
    uname character varying(64) NOT NULL,
    pasword character varying(64),
    email character varying(64) NOT NULL,
    userroleid integer,
    departmentid integer,
    activationid integer,
    fname character varying(64),
    lname character varying(64),
    currentlocation character varying(64),
    mobile character varying,
    phonenumber character varying,
    activate integer,
    cmp_id integer,
    id integer NOT NULL,
    country_code bigint,
    state_code bigint,
    perminsion integer,
    designation character varying,
    state character varying,
    country character varying,
    area character varying,
    city character varying,
    created_on character varying,
    guino character varying,
    issecondaryadmin boolean DEFAULT false NOT NULL,
    fullname character varying
);


ALTER TABLE public.saral_user OWNER TO laitkor;

--
-- Name: saral_manage_user1(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_manage_user1(integer) RETURNS SETOF saral_user
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

BEGIN

RETURN QUERY select so.opening_id,so.position,so.city, ss.name,sd.department_name,su.fname from saral_opening so left outer join saral_stage ss on so.stage_id=ss.stage_id  left outer join saral_department sd on so.dept_id=sd.dept_id left outer join saral_user su on su.id=so.assign_to where su.cmp_id=$1;

End;$_$;


ALTER FUNCTION public.saral_manage_user1(integer) OWNER TO laitkor;

--
-- Name: saral_manage_user2(integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_manage_user2(cmpid integer) RETURNS TABLE(opening_id integer, "position" character varying, city character varying, stagename character varying, department_name character varying, fname character varying)
    LANGUAGE plpgsql
    AS $_$

declare 

cid integer;

BEGIN

RETURN QUERY select so.opening_id,so.position,so.city, ss.stagename,sd.department_name,su.fname from saral_opening so left outer join saral_stage ss on so.stage_id=ss.stage_id  left outer join saral_department sd on so.dept_id=sd.dept_id left outer join saral_user su on su.id=so.assign_to where su.cmp_id=$1;

End;

$_$;


ALTER FUNCTION public.saral_manage_user2(cmpid integer) OWNER TO laitkor;

--
-- Name: saral_search_opening(integer, character varying); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_search_opening(cmpid integer, opening character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

BEGIN

RETURN QUERY select so.opening_id,so.position as opening,so.city,ss.stagename,sd.department_name,su.fname,(select count(*) from saral_opening_assign where opening_id=so.opening_id ) as total_candidate  from saral_opening so left outer join saral_stage ss on so.stage_id=ss.stage_id  left outer join saral_department sd on so.dept_id=sd.dept_id left outer join saral_user su on su.id=so.assign_to where so.cmp_id=$1    and  so.position ~* $2 and so.status='Active' order by  so.opening_id DESC;

End;

$_$;


ALTER FUNCTION public.saral_search_opening(cmpid integer, opening character varying) OWNER TO laitkor;

--
-- Name: saral_search_user(integer, character varying); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_search_user(cmpid integer, opening character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

BEGIN

RETURN QUERY select so.opening_id,so.position,so.city, ss.stagename,sd.department_name,su.fname from saral_opening so left outer join saral_stage ss on so.stage_id=ss.stage_id  left outer join saral_department sd on so.dept_id=sd.dept_id left outer join saral_user su on su.id=so.assign_to where so.cmp_id=$1 and so.position=$2;

End;

$_$;


ALTER FUNCTION public.saral_search_user(cmpid integer, opening character varying) OWNER TO laitkor;

--
-- Name: saral_selaect_company(character varying); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION saral_selaect_company(cmpid character varying) RETURNS TABLE(cnpid integer)
    LANGUAGE plpgsql
    AS $_$

declare 

cid integer;

BEGIN

return QUERY SELECT cmp_id FROM saral_company WHERE  cmp_name=$1;

END;

$_$;


ALTER FUNCTION public.saral_selaect_company(cmpid character varying) OWNER TO laitkor;

--
-- Name: saral_select _company1(character varying); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION "saral_select _company1"(cmpname character varying) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $_$declare 

cid integer;

BEGIN

return QUERY SELECT cmp_id FROM saral_company WHERE  cmp_name=$1;

END;$_$;


ALTER FUNCTION public."saral_select _company1"(cmpname character varying) OWNER TO laitkor;

--
-- Name: search_opening(integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION search_opening(integer, integer) RETURNS SETOF record
    LANGUAGE plpgsql STRICT
    AS $_$declare 

cid integer;

BEGIN

RETURN QUERY select so.opening_id,so.position,so.city, ss.stagename,sd.department_name,su.fname from saral_opening so left outer join saral_stage ss on so.stage_id=ss.stage_id  left outer join saral_department sd on so.dept_id=sd.dept_id left outer join saral_user su on su.id=so.assign_to where su.cmp_id=$1 and so.position ~* $2 order by  so.opening_id DESC;

End;$_$;


ALTER FUNCTION public.search_opening(integer, integer) OWNER TO laitkor;

--
-- Name: search_opening1(integer, character varying); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION search_opening1(integer, character varying) RETURNS SETOF record
    LANGUAGE plpgsql STRICT
    AS $_$declare 

cid integer;

BEGIN

RETURN QUERY select so.opening_id,so.position,so.city, ss.stagename,sd.department_name,su.fname from saral_opening so left outer join saral_stage ss on so.stage_id=ss.stage_id  left outer join saral_department sd on so.dept_id=sd.dept_id left outer join saral_user su on su.id=so.assign_to where su.cmp_id=$1 and so.position ~* $2 order by  so.opening_id DESC;

End;$_$;


ALTER FUNCTION public.search_opening1(integer, character varying) OWNER TO laitkor;

--
-- Name: up_stage(integer, integer); Type: FUNCTION; Schema: public; Owner: laitkor
--

CREATE FUNCTION up_stage(integer, integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$ declare 

nid integer;

cid integer;

nsorder integer;

csorder integer;

tmp integer;

BEGIN

select saral_new_update_stage.sorder INTO csorder from saral_new_update_stage  where su_id=$1;

select su_id INTO nid from saral_new_update_stage  where saral_new_update_stage.sorder < csorder and saral_new_update_stage.opening_id=$2 order by sorder desc  limit 1;

if nid <> 0 then

select saral_new_update_stage.sorder INTO nsorder from saral_new_update_stage  where saral_new_update_stage.su_id=nid ;

update saral_new_update_stage  set sorder=0 where su_id=nid;

update saral_new_update_stage set sorder=nsorder where su_id=$1;

update saral_new_update_stage  set sorder=csorder where su_id=nid;

end if;

Return '';

END;$_$;


ALTER FUNCTION public.up_stage(integer, integer) OWNER TO laitkor;

--
-- Name: fts; Type: TEXT SEARCH CONFIGURATION; Schema: public; Owner: laitkor
--

CREATE TEXT SEARCH CONFIGURATION fts (
    PARSER = pg_catalog."default" );


ALTER TEXT SEARCH CONFIGURATION public.fts OWNER TO laitkor;

--
-- Name: cid; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE cid (
    cmp_id integer
);


ALTER TABLE public.cid OWNER TO laitkor;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE contacts (
    id bigint NOT NULL,
    cell_no character varying(255),
    birthdate date,
    firstname character varying(255),
    lastname character varying(255),
    email_id character varying(255),
    website character varying(255),
    created date
);


ALTER TABLE public.contacts OWNER TO laitkor;

--
-- Name: country; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE country (
    id character varying(2) NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.country OWNER TO laitkor;

--
-- Name: created_by; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE created_by (
    id integer
);


ALTER TABLE public.created_by OWNER TO laitkor;

--
-- Name: department; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE department (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.department OWNER TO laitkor;

--
-- Name: did_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.did_seq OWNER TO laitkor;

--
-- Name: email_notifaction; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE email_notifaction (
    id integer NOT NULL,
    notifaction character varying,
    action character varying,
    permisition integer
);


ALTER TABLE public.email_notifaction OWNER TO laitkor;

--
-- Name: email_notifaction_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE email_notifaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_notifaction_id_seq OWNER TO laitkor;

--
-- Name: email_notifaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE email_notifaction_id_seq OWNED BY email_notifaction.id;


--
-- Name: eml; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE eml (
    "from" character varying(100),
    subject character varying(100),
    path character varying(100),
    "resume_Headline" character varying(60),
    "key_Skills" character varying(100),
    name character varying(100),
    "total_ Experience" character varying(100),
    "cTC" character varying(100),
    "current _Employer" character varying(100),
    "current_ Designation" character varying(100),
    "last_ Employer" character varying(100),
    "last_ Designation" character varying(100),
    "current _Location" character varying(100),
    "preferred Location" character varying(100),
    education character varying(100),
    mobile character varying(20),
    landline character varying(20),
    recommendations character varying(100),
    "last _modified _on" character varying(100),
    id integer NOT NULL
);


ALTER TABLE public.eml OWNER TO laitkor;

--
-- Name: eml_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE eml_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eml_id_seq OWNER TO laitkor;

--
-- Name: eml_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE eml_id_seq OWNED BY eml.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO laitkor;

--
-- Name: nid; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE nid (
    su_id integer
);


ALTER TABLE public.nid OWNER TO laitkor;

--
-- Name: saral_opening; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_opening (
    opening_id integer NOT NULL,
    "position" character varying(64),
    city character varying(64),
    state character varying(64),
    country character varying(64),
    job_discription character varying,
    created_on character varying(64),
    stage_id integer,
    created_by integer,
    dept_id integer,
    assign_to integer,
    cmp_id integer,
    status character varying(64) DEFAULT 'Active'::character varying,
    req_id integer,
    enddate character varying
);


ALTER TABLE public.saral_opening OWNER TO laitkor;

--
-- Name: opening_opening_Id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE "opening_opening_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."opening_opening_Id_seq" OWNER TO laitkor;

--
-- Name: opening_opening_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE "opening_opening_Id_seq" OWNED BY saral_opening.opening_id;


--
-- Name: parse_setting; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE parse_setting (
    id integer NOT NULL,
    cmp_id integer NOT NULL,
    mailhost character varying NOT NULL,
    port character varying NOT NULL,
    username character varying NOT NULL,
    credential character varying NOT NULL
);


ALTER TABLE public.parse_setting OWNER TO laitkor;

--
-- Name: parse_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE parse_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parse_setting_id_seq OWNER TO laitkor;

--
-- Name: parse_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE parse_setting_id_seq OWNED BY parse_setting.id;


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO laitkor;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- Name: saral_adduser; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_adduser (
    id integer NOT NULL,
    fname character varying,
    lname character varying,
    area character varying,
    city character varying,
    state character varying,
    country character varying,
    phonenumber bigint,
    mobile bigint,
    uname character varying,
    password character varying,
    email character varying,
    currentlocation character varying,
    designation character varying,
    department integer,
    role integer DEFAULT 1,
    status integer,
    perminsion integer,
    cmp_id integer,
    activation_id integer
);


ALTER TABLE public.saral_adduser OWNER TO laitkor;

--
-- Name: saral_addUser_user_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE "saral_addUser_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."saral_addUser_user_id_seq" OWNER TO laitkor;

--
-- Name: saral_addUser_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE "saral_addUser_user_id_seq" OWNED BY saral_adduser.id;


--
-- Name: saral_candidate; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_candidate (
    candidate_id integer NOT NULL,
    name character varying(64),
    email character varying(100),
    phone character varying,
    descripation character varying,
    resume character varying,
    opening_id integer,
    created_by integer,
    created_on character varying(64),
    experience character varying,
    location character varying,
    education character varying,
    skills character varying,
    cmp_id integer,
    via character varying,
    mobile character varying,
    lname character varying,
    designation character varying,
    status integer DEFAULT 1,
    createdon timestamp without time zone DEFAULT now(),
    guid character varying,
    g_college character varying,
    g_university character varying,
    g_specialization character varying,
    g_percentage integer,
    pg_college character varying,
    pg_university character varying,
    pg_specialization character varying,
    pg_percentage integer,
    industry_type character varying,
    total_experience integer,
    functional_expertise character varying,
    current_ctc character varying,
    expected_ctc character varying,
    gender character varying,
    age_group character varying,
    passport character varying,
    d_field1 character varying,
    d_field2 character varying,
    d_field3 character varying,
    d_field4 character varying,
    d_field5 character varying,
    gdegree character varying,
    pg_degree character varying,
    current_employer character varying,
    employer_location character varying
);


ALTER TABLE public.saral_candidate OWNER TO laitkor;

--
-- Name: saral_candidate_candidate_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_candidate_candidate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_candidate_candidate_id_seq OWNER TO laitkor;

--
-- Name: saral_candidate_candidate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_candidate_candidate_id_seq OWNED BY saral_candidate.candidate_id;


--
-- Name: saral_candidate_document; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_candidate_document (
    document_id integer NOT NULL,
    candidate_id integer,
    created_on timestamp with time zone DEFAULT now(),
    cmp_id integer,
    doc_name character varying,
    path character varying
);


ALTER TABLE public.saral_candidate_document OWNER TO laitkor;

--
-- Name: saral_candidate_document_document_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_candidate_document_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_candidate_document_document_id_seq OWNER TO laitkor;

--
-- Name: saral_candidate_document_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_candidate_document_document_id_seq OWNED BY saral_candidate_document.document_id;


--
-- Name: saral_candidate_g_college_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_candidate_g_college_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_candidate_g_college_seq OWNER TO laitkor;

--
-- Name: saral_candidate_g_college_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_candidate_g_college_seq OWNED BY saral_candidate.g_college;


--
-- Name: saral_candidate_location_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_candidate_location_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_candidate_location_seq OWNER TO laitkor;

--
-- Name: saral_candidate_location_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_candidate_location_seq OWNED BY saral_candidate.location;


--
-- Name: saral_candidate_stage; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_candidate_stage (
    su_id integer,
    s_name character varying,
    opening_id integer,
    candidate_id integer,
    assign_date date DEFAULT now() NOT NULL
);


ALTER TABLE public.saral_candidate_stage OWNER TO laitkor;

--
-- Name: saral_candidate_todos; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_candidate_todos (
    id integer NOT NULL,
    title character varying NOT NULL,
    timeat character varying,
    candidate_id integer NOT NULL,
    opening_id integer NOT NULL,
    created_by character varying(100),
    created_on character varying(100),
    status integer DEFAULT 1,
    user_id integer,
    due_by character varying NOT NULL,
    createdbyid integer,
    todosdescription character varying,
    completedby integer
);


ALTER TABLE public.saral_candidate_todos OWNER TO laitkor;

--
-- Name: saral_candidate_todos_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_candidate_todos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_candidate_todos_id_seq OWNER TO laitkor;

--
-- Name: saral_candidate_todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_candidate_todos_id_seq OWNED BY saral_candidate_todos.id;


--
-- Name: saral_candidate_todos_title_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_candidate_todos_title_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_candidate_todos_title_seq OWNER TO laitkor;

--
-- Name: saral_candidate_todos_title_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_candidate_todos_title_seq OWNED BY saral_candidate_todos.title;


--
-- Name: saral_company; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_company (
    cmp_id integer NOT NULL,
    cmp_name character varying(64) NOT NULL,
    created_by integer,
    displayname character varying
);


ALTER TABLE public.saral_company OWNER TO laitkor;

--
-- Name: saral_company_cmp_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_company_cmp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_company_cmp_id_seq OWNER TO laitkor;

--
-- Name: saral_company_cmp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_company_cmp_id_seq OWNED BY saral_company.cmp_id;


--
-- Name: saral_company_role; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_company_role (
    id integer NOT NULL,
    role_id integer,
    cmp_id integer
);


ALTER TABLE public.saral_company_role OWNER TO laitkor;

--
-- Name: saral_company_role_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_company_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_company_role_id_seq OWNER TO laitkor;

--
-- Name: saral_company_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_company_role_id_seq OWNED BY saral_company_role.id;


--
-- Name: saral_company_saral_user; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_company_saral_user (
    saral_company_cmp_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.saral_company_saral_user OWNER TO laitkor;

--
-- Name: saral_interview; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_interview (
    interview_id integer NOT NULL,
    description character varying,
    invite_people character varying,
    location character varying,
    schedule character varying,
    duration character varying,
    openning_id integer NOT NULL,
    candidate_id integer NOT NULL,
    cmp_id integer,
    schedule_time character varying(10),
    mail_id integer DEFAULT 0,
    su_id integer,
    iorder integer NOT NULL,
    title integer
);


ALTER TABLE public.saral_interview OWNER TO laitkor;

--
-- Name: saral_create_interview_interview_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_create_interview_interview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_create_interview_interview_id_seq OWNER TO laitkor;

--
-- Name: saral_create_interview_interview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_create_interview_interview_id_seq OWNED BY saral_interview.interview_id;


--
-- Name: saral_create_user; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_create_user (
    user_id integer NOT NULL,
    "position" character varying(60),
    city character varying(60),
    state character varying(60),
    country character varying(60),
    job_description character varying(150)
);


ALTER TABLE public.saral_create_user OWNER TO laitkor;

--
-- Name: saral_create_user_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_create_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_create_user_id_seq OWNER TO laitkor;

--
-- Name: saral_create_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_create_user_id_seq OWNED BY saral_create_user.user_id;


--
-- Name: saral_dfields; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_dfields (
    id integer NOT NULL,
    status integer DEFAULT 0,
    cmpid integer,
    fields character varying,
    field_id integer
);


ALTER TABLE public.saral_dfields OWNER TO laitkor;

--
-- Name: saral_dFields_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE "saral_dFields_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."saral_dFields_id_seq" OWNER TO laitkor;

--
-- Name: saral_dFields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE "saral_dFields_id_seq" OWNED BY saral_dfields.id;


--
-- Name: saral_department; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_department (
    id integer NOT NULL,
    department_name character varying(60) NOT NULL,
    dept_id integer,
    cmp_id integer,
    active integer DEFAULT 0
);


ALTER TABLE public.saral_department OWNER TO laitkor;

--
-- Name: saral_department_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_department_id_seq OWNER TO laitkor;

--
-- Name: saral_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_department_id_seq OWNED BY saral_department.id;


--
-- Name: saral_feedback_rating; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_feedback_rating (
    id integer NOT NULL,
    rating_name character varying
);


ALTER TABLE public.saral_feedback_rating OWNER TO laitkor;

--
-- Name: saral_feedback_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_feedback_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_feedback_rating_id_seq OWNER TO laitkor;

--
-- Name: saral_feedback_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_feedback_rating_id_seq OWNED BY saral_feedback_rating.id;


--
-- Name: saral_internal_notes; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_internal_notes (
    id integer NOT NULL,
    candidate_id integer,
    opening_id integer,
    user_id integer,
    stage_id integer,
    notes character varying(1000) NOT NULL,
    created_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.saral_internal_notes OWNER TO laitkor;

--
-- Name: saral_internal_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_internal_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_internal_notes_id_seq OWNER TO laitkor;

--
-- Name: saral_internal_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_internal_notes_id_seq OWNED BY saral_internal_notes.id;


--
-- Name: saral_internalnotes_reply; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_internalnotes_reply (
    r_id integer NOT NULL,
    note_id integer NOT NULL,
    created_on timestamp without time zone DEFAULT now(),
    user_id integer NOT NULL,
    reply character varying NOT NULL
);


ALTER TABLE public.saral_internalnotes_reply OWNER TO laitkor;

--
-- Name: saral_internalnotes_reply_r_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_internalnotes_reply_r_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_internalnotes_reply_r_id_seq OWNER TO laitkor;

--
-- Name: saral_internalnotes_reply_r_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_internalnotes_reply_r_id_seq OWNED BY saral_internalnotes_reply.r_id;


--
-- Name: saral_internalnotes_reply_reply_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_internalnotes_reply_reply_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_internalnotes_reply_reply_seq OWNER TO laitkor;

--
-- Name: saral_internalnotes_reply_reply_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_internalnotes_reply_reply_seq OWNED BY saral_internalnotes_reply.reply;


--
-- Name: saral_interview_feedback; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_interview_feedback (
    f_id integer NOT NULL,
    interview_id integer NOT NULL,
    user_id integer NOT NULL,
    feedback character varying,
    created_on timestamp without time zone DEFAULT now(),
    experience character varying,
    education character varying,
    communication_skills character varying,
    knowledge character varying,
    presentation character varying,
    problem_solving_skills character varying,
    computer_skills character varying,
    job_stability character varying,
    candidate_strengths character varying,
    candidate_weakness character varying,
    experience_rating character varying,
    education_rating character varying,
    communication_skills_rating character varying,
    knowledge_rating character varying,
    presentation_rating character varying,
    problem_solving_skills_rating character varying,
    computer_skills_rating character varying,
    job_stability_rating character varying,
    job_related_criteria character varying,
    additional_comments character varying,
    status character varying
);


ALTER TABLE public.saral_interview_feedback OWNER TO laitkor;

--
-- Name: saral_interview_feedback_candidate_strengths_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_interview_feedback_candidate_strengths_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_interview_feedback_candidate_strengths_seq OWNER TO laitkor;

--
-- Name: saral_interview_feedback_candidate_strengths_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_interview_feedback_candidate_strengths_seq OWNED BY saral_interview_feedback.candidate_strengths;


--
-- Name: saral_interview_feedback_communication_skills_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_interview_feedback_communication_skills_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_interview_feedback_communication_skills_seq OWNER TO laitkor;

--
-- Name: saral_interview_feedback_communication_skills_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_interview_feedback_communication_skills_seq OWNED BY saral_interview_feedback.communication_skills;


--
-- Name: saral_interview_feedback_f_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_interview_feedback_f_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_interview_feedback_f_id_seq OWNER TO laitkor;

--
-- Name: saral_interview_feedback_f_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_interview_feedback_f_id_seq OWNED BY saral_interview_feedback.f_id;


--
-- Name: saral_interview_order_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_interview_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_interview_order_seq OWNER TO laitkor;

--
-- Name: saral_interview_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_interview_order_seq OWNED BY saral_interview.iorder;


--
-- Name: saral_interview_type; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_interview_type (
    id integer NOT NULL,
    cmp_id integer,
    interview_name character varying,
    status integer DEFAULT 0
);


ALTER TABLE public.saral_interview_type OWNER TO laitkor;

--
-- Name: saral_interview_type_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_interview_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_interview_type_id_seq OWNER TO laitkor;

--
-- Name: saral_interview_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_interview_type_id_seq OWNED BY saral_interview_type.id;


--
-- Name: saral_launch; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_launch (
    cmp_id integer,
    grade character varying(64),
    requirement_no integer,
    month_sallary character varying(64),
    reporting_staff_no integer,
    gender character varying(64),
    incumbent_member character varying(64),
    work_shifts character varying(64),
    experience character varying(64),
    age_group character varying(64),
    requirement_type character varying(64),
    educational_detail character varying(64),
    department integer,
    designation integer,
    purpose character varying(500),
    functions character varying(200),
    results character varying(200),
    behaviors character varying(200),
    id integer NOT NULL,
    status integer DEFAULT 0,
    created_by character varying,
    comments character varying,
    date timestamp with time zone,
    name character varying
);


ALTER TABLE public.saral_launch OWNER TO laitkor;

--
-- Name: saral_launch_designation_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_launch_designation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_launch_designation_seq OWNER TO laitkor;

--
-- Name: saral_launch_designation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_launch_designation_seq OWNED BY saral_launch.designation;


--
-- Name: saral_launch_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_launch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_launch_id_seq OWNER TO laitkor;

--
-- Name: saral_launch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_launch_id_seq OWNED BY saral_launch.id;


--
-- Name: saral_mail_notification; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_mail_notification (
    id integer,
    mail_notification character varying,
    cmp_id integer,
    activation_id integer,
    user_id integer,
    candidate_id integer,
    action character varying,
    permission_id integer
);


ALTER TABLE public.saral_mail_notification OWNER TO laitkor;

--
-- Name: saral_mail_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_mail_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_mail_notification_id_seq OWNER TO laitkor;

--
-- Name: saral_mail_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_mail_notification_id_seq OWNED BY saral_mail_notification.id;


--
-- Name: saral_new_update_stage; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_new_update_stage (
    s_name character varying,
    sorder integer,
    opening_id integer,
    su_id integer NOT NULL,
    created_by integer,
    created_on character varying
);


ALTER TABLE public.saral_new_update_stage OWNER TO laitkor;

--
-- Name: saral_new_update_stage_opening_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_new_update_stage_opening_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_new_update_stage_opening_id_seq OWNER TO laitkor;

--
-- Name: saral_new_update_stage_opening_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_new_update_stage_opening_id_seq OWNED BY saral_new_update_stage.opening_id;


--
-- Name: saral_new_update_stage_order_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_new_update_stage_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_new_update_stage_order_seq OWNER TO laitkor;

--
-- Name: saral_new_update_stage_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_new_update_stage_order_seq OWNED BY saral_new_update_stage.sorder;


--
-- Name: saral_new_update_stage_su_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_new_update_stage_su_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_new_update_stage_su_id_seq OWNER TO laitkor;

--
-- Name: saral_new_update_stage_su_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_new_update_stage_su_id_seq OWNED BY saral_new_update_stage.su_id;


--
-- Name: saral_opening_assign; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_opening_assign (
    id integer NOT NULL,
    opening_id integer,
    candidate_id integer,
    assign_date date DEFAULT now()
);


ALTER TABLE public.saral_opening_assign OWNER TO laitkor;

--
-- Name: saral_opening_assign_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_opening_assign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_opening_assign_id_seq OWNER TO laitkor;

--
-- Name: saral_opening_assign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_opening_assign_id_seq OWNED BY saral_opening_assign.id;


--
-- Name: saral_opening_candidate; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_opening_candidate (
    id integer NOT NULL,
    opening_id integer NOT NULL,
    candidate_id integer,
    created_on character varying(64),
    created_by integer
);


ALTER TABLE public.saral_opening_candidate OWNER TO laitkor;

--
-- Name: saral_opening_candidate_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_opening_candidate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_opening_candidate_id_seq OWNER TO laitkor;

--
-- Name: saral_opening_candidate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_opening_candidate_id_seq OWNED BY saral_opening_candidate.id;


--
-- Name: saral_opening_interview; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_opening_interview (
    id integer NOT NULL,
    opening_id integer,
    interview_id integer,
    created_on character varying,
    created_by integer
);


ALTER TABLE public.saral_opening_interview OWNER TO laitkor;

--
-- Name: saral_opening_interview_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_opening_interview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_opening_interview_id_seq OWNER TO laitkor;

--
-- Name: saral_opening_interview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_opening_interview_id_seq OWNED BY saral_opening_interview.id;


--
-- Name: saral_opening_stage; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_opening_stage (
    stage_id integer NOT NULL,
    opning_stage_id integer NOT NULL,
    opning_details character varying
);


ALTER TABLE public.saral_opening_stage OWNER TO laitkor;

--
-- Name: saral_opening_stage_stage_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_opening_stage_stage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_opening_stage_stage_id_seq OWNER TO laitkor;

--
-- Name: saral_opening_stage_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_opening_stage_stage_id_seq OWNED BY saral_opening_stage.stage_id;


--
-- Name: saral_order_stage; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_order_stage (
    id integer NOT NULL,
    stage_flag boolean,
    opening_id integer,
    stage_order integer
);


ALTER TABLE public.saral_order_stage OWNER TO laitkor;

--
-- Name: saral_order_stage_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_order_stage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_order_stage_id_seq OWNER TO laitkor;

--
-- Name: saral_order_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_order_stage_id_seq OWNED BY saral_order_stage.id;


--
-- Name: saral_permission; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_permission (
    id integer NOT NULL,
    permission_type character varying,
    permission_id integer NOT NULL
);


ALTER TABLE public.saral_permission OWNER TO laitkor;

--
-- Name: saral_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_permission_id_seq OWNER TO laitkor;

--
-- Name: saral_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_permission_id_seq OWNED BY saral_permission.id;


--
-- Name: saral_permission_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_permission_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_permission_permission_id_seq OWNER TO laitkor;

--
-- Name: saral_permission_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_permission_permission_id_seq OWNED BY saral_permission.permission_id;


--
-- Name: saral_replecated_interview; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_replecated_interview (
    interview_id integer,
    title character varying,
    description character varying,
    invite_people character varying,
    location character varying,
    schedule character varying,
    duration character varying,
    openning_id integer,
    candidate_id integer,
    cmp_id integer,
    schedule_time character varying(10),
    mail_id integer,
    su_id integer
);


ALTER TABLE public.saral_replecated_interview OWNER TO laitkor;

--
-- Name: saral_role_assign; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_role_assign (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.saral_role_assign OWNER TO laitkor;

--
-- Name: saral_role_assign_role_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_role_assign_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_role_assign_role_id_seq OWNER TO laitkor;

--
-- Name: saral_role_assign_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_role_assign_role_id_seq OWNED BY saral_role_assign.role_id;


--
-- Name: saral_role_assign_user_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_role_assign_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_role_assign_user_id_seq OWNER TO laitkor;

--
-- Name: saral_role_assign_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_role_assign_user_id_seq OWNED BY saral_role_assign.user_id;


--
-- Name: saral_role_dept; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_role_dept (
    id integer NOT NULL,
    role_id integer,
    dept_id integer
);


ALTER TABLE public.saral_role_dept OWNER TO laitkor;

--
-- Name: saral_role_dept_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_role_dept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_role_dept_id_seq OWNER TO laitkor;

--
-- Name: saral_role_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_role_dept_id_seq OWNED BY saral_role_dept.id;


--
-- Name: saral_stage; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_stage (
    stage_id integer NOT NULL,
    stagename character varying,
    "order" integer,
    created_on character varying(64),
    created_by integer
);


ALTER TABLE public.saral_stage OWNER TO laitkor;

--
-- Name: saral_stage_assign; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_stage_assign (
    id integer NOT NULL,
    assign_id integer,
    stage_id integer,
    created_by integer,
    created_on character varying(64)
);


ALTER TABLE public.saral_stage_assign OWNER TO laitkor;

--
-- Name: saral_stage_assign_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_stage_assign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_stage_assign_id_seq OWNER TO laitkor;

--
-- Name: saral_stage_assign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_stage_assign_id_seq OWNED BY saral_stage_assign.id;


--
-- Name: saral_stage_stage_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_stage_stage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_stage_stage_id_seq OWNER TO laitkor;

--
-- Name: saral_stage_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_stage_stage_id_seq OWNED BY saral_stage.stage_id;


--
-- Name: saral_stage_user_assign; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_stage_user_assign (
    su_id integer,
    opening_id integer,
    user_id integer,
    cmp_id integer
);


ALTER TABLE public.saral_stage_user_assign OWNER TO laitkor;

--
-- Name: saral_todos_user; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_todos_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    opening_id integer NOT NULL
);


ALTER TABLE public.saral_todos_user OWNER TO laitkor;

--
-- Name: saral_todos_user_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_todos_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_todos_user_id_seq OWNER TO laitkor;

--
-- Name: saral_todos_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_todos_user_id_seq OWNED BY saral_todos_user.id;


--
-- Name: saral_unassigin_user; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_unassigin_user (
    id integer NOT NULL,
    user_id integer,
    cmp_id integer,
    candidate_id integer
);


ALTER TABLE public.saral_unassigin_user OWNER TO laitkor;

--
-- Name: saral_unassigin_user_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_unassigin_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_unassigin_user_id_seq OWNER TO laitkor;

--
-- Name: saral_unassigin_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_unassigin_user_id_seq OWNED BY saral_unassigin_user.id;


--
-- Name: testde; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE testde (
    id integer NOT NULL,
    mo character varying,
    clm character varying
);


ALTER TABLE public.testde OWNER TO laitkor;

--
-- Name: update_stage_id_sequence; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE update_stage_id_sequence
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.update_stage_id_sequence OWNER TO laitkor;

--
-- Name: update_stage_id_sequence; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE update_stage_id_sequence OWNED BY testde.id;


--
-- Name: saral_update_stage; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_update_stage (
    stagename character varying,
    "order" integer,
    created_on character varying,
    created_by integer,
    opening_id integer,
    stage_id integer DEFAULT nextval('update_stage_id_sequence'::regclass) NOT NULL
);


ALTER TABLE public.saral_update_stage OWNER TO laitkor;

--
-- Name: saral_update_stage_stage_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_update_stage_stage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_update_stage_stage_id_seq OWNER TO laitkor;

--
-- Name: saral_update_stage_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_update_stage_stage_id_seq OWNED BY saral_update_stage.stage_id;


--
-- Name: saral_user_candidate; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_user_candidate (
    id integer NOT NULL,
    note character varying,
    created_on character varying,
    created_by integer,
    candidate_id integer
);


ALTER TABLE public.saral_user_candidate OWNER TO laitkor;

--
-- Name: saral_user_candidate_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_user_candidate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_user_candidate_id_seq OWNER TO laitkor;

--
-- Name: saral_user_candidate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_user_candidate_id_seq OWNED BY saral_user_candidate.id;


--
-- Name: saral_user_dept; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_user_dept (
    id integer NOT NULL,
    user_id integer,
    dept_id integer
);


ALTER TABLE public.saral_user_dept OWNER TO laitkor;

--
-- Name: saral_user_dept_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_user_dept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_user_dept_id_seq OWNER TO laitkor;

--
-- Name: saral_user_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_user_dept_id_seq OWNED BY saral_user_dept.id;


--
-- Name: saral_user_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_user_id_seq OWNER TO laitkor;

--
-- Name: saral_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_user_id_seq OWNED BY saral_user.id;


--
-- Name: saralnxtid; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saralnxtid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.saralnxtid OWNER TO laitkor;

--
-- Name: saral_user_info; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_user_info (
    id integer DEFAULT nextval('saralnxtid'::regclass) NOT NULL,
    user_id integer,
    username character varying(64) NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE public.saral_user_info OWNER TO laitkor;

--
-- Name: saral_user_mailnotifaction; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_user_mailnotifaction (
    id integer,
    user_id integer,
    cmp_id integer,
    activation_id integer
);


ALTER TABLE public.saral_user_mailnotifaction OWNER TO laitkor;

--
-- Name: saral_user_role; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE saral_user_role (
    user_role character varying(64) NOT NULL,
    active character varying(64) DEFAULT 0,
    role_id integer DEFAULT 0,
    rid integer NOT NULL,
    dept_id integer,
    cmp_id integer
);


ALTER TABLE public.saral_user_role OWNER TO laitkor;

--
-- Name: saral_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE saral_user_role_id_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saral_user_role_id_seq OWNER TO laitkor;

--
-- Name: saral_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE saral_user_role_id_seq OWNED BY saral_user_role.rid;


--
-- Name: sdept_id; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE sdept_id (
    dept_id integer
);


ALTER TABLE public.sdept_id OWNER TO laitkor;

--
-- Name: srole_id; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE srole_id (
    role_id integer
);


ALTER TABLE public.srole_id OWNER TO laitkor;

--
-- Name: tblcountry; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE tblcountry (
    country_code bigint NOT NULL,
    country_name character varying(20)
);


ALTER TABLE public.tblcountry OWNER TO laitkor;

--
-- Name: tblstate; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE tblstate (
    state_code bigint NOT NULL,
    country_code bigint,
    state_name character varying(64)
);


ALTER TABLE public.tblstate OWNER TO laitkor;

--
-- Name: user_interview; Type: TABLE; Schema: public; Owner: laitkor; Tablespace: 
--

CREATE TABLE user_interview (
    id integer NOT NULL,
    interview_id integer NOT NULL,
    user_id integer NOT NULL,
    cmp_id integer
);


ALTER TABLE public.user_interview OWNER TO laitkor;

--
-- Name: user_interview_id_seq; Type: SEQUENCE; Schema: public; Owner: laitkor
--

CREATE SEQUENCE user_interview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_interview_id_seq OWNER TO laitkor;

--
-- Name: user_interview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: laitkor
--

ALTER SEQUENCE user_interview_id_seq OWNED BY user_interview.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY email_notifaction ALTER COLUMN id SET DEFAULT nextval('email_notifaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY eml ALTER COLUMN id SET DEFAULT nextval('eml_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY parse_setting ALTER COLUMN id SET DEFAULT nextval('parse_setting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_adduser ALTER COLUMN id SET DEFAULT nextval('"saral_addUser_user_id_seq"'::regclass);


--
-- Name: candidate_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate ALTER COLUMN candidate_id SET DEFAULT nextval('saral_candidate_candidate_id_seq'::regclass);


--
-- Name: document_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_document ALTER COLUMN document_id SET DEFAULT nextval('saral_candidate_document_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_todos ALTER COLUMN id SET DEFAULT nextval('saral_candidate_todos_id_seq'::regclass);


--
-- Name: cmp_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_company ALTER COLUMN cmp_id SET DEFAULT nextval('saral_company_cmp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_company_role ALTER COLUMN id SET DEFAULT nextval('saral_company_role_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_create_user ALTER COLUMN user_id SET DEFAULT nextval('saral_create_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_department ALTER COLUMN id SET DEFAULT nextval('saral_department_id_seq'::regclass);


--
-- Name: dept_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_department ALTER COLUMN dept_id SET DEFAULT currval('saral_department_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_dfields ALTER COLUMN id SET DEFAULT nextval('"saral_dFields_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_feedback_rating ALTER COLUMN id SET DEFAULT nextval('saral_feedback_rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_internal_notes ALTER COLUMN id SET DEFAULT nextval('saral_internal_notes_id_seq'::regclass);


--
-- Name: r_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_internalnotes_reply ALTER COLUMN r_id SET DEFAULT nextval('saral_internalnotes_reply_r_id_seq'::regclass);


--
-- Name: reply; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_internalnotes_reply ALTER COLUMN reply SET DEFAULT nextval('saral_internalnotes_reply_reply_seq'::regclass);


--
-- Name: interview_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview ALTER COLUMN interview_id SET DEFAULT nextval('saral_create_interview_interview_id_seq'::regclass);


--
-- Name: iorder; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview ALTER COLUMN iorder SET DEFAULT nextval('saral_interview_order_seq'::regclass);


--
-- Name: f_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview_feedback ALTER COLUMN f_id SET DEFAULT nextval('saral_interview_feedback_f_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview_type ALTER COLUMN id SET DEFAULT nextval('saral_interview_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_launch ALTER COLUMN id SET DEFAULT nextval('saral_launch_id_seq'::regclass);


--
-- Name: sorder; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_new_update_stage ALTER COLUMN sorder SET DEFAULT nextval('saral_new_update_stage_order_seq'::regclass);


--
-- Name: su_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_new_update_stage ALTER COLUMN su_id SET DEFAULT nextval('saral_new_update_stage_su_id_seq'::regclass);


--
-- Name: opening_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening ALTER COLUMN opening_id SET DEFAULT nextval('"opening_opening_Id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_assign ALTER COLUMN id SET DEFAULT nextval('saral_opening_assign_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_candidate ALTER COLUMN id SET DEFAULT nextval('saral_opening_candidate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_interview ALTER COLUMN id SET DEFAULT nextval('saral_opening_interview_id_seq'::regclass);


--
-- Name: stage_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_stage ALTER COLUMN stage_id SET DEFAULT nextval('saral_opening_stage_stage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_order_stage ALTER COLUMN id SET DEFAULT nextval('saral_order_stage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_permission ALTER COLUMN id SET DEFAULT nextval('saral_permission_id_seq'::regclass);


--
-- Name: permission_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_permission ALTER COLUMN permission_id SET DEFAULT nextval('saral_permission_permission_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_role_assign ALTER COLUMN user_id SET DEFAULT nextval('saral_role_assign_user_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_role_assign ALTER COLUMN role_id SET DEFAULT nextval('saral_role_assign_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_role_dept ALTER COLUMN id SET DEFAULT nextval('saral_role_dept_id_seq'::regclass);


--
-- Name: stage_id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_stage ALTER COLUMN stage_id SET DEFAULT nextval('saral_stage_stage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_stage_assign ALTER COLUMN id SET DEFAULT nextval('saral_stage_assign_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_todos_user ALTER COLUMN id SET DEFAULT nextval('saral_todos_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_unassigin_user ALTER COLUMN id SET DEFAULT nextval('saral_unassigin_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user ALTER COLUMN id SET DEFAULT nextval('saral_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_candidate ALTER COLUMN id SET DEFAULT nextval('saral_user_candidate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_dept ALTER COLUMN id SET DEFAULT nextval('saral_user_dept_id_seq'::regclass);


--
-- Name: rid; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_role ALTER COLUMN rid SET DEFAULT nextval('saral_user_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY testde ALTER COLUMN id SET DEFAULT nextval('update_stage_id_sequence'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY user_interview ALTER COLUMN id SET DEFAULT nextval('user_interview_id_seq'::regclass);


--
-- Data for Name: cid; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY cid (cmp_id) FROM stdin;
4
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY contacts (id, cell_no, birthdate, firstname, lastname, email_id, website, created) FROM stdin;
1	mmmmm	0006-06-06	mmmmm	`mmmmmmm`m```	mmmmm	mmmmm	\N
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY country (id, name) FROM stdin;
AD	Andorra
AO	Angola
AI	Anguilla
AQ	Antarctica
AG	Antigua and Barbuda
AR	Argentina
AM	Armenia
AW	Aruba
AU	Australia
AT	Austria
AZ	Azerbaijan
BS	Bahamas
BH	Bahrain
BD	Bangladesh
BB	Barbados
BY	Belarus
BE	Belgium
BZ	Belize
BJ	Benin
BM	Bermuda
BT	Bhutan
BO	Bolivia
TD	Chad
CL	Chile
CN	China
CX	Christmas Island
CC	Cocos [Keeling] Islands
CO	Colombia
KM	Comoros
CG	Congo - Brazzaville
CD	Congo - Kinshasa
CK	Cook Islands
CR	Costa Rica
HR	Croatia
CU	Cuba
CY	Cyprus
CZ	Czech Republic
CI	Côte d’Ivoire
DK	Denmark
DJ	Djibouti
DM	Dominica
DO	Dominican Republic
NQ	Dronning Maud Land
DD	East Germany
EC	Ecuador
EG	Egypt
SV	El Salvador
GQ	Equatorial Guinea
ER	Eritrea
EE	Estonia
ET	Ethiopia
FK	Falkland Islands
FO	Faroe Islands
FJ	Fiji
FI	Finland
FR	France
GF	French Guiana
PF	French Polynesia
TF	French Southern Territories
GM	Gambia
GE	Georgia
DE	Germany
GH	Ghana
GI	Gibraltar
GR	Greece
GL	Greenland
GD	Grenada
GP	Guadeloupe
GU	Guam
GT	Guatemala
GG	Guernsey
GN	Guinea
GW	Guinea-Bissau
GY	Guyana
HT	Haiti
HM	Heard Island and McDonald Islands
HN	Honduras
HK	Hong Kong SAR China
HU	Hungary
IS	Iceland
IN	India
ID	Indonesia
IR	Iran
IQ	Iraq
IE	Ireland
IM	Isle of Man
IL	Israel
IT	Italy
JM	Jamaica
JP	Japan
JE	Jersey
JT	Johnston Island
JO	Jordan
KZ	Kazakhstan
KE	Kenya
KI	Kiribati
KW	Kuwait
KG	Kyrgyzstan
LA	Laos
LV	Latvia
LB	Lebanon
LS	Lesotho
LR	Liberia
LY	Libya
LI	Liechtenstein
LT	Lithuania
LU	Luxembourg
MO	Macau SAR China
MK	Macedonia
MG	Madagascar
MW	Malawi
MY	Malaysia
MV	Maldives
ML	Mali
MT	Malta
MH	Marshall Islands
MQ	Martinique
MR	Mauritania
MU	Mauritius
YT	Mayotte
FX	Metropolitan France
MX	Mexico
FM	Micronesia
MI	Midway Islands
MD	Moldova
MC	Monaco
MN	Mongolia
ME	Montenegro
MS	Montserrat
MA	Morocco
MZ	Mozambique
MM	Myanmar [Burma]
NA	Namibia
NR	Nauru
NP	Nepal
NL	Netherlands
AN	Netherlands Antilles
NT	Neutral Zone
NC	New Caledonia
NZ	New Zealand
NI	Nicaragua
NE	Niger
NG	Nigeria
NU	Niue
NF	Norfolk Island
KP	North Korea
VD	North Vietnam
MP	Northern Mariana Islands
NO	Norway
BL	Saint Barthélemy
SH	Saint Helena
KN	Saint Kitts and Nevis
LC	Saint Lucia
MF	Saint Martin
PM	Saint Pierre and Miquelon
VC	Saint Vincent and the Grenadines
WS	Samoa
SM	San Marino
SA	Saudi Arabia
SN	Senegal
RS	Serbia
CS	Serbia and Montenegro
SC	Seychelles
SL	Sierra Leone
SG	Singapore
SK	Slovakia
SI	Slovenia
SB	Solomon Islands
SO	Somalia
ZA	South Africa
GS	South Georgia and the South Sandwich Islands
KR	South Korea
ES	Spain
LK	Sri Lanka
SD	Sudan
SR	Suriname
SJ	Svalbard and Jan Mayen
SZ	Swaziland
SE	Sweden
CH	Switzerland
SY	Syria
ST	São Tomé and Príncipe
TW	Taiwan
TJ	Tajikistan
TZ	Tanzania
TH	Thailand
TL	Timor-Leste
TG	Togo
TK	Tokelau
TO	Tonga
TT	Trinidad and Tobago
TN	Tunisia
TR	Turkey
TM	Turkmenistan
TC	Turks and Caicos Islands
TV	Tuvalu
UM	U.S. Minor Outlying Islands
PU	U.S. Miscellaneous Pacific Islands
VI	U.S. Virgin Islands
UG	Uganda
UA	Ukraine
SU	Union of Soviet Socialist Republics
AE	United Arab Emirates
GB	United Kingdom
US	United States
ZZ	Unknown or Invalid Region
UY	Uruguay
UZ	Uzbekistan
VU	Vanuatu
VA	Vatican City
VE	Venezuela
VN	Vietnam
WK	Wake Island
WF	Wallis and Futuna
EH	Western Sahara
YE	Yemen
ZM	Zambia
ZW	Zimbabwe
AX	Åland Islands
\.


--
-- Data for Name: created_by; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY created_by (id) FROM stdin;
3
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY department (id, name) FROM stdin;
1	Management
2	IT
\.


--
-- Name: did_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('did_seq', 13, true);


--
-- Data for Name: email_notifaction; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY email_notifaction (id, notifaction, action, permisition) FROM stdin;
4	** Notify me when an new opening is created	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	candidateadd	1
6	** Notify me when any opening in my account is deleted	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	newuser	1
7	Notify me when an opening is assigned to me	openingme	2
8	Notify me when I am unassigned from an opening	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	openingassigned	2
\.


--
-- Name: email_notifaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('email_notifaction_id_seq', 11, true);


--
-- Data for Name: eml; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY eml ("from", subject, path, "resume_Headline", "key_Skills", name, "total_ Experience", "cTC", "current _Employer", "current_ Designation", "last_ Employer", "last_ Designation", "current _Location", "preferred Location", education, mobile, landline, recommendations, "last _modified _on", id) FROM stdin;
\.


--
-- Name: eml_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('eml_id_seq', 150, true);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY employee (id, name, salary, departmentid) FROM stdin;
1	John Smith	30000	1
2	Jane Doe	50000	1
3	Jack Jackson	60000	2
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('hibernate_sequence', 2, true);


--
-- Data for Name: nid; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY nid (su_id) FROM stdin;
43
\.


--
-- Name: opening_opening_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('"opening_opening_Id_seq"', 558, true);


--
-- Data for Name: parse_setting; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY parse_setting (id, cmp_id, mailhost, port, username, credential) FROM stdin;
1	127	imap.gmail.com	465	mlaitkor@gmail.com	laitkor@@
2	128				
3	128				
4	128				
5	128				
6	128			fahd4007	
7	128			abdul.aleem@laitkor.com	
8	128	imap.gmail.com	465	anshika.gupta@laitkor.com	iminlove1028
\.


--
-- Name: parse_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('parse_setting_id_seq', 8, true);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY person (id, first_name, last_name) FROM stdin;
1	nk	pan
2	nk	pan
3	mukesh	pandey
4	nukesh	pande
5	nukesh	pande
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('person_id_seq', 5, true);


--
-- Name: saral_addUser_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('"saral_addUser_user_id_seq"', 5, true);


--
-- Data for Name: saral_adduser; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_adduser (id, fname, lname, area, city, state, country, phonenumber, mobile, uname, password, email, currentlocation, designation, department, role, status, perminsion, cmp_id, activation_id) FROM stdin;
1	laitkor	laitkor	LKO	LKO	LKO	INDIA	188	654343543	laitkow	m2n1shlko	litkor@gmail.com	LKO		70	1	1	1	32	1
2	mukesh	mukesh	mukesh	mukesh	mukesh	mukesh	345435435	324324	mukesh	ogplbns40cc+qP2dn9g54A==	mukesh	mukesh	mukesh	64	-1	0	0	32	1
3	Test	Test	Test	Test	Test	Test	345435435	324324	Test	ogplbns40cc+qP2dn9g54A==	mukesh@gmail.com	mukesh	mukesh	70	-1	0	1	32	1
4	abc	abc	abc	abc	abc	abc	46547567	547547567	abc	ogplbns40cc+qP2dn9g54A==	abc@gmail.com	abc	abc	0	0	0	1	32	1
5	TestUser	TestUser	TestUser	TestUser	TestUser	TestUser	436436445	435435454	TestUser	ogplbns40cc+qP2dn9g54A==	TestUser@laitkor.com	TestUser	TestUser	64	12	0	1	32	1
\.


--
-- Data for Name: saral_candidate; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_candidate (candidate_id, name, email, phone, descripation, resume, opening_id, created_by, created_on, experience, location, education, skills, cmp_id, via, mobile, lname, designation, status, createdon, guid, g_college, g_university, g_specialization, g_percentage, pg_college, pg_university, pg_specialization, pg_percentage, industry_type, total_experience, functional_expertise, current_ctc, expected_ctc, gender, age_group, passport, d_field1, d_field2, d_field3, d_field4, d_field5, gdegree, pg_degree, current_employer, employer_location) FROM stdin;
102146	dfrgttttttt	test5ty@gmail.com	3232322323	iuiiii	\N	\N	531	2014/09/05	0	Ireland	Undergraduate	test	175	Upload	9874563210	Gupta		1	2014-09-05 15:27:16.008857	30310a13-3790-4f2c-ad7a-91e8164a6ea2	test	delhi	test	56				0		0				female	30-40	dfsdf	\N	\N	\N	\N	\N	test		\N	\N
102097	anshi	test5ty@gmail.com	3232322323	ewrqwr r\r\n<p class="p2">First Name: hgh Middle Name / Other Names:\r\n<p class="p2">Physical Street Address for courier delivery (NOT A POSTAL BOX):\r\n<p class="p2">Telephone Home:\r\n<p class="p2">Telephone Mobile:\r\n<p class="p2">Telephone Office:\r\n<p class="p2">Email 1: Email 2:\r\n<p class="p2">Marital Status:\r\n<p class="p2">Date of Birth: DAY/MONTH/YEAR <span class="s1">Example:</span> 25/December/1968\r\n<p class="p2">Gender:\r\n<p class="p2">Country of Origin:\r\n<p class="p2">Present Nationality:\r\n<p class="p2">Languages and Fluency Level:\r\n<p class="p2"><span class="s1">EDUCATION:</span>\r\n<p class="p2"><span class="s1">Degree Earned</span>, <span class="s2">Institution Name, Address</span>, <span class="s1">Start and End Date</span>\r\n<p class="p2"><span class="s1">Example:</span>\r\n<p class="p2"><span class="s1">MSc</span>, <span class="s2">London School of Hygiene &amp; Tropical Medicine, Keppel Street, London</span>\r\n<p class="p3"><span class="s2">WC1E 7HT, UK</span>, <span class="s1">08/1996 to 06/1998.</span>\r\n<p class="p4"><span class="s3">&iuml;&fnof;&tilde;&acirc;&euro;&lsaquo;       gfgdfg</span>	resourcess/download/resumes/abc1405677251189.doc	\N	450	2014/07/07	0	kanpur	Undergraduate	java	128	Via Upload	1234567890	Gupta		1	2014-07-04 13:41:04.871309	9e332762-2e9e-4f2f-a156-5cd07c5c1914	test	test	Btech ECE	0				0		0				female	20-30	dfsdf	ARAMCO	\N	\N	\N	\N	test			
101890	testcsv6	ans@gmail.com	1234567890	vnbv		\N	450	2014/06/10	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-07 17:38:07.346822	4a45ca98-a47e-4ce0-b7b8-009ddbd66e16	ncet	uptu		0				0		2				female	20-30	NA	\N	\N	\N	\N	\N	btech			
101891	testcsv7	ans@gmail.com	1234567890	nbvc		\N	450	2014/06/10	3	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:38:07.351076	4a45ca98-a47e-4ce0-b7b8-009ddbd66e16	ncet	uptu		0				0		3				female	20-30	NA	\N	\N	\N	\N	\N	btech		e	
101892	nhgn	gdfg@gfdf.fghh	7.65777E+12	 		\N	450	2014/06/10	6	vhn	graduate	tfy	128	Csv	1234567890	nvbn	\N	1	2014-06-07 17:38:07.35549	4a45ca98-a47e-4ce0-b7b8-009ddbd66e16	\N	\N	\N	0	\N	\N	\N	0	\N	6	\N	\N	\N	nvnv	37		\N	\N	\N	\N	\N	jgh	\N	\N	\N
101889	testcsv5	xdfg@gfghdhg.com	1234567890	gfn		\N	450	2014/06/10	0	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-07 17:38:07.314056	4a45ca98-a47e-4ce0-b7b8-009ddbd66e16	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101850	gfgg	test44@gmail.com	455435435345435	fgfdgfg	resourcess/download/resumes/stop-cv-format1400838374553.doc	\N	450	2014/05/23	0	hgh	Doctorate	gdfgd	128	Upload	4444444444444	gdfg		1	2014-05-21 01:07:38.376938	a163470e-6cf3-4a0f-8731-23dd0694eb6c	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101875	testcsv1	xdfg@gfghdhg.com	1234567890	lhj		\N	450	2014/06/10	0	lucknow	graduate	java	128	Csv	1234567890	gupta	\N	1	2014-06-07 17:04:37.443076	0c5150f6-d695-4ea4-87cf-1093b0c00ece	ncet	uptu		0				0	\N	0	\N	\N	\N	female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	\N
102147	dfrgttttttt	test5ty@gmail.com	3232322323	kjhkhkkjhkhjkjhk	\N	\N	531	2014/09/05	0	Ireland	Undergraduate	test	175	Upload	1234567890	rastogi		3	2014-09-05 15:48:33.467713	75a18f52-3436-42e1-aad2-712a5ed6b47d	jhgj	test	Btech ECE	23				0		0				female	20-30	dfsdf	\N	\N	\N	\N	\N	test		\N	\N
101876	testcsv2	ans@gmail.com	1234567890	\N		\N	450	2014/06/10	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-07 17:04:37.462993	0c5150f6-d695-4ea4-87cf-1093b0c00ece	ncet	uptu		0				0	\N	2	\N	\N	\N	female	20-30	NA	\N	\N	\N	\N	\N	btech			\N
101879	testcsv6	ans@gmail.com	1234567890	vnbv		\N	450	2014/06/10	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-07 17:14:47.097052	adf34f8d-de13-4702-b85d-5e37b64c432f	ncet	uptu		0				0		2				female	20-30	NA	\N	\N	\N	\N	\N	btech			
101880	testcsv7	ans@gmail.com	1234567890	nbvc		\N	450	2014/06/10	3	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:14:47.101037	adf34f8d-de13-4702-b85d-5e37b64c432f	ncet	uptu		0				0		3				female	20-30	NA	\N	\N	\N	\N	\N	btech		e	
101863	ghcbcb anshi	test5ty@gmail.com	3232322323	hfghffghfgh	\N	\N	450	2014/05/27	5-7	test	Postgraduate	test	128	Upload	1234567890	hgf	test	1	2014-05-24 17:17:52.284278	eb4baa5c-6e8b-4cc2-9ddf-5a6760f49e60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101864	ghcbcbgattu	test5ty@gmail.com	3232322323	hfghffghfgh	\N	\N	450	2014/05/27	7-10	test	Postgraduate	test	128	Upload	1234567890	hgf	test	1	2014-05-24 17:20:08.278383	5afd1e0e-2bd9-4596-a845-b184def665c7	\N	\N	\N	66	\N	\N	\N	67	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101865	dfrgttttttt	test5ty@gmail.com	3232322323	hfghffghfgh	\N	\N	450	2014/05/27	7-10	test	Postgraduate	test	128	Upload	1234567890	hgf	test	1	2014-05-24 17:46:46.445688	ca7bd4a9-ca96-4b2d-ac2f-8089f1e4cb85	test	test	test	66	\N	\N	\N	67	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	test	\N	\N	\N
101881	testcsv5	xdfg@gfghdhg.com	1234567890	gfn		\N	450	2014/06/10	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:19:01.495746	69ab704a-0a68-4422-bd98-1d1df9d56556	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101882	testcsv6	ans@gmail.com	1234567890	vnbv		\N	450	2014/06/10	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-07 17:19:01.509299	69ab704a-0a68-4422-bd98-1d1df9d56556	ncet	uptu		0				0		2				female	20-30	NA	\N	\N	\N	\N	\N	btech			
101883	testcsv7	ans@gmail.com	1234567890	nbvc		\N	450	2014/06/10	3	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:19:01.533418	69ab704a-0a68-4422-bd98-1d1df9d56556	ncet	uptu		0				0		3				female	20-30	NA	\N	\N	\N	\N	\N	btech		e	
101885	testcsv5	xdfg@gfghdhg.com	1234567890	gfn		\N	450	2014/06/10	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:37:20.489367	fcf36737-fc7c-4adc-9b5f-f4b97e865684	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101886	testcsv6	ans@gmail.com	1234567890	vnbv		\N	450	2014/06/10	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-07 17:37:20.498433	fcf36737-fc7c-4adc-9b5f-f4b97e865684	ncet	uptu		0				0		2				female	20-30	NA	\N	\N	\N	\N	\N	btech			
101887	testcsv7	ans@gmail.com	1234567890	nbvc		\N	450	2014/06/10	3	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:37:20.51818	fcf36737-fc7c-4adc-9b5f-f4b97e865684	ncet	uptu		0				0		3				female	20-30	NA	\N	\N	\N	\N	\N	btech		e	
101888	nhgn	gdfg@gfdf.fghh	7.65777E+12	 		\N	450	2014/06/10	6	vhn	graduate	tfy	128	Csv	1234567890	nvbn	\N	1	2014-06-07 17:37:20.522334	fcf36737-fc7c-4adc-9b5f-f4b97e865684	\N	\N	\N	0	\N	\N	\N	0	\N	6	\N	\N	\N	nvnv	37		\N	\N	\N	\N	\N	jgh	\N	\N	\N
101904	Newri	anshika.gupta1028@gmail.com	1232344556667		\N	\N	450	2014/06/11	-1	lucknow	-1	java php node 	128	Upload	12324325436545	Gupta		1	2014-06-08 04:59:43.203229	3c1e9803-708f-40c3-8d12-2c4cdcf90a66				0				0		0				female	20-30	NA	\N	\N	\N	\N	\N			\N	\N
101911	opening check2	ram.tripathi@laitkor.com	797907097	lkjllkljllkjljl	resourcess/download/resumes/stop-cv-format1402555083890.doc	\N	0	2014/06/12	0	fdsfsf	Undergraduate	fsfbbcxbxcbvcvc	128	Embed form	0979070970	tripathi		1	2014-06-09 11:42:43.800999	d05dcc70-94e8-4031-8489-7e5f95dda13c				0				0		0				female	20-30	hgfhf	\N	\N	\N	\N	\N			\N	\N
101912	Yasser	yasser@mailinator.com	1234512345	dsddddd	\N	\N	0	2014/06/12	1-	India	Undergraduate	test	128	Embed form	1234512345	Sheikh	sss	1	2014-06-09 12:20:53.908524	1a0ab20b-1ae3-4e3f-a80e-704621b392f1	sss	sss	sss	0				0	ss	0	ddd	111	111	male	20-30		\N	\N	\N	\N	\N	sss		\N	\N
101905	testopening	test5ty@gmail.com	4309877777		\N	\N	450	2014/06/11	-1	test	Undergraduate	fsfbbcxbxcb	128	Upload	1234567890	hgf		1	2014-06-08 05:03:01.623966	25883ef8-52f7-414d-889d-2e41dbb9d37e				0				0		0				male	20-30	dfsdf			\N	\N	\N			\N	\N
101893	testcsv8	xdfg@gfghdhg.com	1234567890	gfn		\N	450	2014/06/10	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:45:39.982175	7e9e1e10-64e6-4d54-94b4-9b58a3b8fc31	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101894	testcsv9	ans@gmail.com	1234567890	vnbv		\N	450	2014/06/10	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-07 17:45:39.991873	7e9e1e10-64e6-4d54-94b4-9b58a3b8fc31	ncet	uptu		0				0		2				female	20-30	NA	\N	\N	\N	\N	\N	btech			
101895	testcsv10	ans@gmail.com	1234567890	nbvc		\N	450	2014/06/10	3	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-07 17:45:39.997187	7e9e1e10-64e6-4d54-94b4-9b58a3b8fc31	ncet	uptu		0				0		3				female	20-30	NA	\N	\N	\N	\N	\N	btech		e	
101897	abc	abc@mailinator.com		a		\N	450	2014/06/10	2	Lucknow	post gradutaion	java	128	Csv	1234512345	abc		1	2014-06-07 18:09:52.142414	b846ce95-3de2-4d69-98ef-4786294880cb				0				0		2				male	30		\N	\N	\N	\N	\N				
101898	def	def@mailinator.com		a		\N	450	2014/06/10	2	Lucknow	post gradutaion	java	128	Csv	1234512345	def		1	2014-06-07 18:09:52.169589	b846ce95-3de2-4d69-98ef-4786294880cb				0				0		2				male	30		\N	\N	\N	\N	\N				
101899	ghi	ghi@mailinator.com		a		\N	450	2014/06/10	2	Lucknow	post gradutaion	java	128	Csv	1234512345	ghi		1	2014-06-07 18:09:52.174074	b846ce95-3de2-4d69-98ef-4786294880cb				0				0		2				male	30		\N	\N	\N	\N	\N				
101921	testcsv12	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv51403003329213.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.599067	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-34		\N	\N	\N	\N	\N				
101952	fname012	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv121403006482696.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.385807	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-41		\N	\N	\N	\N	\N				
101951	fname011	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403006482677.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.377518	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-40		\N	\N	\N	\N	\N				
101950	fname010	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403006482677.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.368004	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-39		\N	\N	\N	\N	\N				
101949	fname009	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv91403006482651.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.359379	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-38		\N	\N	\N	\N	\N				
101947	fname007	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv71403006482619.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.315568	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-36		\N	\N	\N	\N	\N				
101948	fname008	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv81403006482633.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.325382	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-37		\N	\N	\N	\N	\N				
101953	fname001	xdfg001@gfghdhg.com	1234567890	gfn	resourcess/download/resumes/cv11403007539510.doc	\N	450	2014/06/17	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.307832	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101954	fname002	xdfg001@gfghdhg.com	1234567890	vnbv	resourcess/download/resumes/cv21403007539528.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-14 13:11:17.320533	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
101955	fname003	xdfg001@gfghdhg.com	1234567890	nbvc	resourcess/download/resumes/cv31403007539555.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.347849	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
101868	Arif usman	test5ty@gmail.com	3232322323	hfghffghfgh	\N	\N	450	2014/05/27	7-10	test	Postgraduate	test	128	Upload	1234567890	md	test	1	2014-05-24 17:52:32.996328	37d44e04-7c2c-4388-927e-3e2bfa7719b0	test	test	test	66	test	test	test	67	test	3	test	3	4	male	30-40	dfsdf	was	dasd	\N	\N	\N	test	test		
101980	ladoo001	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.611404	a17d3a8f-b57e-4437-a2a6-cb2241b9581e	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101973	fahd	candidatethree@mailinator.com	1234512345	POLAR. It's a pen. It's a stylus. It's a tool. It's a toy. And it won't even F up your phone and credit cards*! The modular writing implement, made of 12 cylindrical neodymium magnets stacked over a Pilot ink cartridge, provides just as much tinkering entertainment as it does scribbling assistance. Take POLAR apart, flip and bounce its magnets' repellent ends, swap out the ink tip for the stylus' rubber version, slap it on your fridge for safe storage, or try throwing it at the flap of your Trapper Keeper and see if you can get it to stick. Such a simple idea, such endless ways to dick around and miss deadlines.	resourcess/download/resumes/TEST Resume1403342384900.doc	\N	450	2014/06/18	-1	lucknow	-1	BE	128	Upload	1234512345	three		1	2014-06-15 09:48:43.440627	f402211c-317b-4133-81c3-f9a0eea01748				0				0		2			2000	male	-1		Aramco	AL babtain	\N	\N	\N	BE			
101981	ladoo002	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 08:53:10.634121	a17d3a8f-b57e-4437-a2a6-cb2241b9581e	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
101982	ladoo003	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.638194	a17d3a8f-b57e-4437-a2a6-cb2241b9581e	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
101983	ladoo004	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.641206	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
101984	ladoo005	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.658704	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-34		\N	\N	\N	\N	\N				
101985	ladoo006	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.662188	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-35		\N	\N	\N	\N	\N				
101986	ladoo007	kjhk@sd.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.665546	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-36		\N	\N	\N	\N	\N				
101987	ladoo008	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.673228	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-37		\N	\N	\N	\N	\N				
101988	ladoo009	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.677589	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-38		\N	\N	\N	\N	\N				
101989	ladoo010	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.68234	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-39		\N	\N	\N	\N	\N				
101990	ladoo011	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.686297	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-40		\N	\N	\N	\N	\N				
101991	ladoo012	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:53:10.690605	a17d3a8f-b57e-4437-a2a6-cb2241b9581e				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
101992	ladoo001	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:03.972625	aaf43c35-3f87-4af6-b46d-c48eaa84afd4	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102055	ladoo00117	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.464306	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
102056	ladoo00118	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.497721	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-34		\N	\N	\N	\N	\N				
102057	ladoo00119	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.502672	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-35		\N	\N	\N	\N	\N				
102058	ladoo00120	kjhk@sd.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.506453	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-36		\N	\N	\N	\N	\N				
102059	ladoo00121	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.511299	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-37		\N	\N	\N	\N	\N				
102060	ladoo00122	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.516929	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-38		\N	\N	\N	\N	\N				
102061	ladoo00123	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.520878	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102062	ladoo00124	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.524702	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-40		\N	\N	\N	\N	\N				
102063	ladoo00125	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.528476	47d6466e-2276-4884-8864-65e14b5791e1				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
102064	cando000	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.758532	ef66828f-6a5f-4ad1-879c-a7ecdff9775d	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102077	dfrgttttttt	test5ty@gmail.com	3232322323	jlkljkl kljlj ljkl ljklj 	resourcess/download/resumes/stop-cv-format1404385530213.doc	\N	450	2014/07/03	0	test	Undergraduate	Animator	128	Upload	1234567890	rastogi		1	2014-06-30 11:06:59.36688	eb29c4e0-dce7-40cf-bcab-424d00302277				0				0		0				female	30-40	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102078	anshi	test5ty@gmail.com	3232322323	gfdgd hgfhf hfgfh gfdgd hgfhf hfgfh gfdgd hgfhf hfgfh gfdgd hgfhf hfgfh	resourcess/download/resumes/stop-cv-format1404388035280.doc	\N	450	2014/07/03	1-3	test	Graduate	fsfbbcxbxcb	128	Upload	1234567890	Gupta		1	2014-06-30 11:48:44.632582	0d2955f1-b874-4992-9d68-b6f6230cc749				0				0		0				female	20-30	dfsdf	ARAMCO	\N	\N	\N	\N				
102098	Yasser	yassertest11111@mailinator.com	1234512345	Test	\N	\N	0	2014/07/10	0	India	Undergraduate	test	165	Embed form	1234512345	Sheikh		2	2014-07-07 13:18:32.520047	09e13842-7972-49e7-baf5-b0629686f876	test	Test	test	99				0		0				male	20-30	1234512345	\N	\N	\N	\N	\N	test		\N	\N
102111	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form		rastogi		2	2014-08-18 11:53:19.755413	48e58fbd-8604-4488-8b67-2d6d00a23adc				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
101859	dfhgdf	anshigdfgkagupta1028@gmail.com	3232322323		resourcess/download/resumes/stop-cv-format14006690849641400845154037.doc	\N	450	2014/05/23	-1	hgfh	-1		128	Upload	1234567890	rastogi		1	2014-05-21 03:00:38.529939	02e2cf47-7a21-4e50-95aa-ed3eedabc9f6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101860	dfhgdf	anshigdfgkagupta1028@gmail.com	3232322323		resourcess/download/resumes/stop-cv-format14006690849641400845154622.doc	\N	450	2014/05/23	-1	hgfh	-1		128	Upload	1234567890	rastogi		1	2014-05-21 03:00:39.069979	ec59ebf1-eba3-40b5-897e-3fa160b12308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102112	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 11:53:42.735924	824fbd82-b805-484d-b890-0352bb4cfe01				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102114	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 11:54:47.157719	83cf4e23-0f74-4d5f-86e3-f4f921ebe561				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102116	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 11:56:04.761187	8a1ba78c-bc2b-4d2b-bab8-3eb75d45af3e				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102117	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 11:56:56.079332	c6dfb585-4dae-4ff0-9e9d-2bb931aaa678				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102115	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 11:55:41.254781	57806e67-f175-42c3-9d44-e1a8423c6973				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102113	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 11:53:52.516266	4ae398de-dab4-495e-9924-2a6eaad73b9e				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102118	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 12:21:04.054003	ffc5390b-94a7-4c2f-a3f7-e84cedacd1c1				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102134	\N	saralpayroll2@gmail.com	1234512345		\N	\N	0	2014/08/18	0	aaaa	Undergraduate	aaa	128	Embed form	1234512345	sheikh		2	2014-08-18 17:48:19.351303	4aa4e618-42af-4e23-a7ee-72eebbd5dad3	www	w	wwww	11				0		0				male	20-30	111	\N	\N	\N	\N	\N	ww			\N
102132	\N	test5ty@gmail.com	3232322323	hgkjhgkhj	\N	\N	0	2014/08/18	0	hgfh	Postgraduate	fsfbbcxbxcb	128	Embed form	1234567890	rastogi		2	2014-08-18 17:38:50.866391	4d783e59-5973-4108-85e6-ea0775123620	test	test	test	66	test	test	test	67		0				male	20-30	dfsdf	\N	\N	\N	\N	\N	test	test		\N
102130	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 14:44:59.975671	530a25dd-edb7-49cf-b622-fee456b3d538				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102142	\N				\N	\N	0	2014/08/20	-1		-1		128	Embed form				2	2014-08-20 15:20:15.327018	61897436-d713-4b1d-8b9d-a9fce750d5c0				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
101851	jhkhjk	gupta20ahgfhditi@gmail.com	9996969678678	hghfhh	resourcess/download/resumes/stop-cv-format1400669084964 (1)1400838460636.doc	\N	450	2014/05/23	0	hfghfh	Doctorate	hghfh	128	Upload	6788678678868	jhgjhgj		1	2014-05-21 01:09:04.441594	a24c40ec-39a9-44ea-8773-849ae6ef2ea4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101853	gfgdg	hgfhfh@dfh.com	67675756756	jhfjfgj	resourcess/download/resumes/stop-cv-format1400669084964 (1)1400839268047.doc	\N	450	2014/05/23	0	hgfh	Doctorate	hfg	128	Upload	6456645646	hghfgh		1	2014-05-21 01:22:31.958127	11a160d4-a398-4207-a8a4-36ddf9aa90c5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101854	rrrrrr	testfml@gmail.com	565645656546	yrtyry yhrytr	resourcess/download/resumes/stop-cv-format14006690849641400839501772.doc	\N	450	2014/05/23	0	test	Doctorate	fsf	128	Upload	543543543543535	dsfdsfs		1	2014-05-21 01:26:25.706644	7e1f1f95-38b2-4591-b232-baf939d96eef	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101855	a	a.rastogi@laitkor.com	3232322323	tgdg	resourcess/download/resumes/stop-cv-format14006674052791400839734941.doc	\N	450	2014/05/23	0	test	Doctorate	test	128	Upload	1234567890	rastogi		1	2014-05-21 01:30:18.888733	ee5e5be0-ec06-4334-b2a7-ffa798fd7b4d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101857	uty	anshikagutyupta1028@gmail.com	3232322323		resourcess/download/resumes/stop-cv-format1400844239143.doc	\N	450	2014/05/23	-1	test	-1		128	Upload	1234567890	test		1	2014-05-21 02:45:23.491305	0e4d15e3-84cc-49c3-907e-a59dcc6c0844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101858	a	anshikdsa.gupta1028@gmail.com	3232322323	fdsf	resourcess/download/resumes/stop-cv-format14006674052791400844506992.doc	\N	450	2014/05/23	-1	test	-1	fsf	128	Upload	1234567890	hgfh		1	2014-05-21 02:49:51.396717	2770d0e7-6a6a-4419-a8b2-d4b3024abe47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101866	dfrgttttttt	test5ty@gmail.com	3232322323	hfghffghfgh	\N	\N	450	2014/05/27	7-10	test	Postgraduate	test	128	Upload	1234567890	hgf	test	1	2014-05-24 17:52:10.646629	2949f9da-cb47-4b65-beac-4aefd68ef5f9	test	test	test	66	test	test	test	67	test	3	test	3	4	male	30-40	dfsdf	was	dasd				test	test	\N	\N
101867	dfrgttttttt	test5ty@gmail.com	3232322323	hfghffghfgh	\N	\N	450	2014/05/27	7-10	test	Postgraduate	test	128	Upload	1234567890	hgf	test	1	2014-05-24 17:52:17.61353	3371606f-ac5e-4371-91ad-3ca080a18f55	test	test	test	66	test	test	test	67	test	3	test	3	4	male	30-40	dfsdf	was	dasd				test	test	\N	\N
101846	dfhgdf	gupta20aditi@gmail.com	6456465466	hghgh	resourcess/download/resumes/stop-cv-format1400741438865.doc	\N	450	2014/05/22	1-3	hgfh	-1	hgfh	128	Upload	6456645646	gfgdg	hgfh	2	2014-05-19 22:11:52.628247	0820e5e7-f70c-4c65-b25a-16ab3aed1d59	6			0				0		2				-1	-1				\N	\N	\N				
101852	gdfg	test78@gmail.com	6757657765757	hgj	resourcess/download/resumes/stop-cv-format14006690849641400838983446.doc	\N	450	2014/05/23	-1	test	-1	test	128	Upload	75677567765	gdfg		2	2014-05-21 01:17:47.323454	855e7cb5-c394-45a2-af75-7abd07dc8e05	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101856	test	testrr@gmail.com	3232322323		resourcess/download/resumes/stop-cv-format1400839866009.doc	\N	450	2014/05/23	-1	dvd	-1	test	128	Upload	1234567890	rastogi		2	2014-05-21 01:32:29.944861	b32e6e8e-38cd-45fd-8314-06cb0f1e05c3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101862	gh	test5ty@gmail.com	3232322323	hfghffghfgh	\N	\N	450	2014/05/27	5-7	test	Postgraduate	test	128	Upload	1234567890	hgf	test	1	2014-05-24 17:17:26.713045	b799d3b0-86a7-412d-84c1-3c37077f104e				0				0		0				-1	-1				\N	\N	\N				
101842	test	anshikagupta1028@gmail.com	3232322323	cxcxzczccxczxczxcdfsfasfhgfhgfhf	resourcess/download/resumes/sample1398935753304.docx	527	450	2014/04/24	fdf	dvd	fs	fsfbbcxbxcb	128	Upload	3232322323	b	ffds	2	2014-04-21 21:14:52.095725	6c09b41e-f898-4fa6-a446-cef5289acb01	3	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101843	aditi	gupta20aditi@gmail.com	87867867888	mnbb	resourcess/download/resumes/stop-cv-format1400306260064.doc	527	450	2014/04/24	m,,	nbmbm	mmnbm	mnbmbm	128	Upload	787876878678	v	nmb	3	2014-04-21 21:20:17.893713	74f8ccd0-cc29-4f5e-9093-f04f94a06d7f	5	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101841	 Babon 	rahul.tiwari@laitkor.com	430-987-7777		/home/laitkor/workspace2/HtmlParser/myfile/resumes/rahul.tiwari@laitkor.com.babon-das.rtf	530	0	2014/01/08 15:04:06	 2 Years, 2 Months    	location not Included	 B.Tech/B.E.     		127	Upload	07827347563	Das    		1	2014-01-07 19:04:58.721642	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101849	test4	testxgfml@gmail.com	565645656546	hgfhgfh	resourcess/download/resumes/stop-cv-format1400838125160.doc	528	450	2014/05/23	0	hfghf	Doctorate	hgfh	128	Upload	56456656646546	hgh		1	2014-05-21 01:03:28.935093	75c78a00-515f-4124-b613-5fec9aa5400d	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101848	test3	testxml@gmail.com	1234567890	<span style="font-family: terminal, monaco; font-size: x-small;">                                      </span>\n<p style="text-align: center;"><span style="font-family: terminal, monaco; font-size: xx-small;">khkjhkjh</span>	\N	535	450	2014/05/23	0	test	Graduate		128	Upload	1234567890	test		1	2014-05-21 00:24:18.02454	77945b21-bff6-4bf4-b8af-f2e59130a0ef	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101870	saurabh	saurabh.duby@laitkor.com	7778889990		\N	\N	450	2014/05/30	3-5	Thailand	-1	asp .net	128	Upload	11122233340	duby	developer	1	2014-05-27 13:52:29.083755	542b3980-05aa-46e3-9a01-17448d861dc3				0				0		0	app. development	14785	25896	male	20-30	123-123-123	\N	\N	\N	\N	\N			\N	\N
101901	mno	mno@mailinator.com		a		\N	450	2014/06/10	2	Lucknow	post gradutaion	java	128	Csv	1234512345	mno		1	2014-06-07 18:09:52.199676	b846ce95-3de2-4d69-98ef-4786294880cb				0				0		2				male	30		\N	\N	\N	\N	\N				
101902	pqr	pqr@mailinator.com		a		\N	450	2014/06/10	2	Lucknow	post gradutaion	java	128	Csv	1234512345	pqr		1	2014-06-07 18:09:52.204483	b846ce95-3de2-4d69-98ef-4786294880cb				0				0		2				male	30		\N	\N	\N	\N	\N				
101903	stu	stu@mailinator.com		a		\N	450	2014/06/10	2	Lucknow	post gradutaion	java	128	Csv	1234512345	stu		1	2014-06-07 18:09:52.209153	b846ce95-3de2-4d69-98ef-4786294880cb				0				0		2				male	30		\N	\N	\N	\N	\N				
101913	testcsv8	xdfg@gfghdhg.com	1234567890	gfn		\N	450	2014/06/17	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 07:32:23.379126	cd68723d-61d0-43fc-8219-9065aad3b8bd	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102544	    ritesh pandey 	arif.usman@laitkor.com	\N	 b.tech. in electrical and electronics engineering fresher     	resourcess/download/resumes/arif.usman@laitkor.com.f1324475523.9195.rtf	\N	0	2014/10/08 14:46:16	  Fresher      	  Lucknow      	  B.Tech/B.E.     	 ASP.NET with c# btechnology,basic knowlege of C,C++MS office,html,photoshop banner designing, c#,SQL, DATABASE, CSS,VISUAL BASIC	128	naukri.com	 9889991233      		\N	1	2014-10-08 14:46:16.295146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102548	    Priyanshu GopalSharma 	keerti.rastogi@laitkor.com	\N	 Graduationfrom Kanpur University and Six month HR Training From AsiawebmediaManagement, Noida with 2 year experience as a HR executive.     	resourcess/download/resumes/keerti.rastogi@laitkor.com.f1307372510.1384.doc	\N	0	2014/10/08 14:46:16	  2Years, 6 Months      	  Delhi      	  B.A     	 HRoperation.     	128	naukri.com	 7503708575      		\N	1	2014-10-08 14:46:16.517475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
101847	Harkamal	harkamal.singh@gmail.com	1234567890	<p style="text-align: center;"><span style="font-family: 'arial black', 'avant garde'; font-size: medium;" data-mce-mark="1">Harkamal</span>\r\n<p style="text-align: center;"> \r\n<span style="font-size: small;"><strong>Duis tempus convallis risus.</strong></span>\r\n<span style="font-size: small;"> Mauris id faucibus elit, at faucibus nisi. Donec quam nunc, hendrerit malesuada malesuada eu, placerat dictum elit. Mauris egestas elit ligula, eget tincidunt mi mollis sit amet. Fusce malesuada in justo eu accumsan.</span>\r\n \r\n \r\n<span style="font-size: small;"><strong>Sed quis commodo augue.</strong></span>\r\n<span style="font-size: small;"> Vestibulum dignissim, nunc ut blandit vulputate, dolor nulla varius orci, ut euismod nulla risus eget odio. Praesent egestas faucibus laoreet. Donec quis velit ac urna consectetur interdum. Nam augue justo,</span>\r\n \r\n<strong><span style="font-size: small;">dapibus eu augue id,</span></strong>\r\n<span style="font-size: small;"> porttitor aliquam dui. Fusce viverra est commodo ultrices iaculis. Mauris in mauris at magna congue feugiat. Nunc congue sem quis augue accumsan, ut fermentum metus scelerisque.</span>	\N	\N	450	2014/05/23	0	delhi	Undergraduate	photoshop, html, css	128	Upload	1234567890	singh		1	2014-05-21 00:23:55.65123	ce8a938a-9b81-4468-9f13-8553f8a50d12	Lucknow PG college	Lucknow university	design	0				0		0				male	20-30		lko graphic	lko adv.	\N	\N	\N	BSc			
101844	abdul aleem	abdul.aleem@laitkor.com	8960205841	<span>WASHINGTON (Reuters) - Former U.S. National Security Agency contractor Edward Snowden told a U.S. television interviewer on Wednesday he was not under the control of Russia's government and had given Moscow no intelligence documents after nearly a year of asylum there.</span>	resourcess/download/resumes/test_CV1401522439163.doc	\N	450	2014/04/28	7-10	lucknow	Graduate	UI, UX, Graphic, Web	128	Upload	8960205841	al-husayni	designer	1	2014-04-25 22:34:24.305651	4c1b5472-6b16-4199-ad9d-29f709eef62b	National PG college	Lucknow university	arab culture	70				0	info. tech	8	visualizer 	23456	34567	male	20-30				\N	\N	\N	art		laitkor infosolutions pvt. ltd.	lucknow
101869	abdul aleem	abdul.aleem@laitkor.com	8960205841	<span>WASHINGTON (Reuters) - Former U.S. National Security Agency contractor Edward Snowden told a U.S. television interviewer on Wednesday he was not under the control of Russia's government and had given Moscow no intelligence documents after nearly a year of asylum there.</span>	resourcess/download/resumes/test_CV1401354648559.doc	\N	450	2014/05/29	-1	lucknow	Graduate	UI, UX, Graphic, Web	128	Upload	9874563210	al-husayni		1	2014-05-26 16:49:48.645647	17d08478-298e-463a-a145-151b7f1f6cab	mumtaz PG college	Lucknow university	arab culture	70				0		0				male	20-30		matrix	laitkor	\N	\N	\N	art		\N	\N
101878	Sachin	xdfg@gfghdhg.com	1234567890	gfn		\N	450	2014/06/10	0	lucknow	-1	java	128	Upload	1234567890	gupta		1	2014-06-07 17:14:47.049006	adf34f8d-de13-4702-b85d-5e37b64c432f	ncet	uptu		0				0		0				female	20-30	NA			\N	\N	\N	btech		fd	
101884	preeta	gdfg@gfdf.fghh	9874563210			\N	450	2014/06/10	-1	vhn	-1	tfy	128	Upload	1234567890	pr		1	2014-06-07 17:19:01.537399	69ab704a-0a68-4422-bd98-1d1df9d56556				0				0		6				-1	-1		\N	\N	\N	\N	\N	jgh			
101906	assignto 	test5ty@gmail.com	3232322323	<p style="text-align: center;">gdfgdfg gfhgh	\N	\N	450	2014/06/11	-1	test	-1	test	128	Upload	1234567890	opening		2	2014-06-08 05:21:04.388099	94e46cb1-2b66-44fe-822f-02842c80b3cf				0				0		0				male	20-30	dfsdf	\N	\N	\N	\N	\N			\N	\N
101907	dfrgttttttt	test5ty@gmail.com	3232322323		\N	\N	450	2014/06/11	-1	kanpur	-1		128	Upload	1234567890	hgf		1	2014-06-08 05:28:13.722283	337a475a-5ac5-43a7-a60a-5b5a403bdcf9				0				0		0				male	30-40		\N	\N	\N	\N	\N			\N	\N
101910	abdul aleem	abdul.aleem@laitkor.com	1478523690		\N	\N	450	2014/06/11	-1	lko	-1	PHP, sql	128	Upload	1234567890	mohd		1	2014-06-08 06:08:14.761739	e3bffdc8-8396-4a81-8856-df5d7ea79aa3				0				0		0				male	30-40	123	\N	\N	\N	\N	\N			\N	\N
101896	Ansho	gdfg@gfdf.fghh	7778889990			\N	450	2014/06/10	-1	vhn	-1	tfy	128	Upload	1234567890	nvbn		2	2014-06-07 17:45:40.029734	7e9e1e10-64e6-4d54-94b4-9b58a3b8fc31				0				0		6				-1	-1				\N	\N	\N	jgh			
102091	dfrgttttttt	test5ty@gmail.com	3232322323	vdsfvdsfsf	resourcess/download/resumes/stop-cv-format140066908496414020548190621404737358077.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	hgf		1	2014-07-04 12:57:09.156234	ed1763d2-154b-46b6-8e33-6584fda0924f				0				0		0				male	20-30	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102092	dfrgttttttt	test5ty@gmail.com	3232322323	<p style="text-align: left;">FSDFDSF	resourcess/download/resumes/stop-cv-format140066908496414020548190621404738648460.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 13:18:39.672482	a3c9f970-b3c9-452e-a444-7dcde9810c5c				0				0		0				male	20-30	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102093	dfrgttttttt	test5ty@gmail.com	3232322323	EWQEQWEQE	resourcess/download/resumes/stop-cv-format140066908496414020548190621404739111585.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 13:26:22.841267	965db502-313a-44fa-b1d6-5514ad25a01c				0				0		0				male	20-30	dfsdf	was	\N	\N	\N	\N			\N	\N
102094	dfrgtttttttgfhfgd	test5ty@gmail.com	3232322323	fdrsfsfsdfs	\N	\N	450	2014/07/07	-1	kanpur	-1		128	Upload	1234567890	hgf		1	2014-07-04 13:29:26.045403	0cdf19f4-99e2-4c9f-8439-c926b0115653				0				0		0				female	20-30		\N	\N	\N	\N	\N			\N	\N
102095	dfrgttttttt	test5ty@gmail.com	4309877777	bfcbcfb	resourcess/download/resumes/stop-cv-format140066908496414020548190621404739327492.doc	\N	450	2014/07/07	0	test	-1		128	Upload	1234567890	rastogi		1	2014-07-04 13:29:58.812102	fff9c157-59bb-4f01-afb6-5c23479ce5e7				0				0		0				female	30-40	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102096	dfrgttttttt	test5ty@gmail.com	3232322323	nvgvbn bvnbvn	resourcess/download/resumes/resume1406700952362.doc	\N	450	2014/07/07	-1	test	-1		128	Upload	1234567890	rastogi		1	2014-07-04 13:32:05.817328	bd849f7d-8f3a-4216-ac5e-bb92148b9b6b				0				0		0				female	30-40	dfsdf	ARAMCO	\N	\N	\N	\N				
101914	testcsv9	ans@gmail.com	1234567890	vnbv		\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-14 07:32:23.444791	cd68723d-61d0-43fc-8219-9065aad3b8bd	ncet	uptu		0				0		2				female	20-30	NA	\N	\N	\N	\N	\N	btech			
101915	testcsv10	ans@gmail.com	1234567890	nbvc		\N	450	2014/06/17	3	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 07:32:23.452108	cd68723d-61d0-43fc-8219-9065aad3b8bd	ncet	uptu		0				0		3				female	20-30	NA	\N	\N	\N	\N	\N	btech		e	
102545	    ankita srivastava 	yasser.sheikh@laitkor.com	\N	 M.com, MBA(HR)     	resourcess/download/resumes/yasser.sheikh@laitkor.com.sureshbeharisrivastava@gmail.com.docx	\N	0	2014/10/08 14:46:16	  3 Years      	  Lucknow      	  B.Com, M.Com     	 Accounts, Tally     	128	naukri.com	 9792907206      		\N	1	2014-10-08 14:46:16.341079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102549	    NEHA RAI 	akash.agrawal@laitkor.com	\N	 MBA in HR and marketing, willing to work in a progressive organisation where I can enhance myskill and contribute my best knowledge and skills towards the growth of theorganisation.     	resourcess/download/resumes/akash.agrawal@laitkor.com.raineha.786@gmail.com.docx	\N	0	2014/10/08 14:46:16	  01 Month      	  Lucknow      	  B.Sc, MBA/PGDM     	 Operating Systems  Windows Microsoft Office& Excel Adobe Illustrator. Photoshop , Coral draw Flash etc.     	128	naukri.com	 8423643919		\N	1	2014-10-08 14:46:16.5638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102079	dfrgttttttt	test5ty@gmail.com	4309877777	jhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghgjhjfgjf hfgh hngfhfghfhfgh hffghg	resourcess/download/resumes/stop-cv-format13987777446921404388324773.doc	\N	450	2014/07/03	1-	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-06-30 11:53:34.119365	bb6b7717-6a4a-45f3-a9d3-400413e62012				0				0		0				female	20-30	dfsdf		\N	\N	\N	\N			\N	\N
102081	dfhgdf	anshikagupta111@gmail.com	3232322323	id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"\r\nid="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"\r\nid="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"\r\nid="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"	resourcess/download/resumes/stop-cv-format1404388905809.doc	\N	450	2014/07/03	1-	test	Undergraduate	hgfh	128	Upload	1234567890	rastogi		1	2014-06-30 12:03:15.203006	e37c19ab-da92-4386-aafb-5ec2a017ee32				0				0		0				male	20-30	dfsdf	ggfg	\N	\N	\N	\N			\N	\N
102080	dfrgttttttt	test5ty@gmail.com	3232322323	id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"id="resumediv"	resourcess/download/resumes/stop-cv-format1400669084964 (1)1404388477588.doc	\N	450	2014/07/03	1-	test	Undergraduate	Animator	128	Upload	3232322323	rastogi		2	2014-06-30 11:56:06.947697	aa23624f-0566-41d4-b2ae-dd7e28434c47				0				0		0				male	20-30	dfsdf	ggfg	\N	\N	\N	\N			\N	\N
102082	anshi	test5ty@gmail.com	3232322323		resourcess/download/resumes/stop-cv-format1404732205067.doc	\N	450	2014/07/07	0	lucknow	Undergraduate	java php node 	128	Upload	1234567890	Gupta		1	2014-07-04 11:31:15.652469	fa87c149-e080-4b24-b800-0f271c5733f1				0				0		0				female	20-30	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102083	dfrgttttttt	test5ty@gmail.com	3232322323	dsdas	resourcess/download/resumes/stop-cv-format14006690849641404732509513.doc	\N	450	2014/07/07	0	kanpur	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 11:36:20.101733	0b2ce52f-4d1f-49c1-872d-da8eb218fc9a				0				0		0				female	20-30	dfsdf		\N	\N	\N	\N			\N	\N
102084	dfrgttttttt	test5ty@gmail.com	3232322323	y5ryr5ty	resourcess/download/resumes/stop-cv-format1404734552307.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 12:10:23.101093	7e3cd904-14bd-4a34-9a3c-64756a128654				0				0		0				female	20-30	dfsdf		\N	\N	\N	\N			\N	\N
102085	dfrgttttttt	test5ty@gmail.com	3232322323	fefsdf	resourcess/download/resumes/stop-cv-format14006674052791404734745121.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 12:13:35.948607	39320d00-91e8-46e0-9d72-d20eeefbbec8				0				0		0				male	30-40	dfsdf	was	\N	\N	\N	\N			\N	\N
102086	dfrgttttttt	test5ty@gmail.com	3232322323		resourcess/download/resumes/stop-cv-format1404735136584.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 12:20:07.438575	afa69541-276a-4cad-8fbb-3abaabb3cfb0				0				0		0				female	20-30	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102087	dfrgttttttt	test5ty@gmail.com	3232322323	dzfdsfdsf	resourcess/download/resumes/stop-cv-format14006674052791404735477428.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 12:25:48.317879	8937b22e-97c4-4887-b85e-2c203b0bf471				0				0		0				female	20-30	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102088	dfrgttttttt	test5ty@gmail.com	3232322323	fdfasfasf	resourcess/download/resumes/stop-cv-format1404735541143.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 12:26:52.037135	f5f502ee-c765-452b-b094-2b254bfc3ad6				0				0		0				female	20-30	dfsdf	was	\N	\N	\N	\N			\N	\N
102089	dfrgttttttt	test5ty@gmail.com	3232322323	fsdfds	resourcess/download/resumes/stop-cv-format140066908496414020548190621404736784222.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	rastogi		1	2014-07-04 12:47:35.269121	b4dd8154-c98d-4d2a-9ed0-d9337aecaa8b				0				0		0				female	20-30	dfsdf	ARAMCO	\N	\N	\N	\N			\N	\N
102090	dfrgttttttt	test5ty@gmail.com	3232322323	cxzczxcz	resourcess/download/resumes/stop-cv-format1400669084964 (1)1404737264821.doc	\N	450	2014/07/07	0	test	Undergraduate	test	128	Upload	1234567890	hgf		1	2014-07-04 12:55:35.890938	a9e079a6-a904-44f6-b906-3fa6a6ebf0f6				0				0		0				male	20-30	dfsdf	was	\N	\N	\N	\N			\N	\N
102076	m a aleem	abdul.aleem@laitkor.com	8960205841	Named &ldquo;Best Digital Marketing Consultant In Long Beach,&rdquo; California in April 2013, Kalem Aquil is an author, business coach, marketing consultant and speaker. He has taught hundreds of small business owners how to grow their businesses by using effective marketing strategies. Hundreds of small business owners, from photographers, to professional child care providers, to manufacturers, continue to benefit from the training he has shared. bgfdfgdf frdfdsf	resourcess/download/resumes/TEST Resume1404970971540.doc	\N	450	2014/06/30	1-3	lucknow	Graduate	Animator	128	Upload	1234567890	al-husayni	animator	1	2014-06-27 09:11:04.007415	0a21f768-16f0-4a28-bb39-dbb0202ab170	Lucknow PG college	Lucknow university	anim.	70				0	Information Technology 	0		23456	34567	male	30-40	123a	ARAMCO	\N	\N	\N	\N	BSc			
101916	nhgnfhfd456	gdfg@gfdf.fghh	7.65777E+12	 		\N	450	2014/06/17	6	vhn	graduate	tfy	128	Csv	1234567890	nvbn	\N	1	2014-06-14 07:32:23.458655	cd68723d-61d0-43fc-8219-9065aad3b8bd	\N	\N	\N	0	\N	\N	\N	0	\N	6	\N	\N	\N	nvnv	37		\N	\N	\N	\N	\N	jgh	\N	\N	\N
102144	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	ansrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhika.gupta@laitkor.com	6757657765757	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	\N	\N	450	2014/08/28	1-3	tttttttttttttttttttttttttttttttttttttttttttttttttt	Postgraduate	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	128	Upload	123456789066	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	2	2014-08-28 16:08:49.795101	51099799-9092-41ab-914a-87c0a0071482	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttt	0	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttt	56	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	5	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	4444444	4444444	female	20-30	tttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttt	\N	\N	\N	\N	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	\N	\N
101922	testcsv13	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv61403003329234.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.620876	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-35		\N	\N	\N	\N	\N				
101923	testcsv14	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv71403003329242.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.628896	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-36		\N	\N	\N	\N	\N				
101924	testcsv15	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv81403003329250.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.637207	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-37		\N	\N	\N	\N	\N				
101925	testcsv16	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv91403003329259.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.645287	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-38		\N	\N	\N	\N	\N				
101926	testcsv17	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403003329279.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.665746	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102143	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	ansrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhika.gupta@laitkor.com	6757657765757	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	\N	\N	450	2014/08/28	1-3	tttttttttttttttttttttttttttttttttttttttttttttttttt	Postgraduate	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	128	Upload	123456789066	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	2	2014-08-28 16:07:35.764234	9e878672-9d9e-4478-bf2d-2a322f199592	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttt	0	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttt	56	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	5	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	4444444	4444444	female	20-30	tttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttt	\N	\N	\N	\N	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt	\N	\N
102133	\N	test5ty@gmail.com	3232322323		resourcess/download/resumes/abc1408364060893.doc	\N	0	2014/08/18	0	Ireland	Undergraduate	test	128	Embed form	1234567890	rastogi		2	2014-08-18 17:45:00.371092	43c0e03b-9b41-41ad-8da7-fa958a9c9af6	test	test	test	70				0		0				female	20-30	dfsdf	\N	\N	\N	\N	\N	test			\N
102131	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 17:35:15.331884	57be1932-8ff6-4d21-985d-df5edaa213b0				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102128	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 13:28:25.11711	eec7b535-773c-4526-913b-ff7a5d2ee1f8				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102126	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 13:23:38.080839	cdfc9434-72e5-4d8f-983c-e4efd55e23c4				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102127	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 13:27:27.716055	894bf8f9-7956-4dfb-9b2e-967b5cc23b52				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102129	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 13:30:02.882915	84e813fd-70a8-4f0f-bd05-bb3ce198c2bb				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102123	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 13:00:08.489879	4cfe92f2-c7c8-4ad4-accf-41551720d323				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102124	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 13:02:36.491643	9aa424b8-585d-44b0-8508-fe81f9245387				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102121	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 12:55:22.848789	912b7c97-337e-4fab-b1a4-6b8c729663bb				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102120	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 12:54:58.488035	5f94e997-7033-428d-9aef-3726ca86402c				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102119	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 12:49:30.852642	fdd926ba-4bae-4487-85f8-cafdddd45647				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102122	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 12:58:57.85078	249c06ca-f6fa-4195-8185-4b820837a153				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
102125	\N				\N	\N	0	2014/08/18	-1		-1		128	Embed form				2	2014-08-18 13:03:52.721373	0f8d59ba-b9dd-4082-965f-34f3facbb96b				0				0		0				-1	-1		\N	\N	\N	\N	\N				\N
101900	jkl	jkl@mailinator.com		a		\N	450	2014/06/10	2	Lucknow	post gradutaion	java	128	Csv	1234512345	jkl		1	2014-06-07 18:09:52.178409	b846ce95-3de2-4d69-98ef-4786294880cb				0				0		2				male	30		\N	\N	\N	\N	\N				
101917	testcsv8	xdfg@gfghdhg.com	1234567890	gfn	resourcess/download/resumes/cv11403003329151.doc	\N	450	2014/06/17	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.541261	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101918	testcsv9	xdfg@gfghdhg.com	1234567890	vnbv	resourcess/download/resumes/cv21403003329168.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-14 12:01:06.554208	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
101919	testcsv10	xdfg@gfghdhg.com	1234567890	nbvc	resourcess/download/resumes/cv31403003329176.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.561872	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
101920	testcsv11	xdfg@gfghdhg.com	7.66E+12	nbvc	resourcess/download/resumes/cv41403003329183.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.584891	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
101927	testcsv18	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403003329279.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.670421	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-40		\N	\N	\N	\N	\N				
101928	testcsv19	xdfg@gfghdhg.com		nbvc	resourcess/download/resumes/cv121403003329292.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:01:06.678498	4bdedf14-f2cd-400c-83fa-ae9e5d87a3a2				0				0		2				female	20-41		\N	\N	\N	\N	\N				
101929	name001	xdfg001@gfghdhg.com	1234567890	gfn	resourcess/download/resumes/cv11403003746130.doc	\N	450	2014/06/17	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.580045	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101930	name002	xdfg001@gfghdhg.com	1234567890	vnbv	resourcess/download/resumes/cv21403003746178.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-14 12:08:03.605572	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
101931	name003	xdfg001@gfghdhg.com	1234567890	nbvc	resourcess/download/resumes/cv31403003746193.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.620278	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
101932	name004	xdfg001@gfghdhg.com	7.66E+12	nbvc	resourcess/download/resumes/cv41403003746202.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.739746	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
101933	name005	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv51403003746321.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.761178	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-34		\N	\N	\N	\N	\N				
101934	name006	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv61403003746343.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.770575	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-35		\N	\N	\N	\N	\N				
101935	name007	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv71403003746352.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.779435	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-36		\N	\N	\N	\N	\N				
101936	name008	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv81403003746367.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.794607	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-37		\N	\N	\N	\N	\N				
101937	name009	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv91403003746376.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.803354	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-38		\N	\N	\N	\N	\N				
101938	name010	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403003746391.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.819147	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-39		\N	\N	\N	\N	\N				
101939	name011	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403003746391.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 12:08:03.823078	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-40		\N	\N	\N	\N	\N				
101946	fname006	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv61403006482610.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.301066	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-35		\N	\N	\N	\N	\N				
101945	fname005	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv51403006482602.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.292735	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-34		\N	\N	\N	\N	\N				
101944	fname004	xdfg001@gfghdhg.com	7.66E+12	nbvc	resourcess/download/resumes/cv41403006482587.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.285015	8314d087-9af0-418a-9eb9-f1d2c4f5319e				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
101943	fname003	xdfg001@gfghdhg.com	1234567890	nbvc	resourcess/download/resumes/cv31403006482579.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.269603	8314d087-9af0-418a-9eb9-f1d2c4f5319e	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
101941	fname001	xdfg001@gfghdhg.com	1234567890	gfn	resourcess/download/resumes/cv11403006482526.doc	\N	450	2014/06/17	0	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:53:40.223627	8314d087-9af0-418a-9eb9-f1d2c4f5319e	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
101940	name012	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv121403003746404.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-14 12:08:03.833586	a2ed4fe4-f210-44ee-8f65-a3fed4bbf3c7				0				0		2				female	20-41		\N	\N	\N	\N	\N				
101942	fname002	xdfg001@gfghdhg.com	1234567890	vnbv	resourcess/download/resumes/cv21403006482551.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	2	2014-06-14 12:53:40.241649	8314d087-9af0-418a-9eb9-f1d2c4f5319e	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
101956	fname004	xdfg001@gfghdhg.com	7.66E+12	nbvc	resourcess/download/resumes/cv41403007539564.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.368192	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
101957	fname005	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv51403007539584.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.376967	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-34		\N	\N	\N	\N	\N				
101958	fname006	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv61403007539597.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.389955	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-35		\N	\N	\N	\N	\N				
101959	fname007	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv71403007539605.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.39879	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-36		\N	\N	\N	\N	\N				
101960	fname008	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv81403007539614.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.407624	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-37		\N	\N	\N	\N	\N				
101961	fname009	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv91403007539623.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.417762	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-38		\N	\N	\N	\N	\N				
101962	fname010	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403007539639.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.433448	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-39		\N	\N	\N	\N	\N				
101963	fname011	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv101403007539639.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.437193	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-40		\N	\N	\N	\N	\N				
101964	fname012	xdfg001@gfghdhg.com		nbvc	resourcess/download/resumes/cv121403007539652.doc	\N	450	2014/06/17	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-14 13:11:17.446274	c08fa6e3-6fc3-415b-a09b-f88d76dc3a46				0				0		2				female	20-41		\N	\N	\N	\N	\N				
101993	ladoo002	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 08:58:04.023307	aaf43c35-3f87-4af6-b46d-c48eaa84afd4	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
101994	ladoo003	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.13466	aaf43c35-3f87-4af6-b46d-c48eaa84afd4	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
101995	ladoo004	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.140787	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
101996	ladoo005	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.147275	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-34		\N	\N	\N	\N	\N				
101997	ladoo006	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.152268	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-35		\N	\N	\N	\N	\N				
101998	ladoo007	kjhk@sd.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.156666	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-36		\N	\N	\N	\N	\N				
101999	ladoo008	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.161033	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-37		\N	\N	\N	\N	\N				
102000	ladoo009	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.1651	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-38		\N	\N	\N	\N	\N				
102001	ladoo010	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.172759	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102002	ladoo011	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.178357	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-40		\N	\N	\N	\N	\N				
102003	ladoo012	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:04.182176	aaf43c35-3f87-4af6-b46d-c48eaa84afd4				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
102004	ladoo00114	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.355676	17edc270-0e4e-459a-8a6a-e9e3e2748d51	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102005	ladoo00115	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 08:58:21.365661	17edc270-0e4e-459a-8a6a-e9e3e2748d51	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
102006	ladoo00116	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.371198	17edc270-0e4e-459a-8a6a-e9e3e2748d51	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
102007	ladoo00117	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.374751	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
102008	ladoo00118	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.380252	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-34		\N	\N	\N	\N	\N				
102009	ladoo00119	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.384477	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-35		\N	\N	\N	\N	\N				
102010	ladoo00120	kjhk@sd.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.39399	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-36		\N	\N	\N	\N	\N				
102011	ladoo00121	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.410032	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-37		\N	\N	\N	\N	\N				
102012	ladoo00122	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.418634	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-38		\N	\N	\N	\N	\N				
102013	ladoo00123	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.434768	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102014	ladoo00124	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.438133	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-40		\N	\N	\N	\N	\N				
102015	ladoo00125	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:58:21.441965	17edc270-0e4e-459a-8a6a-e9e3e2748d51				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
102016	ladoo00114	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.714748	cc8d18f4-bde5-43cd-946f-3bc24781199c	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102017	ladoo00115	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 08:59:54.738829	cc8d18f4-bde5-43cd-946f-3bc24781199c	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
102018	ladoo00116	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.743777	cc8d18f4-bde5-43cd-946f-3bc24781199c	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
102019	ladoo00117	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.762897	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
102020	ladoo00118	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.767289	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-34		\N	\N	\N	\N	\N				
102021	ladoo00119	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.771689	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-35		\N	\N	\N	\N	\N				
102022	ladoo00120	kjhk@sd.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.775836	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-36		\N	\N	\N	\N	\N				
102023	ladoo00121	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.780165	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-37		\N	\N	\N	\N	\N				
102024	ladoo00122	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.784055	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-38		\N	\N	\N	\N	\N				
102025	ladoo00123	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.788176	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102026	ladoo00124	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.792068	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-40		\N	\N	\N	\N	\N				
102027	ladoo00125	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 08:59:54.796052	cc8d18f4-bde5-43cd-946f-3bc24781199c				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
102028	ladoo00114	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:02:49.658125	68ade24b-b14c-4987-9747-cb28d8f1677e	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102029	ladoo00115	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 09:02:51.103702	68ade24b-b14c-4987-9747-cb28d8f1677e	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
102030	ladoo00116	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:02:52.586164	68ade24b-b14c-4987-9747-cb28d8f1677e	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
102031	ladoo00117	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:02:52.601051	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
102032	ladoo00118	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:02:57.038248	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-34		\N	\N	\N	\N	\N				
102033	ladoo00119	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:02:58.418905	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-35		\N	\N	\N	\N	\N				
102034	ladoo00120	kjhk@sd.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:02:58.423987	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-36		\N	\N	\N	\N	\N				
102035	ladoo00121	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:01.131062	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-37		\N	\N	\N	\N	\N				
102036	ladoo00122	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:02.483656	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-38		\N	\N	\N	\N	\N				
102037	ladoo00123	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:05.774828	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102038	ladoo00124	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:07.105554	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-40		\N	\N	\N	\N	\N				
102039	ladoo00125	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:08.518858	68ade24b-b14c-4987-9747-cb28d8f1677e				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
102040	ladoo00114	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:12.686022	312dd174-3069-4b22-b5f4-85d67d7a4037	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102041	ladoo00115	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 09:03:15.520417	312dd174-3069-4b22-b5f4-85d67d7a4037	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
102042	ladoo00116	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:16.731442	312dd174-3069-4b22-b5f4-85d67d7a4037	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
102043	ladoo00117	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:24.705005	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
102044	ladoo00118	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:03:57.447217	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-34		\N	\N	\N	\N	\N				
102045	ladoo00119	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:04:07.656577	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-35		\N	\N	\N	\N	\N				
102046	ladoo00120	kjhk@sd.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:04:18.051115	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-36		\N	\N	\N	\N	\N				
102047	ladoo00121	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:04:18.056927	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-37		\N	\N	\N	\N	\N				
102048	ladoo00122	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:04:18.061101	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-38		\N	\N	\N	\N	\N				
102049	ladoo00123	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:04:18.064784	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102050	ladoo00124	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:04:18.068332	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-40		\N	\N	\N	\N	\N				
102051	ladoo00125	xdfg001@gfghdhg.com	7.66E+12	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:04:18.072083	312dd174-3069-4b22-b5f4-85d67d7a4037				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
102052	ladoo00114	jhk@sd.com	1234567890	gfn		\N	450	2014/06/24	0	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.415582	47d6466e-2276-4884-8864-65e14b5791e1	ncet	uptu		0				0		0				female	20-30	NA	\N	\N	\N	\N	\N	btech		fd	
102053	ladoo00115	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 09:08:45.456054	47d6466e-2276-4884-8864-65e14b5791e1	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
102054	ladoo00116	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:08:45.460291	47d6466e-2276-4884-8864-65e14b5791e1	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
102065	cando001	khjk@fgh.com	1234567890	vnbv		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta	ffsd	1	2014-06-21 09:15:49.773608	ef66828f-6a5f-4ad1-879c-a7ecdff9775d	ncet	uptu		0				0		2				female	20-31	NA	\N	\N	\N	\N	\N	btech			
102066	cando002	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.802592	ef66828f-6a5f-4ad1-879c-a7ecdff9775d	ncet	uptu		0				0		2				female	20-32	NA	\N	\N	\N	\N	\N	btech		e	
102067	cando003	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.810556	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-33		\N	\N	\N	\N	\N	jgh			
102068	cando004	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.816676	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-34		\N	\N	\N	\N	\N				
102069	cando005	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.821062	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-35		\N	\N	\N	\N	\N				
102070	cando006	kjhk@sd.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.824859	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-36		\N	\N	\N	\N	\N				
102071	cando007	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.829731	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-37		\N	\N	\N	\N	\N				
102072	cando008	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.834539	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-38		\N	\N	\N	\N	\N				
102074	cando010	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.842993	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-40		\N	\N	\N	\N	\N				
102075	cando011	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		1	2014-06-21 09:15:49.849676	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-41	kjh	\N	\N	\N	\N	\N				
102073	cando009	xdfg001@gfghdhg.com	1234567890	nbvc		\N	450	2014/06/24	2	lucknow	graduate	java	128	Csv	1234567890	gupta		2	2014-06-21 09:15:49.838322	ef66828f-6a5f-4ad1-879c-a7ecdff9775d				0				0		2				female	20-39		\N	\N	\N	\N	\N				
102153	demo6	usersix7@mailinator.com	1234512350	dem demo demo		\N	450	2014/09/20	7	lucknow	Undergraduate	Dot Net	128	csv	1234512350	usersix		1	2014-09-20 13:21:55.681757	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		7				male	35		\N	\N	\N	\N	\N	BE			
102154	demo7	userseven7@mailinator.com	1234512351	dem demo demo		\N	450	2014/09/20	8	lucknow	Undergraduate	java	128	csv	1234512351	userseven		1	2014-09-20 13:21:55.690188	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		8				male	36		\N	\N	\N	\N	\N	BE			
102155	demo8	usereight7@mailinator.com	1234512352	dem demo demo		\N	450	2014/09/20	9	lucknow	Undergraduate	Dot Net	128	csv	1234512352	usereight		1	2014-09-20 13:21:55.69845	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		9				male	37		\N	\N	\N	\N	\N	BE			
102156	demo9	usernine7@mailinator.com	1234512353	dem demo demo		\N	450	2014/09/20	10	lucknow	Undergraduate	java	128	csv	1234512353	usernine		1	2014-09-20 13:21:55.70678	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		10				male	38		\N	\N	\N	\N	\N	BE			
102157	demo10	userten7@mailinator.com	1234512354	dem demo demo		\N	450	2014/09/20	11	lucknow	Undergraduate	Dot Net	128	csv	1234512354	userten		1	2014-09-20 13:21:55.715149	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		11				male	39		\N	\N	\N	\N	\N	BE			
102158	demo11	usereleven7@mailinator.com	1234512355	dem demo demo		\N	450	2014/09/20	12	lucknow	Undergraduate	java	128	csv	1234512355	usereleven		1	2014-09-20 13:21:55.723913	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		12				male	40		\N	\N	\N	\N	\N	BE			
102159	demo12	usertwelve7@mailinator.com	1234512356	dem demo demo		\N	450	2014/09/20	13	lucknow	Undergraduate	PHP	128	csv	1234512356	usertwelve		1	2014-09-20 13:21:55.73709	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		13				male	41		\N	\N	\N	\N	\N	BE			
102160	demo13	userthirteen7@mailinator.com	1234512357	dem demo demo		\N	450	2014/09/20	14	lucknow	Undergraduate	PHP	128	csv	1234512357	userthirteen		1	2014-09-20 13:21:55.748414	658a82f7-e77b-4add-b94e-c413e490c31a	Demo	Demo College	Demo	0				0		14				male	42		\N	\N	\N	\N	\N	BE			
102546	    rahul vishwakarma 	anshika.gupta@laitkor.com	\N	 OBJECTIVE To secure a challenging position with professionallymanaged group. A position which will utilize my experience & planning ifprovided opportunity for professional & personal growth.     	resourcess/download/resumes/anshika.gupta@laitkor.com.rahul.vis.docx	\N	0	2014/10/08 14:46:16	  01 Month	  Mumbai      	  B.Sc     	 webdeveloper     	128	naukri.com	 9702266083		\N	1	2014-10-08 14:46:16.380407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102550	Nirjala 	laitkor@gmail.com		MTech (CSE) With More Than 2 Years Experience in Software Development.	resourcess/download/resumes/laitkor@gmail.com.nir.cs2008@gmail.com.doc	\N	0	2014/10/08 14:46:16	2 Years, 10 Months      	Delhi      	B.Tech/B.E., M.Tech     	C#, ASP.NET 3.5/4/4.5,ADO.NET,ASP MVC4, Web Services, jQuery, AJAXArcGis API for JAVA Script, JAVA Script DOJO 2.8, HTML5, CSS3 ,C	128	Via Upload	7206290170	Singh 	\N	1	2014-10-08 14:46:16.591669	\N	\N	\N	\N	0	\N	\N	\N	0	\N	0	\N	\N	\N	female	20-30			\N	\N	\N	\N	\N	\N	\N	\N
102162	demo11	demo@gmail.com		Detail 124		\N	450	2014/09/23	0	city11	Graduate	skill2	128	csv	234243243244	last11		1	2014-09-23 18:53:45.18779	1939a0f5-4ec0-417c-bab5-7edbf3aac108	college11	Univ 11	Spec 11	0				0		0				female	20-34		\N	\N	\N	\N	\N	fgdfg11			
102163	demo12	demo@gmail.com		Detail 125		\N	450	2014/09/23	0	city12	Graduate	skill3	128	csv	234243243245	last12		1	2014-09-23 18:53:45.209126	1939a0f5-4ec0-417c-bab5-7edbf3aac108	college12	Univ 12	Spec 12	0				0		0				female	20-33		\N	\N	\N	\N	\N	fgdfg12			
102164	demo13	demo@gmail.com		Detail 126		\N	450	2014/09/23	0	city13	Graduate	skill4	128	csv	234243243246	last13		1	2014-09-23 18:53:45.217436	1939a0f5-4ec0-417c-bab5-7edbf3aac108	college13	Univ 13	Spec 13	0				0		0				female	20-32		\N	\N	\N	\N	\N	fgdfg13			
102165	demo14	demo@gmail.com		Detail 127		\N	450	2014/09/23	0	city14	Graduate	skill5	128	csv	234243243247	last14		1	2014-09-23 18:53:45.225829	1939a0f5-4ec0-417c-bab5-7edbf3aac108	college14	Univ 14	Spec 14	0				0		0				male	20-31		\N	\N	\N	\N	\N	fgdfg14			
102166	demo15	demo@gmail.com		Detail 128		\N	450	2014/09/23	0	city15	Graduate	skill6	128	csv	234243243248	last15		1	2014-09-23 18:53:45.234296	1939a0f5-4ec0-417c-bab5-7edbf3aac108	college15	Univ 15	Spec 15	0				0		0				male	20-30		\N	\N	\N	\N	\N	fgdfg15			
102168	demo17	demo@gmail.com		Detail 130		\N	450	2014/09/23	0	city17	Graduate	skill8	128	csv	234243243250	last17		1	2014-09-23 18:53:45.250901	1939a0f5-4ec0-417c-bab5-7edbf3aac108	college17	Univ 17	Spec 17	0				0		0				male	20-28		\N	\N	\N	\N	\N	fgdfg17			
102169	demo18	demo@gmail.com		Detail 131		\N	450	2014/09/23	0	city18	Graduate	skill9	128	csv	234243243251	last18		1	2014-09-23 18:53:45.259168	1939a0f5-4ec0-417c-bab5-7edbf3aac108	college18	Univ 18	Spec 18	0				0		0				male	20-27		\N	\N	\N	\N	\N	fgdfg18			
102179	demo18	demo@gmail.com		Detail 131	resourcess/download/resumes/cv91411479122982.doc	\N	450	2014/09/23	0	city18	Graduate	skill9	128	csv	234243243251	last18		1	2014-09-23 19:02:02.987218	3acbe284-d60d-4fc2-8652-747434d77535	college18	Univ 18	Spec 18	0				0		0				male	20-27		\N	\N	\N	\N	\N	fgdfg18			
102176	demo15	demo@gmail.com		<span style="text-decoration: underline;"><strong><span style="font-size: small; font-family: arial, helvetica, sans-serif;">Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj Detail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjjDetail 128 jhghjjjjjjjjjjjjjjjjjjj</span></strong></span>	resourcess/download/resumes/cv61411479122956.doc	\N	450	2014/09/23	0	city15	Graduate	skill6	128	Via Upload	234243243248	last15		1	2014-09-23 19:02:02.961172	3acbe284-d60d-4fc2-8652-747434d77535	college15	Univ 15	Spec 15	0				0		0				male	20-30			\N	\N	\N	\N	fgdfg15			
102543	    Animesh Bajpai 	sagar.gurnani@laitkor.com	\N	 Having experience inMicrosoft Technologies like .NET framework 3.5,4.0 ASP.NET, AJAX, ADO.NET,SQL Server. My work experience involves Rich Internet ApplicationsDevelopment. Seeking a position to utilize my skills and abilities in theI.T.     	resourcess/download/resumes/sagar.gurnani@laitkor.com.ani10091989.docx	\N	0	2014/10/08 14:46:15	  2 Years, 5Months      	Lucknow      	  B.Tech/B.E.     	 Asp.Net C#,Sql Server 2008,HTML, Javascript,Webservice     	128	naukri.com	 +919453051352      		\N	1	2014-10-08 14:46:15.998456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
102547	    Saurabh Verma 	mail4@laitkor.com	\N	 SoftwareEngineer with 3+ years of experience in Microsoft Technologies(C#,Asp.Netand SQL Server 2005/2008)     	resourcess/download/resumes/mail4@laitkor.com.mailme.saurabh_verma@rediffmail.com.doc	\N	0	2014/10/08 14:46:16	  3 Years, 5 Months      	  Lucknow      	  B.Sc, MCA     	 C#.Asp.Net, Sql Server2005/2008, Crystal Reports 2008, Jquery, Ajax Toolkit     	128	naukri.com	 09670149883      		\N	1	2014-10-08 14:46:16.462507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: saral_candidate_candidate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_candidate_candidate_id_seq', 102550, true);


--
-- Data for Name: saral_candidate_document; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_candidate_document (document_id, candidate_id, created_on, cmp_id, doc_name, path) FROM stdin;
1	92	2013-08-14 03:16:16.965499+05:30	32	MyDoc	resourcess/download/docs/Project1376486637406.docx
2	92	2013-08-14 03:43:44.81157+05:30	32	Doc2	resourcess/download/docs/Project1376488285187.docx
3	116	2013-08-25 23:24:14.553767+05:30	32	Added file for testing	resourcess/download/docs/New Text Document1377521681625.txt
4	147	2013-08-30 23:48:19.933763+05:30	97	Resume	resourcess/download/docs/ASHWINI_KUMAR_SINGH_CHANDEL-exp_020920121377955129625.doc
5	116	2013-09-04 16:26:51.192157+05:30	32	Abc	resourcess/download/docs/New Text Document1378448880343.txt
6	116	2013-09-04 16:43:47.592005+05:30	32	abc	resourcess/download/docs/New Text Document (3)1378449896562.txt
7	116	2013-09-04 16:56:09.969022+05:30	32	abc	resourcess/download/docs/How-to-install-Livezilla1378450638875.pdf
8	116	2013-09-04 17:03:10.436172+05:30	32	avf	resourcess/download/docs/Ankit1378451059312.doc
9	116	2013-09-04 17:10:14.170211+05:30	32	weqe	resourcess/download/docs/Ankit1378451483046.doc
10	116	2013-09-04 17:16:17.002705+05:30	32	ffffffff	resourcess/download/docs/Project1378451845781.docx
11	133	2013-09-04 19:21:30.417518+05:30	32	rr	resourcess/download/docs/Ankit1378459418328.doc
12	10160	2013-09-06 17:43:31.027712+05:30	32	resr	resourcess/download/docs/New Text Document (2)1378626392140.txt
13	10160	2013-09-06 18:44:08.746227+05:30	32	wewrew	resourcess/download/docs/New Text Document (2)1378630029484.txt
14	10160	2013-09-06 19:13:56.777312+05:30	32	wetrer	resourcess/download/docs/What are the various types of reports1378631817312.doc
15	10166	2013-09-10 16:17:49.743714+05:30	97	New document	resourcess/download/docs/Ankit1378880466375.doc
16	101682	2013-09-25 15:12:31.672977+05:30	111	jjjjj	resourcess/download/docs/Project1380178674634.docx
17	101722	2013-10-20 20:21:11.43159+05:30	32	Image Uploaded	resourcess/download/docs/amorphia-apparel1382352263316.jpg
18	101805	2013-12-15 21:12:48.022151+05:30	119	cover	resourcess/download/docs/wpo_testing1387193990195.pdf
19	101805	2013-12-19 20:21:28.349544+05:30	119	doc 2	resourcess/download/docs/ajay.singh@laitkor.com.saris_gupta_11387536640454.doc
20	101833	2013-12-23 18:53:12.444467+05:30	119	my doc 2	resourcess/download/docs/ajay.singh@laitkor.com.saris_gupta_11387876963035.doc
21	101843	2014-05-19 01:37:50.745989+05:30	128	OUIOU	resourcess/download/docs/stop-cv-format1400667405279.doc
22	101844	2014-05-28 15:25:21.903397+05:30	128	test_CV	resourcess/download/docs/test_CV1401522363498.doc
23	101844	2014-06-03 19:19:26.76894+05:30	128	test to do	resourcess/download/docs/stop-cv-format14006690849641402054819062.doc
24	102073	2014-06-27 07:29:39.334336+05:30	128	123	resourcess/download/docs/cover letter_fahd1404110230910.doc
25	102076	2014-06-28 07:18:53.726523+05:30	128	cover letter	resourcess/download/docs/TEST Resume1404195980272.doc
26	102081	2014-07-02 05:54:26.349849+05:30	128	cover page	resourcess/download/docs/stop-cv-format14006690849641404536515501.doc
27	102081	2014-07-02 05:56:17.571153+05:30	128	offer letter	resourcess/download/docs/stop-cv-format1404536626719.doc
28	101869	2014-07-02 07:27:41.831768+05:30	128	test doc fahd	resourcess/download/docs/c1404542110527.html
29	102091	2014-07-04 13:05:26.855249+05:30	128	test to do	resourcess/download/docs/stop-cv-format140066908496414045365155011404737855722.doc
30	102097	2014-07-15 07:28:38.967331+05:30	128	test to do	resourcess/download/docs/popup1405665370924.jsp
31	102097	2014-07-16 07:54:47.648929+05:30	128	test to do	resourcess/download/docs/abc1405753332491.doc
32	102097	2014-08-22 16:08:46.107166+05:30	128	  	resourcess/download/docs/abc1408703882489.doc
33	102097	2014-08-22 16:10:27.041089+05:30	128	 	resourcess/download/docs/abc1408703983387.doc
34	102097	2014-08-22 16:35:26.866327+05:30	128	hjhh	resourcess/download/docs/abc1408705483162.doc
35	102097	2014-08-22 16:36:42.193674+05:30	128	jkhjk	resourcess/download/docs/abc1408705558483.doc
36	102145	2014-09-02 14:26:47.407302+05:30	128	fhfghgh	resourcess/download/docs/12341409648588538.rar
37	102145	2014-09-02 14:59:59.295285+05:30	128	kjhkh	resourcess/download/docs/saral1409650580190.doc
38	102145	2014-09-02 15:05:15.46562+05:30	128	Highcharts Demo	resourcess/download/docs/abc14056697268141409650893604.doc
39	102145	2014-09-02 15:12:41.285997+05:30	128	Highcharts Demo	resourcess/download/docs/cv1214030033292921409651339420.docx
\.


--
-- Name: saral_candidate_document_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_candidate_document_document_id_seq', 40, true);


--
-- Name: saral_candidate_g_college_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_candidate_g_college_seq', 6, true);


--
-- Name: saral_candidate_location_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_candidate_location_seq', 3, true);


--
-- Data for Name: saral_candidate_stage; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_candidate_stage (su_id, s_name, opening_id, candidate_id, assign_date) FROM stdin;
2814	Offered and Rejected	549	102075	2014-06-22
2656	Unscreened	529	102075	2014-06-27
2668	Offered and Accepted	530	102097	2014-07-06
2640	Unscreened	527	102097	2014-07-19
2649	screening	528	102097	2014-07-08
2801	Unscreened	548	102142	2014-08-20
2818	screening	550	102076	2014-06-28
2650	Telephonic Interview	528	102076	2014-06-28
2809	Unscreened	549	102081	2014-07-02
2648	Unscreened	528	102096	2014-07-26
2817	Unscreened	550	102081	2014-07-02
2834	screening	552	102081	2014-07-02
2833	Unscreened	552	102078	2014-07-04
2817	Unscreened	550	102078	2014-07-04
2809	Unscreened	549	102078	2014-07-04
2801	Unscreened	548	102078	2014-07-04
2817	Unscreened	550	102091	2014-07-04
2629	Offered and Rejected	525	101841	2014-01-07
2648	Unscreened	528	101842	2014-04-21
2801	Unscreened	548	102091	2014-07-04
2793	Unscreened	547	102091	2014-07-04
2640	Unscreened	527	101844	2014-04-25
2641	screening	527	101842	2014-04-21
2810	screening	549	102096	2014-07-26
2680	Unscreened	532	101843	2014-05-19
2656	Unscreened	529	101843	2014-05-19
2642	Telephonic Interview	527	101843	2014-04-21
2656	Unscreened	529	101846	2014-05-21
2648	Unscreened	528	101846	2014-05-21
2641	screening	527	101846	2014-05-21
2664	Unscreened	530	101844	2014-05-26
2656	Unscreened	529	101844	2014-05-26
2689	Unscreened	533	101870	2014-05-27
2649	screening	528	101844	2014-04-26
2769	Unscreened	544	101868	2014-06-07
2664	Unscreened	530	101875	2014-06-07
2656	Unscreened	529	101875	2014-06-07
2769	Unscreened	544	101878	2014-06-07
2737	Unscreened	540	101878	2014-06-07
2697	Unscreened	534	101881	2014-06-07
2664	Unscreened	530	101881	2014-06-07
2769	Unscreened	544	101884	2014-06-07
2737	Unscreened	540	101896	2014-06-07
2697	Unscreened	534	101896	2014-06-07
2737	Unscreened	540	101896	2014-06-07
2697	Unscreened	534	101896	2014-06-07
2664	Unscreened	530	101896	2014-06-07
2769	Unscreened	544	101889	2014-06-07
2737	Unscreened	540	101889	2014-06-07
2697	Unscreened	534	101889	2014-06-07
2656	Unscreened	529	101869	2014-06-07
2648	Unscreened	528	101869	2014-06-07
2640	Unscreened	527	101869	2014-06-07
2769	Unscreened	544	101905	2014-06-08
2697	Unscreened	534	101907	2014-06-08
2769	Unscreened	544	101911	2014-06-09
2769	Unscreened	544	101912	2014-06-09
2648	Unscreened	528	101912	2014-06-13
2810	screening	549	102091	2014-07-04
2740	Face to Face	540	101884	2014-06-07
2773	Offered and Accepted	544	101910	2014-06-08
2774	Offered and Rejected	544	101896	2014-06-07
2774	Offered and Rejected	544	101896	2014-06-07
2656	Unscreened	529	101973	2014-06-18
2738	screening	540	101973	2014-06-15
2834	screening	552	102091	2014-07-04
2857	Unscreened	555	102142	2014-08-22
2789	Offered and Accepted	546	102091	2014-07-04
2819	Telephonic Interview	550	102075	2014-06-22
2833	Unscreened	552	102092	2014-07-04
2738	screening	540	102075	2014-06-22
2737	Unscreened	540	102092	2014-07-04
2770	screening	544	102075	2014-06-22
2698	screening	534	102075	2014-06-22
2664	Unscreened	530	102092	2014-07-04
2648	Unscreened	528	102092	2014-07-04
2640	Unscreened	527	102092	2014-07-04
2819	Telephonic Interview	550	102092	2014-07-04
2657	screening	529	102092	2014-07-04
2643	Face to Face	527	102076	2014-06-28
2785	Unscreened	546	102097	2014-08-12
2801	Unscreened	548	102096	2014-08-13
2640	Unscreened	527	102096	2014-08-13
2656	Unscreened	529	102096	2014-08-13
2836	Face to Face	552	102097	2014-07-06
2842	screening	553	102098	2014-07-07
2801	Unscreened	548	102097	2014-07-08
2793	Unscreened	547	102097	2014-07-08
2811	Telephonic Interview	549	102097	2014-07-08
2737	Unscreened	540	102097	2014-07-08
2656	Unscreened	529	102097	2014-07-08
2809	Unscreened	549	102095	2014-08-13
2801	Unscreened	548	102095	2014-08-13
2821	Offered and Accepted	550	102097	2014-07-08
2793	Unscreened	547	102095	2014-08-13
2809	Unscreened	549	102142	2014-08-22
2697	Unscreened	534	102096	2014-08-13
2809	Unscreened	549	102094	2014-08-13
2793	Unscreened	547	102096	2014-08-14
2785	Unscreened	546	102096	2014-08-14
2809	Unscreened	549	102093	2014-08-14
2801	Unscreened	548	102093	2014-08-14
2809	Unscreened	549	102111	2014-08-18
2809	Unscreened	549	102112	2014-08-18
2809	Unscreened	549	102113	2014-08-18
2809	Unscreened	549	102114	2014-08-18
2809	Unscreened	549	102115	2014-08-18
2809	Unscreened	549	102116	2014-08-18
2809	Unscreened	549	102117	2014-08-18
2809	Unscreened	549	102118	2014-08-18
2801	Unscreened	548	102119	2014-08-18
2801	Unscreened	548	102120	2014-08-18
2801	Unscreened	548	102121	2014-08-18
2801	Unscreened	548	102122	2014-08-18
2801	Unscreened	548	102123	2014-08-18
2801	Unscreened	548	102124	2014-08-18
2801	Unscreened	548	102125	2014-08-18
2801	Unscreened	548	102126	2014-08-18
2801	Unscreened	548	102127	2014-08-18
2801	Unscreened	548	102128	2014-08-18
2801	Unscreened	548	102129	2014-08-18
2801	Unscreened	548	102130	2014-08-18
2801	Unscreened	548	102131	2014-08-18
2801	Unscreened	548	102132	2014-08-18
2801	Unscreened	548	102133	2014-08-18
2801	Unscreened	548	102134	2014-08-18
2793	Unscreened	547	102142	2014-08-22
2785	Unscreened	546	102142	2014-08-22
2769	Unscreened	544	102142	2014-08-22
2737	Unscreened	540	102142	2014-08-22
2697	Unscreened	534	102142	2014-08-22
2648	Unscreened	528	102142	2014-08-22
2640	Unscreened	527	102142	2014-08-22
2770	screening	544	102097	2014-08-08
2700	Face to Face	534	102097	2014-07-06
2873	Unscreened	556	102146	2014-09-05
2857	Unscreened	555	102096	2014-09-08
\.


--
-- Data for Name: saral_candidate_todos; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_candidate_todos (id, title, timeat, candidate_id, opening_id, created_by, created_on, status, user_id, due_by, createdbyid, todosdescription, completedby) FROM stdin;
268	ee	12:00	102097	549	Anshika Gupta	2014/07/18 12:01:49	0	\N	07/26/2014	450	ww	450
257	post job	01:20	101869	527	Anshika Gupta	2014/06/10 18:07:57	0	\N	06/30/2014	450	American �Football� Fans Adapt Foreign Traditions 	450
252	gfdg	11:24	101842	527	Anshika Gupta	2014/04/24 11:26:09	1	\N	04/30/2014	450	ghfhfh	\N
260	test to do	15:37	102081	552	Anshika Gupta	2014/07/05 15:38:16	1	\N	07/05/2014	450	gdgdfgds	0
259	ccxczxc	14:59	102081	549	Anshika Gupta	2014/07/05 14:59:50	0	\N	07/31/2014	450	gdgdfgds	450
261		10:41	102078	552	Anshika Gupta	2014/07/07 10:58:57	1	\N	07/14/2014	450	gdgdfgds	0
262	test to do	7/7/14	102091	546	Anshika Gupta	2014/07/07 18:27:00	1	\N	05/31/2014	450	gdgdfgds	\N
263	test to do	18:30	102091	546	Anshika Gupta	2014/07/07 18:31:12	1	\N	07/16/2014	450	DWADA	\N
264	test to do	18:31	102091	546	Anshika Gupta	2014/07/07 18:31:45	1	\N	07/17/2014	450	gdgdfgds	\N
265	test to do	18:44	102091	546	Anshika Gupta	2014/07/07 18:35:42	1	\N	07/10/2014	450	F	\N
255	todo	12:10	101844	527	Anshika Gupta	2014/05/31 12:10:43	1	\N	06/07/2014	450	ghfh	0
256	todo3	12:12	101844	527	Anshika Gupta	2014/05/31 12:12:27	1	\N	05/31/2014	450	gdgdfgds	0
258	CSS3 inset text	12:02	102076	528	Anshika Gupta	2014/07/01 12:06:06	1	\N	07/28/2014	450	And it won't even F up your phone and credit cards	0
266	test to do	18:37	102076	527	Anshika Gupta	2014/07/07 18:37:27	1	\N	07/10/2014	450	gdgdfgds	0
267	test to do	18:45	102092	529	Anshika Gupta	2014/07/07 18:46:04	0	\N	07/08/2014	450	gdgdfgds	450
254	vxcvx	12:10	101844	529	Anshika Gupta	2014/05/31 12:10:26	1	\N	06/06/2014	450	gdgdfgds	0
253	test to do	12:09	101844	527	Anshika Gupta	2014/05/31 12:09:33	1	\N	06/19/2014	450	trtgdeg	0
269	fdfdsf	12:48	102097	548	Anshika Gupta	2014/08/28 12:48:33	1	\N	05/31/2014	450	fdgd gdfggd	\N
\.


--
-- Name: saral_candidate_todos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_candidate_todos_id_seq', 271, true);


--
-- Name: saral_candidate_todos_title_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_candidate_todos_title_seq', 1, false);


--
-- Data for Name: saral_company; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_company (cmp_id, cmp_name, created_by, displayname) FROM stdin;
175	keerti1234	\N	keerti1234
127	mycomp	\N	mycomp
128	laitkor	\N	laitkor
136	laitkor2	\N	laitkor2
141	lisp	\N	lisp
151	shalnicompany	\N	shalnicompany
154	yasser	\N	yasser
155	123456	\N	123456
156	james	\N	james
157	keerticompany	\N	keerticompany
158	laitkor44	\N	laitkor44
159	jyghjhgj67	\N	jyghjhgj67
160	shalnicompanyere	\N	shalnicompanyere
161	junetest	\N	junetest
162	bytekor	\N	bytekor
163	nitekor	\N	nitekor
164	nitekor123	\N	nitekor123
165	julytest	\N	julytest
166	byteacore	\N	byteacore
167	vanarchap	\N	vanarchap
168	test2345	\N	test2345
169	test5ty90	\N	test5ty90
170	test34	\N	test34
171	test34345	\N	test34345
172	test0806	\N	test0806
173	test1august	\N	test1august
174	keerti20263	\N	keerti20263
176	account	\N	account
178	help123	\N	help123
\.


--
-- Name: saral_company_cmp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_company_cmp_id_seq', 178, true);


--
-- Data for Name: saral_company_role; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_company_role (id, role_id, cmp_id) FROM stdin;
\.


--
-- Name: saral_company_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_company_role_id_seq', 1, false);


--
-- Data for Name: saral_company_saral_user; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_company_saral_user (saral_company_cmp_id, user_id) FROM stdin;
\.


--
-- Name: saral_create_interview_interview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_create_interview_interview_id_seq', 437, true);


--
-- Data for Name: saral_create_user; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_create_user (user_id, "position", city, state, country, job_description) FROM stdin;
1	java	lko	up	india	core java,jsp ,struts2,Android,
\.


--
-- Name: saral_create_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_create_user_id_seq', 1, true);


--
-- Name: saral_dFields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('"saral_dFields_id_seq"', 40, true);


--
-- Data for Name: saral_department; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_department (id, department_name, dept_id, cmp_id, active) FROM stdin;
36	Operation	36	128	1
86	nbvnvbn	86	151	0
87	operations	87	151	0
88	TEST	88	154	0
89	operation	89	151	0
91	Operations	91	154	0
92	Operation	92	154	0
37	Development	37	128	1
64	Admin	64	\N	1
118	kjk jhklj	118	128	0
119	Development56	119	128	0
116	kokkl21	116	128	1
101	newtestrterg	101	128	1
\.


--
-- Name: saral_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_department_id_seq', 119, true);


--
-- Data for Name: saral_dfields; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_dfields (id, status, cmpid, fields, field_id) FROM stdin;
36	1	128	1st company	1
37	0	128	2nd company	2
38	0	128	IUIY	3
39	0	128	Test_4	4
40	0	128	field_5	5
\.


--
-- Data for Name: saral_feedback_rating; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_feedback_rating (id, rating_name) FROM stdin;
1	Not Satisfactory
2	Satisfactory
3	Very Satisfactory
4	Not Applicable
\.


--
-- Name: saral_feedback_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_feedback_rating_id_seq', 4, true);


--
-- Data for Name: saral_internal_notes; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_internal_notes (id, candidate_id, opening_id, user_id, stage_id, notes, created_on) FROM stdin;
142	101844	530	450	2664	One glimmer of hope: The remote-control operated OutRunner is still in its Kickstarter phase, and just $20,000 have been pledged of its $150,000 goal. Fund it if you'd like, but know this: You are making things that much easier for our one-day machine overlords to capture us and store our bodies in biology-sucking battery pods. Swear your allegiances now.\r\n	2014-05-28 15:26:00.424241
143	102075	544	450	2770	ghfhfg hgfh	2014-06-24 14:05:09.892295
144	102076	550	450	2819	Named Best Digital Marketing Consultant In Long Beach, California in April 2013	2014-06-28 07:23:39.017478
145	102076	527	450	2640	Kalem Aquil is an author, business coach, marketing consultant and speaker.	2014-06-28 07:24:22.725714
146	102076	528	450	2648	This is to Inform you that Off Record Chats / Downloading Videos / Movies in the Office Premises is Strictly Prohibited, Anybody found Guilty doing that will be Forwarded to Human Resource Department for Further Action. Considering you all a Professional, Look forward for your Support for Taking the Organization to the Brighter Side.\r\n	2014-06-28 10:19:34.061335
147	102081	549	450	2809	dsfsdfsf	2014-07-02 06:50:19.06871
148	102081	550	450	2817	bcvbcvbcvbvcb	2014-07-02 06:52:34.644347
149	102091	549	450	2810	sasas	2014-07-04 13:05:02.90549
150	102097	529	450	2656	eqwewqeq	2014-07-15 07:24:39.525031
151	101844	528	450	2649	Russian bombers have penetrated US airspace 16 times in the last TEN days. At the same time, Russia's Navy says it chased a submarine out of its 'boundary waters' in the Barents Sea, near the home of its powerful Northern Fleet. \r\n	2014-08-12 13:28:11.379094
\.


--
-- Name: saral_internal_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_internal_notes_id_seq', 153, true);


--
-- Data for Name: saral_internalnotes_reply; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_internalnotes_reply (r_id, note_id, created_on, user_id, reply) FROM stdin;
193	142	2014-06-06 19:58:10.360385	450	hello
195	144	2014-06-28 07:25:39.795367	450	business coach, marketing consultant and speaker.
196	144	2014-06-28 07:26:33.116024	450	Kalem Aquil  consultant and speaker.
197	147	2014-07-02 07:06:44.031539	450	gdfgdfg
198	148	2014-07-02 07:06:50.080132	450	hjkjhkljl
199	147	2014-07-02 07:43:48.166493	450	csxcscsc
200	147	2014-07-02 07:44:20.777795	450	khg fuh
201	147	2014-07-02 07:53:38.467996	450	22
202	147	2014-07-02 07:58:45.002661	450	gbfhbgfbf
206	142	2014-08-12 13:20:46.227129	450	A group of major Japanese firms are planning a test flight next year for the nation's first homegrown stealth fighter jet, a report said Tuesday. The consortium -- led by Mitsubishi Heavy Industries -- is developing a jet that has similar technology to US-made F-35 stealth fighters, with a
207	142	2014-08-12 13:23:18.398263	450	Nissan Nismo was a tuning division once content (or required) to restrict itself to just one or two models at a time, but these days Nissan is taking the gloves off and allowing its motorsport department to tune just about everything's it's got. Now in its thirtieth
208	150	2014-08-19 13:33:57.961436	450	gfhgfhfgh
209	150	2014-08-19 13:33:58.688597	450	gfhgfhfgh
\.


--
-- Name: saral_internalnotes_reply_r_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_internalnotes_reply_r_id_seq', 209, true);


--
-- Name: saral_internalnotes_reply_reply_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_internalnotes_reply_reply_seq', 1, false);


--
-- Data for Name: saral_interview; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_interview (interview_id, description, invite_people, location, schedule, duration, openning_id, candidate_id, cmp_id, schedule_time, mail_id, su_id, iorder, title) FROM stdin;
412	SCZXC	\N	bhopal	07/07/2014	34	546	102091	128	18:30	0	2789	177	2
413	SQAS	\N	bhopal	07/10/2014	34	529	102092	128	18:45	0	2657	178	2
414	fsfdsf	\N	fsdf	07/08/2014	34	527	102076	128	15:03	0	2643	179	2
415	fsfsd	\N	dubai	07/09/2014	40	552	102097	128	10:50	0	2834	185	2
395	dsfdsf	\N	hdfh	06/27/2014	56	544	102075	128	13:11	0	2770	160	2
396	ggfg	\N	lucknow	06/27/2014	465	534	102075	128	13:12	0	2698	161	2
416	cczcxz	\N	bhopal	07/09/2014	czsc	552	102097	128	11:25	0	2835	185	4
420	ds	\N	bhopal	07/09/2014	23	552	102097	128	18:56	0	2836	185	4
421	Test	\N	aaaa	07/10/2014	30	553	102098	165	18:09	0	2842	186	2
388	gjhgjgj	\N	bhopal	06/27/2014	40	549	102075	128	11:26	0	2811	163	2
389	jnhvjn	\N	bhopal	06/27/2014	20	549	102075	128	11:27	0	2812	163	2
397	k;lk;	\N	bhopal	06/27/2014	65	549	102075	128	13:38	0	2813	163	2
401	Free fonts have met their match. We know how hard it is to find quality freeware that is licensed for commercial work. We've done the hard work, hand-selecting these typefaces and presenting them in an easy-to-use format. Here are some of our favorites:	\N	lucknow	07/23/2014	30	528	102076	128	18:03	0	2649	166	4
399	kkk	\N	bhopal	07/01/2014	33	550	102076	128	11:52	0	2818	167	2
400	Named �Best Digital Marketing Consultant In Long Beach,� California in April 2013, Kalem Aquil is an author, business coach, marketing consultant and speaker.	\N	delhi	07/16/2014	40	550	102076	128	11:38	0	2819	167	2
402	xvcxv	\N	bhopal	07/03/2014	88	550	102076	128	12:04	0	2820	167	2
407	bbcvbc	\N	bhopal	07/05/2014	40	550	102081	128	13:12	0	2819	172	4
408	khukhk	\N	b	07/05/2014	67	552	102081	128	14:28	0	2834	173	2
426	hgfhfh	\N	bhopal	07/23/2014	40	528	102097	128	11:37	0	2649	191	4
429	xdass	\N	ads	07/29/2014	dfg	549	102096	128	12:06	0	2810	194	2
417	fd	\N	gfdg	07/09/2014	43	530	102097	128	13:02	0	2665	196	2
418	fsrfs	\N	fsdf	07/09/2014	34	530	102097	128	18:37	0	2666	196	4
431	vxvx	\N	vxcvxcv	08/19/2014	45	530	102097	128	12:03	0	2668	196	2
432	kjhkjhk	\N	k;ko;	08/28/2014	67, 899	544	102097	128	12:59	0	2770	197	4
419	sad	\N	das	07/09/2014	23	534	102097	128	18:38	0	2698	198	2
422	dsgv	\N	bhopal	07/11/2014	40	534	102097	128	13:08	0	2699	198	2
433	kjgjh	\N	jhgj	08/28/2014	120	534	102097	128	13:02	0	2700	198	2
423	mjjjhgj	\N	nvbn	07/18/2014	55	549	102097	128	17:52	0	2810	199	2
424	lp	\N	kio	07/18/2014	89	549	102097	128	18:19	0	2811	199	2
425	joo	\N	piop	07/19/2014	56	549	102097	128	13:21	0	2812	199	2
428	tfgh	\N	dubai	07/24/2014	40	549	102097	128	16:58	0	2813	199	2
430	lkj;l	\N	''';';l'	08/12/2014	90	549	102097	128	12:11	0	2810	199	4
434	hgfhfhfh	\N	hfgdgfh	08/28/2014	54	549	102097	128	13:05	0	2811	199	4
\.


--
-- Data for Name: saral_interview_feedback; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_interview_feedback (f_id, interview_id, user_id, feedback, created_on, experience, education, communication_skills, knowledge, presentation, problem_solving_skills, computer_skills, job_stability, candidate_strengths, candidate_weakness, experience_rating, education_rating, communication_skills_rating, knowledge_rating, presentation_rating, problem_solving_skills_rating, computer_skills_rating, job_stability_rating, job_related_criteria, additional_comments, status) FROM stdin;
233	431	450	\N	2014-08-19 13:05:26.143313											\N	\N	\N	\N	\N	\N	\N	\N			On Hold
\.


--
-- Name: saral_interview_feedback_candidate_strengths_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_interview_feedback_candidate_strengths_seq', 66, true);


--
-- Name: saral_interview_feedback_communication_skills_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_interview_feedback_communication_skills_seq', 66, true);


--
-- Name: saral_interview_feedback_f_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_interview_feedback_f_id_seq', 233, true);


--
-- Name: saral_interview_order_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_interview_order_seq', 202, true);


--
-- Data for Name: saral_interview_type; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_interview_type (id, cmp_id, interview_name, status) FROM stdin;
2	\N	default	1
4	128	test interview	0
8	128	8888888	0
9	128	88888888888888888888	0
10	128	666666	0
11	128	888	0
12	128	kkkkkkkk	0
13	128	hhhhh77	0
14	128	hh hhh	0
\.


--
-- Name: saral_interview_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_interview_type_id_seq', 14, true);


--
-- Data for Name: saral_launch; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_launch (cmp_id, grade, requirement_no, month_sallary, reporting_staff_no, gender, incumbent_member, work_shifts, experience, age_group, requirement_type, educational_detail, department, designation, purpose, functions, results, behaviors, id, status, created_by, comments, date, name) FROM stdin;
161	1	5	50000	1	male		morning	1-3	20-30	Fresh requirement	Graduate	64	101	Test	test	Test	Test	141	2	junetest	Ok	2014-06-24 12:22:25.537+05:30	\N
128	5	4	6	7	female		morning	1-3	30-40	Fresh requirement	Graduate	36	2					138	2	anshika1028	m,b,mn	2014-06-23 15:54:35.273+05:30	\N
165	1	2	12000	1	male		morning	1-3	20-30	Fresh requirement	Graduate	64	101	ddsdsds	sddssd	dsdsds	sdsddsdsds	144	2	julytest	Approved	2014-07-10 17:51:25.337+05:30	\N
167	1	9	12000	0	male		evening	1-3	20-30	Fresh requirement	Graduate	64	101	wqde2d	java	java	english	145	0	che	\N	2014-08-04 20:20:20.281+05:30	\N
128	B	2	36985	1	female		evening	7-10	30-40	Fresh requirement	Master	37	1	leading development team	programing	c# .Net	lead	130	2	anshika1028	approved	2014-05-30 18:38:12.386+05:30	\N
128	A+	4	6	7	male		morning	1-3	20-30	Fresh requirement	Graduate	64	2	jhkhk	hgfh	hgfh	hgfh	142	2	anshika1028	.,.	2014-07-07 11:12:22.427+05:30	\N
128	5	6	6	5	female	jhgghghggfdgdg	morning	1-3	30-40	Replacement	Master	64	3	fghhgjghjghghfh	hgfh	hgfh	hgfh	93	2	anshika1028	ljj	2014-05-15 18:55:57.851+05:30	\N
128	tfyhdfh	5	567	6	female	hth	evening	7-10	30-40	Fresh requirement	Graduate	64	3	gdh	gdfh	hgh	hgfh	89	2	anshika1028	fdxcfd	2014-04-15 17:50:05+05:30	\N
154	1	2	1	1	male		morning	1-3	20-30	Fresh requirement	Graduate	92	147	Test, test	Test, test	Test, test	Test, test	136	2	yasser	test	2014-06-13 15:12:36.343+05:30	\N
128	bfb	6	77	7	female		evening	7-10	30-40	Fresh requirement	Graduate	37	5					126	2	anshika1028	jhjj	2014-06-20 15:48:25.41+05:30	\N
128	a+	4	6	5	female	jhgghghggfdgdg	morning	1-3	30-40	Replacement	Master	64	3	fghhgjghjghghfh	hgfh	hgfh	hgfh	129	2	anshika1028	jkljhl	2014-05-30 12:12:52.381+05:30	\N
128	gfdg	4	44	7	female		morning	1-3	20-30	Fresh requirement	Graduate	64	1	fgg		hgfh		137	2	anshika1028	bbvc	2014-06-20 17:05:57.927+05:30	\N
128	A+	8	77	7	female		evening	3-5	30-40	Fresh requirement	Master	64	1	gfhdfh	hgfh	hgfh	hgfhf	131	2	anshika1028	ther	2014-05-31 17:44:46.454+05:30	\N
175	gfdg	4	6	7	female		morning	3-5	20-30	Fresh requirement	Graduate	64	101					149	2	keerti1234	uihyiyi	2014-09-05 15:55:41.896+05:30	dfrgttttttt
128	4	45	24	23	female	kljlk jlijl	evening	7-10	40-50	Replacement	Graduate	116	3					150	2	anshika1028	/.l.l	2014-09-18 12:35:56.604+05:30	kpkok;p
128	45	7	24	45	female		morning	3-5	20-30	Fresh requirement	Graduate	101	4					152	2	anshika1028	hgfhf	2014-09-22 10:46:44.062+05:30	dfrgttttttt
\.


--
-- Name: saral_launch_designation_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_launch_designation_seq', 1, false);


--
-- Name: saral_launch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_launch_id_seq', 152, true);


--
-- Data for Name: saral_mail_notification; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_mail_notification (id, mail_notification, cmp_id, activation_id, user_id, candidate_id, action, permission_id) FROM stdin;
2	** Notify me when a new user is added to Saral Hiring	95	\N	\N	\N	newuser	\N
6	** Notify me when any opening in my account is deleted	95	\N	\N	\N	openingdel	\N
5	** Notify me when a new candidate is added to Saral Hiring	95	\N	\N	\N	candidateadd	\N
3	** Notify me when a user is deleted from Saral Hiring	95	\N	\N	\N	userdeleted	\N
4	** Notify me when an new opening is created	95	\N	\N	\N	newopening	\N
2	** Notify me when a new user is added to Saral Hiring	96	\N	\N	\N	newuser	\N
6	** Notify me when any opening in my account is deleted	96	\N	\N	\N	openingdel	\N
5	** Notify me when a new candidate is added to Saral Hiring	96	\N	\N	\N	candidateadd	\N
3	** Notify me when a user is deleted from Saral Hiring	96	\N	\N	\N	userdeleted	\N
4	** Notify me when an new opening is created	96	\N	\N	\N	newopening	\N
2	** Notify me when a new user is added to Saral Hiring	97	\N	\N	\N	newuser	\N
6	** Notify me when any opening in my account is deleted	97	\N	\N	\N	openingdel	\N
5	** Notify me when a new candidate is added to Saral Hiring	97	\N	\N	\N	candidateadd	\N
3	** Notify me when a user is deleted from Saral Hiring	97	\N	\N	\N	userdeleted	\N
4	** Notify me when an new opening is created	97	\N	\N	\N	newopening	\N
4	** Notify me when an new opening is created	98	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	98	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	98	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	98	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	98	\N	\N	\N	newuser	1
11	Notify me when an opening that I am assigned to is deleted	95	\N	\N	\N	openingassigned	2
10	Notify me once a day about new candidates, events and pending tasks	95	\N	\N	\N	candidatestask	2
9	Notify me when a candidate is moved to a stage that I am assigned to	95	\N	\N	\N	changestage	2
8	Notify me when I am unassigned from an opening	95	\N	\N	\N	unassiginopening	2
7	Notify me when an opening is assigned to me	95	\N	\N	\N	openingme	2
11	Notify me when an opening that I am assigned to is deleted	96	\N	\N	\N	openingassigned	2
10	Notify me once a day about new candidates, events and pending tasks	96	\N	\N	\N	candidatestask	2
9	Notify me when a candidate is moved to a stage that I am assigned to	96	\N	\N	\N	changestage	2
8	Notify me when I am unassigned from an opening	96	\N	\N	\N	unassiginopening	2
7	Notify me when an opening is assigned to me	96	\N	\N	\N	openingme	2
11	Notify me when an opening that I am assigned to is deleted	97	\N	\N	\N	openingassigned	2
10	Notify me once a day about new candidates, events and pending tasks	97	\N	\N	\N	candidatestask	2
9	Notify me when a candidate is moved to a stage that I am assigned to	97	\N	\N	\N	changestage	2
8	Notify me when I am unassigned from an opening	97	\N	\N	\N	unassiginopening	2
7	Notify me when an opening is assigned to me	97	\N	\N	\N	openingme	2
7	Notify me when an opening is assigned to me	98	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	98	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	98	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	98	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	98	\N	\N	\N	openingassigned	2
\N	** Notify me when an new opening is created	99	\N	\N	\N	newopening	\N
\N	** Notify me when a user is deleted from Saral Hiring	99	\N	\N	\N	userdeleted	\N
\N	** Notify me when a new candidate is added to Saral Hiring	99	\N	\N	\N	candidateadd	\N
\N	** Notify me when any opening in my account is deleted	99	\N	\N	\N	openingdel	\N
\N	** Notify me when a new user is added to Saral Hiring	99	\N	\N	\N	newuser	\N
\N	Notify me when an opening is assigned to me	99	\N	\N	\N	openingme	\N
\N	Notify me when I am unassigned from an opening	99	\N	\N	\N	unassiginopening	\N
\N	Notify me when a candidate is moved to a stage that I am assigned to	99	\N	\N	\N	changestage	\N
\N	Notify me once a day about new candidates, events and pending tasks	99	\N	\N	\N	candidatestask	\N
\N	Notify me when an opening that I am assigned to is deleted	99	\N	\N	\N	openingassigned	\N
4	** Notify me when an new opening is created	100	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	100	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	100	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	100	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	100	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	100	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	100	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	100	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	100	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	100	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	101	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	101	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	101	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	101	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	101	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	101	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	101	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	101	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	101	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	101	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	102	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	102	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	102	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	102	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	102	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	102	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	102	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	102	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	102	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	102	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	103	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	103	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	103	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	103	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	103	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	103	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	103	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	103	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	103	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	103	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	104	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	104	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	104	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	104	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	104	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	104	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	104	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	104	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	104	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	104	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	105	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	105	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	105	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	105	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	105	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	105	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	105	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	105	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	105	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	105	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	106	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	106	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	106	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	106	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	106	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	106	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	106	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	106	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	106	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	106	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	107	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	107	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	107	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	107	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	107	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	107	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	107	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	107	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	107	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	107	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	108	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	108	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	108	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	108	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	108	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	108	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	108	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	108	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	108	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	108	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	0	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	0	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	0	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	0	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	0	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	0	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	0	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	0	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	0	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	0	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	110	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	110	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	110	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	110	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	110	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	110	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	110	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	110	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	110	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	110	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	111	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	111	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	111	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	111	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	111	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	111	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	111	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	111	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	111	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	111	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	112	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	112	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	112	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	112	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	112	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	112	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	112	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	112	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	112	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	112	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	115	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	115	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	115	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	115	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	115	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	115	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	115	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	115	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	115	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	115	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	116	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	116	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	116	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	116	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	116	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	116	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	116	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	116	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	116	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	116	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	117	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	117	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	117	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	117	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	117	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	117	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	117	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	117	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	117	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	117	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	118	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	118	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	118	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	118	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	118	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	118	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	118	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	118	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	118	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	118	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	119	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	119	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	119	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	119	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	119	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	119	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	119	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	119	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	119	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	119	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	120	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	120	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	120	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	120	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	120	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	120	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	120	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	120	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	120	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	120	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	121	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	121	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	121	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	121	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	121	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	121	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	121	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	121	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	121	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	121	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	122	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	122	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	122	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	122	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	122	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	122	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	122	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	122	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	122	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	122	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	123	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	123	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	123	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	123	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	123	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	123	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	123	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	123	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	123	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	123	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	0	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	0	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	0	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	0	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	0	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	0	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	0	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	0	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	0	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	0	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	0	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	0	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	0	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	0	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	0	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	0	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	0	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	0	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	0	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	0	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	126	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	126	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	126	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	126	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	126	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	126	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	126	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	126	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	126	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	126	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	127	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	127	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	127	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	127	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	127	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	127	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	127	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	127	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	127	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	127	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	128	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	128	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	128	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	128	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	128	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	128	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	128	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	128	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	128	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	128	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	129	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	129	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	129	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	129	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	129	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	129	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	129	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	129	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	129	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	129	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	130	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	130	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	130	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	130	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	130	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	130	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	130	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	130	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	130	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	130	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	131	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	131	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	131	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	131	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	131	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	131	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	131	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	131	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	131	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	131	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	132	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	132	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	132	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	132	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	132	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	132	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	132	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	132	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	132	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	132	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	134	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	134	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	134	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	134	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	134	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	134	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	134	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	134	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	134	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	134	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	135	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	135	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	135	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	135	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	135	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	135	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	135	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	135	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	135	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	135	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	136	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	136	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	136	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	136	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	136	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	136	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	136	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	136	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	136	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	136	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	151	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	151	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	151	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	151	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	151	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	151	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	151	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	151	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	151	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	151	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	152	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	152	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	152	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	152	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	152	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	152	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	152	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	152	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	152	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	152	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	153	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	153	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	153	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	153	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	153	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	153	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	153	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	153	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	153	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	153	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	154	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	154	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	154	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	154	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	154	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	154	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	154	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	154	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	154	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	154	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	155	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	155	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	155	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	155	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	155	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	155	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	155	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	155	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	155	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	155	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	156	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	156	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	156	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	156	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	156	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	156	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	156	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	156	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	156	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	156	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	157	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	157	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	157	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	157	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	157	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	157	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	157	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	157	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	157	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	157	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	158	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	158	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	158	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	158	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	158	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	158	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	158	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	158	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	158	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	158	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	159	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	159	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	159	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	159	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	159	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	159	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	159	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	159	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	159	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	159	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	160	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	160	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	160	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	160	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	160	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	160	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	160	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	160	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	160	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	160	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	161	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	161	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	161	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	161	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	161	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	161	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	161	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	161	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	161	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	161	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	165	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	165	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	165	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	165	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	165	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	165	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	165	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	165	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	165	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	165	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	166	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	166	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	166	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	166	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	166	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	166	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	166	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	166	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	166	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	166	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	167	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	167	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	167	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	167	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	167	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	167	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	167	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	167	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	167	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	167	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	168	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	168	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	168	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	168	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	168	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	168	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	168	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	168	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	168	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	168	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	169	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	169	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	169	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	169	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	169	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	169	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	169	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	169	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	169	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	169	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	170	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	170	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	170	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	170	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	170	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	170	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	170	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	170	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	170	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	170	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	171	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	171	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	171	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	171	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	171	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	171	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	171	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	171	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	171	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	171	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	172	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	172	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	172	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	172	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	172	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	172	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	172	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	172	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	172	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	172	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	173	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	173	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	173	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	173	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	173	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	173	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	173	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	173	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	173	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	173	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	175	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	175	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	175	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	175	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	175	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	175	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	175	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	175	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	175	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	175	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	176	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	176	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	176	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	176	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	176	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	176	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	176	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	176	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	176	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	176	\N	\N	\N	openingassigned	2
4	** Notify me when an new opening is created	178	\N	\N	\N	newopening	1
3	** Notify me when a user is deleted from Saral Hiring	178	\N	\N	\N	userdeleted	1
5	** Notify me when a new candidate is added to Saral Hiring	178	\N	\N	\N	candidateadd	1
6	** Notify me when any opening in my account is deleted	178	\N	\N	\N	openingdel	1
2	** Notify me when a new user is added to Saral Hiring	178	\N	\N	\N	newuser	1
7	Notify me when an opening is assigned to me	178	\N	\N	\N	openingme	2
8	Notify me when I am unassigned from an opening	178	\N	\N	\N	unassiginopening	2
9	Notify me when a candidate is moved to a stage that I am assigned to	178	\N	\N	\N	changestage	2
10	Notify me once a day about new candidates, events and pending tasks	178	\N	\N	\N	candidatestask	2
11	Notify me when an opening that I am assigned to is deleted	178	\N	\N	\N	openingassigned	2
\.


--
-- Name: saral_mail_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_mail_notification_id_seq', 61, true);


--
-- Data for Name: saral_new_update_stage; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_new_update_stage (s_name, sorder, opening_id, su_id, created_by, created_on) FROM stdin;
Unscreened	2626	525	2624	\N	\N
screening	2627	525	2625	\N	\N
Telephonic Interview	2628	525	2626	\N	\N
Face to Face	2629	525	2627	\N	\N
Reject/Not a Fit	2633	525	2631	\N	\N
Unscreened	2658	529	2656	\N	\N
Offered and Accepted	2630	525	2628	\N	\N
On Hold	2632	525	2630	\N	\N
screening	2659	529	2657	\N	\N
Offered and Rejected	2631	525	2629	\N	\N
Unscreened	2634	526	2632	\N	\N
screening	2635	526	2633	\N	\N
Face to Face	2637	526	2635	\N	\N
Offered and Accepted	2638	526	2636	\N	\N
Offered and Rejected	2639	526	2637	\N	\N
On Hold	2640	526	2638	\N	\N
Reject/Not a Fit	2641	526	2639	\N	\N
Telephonic Interview	2636	526	2634	\N	\N
Unscreened	2642	527	2640	\N	\N
screening	2643	527	2641	\N	\N
Telephonic Interview	2644	527	2642	\N	\N
Face to Face	2645	527	2643	\N	\N
Offered and Accepted	2646	527	2644	\N	\N
Offered and Rejected	2647	527	2645	\N	\N
On Hold	2648	527	2646	\N	\N
Reject/Not a Fit	2649	527	2647	\N	\N
Telephonic Interview	2660	529	2658	\N	\N
Face to Face	2661	529	2659	\N	\N
Offered and Accepted	2662	529	2660	\N	\N
Offered and Rejected	2663	529	2661	\N	\N
On Hold	2664	529	2662	\N	\N
Reject/Not a Fit	2665	529	2663	\N	\N
Unscreened	2666	530	2664	\N	\N
Reject/Not a Fit	2657	528	2655	\N	\N
screening	2667	530	2665	\N	\N
Telephonic Interview	2668	530	2666	\N	\N
Face to Face	2669	530	2667	\N	\N
Offered and Accepted	2670	530	2668	\N	\N
Offered and Rejected	2671	530	2669	\N	\N
On Hold	2672	530	2670	\N	\N
Reject/Not a Fit	2673	530	2671	\N	\N
Unscreened	2674	531	2672	\N	\N
screening	2675	531	2673	\N	\N
Telephonic Interview	2676	531	2674	\N	\N
Face to Face	2677	531	2675	\N	\N
Offered and Accepted	2678	531	2676	\N	\N
Offered and Rejected	2679	531	2677	\N	\N
On Hold	2680	531	2678	\N	\N
Reject/Not a Fit	2681	531	2679	\N	\N
Unscreened	2682	532	2680	\N	\N
screening	2683	532	2681	\N	\N
Telephonic Interview	2684	532	2682	\N	\N
Face to Face	2685	532	2683	\N	\N
Offered and Accepted	2686	532	2684	\N	\N
Offered and Rejected	2687	532	2685	\N	\N
On Hold	2688	532	2686	\N	\N
Reject/Not a Fit	2689	532	2687	\N	\N
Fired	2690	531	2688	450	2014/05/17 11:25:47
Unscreened	2691	533	2689	\N	\N
Telephonic Interview	2652	528	2650	\N	\N
screening	2692	533	2690	\N	\N
Unscreened	2650	528	2648	\N	\N
screening	2651	528	2649	\N	\N
Telephonic Interview	2693	533	2691	\N	\N
Face to Face	2694	533	2692	\N	\N
Offered and Accepted	2695	533	2693	\N	\N
Offered and Rejected	2696	533	2694	\N	\N
On Hold	2697	533	2695	\N	\N
Reject/Not a Fit	2698	533	2696	\N	\N
Unscreened	2699	534	2697	\N	\N
screening	2700	534	2698	\N	\N
Telephonic Interview	2701	534	2699	\N	\N
Face to Face	2702	534	2700	\N	\N
Offered and Accepted	2703	534	2701	\N	\N
Offered and Rejected	2704	534	2702	\N	\N
On Hold	2705	534	2703	\N	\N
Reject/Not a Fit	2706	534	2704	\N	\N
Unscreened	2707	535	2705	\N	\N
screening	2708	535	2706	\N	\N
Telephonic Interview	2709	535	2707	\N	\N
Face to Face	2710	535	2708	\N	\N
Offered and Accepted	2711	535	2709	\N	\N
Offered and Rejected	2712	535	2710	\N	\N
On Hold	2713	535	2711	\N	\N
Reject/Not a Fit	2714	535	2712	\N	\N
Face to Face	2653	528	2651	\N	\N
Offered and Accepted	2654	528	2652	\N	\N
Offered and Rejected	2655	528	2653	\N	\N
On Hold	2656	528	2654	\N	\N
Unscreened	2739	540	2737	\N	\N
screening	2740	540	2738	\N	\N
Telephonic Interview	2741	540	2739	\N	\N
Face to Face	2742	540	2740	\N	\N
Offered and Accepted	2743	540	2741	\N	\N
Offered and Rejected	2744	540	2742	\N	\N
On Hold	2745	540	2743	\N	\N
Reject/Not a Fit	2746	540	2744	\N	\N
Unscreened	2771	544	2769	\N	\N
screening	2772	544	2770	\N	\N
Telephonic Interview	2773	544	2771	\N	\N
Face to Face	2774	544	2772	\N	\N
Reject/Not a Fit	2778	544	2776	\N	\N
Offered and Rejected	2775	544	2774	\N	\N
On Hold	2776	544	2775	\N	\N
Offered and Accepted	2777	544	2773	\N	\N
Unscreened	2779	545	2777	\N	\N
screening	2780	545	2778	\N	\N
Telephonic Interview	2781	545	2779	\N	\N
Face to Face	2782	545	2780	\N	\N
Offered and Accepted	2783	545	2781	\N	\N
Offered and Rejected	2784	545	2782	\N	\N
On Hold	2785	545	2783	\N	\N
Reject/Not a Fit	2786	545	2784	\N	\N
Unscreened	2787	546	2785	\N	\N
screening	2788	546	2786	\N	\N
Telephonic Interview	2789	546	2787	\N	\N
Face to Face	2790	546	2788	\N	\N
Offered and Accepted	2791	546	2789	\N	\N
Offered and Rejected	2792	546	2790	\N	\N
On Hold	2793	546	2791	\N	\N
Reject/Not a Fit	2794	546	2792	\N	\N
Unscreened	2795	547	2793	\N	\N
screening	2796	547	2794	\N	\N
Telephonic Interview	2797	547	2795	\N	\N
Face to Face	2798	547	2796	\N	\N
Offered and Accepted	2799	547	2797	\N	\N
Offered and Rejected	2800	547	2798	\N	\N
On Hold	2801	547	2799	\N	\N
Reject/Not a Fit	2802	547	2800	\N	\N
Unscreened	2803	548	2801	\N	\N
screening	2804	548	2802	\N	\N
Telephonic Interview	2805	548	2803	\N	\N
Face to Face	2806	548	2804	\N	\N
Offered and Accepted	2807	548	2805	\N	\N
Offered and Rejected	2808	548	2806	\N	\N
On Hold	2809	548	2807	\N	\N
Reject/Not a Fit	2810	548	2808	\N	\N
Unscreened	2811	549	2809	\N	\N
screening	2812	549	2810	\N	\N
Telephonic Interview	2813	549	2811	\N	\N
Face to Face	2814	549	2812	\N	\N
Offered and Accepted	2815	549	2813	\N	\N
Offered and Rejected	2816	549	2814	\N	\N
On Hold	2817	549	2815	\N	\N
Reject/Not a Fit	2818	549	2816	\N	\N
Unscreened	2835	552	2833	\N	\N
Face to Face	2822	550	2820	\N	\N
Offered and Accepted	2823	550	2821	\N	\N
Offered and Rejected	2824	550	2822	\N	\N
On Hold	2825	550	2823	\N	\N
Reject/Not a Fit	2826	550	2824	\N	\N
Unscreened	2827	551	2825	\N	\N
screening	2828	551	2826	\N	\N
Telephonic Interview	2829	551	2827	\N	\N
Face to Face	2830	551	2828	\N	\N
Offered and Accepted	2831	551	2829	\N	\N
Offered and Rejected	2832	551	2830	\N	\N
On Hold	2833	551	2831	\N	\N
Reject/Not a Fit	2834	551	2832	\N	\N
On Hold	2841	552	2839	\N	\N
Face to Face	2838	552	2836	\N	\N
Unscreened	2843	553	2841	\N	\N
screening	2844	553	2842	\N	\N
Telephonic Interview	2845	553	2843	\N	\N
Face to Face	2846	553	2844	\N	\N
Offered and Accepted	2847	553	2845	\N	\N
Offered and Rejected	2848	553	2846	\N	\N
On Hold	2849	553	2847	\N	\N
Reject/Not a Fit	2850	553	2848	\N	\N
Offered and Accepted	2840	552	2837	\N	\N
Offered and Rejected	2839	552	2838	\N	\N
Reject/Not a Fit	2842	552	2840	\N	\N
screening	2836	552	2834	\N	\N
Telephonic Interview	2837	552	2835	\N	\N
Unscreened	2859	555	2857	\N	\N
Telephonic Interview	2861	555	2859	\N	\N
Face to Face	2862	555	2860	\N	\N
Offered and Accepted	2863	555	2861	\N	\N
Reject/Not a Fit	2866	555	2864	\N	\N
On Hold	2864	555	2863	\N	\N
Offered and Rejected	2865	555	2862	\N	\N
employed	2868	555	2866	450	2014/08/28 12:19:40
screening	2874	555	2872	450	2014/09/03 10:44:18
Unscreened	2875	556	2873	\N	\N
Screening	2876	556	2874	\N	\N
Telephonic Interview	2877	556	2875	\N	\N
Face to Face	2878	556	2876	\N	\N
Offered and Accepted	2879	556	2877	\N	\N
Offered and Rejected	2880	556	2878	\N	\N
On Hold	2881	556	2879	\N	\N
Reject/Not a Fit	2882	556	2880	\N	\N
Unscreened	2819	550	2817	\N	\N
Screening	2860	555	2858	\N	\N
screening	2820	550	2818	\N	\N
Telephonic Interview	2821	550	2819	\N	\N
Unscreened	2883	557	2881	\N	\N
Screening	2884	557	2882	\N	\N
Telephonic Interview	2885	557	2883	\N	\N
Face to Face	2886	557	2884	\N	\N
Offered and Accepted	2887	557	2885	\N	\N
Offered and Rejected	2888	557	2886	\N	\N
On Hold	2889	557	2887	\N	\N
Reject/Not a Fit	2890	557	2888	\N	\N
Unscreened	2891	558	2889	\N	\N
Screening	2892	558	2890	\N	\N
Telephonic Interview	2893	558	2891	\N	\N
Face to Face	2894	558	2892	\N	\N
Offered and Accepted	2895	558	2893	\N	\N
Offered and Rejected	2896	558	2894	\N	\N
On Hold	2897	558	2895	\N	\N
Reject/Not a Fit	2898	558	2896	\N	\N
\.


--
-- Name: saral_new_update_stage_opening_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_new_update_stage_opening_id_seq', 1, false);


--
-- Name: saral_new_update_stage_order_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_new_update_stage_order_seq', 2898, true);


--
-- Name: saral_new_update_stage_su_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_new_update_stage_su_id_seq', 2896, true);


--
-- Data for Name: saral_opening; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_opening (opening_id, "position", city, state, country, job_discription, created_on, stage_id, created_by, dept_id, assign_to, cmp_id, status, req_id, enddate) FROM stdin;
525	opening1	kanpur	uttar pradesh	India	dsgfjhsg	2014/01/08 17:13:03	1	\N	64	448	127	Active	\N	\N
526	edrwe	dsfsd	sdfs	sdf	dsf	2014/01/09 16:14:41	1	\N	64	448	127	Active	\N	\N
550	ruby1	bhopal	mp	india	dfggdfgdfg	2014/06/20 18:07:56	1	\N	64	450	128	archive	131	08/31/2014
549	ruby2	bhopal	mp	india	kjhg jgfh hftgh	2014/06/20 17:43:52	1	\N	64	450	128	Active	137	07/31/2014
548	ruby4	test	mp	india	fsdfsf vdf	2014/06/20 17:37:18	1	\N	64	450	128	Active	137	10/24/2014
551	Test	Test	tetst	Test	ddddddddd	2014/06/24 12:38:12	1	\N	64	507	161	Active	141	06/25/2014
534	testAnshika	lucknow	uttar pradesh	india	kjkkjhk	2014/05/19 17:40:18	1	\N	64	450	128	Active	93	\N
530	node	asdasd	fdsfs	fsdfs	gfgdfgf	2014/05/16 16:52:43	1	\N	64	450	128	Inactive	\N	2014/05/16 16:52:43
529	dotNet	lucknow	uttar pradesh	india	bvnvn	2014/05/16 14:58:09	1	\N	64	450	128	Closed	\N	\N
531	vcv	vcv	vcv	vcv	vcv	2014/05/16 18:55:20	1	\N	64	450	128	Inactive	\N	\N
553	Quality Assurance	Test	Test	Test	<strong>Account Development Manager Job Duties:</strong>\r\n<ul>\r\n<li>Identifies development potential in accounts by studying current business; interviewing key customer personnel and company personnel who have worked with customer; identifying and evaluating additional needs; analyzing opportunities.</li>\r\n<li>Initiates sales process by building relationships; qualifying potential; scheduling appointments.</li>\r\n<li>Develops sales by making initial presentation; explaining product and service enhancements and additions; introducing new products and services.</li>\r\n<li>Develops new applications by preparing specifications; conferring with product engineering.</li>\r\n<li>Closes sales by overcoming objections; preparing contracts.</li>\r\n<li>Contributes information to sales strategies by evaluating current product results; identifying needs to be filled; monitoring competitive products; analyzing and relaying customer reactions.</li>\r\n<li>Updates job knowledge by participating in educational opportunities; reading professional publications; maintaining personal networks; participating in professional organizations.</li>\r\n<li>Enhances department and organization reputation by accepting ownership for accomplishing new and different requests; exploring opportunities to add value to job accomplishments.</li>\r\n</ul>	2014/07/10 17:58:21	1	\N	64	514	165	Active	144	07/11/2014
552	graphic designer	bhopal	mp	india	dtgdegd hghfgh	2014/07/01 15:01:42	1	\N	64	450	128	archive	138	07/23/2014
532	dasda	asdsa	dasda	sdasd	asdsad	2014/05/16 19:19:52	1	\N	64	450	128	Closed	\N	\N
533	fgg	gfg	gfdg	gfdg	gfdg	2014/05/19 16:14:26	1	\N	64	450	128	Inactive	\N	\N
555	test2_Ugust	xyz	Antrim	Ireland	gdfg&nbsp;	2014/08/19 15:13:04	1	\N	64	450	128	Active	142	08/28/2014
528	php	lucknow	uttar pradesh	india	test jd	2014/04/24 11:20:34	1	\N	64	450	128	Active	\N	
540	jython	bhopal	mp	india	gdfggfdg gfdgdgfdgdgzgdgzg	2014/05/30 12:13:33	1	\N	64	450	128	Active	129	\N
544	rfesf	hdfh	hfdh	hdfh	hgdfhdhdfhdh	2014/05/31 10:59:28	1	\N	64	450	128	Active	130	\N
545	Test	Lucknow	UP	India	<ul style="margin: 0px; padding: 0px; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif; color: #000000; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff;">\r\n<li style="margin: 0px 0px 10px 20px; padding: 0px; list-style: disc; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif;">Accomplishes human resource objectives by recruiting, selecting, orienting, training, assigning, scheduling, coaching, counseling, and disciplining employees; communicating job expectations; planning, monitoring, appraising, and reviewing job contributions; planning and reviewing compensation actions; enforcing policies and procedures.</li>\r\n<li style="margin: 0px 0px 10px 20px; padding: 0px; list-style: disc; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif;">Achieves operational objectives by contributing information and recommendations to strategic plans and reviews; preparing and completing action plans; implementing production, productivity, quality, and customer-service standards; resolving problems; completing audits; identifying trends; determining system improvements; implementing change.</li>\r\n<li style="margin: 0px 0px 10px 20px; padding: 0px; list-style: disc; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif;">Meets financial objectives by forecasting requirements; preparing an annual budget; scheduling expenditures; analyzing variances; initiating corrective actions.</li>\r\n<li style="margin: 0px 0px 10px 20px; padding: 0px; list-style: disc; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif;">Updates job knowledge by participating in educational opportunities; reading professional publications; maintaining personal networks; participating in professional organizations.</li>\r\n<li style="margin: 0px 0px 10px 20px; padding: 0px; list-style: disc; letter-spacing: normal; font-family: Arial, Helvetica, sans-serif;">Enhances department and organization reputation by accepting ownership for accomplishing new and different requests; exploring opportunities to add value to job accomplishments.</li>\r\n</ul>	2014/06/13 15:14:08	1	\N	64	483	154	Active	136	\N
546	ruby3	bhopal	mp	india	rgfeggda	2014/06/20 15:46:25	1	\N	64	450	128	Active	131	\N
547	ruby6	bhopal	mp	india	ghfghfgjh	2014/06/20 15:49:06	1	\N	64	450	128	Active	126	07/31/2014
527	java	lucknow	uttar pradesh	indi	test jd	2014/07/29 11:20:11	1	\N	64	450	128	Active	\N	\N
535	testAnshi	test	test	test	test hghfhfh	2014/05/19 17:44:26	1	\N	64	450	128	0	89	\N
556	ruby	bhopal	Antrim	Ireland	kjlokjln bjhgjhgjkjhk	2014/09/05 15:56:13	1	\N	64	531	175	Active	149	Tuesday, 24 June 2014
557	fgdfg	gfdg                     	vfgfg	fgdfg	&nbsp;nbvnbvn	2014/09/18 13:12:28	1	\N	64	450	128	archive	150	
558	fgdfg	lucknow	UP	india	gffgdfgdgdfg fdsfdsf fdsfdsf	2014/09/22 10:47:12	1	\N	64	450	128	Active	152	12/31/2014
\.


--
-- Data for Name: saral_opening_assign; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_opening_assign (id, opening_id, candidate_id, assign_date) FROM stdin;
601	525	101841	2014-01-07
602	528	101842	2014-04-21
603	527	101842	2014-04-21
604	527	101843	2014-04-21
605	527	101844	2014-04-25
606	528	101844	2014-04-26
609	532	101843	2014-05-19
610	529	101843	2014-05-19
611	529	101846	2014-05-21
612	528	101846	2014-05-21
613	527	101846	2014-05-21
615	530	101844	2014-05-26
616	529	101844	2014-05-26
617	533	101870	2014-05-27
626	544	101868	2014-06-07
627	530	101875	2014-06-07
628	529	101875	2014-06-07
629	544	101878	2014-06-07
630	540	101878	2014-06-07
631	534	101881	2014-06-07
632	530	101881	2014-06-07
633	544	101884	2014-06-07
634	540	101884	2014-06-07
635	544	101896	2014-06-07
636	540	101896	2014-06-07
637	534	101896	2014-06-07
638	544	101896	2014-06-07
639	540	101896	2014-06-07
640	534	101896	2014-06-07
641	530	101896	2014-06-07
642	544	101889	2014-06-07
643	540	101889	2014-06-07
644	534	101889	2014-06-07
645	529	101869	2014-06-07
646	528	101869	2014-06-07
647	527	101869	2014-06-07
648	544	101905	2014-06-08
649	534	101907	2014-06-08
652	544	101910	2014-06-08
653	544	101911	2014-06-09
654	544	101912	2014-06-09
655	528	101912	2014-06-13
656	540	101973	2014-06-15
657	529	101973	2014-06-18
659	550	102075	2014-06-22
660	549	102075	2014-06-22
661	544	102075	2014-06-22
662	540	102075	2014-06-22
663	534	102075	2014-06-22
664	529	102075	2014-06-27
665	550	102076	2014-06-28
666	528	102076	2014-06-28
667	527	102076	2014-06-28
668	552	102081	2014-07-02
669	550	102081	2014-07-02
670	549	102081	2014-07-02
671	552	102078	2014-07-04
672	550	102078	2014-07-04
673	549	102078	2014-07-04
674	548	102078	2014-07-04
675	552	102091	2014-07-04
676	550	102091	2014-07-04
677	549	102091	2014-07-04
678	548	102091	2014-07-04
679	547	102091	2014-07-04
680	546	102091	2014-07-04
681	552	102092	2014-07-04
682	550	102092	2014-07-04
683	540	102092	2014-07-04
684	530	102092	2014-07-04
685	529	102092	2014-07-04
686	528	102092	2014-07-04
687	527	102092	2014-07-04
688	552	102097	2014-07-06
689	530	102097	2014-07-06
690	534	102097	2014-07-06
691	553	102098	2014-07-07
692	550	102097	2014-07-08
693	548	102097	2014-07-08
694	549	102097	2014-07-08
695	547	102097	2014-07-08
696	528	102097	2014-07-08
697	529	102097	2014-07-08
698	540	102097	2014-07-08
699	527	102097	2014-07-19
700	549	102096	2014-07-26
701	528	102096	2014-07-26
702	544	102097	2014-08-08
703	546	102097	2014-08-12
704	548	102096	2014-08-13
705	527	102096	2014-08-13
706	529	102096	2014-08-13
707	549	102095	2014-08-13
708	548	102095	2014-08-13
709	547	102095	2014-08-13
710	534	102096	2014-08-13
711	549	102094	2014-08-13
712	547	102096	2014-08-14
713	546	102096	2014-08-14
714	549	102093	2014-08-14
715	548	102093	2014-08-14
716	549	102111	2014-08-18
717	549	102112	2014-08-18
718	549	102113	2014-08-18
719	549	102114	2014-08-18
720	549	102115	2014-08-18
721	549	102116	2014-08-18
722	549	102117	2014-08-18
723	549	102118	2014-08-18
724	548	102119	2014-08-18
725	548	102120	2014-08-18
726	548	102121	2014-08-18
727	548	102122	2014-08-18
728	548	102123	2014-08-18
729	548	102124	2014-08-18
730	548	102125	2014-08-18
731	548	102126	2014-08-18
732	548	102127	2014-08-18
733	548	102128	2014-08-18
734	548	102129	2014-08-18
735	548	102130	2014-08-18
736	548	102131	2014-08-18
737	548	102132	2014-08-18
738	548	102133	2014-08-18
739	548	102134	2014-08-18
740	548	102142	2014-08-20
742	555	102142	2014-08-22
744	549	102142	2014-08-22
745	547	102142	2014-08-22
746	546	102142	2014-08-22
747	544	102142	2014-08-22
748	540	102142	2014-08-22
749	534	102142	2014-08-22
750	528	102142	2014-08-22
751	527	102142	2014-08-22
763	556	102146	2014-09-05
790	555	102096	2014-09-08
\.


--
-- Name: saral_opening_assign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_opening_assign_id_seq', 791, true);


--
-- Data for Name: saral_opening_candidate; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_opening_candidate (id, opening_id, candidate_id, created_on, created_by) FROM stdin;
\.


--
-- Name: saral_opening_candidate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_opening_candidate_id_seq', 1, false);


--
-- Data for Name: saral_opening_interview; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_opening_interview (id, opening_id, interview_id, created_on, created_by) FROM stdin;
\.


--
-- Name: saral_opening_interview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_opening_interview_id_seq', 1, false);


--
-- Data for Name: saral_opening_stage; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_opening_stage (stage_id, opning_stage_id, opning_details) FROM stdin;
\.


--
-- Name: saral_opening_stage_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_opening_stage_stage_id_seq', 1, false);


--
-- Data for Name: saral_order_stage; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_order_stage (id, stage_flag, opening_id, stage_order) FROM stdin;
9	t	137	2
10	t	137	3
12	t	137	103
13	t	137	104
14	t	137	104
27	t	164	6
\.


--
-- Name: saral_order_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_order_stage_id_seq', 29, true);


--
-- Data for Name: saral_permission; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_permission (id, permission_type, permission_id) FROM stdin;
2	Privileged User	2
3	Limited Access	3
1	Super User	1
\.


--
-- Name: saral_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_permission_id_seq', 3, true);


--
-- Name: saral_permission_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_permission_permission_id_seq', 1, false);


--
-- Data for Name: saral_replecated_interview; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_replecated_interview (interview_id, title, description, invite_people, location, schedule, duration, openning_id, candidate_id, cmp_id, schedule_time, mail_id, su_id) FROM stdin;
\.


--
-- Data for Name: saral_role_assign; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_role_assign (user_id, role_id) FROM stdin;
\.


--
-- Name: saral_role_assign_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_role_assign_role_id_seq', 1, false);


--
-- Name: saral_role_assign_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_role_assign_user_id_seq', 1, false);


--
-- Data for Name: saral_role_dept; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_role_dept (id, role_id, dept_id) FROM stdin;
\.


--
-- Name: saral_role_dept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_role_dept_id_seq', 1, false);


--
-- Data for Name: saral_stage; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_stage (stage_id, stagename, "order", created_on, created_by) FROM stdin;
1	Unscreened	1	20/3/13	57
7	On Hold	7	20/3/13	57
8	Reject/Not a Fit	8	20/3/13	57
6	Telephonic Interview	3	20/3/13	57
3	Face to Face	4	20/3/13	57
4	Offered and Accepted	5	20/3/13	57
5	Offered and Rejected	6	20/3/13	57
2	Screening	2	20.13	57
\.


--
-- Data for Name: saral_stage_assign; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_stage_assign (id, assign_id, stage_id, created_by, created_on) FROM stdin;
\.


--
-- Name: saral_stage_assign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_stage_assign_id_seq', 1, false);


--
-- Name: saral_stage_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_stage_stage_id_seq', 8, true);


--
-- Data for Name: saral_stage_user_assign; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_stage_user_assign (su_id, opening_id, user_id, cmp_id) FROM stdin;
2624	525	448	127
2625	525	448	127
2628	525	448	127
2630	525	448	127
2629	525	448	127
2632	526	448	127
2634	526	448	127
2640	527	450	128
2648	528	450	128
2641	527	450	128
2640	527	458	128
2641	527	458	128
2656	529	450	128
2664	530	450	128
2672	531	450	128
2680	532	450	128
2688	531	458	128
2688	531	450	128
2689	533	450	128
2697	534	450	128
2705	535	450	128
2651	528	450	128
2656	529	458	128
2737	540	461	128
2737	540	450	128
2769	544	450	128
2649	528	466	128
2777	545	483	154
2777	545	486	154
2785	546	450	128
2793	547	450	128
2801	548	450	128
2809	549	450	128
2817	550	450	128
2825	551	507	161
2825	551	508	161
2826	551	508	161
2827	551	507	161
2827	551	508	161
2818	550	499	128
2818	550	489	128
2810	549	494	128
2738	540	506	128
2738	540	500	128
2738	540	501	128
2738	540	469	128
2811	549	506	128
2811	549	500	128
2811	549	501	128
2812	549	501	128
2770	544	506	128
2770	544	500	128
2739	540	500	128
2739	540	501	128
2739	540	506	128
2698	534	506	128
2698	534	500	128
2698	534	501	128
2698	534	469	128
2770	544	501	128
2770	544	469	128
2813	549	501	128
2814	549	506	128
2814	549	500	128
2814	549	501	128
2819	550	506	128
2833	552	450	128
2649	528	506	128
2818	550	506	128
2834	552	497	128
2788	546	500	128
2788	546	501	128
2788	546	469	128
2810	549	500	128
2810	549	501	128
2789	546	500	128
2657	529	500	128
2657	529	501	128
2643	527	506	128
2643	527	500	128
2643	527	501	128
2813	549	506	128
2813	549	450	128
2665	530	512	128
2665	530	513	128
2666	530	450	128
2698	534	450	128
2836	552	450	128
2841	553	514	165
2842	553	514	165
2842	553	515	165
2699	534	450	128
2810	549	513	128
2812	549	513	128
2812	549	450	128
2834	552	450	128
2837	552	513	128
2838	552	497	128
2840	552	513	128
2649	528	500	128
2667	530	513	128
2810	549	512	128
2801	548	501	128
2640	527	489	128
2664	530	501	128
2656	529	506	128
2793	547	501	128
2833	552	494	128
2809	549	489	128
2834	552	494	128
2834	552	495	128
2834	552	499	128
2834	552	513	128
2833	552	495	128
2668	530	512	128
2668	530	513	128
2668	530	450	128
2839	552	494	128
2809	549	526	128
2664	530	526	128
2655	528	526	128
2640	527	526	128
2656	529	526	128
2857	555	450	128
2857	555	526	128
2858	555	450	128
2863	555	450	128
2863	555	526	128
2858	555	526	128
2857	555	493	128
2857	555	490	128
2859	555	493	128
2859	555	490	128
2859	555	506	128
2859	555	512	128
2859	555	497	128
2859	555	450	128
2859	555	526	128
2866	555	500	128
2770	544	512	128
2770	544	513	128
2700	534	512	128
2811	549	513	128
2857	555	489	128
2640	527	490	128
2737	540	490	128
2769	544	490	128
2769	544	490	128
2785	546	489	128
2857	555	496	128
2793	547	506	128
2801	548	506	128
2872	555	-1	128
2709	535	450	128
2802	548	491	128
2873	556	531	175
2803	548	532	128
2804	548	513	128
2881	557	450	128
2889	558	450	128
\.


--
-- Data for Name: saral_todos_user; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_todos_user (id, user_id, opening_id) FROM stdin;
252	450	527
253	450	527
253	458	527
253	466	527
254	450	529
254	458	529
254	466	529
255	450	527
256	458	527
257	450	527
258	496	528
259	494	549
259	495	549
259	493	549
259	469	549
260	494	552
260	495	552
260	499	552
260	496	552
260	493	552
260	490	552
260	497	552
260	498	552
261	494	552
261	495	552
261	499	552
261	500	552
262	495	546
263	495	546
263	493	546
264	494	546
264	495	546
265	494	546
265	495	546
266	494	527
267	494	529
267	495	529
267	493	529
267	469	529
268	494	549
269	513	548
\.


--
-- Name: saral_todos_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_todos_user_id_seq', 106, true);


--
-- Data for Name: saral_unassigin_user; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_unassigin_user (id, user_id, cmp_id, candidate_id) FROM stdin;
\.


--
-- Name: saral_unassigin_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_unassigin_user_id_seq', 4, true);


--
-- Data for Name: saral_update_stage; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_update_stage (stagename, "order", created_on, created_by, opening_id, stage_id) FROM stdin;
\.


--
-- Name: saral_update_stage_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_update_stage_stage_id_seq', 9, true);


--
-- Data for Name: saral_user; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_user (uname, pasword, email, userroleid, departmentid, activationid, fname, lname, currentlocation, mobile, phonenumber, activate, cmp_id, id, country_code, state_code, perminsion, designation, state, country, area, city, created_on, guino, issecondaryadmin, fullname) FROM stdin;
keerti208	ffkrBjqMAog=	keerti.rastogi@g.com	4	36	1	keerti	rastogi	\N	1234567890	1234567890	1	128	494	\N	\N	2	\N			test		6-16-2014	2cc74b8f-23ec-41e1-98e6-9b7b91d2dc64	t	keertirastogi
keerti202637	ffkrBjqMAog=	keerti202637@mailinator.com	4	36	1	keerti	rastogi	\N	1234567890	1234567890	1	128	495	\N	\N	1	\N					6-16-2014	4efed581-184b-4401-9eaa-2cbdbeb86c89	t	keertirastogi
keertig	ffkrBjqMAog=	keertig@mailinator.com	101	36	1	keerti	Gupta	\N	1234567890	1234567890	1	128	499	\N	\N	2	\N					6-16-2014	0e569b92-c2b6-4e2f-acad-238818e8aeeb	t	keertiGupta
shalni3045	5ch0S9x5sBD/D3a8/V5Uig==	shalni3045@mailinator.com	101	64	1	shalini	rastogi	\N	1234567890	1234567890	1	128	500	\N	\N	3	\N					6-16-2014	682bc963-5bb3-4b23-b680-e55c5b4a0120	t	shalinirastogi
keerti2340263	ogplbns40cc+qP2dn9g54A==	keerti2340263@mailinator.com	1	64	1	keerti	rastogi	\N	\N	1234	1	157	502	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
keerti2026398	ak7RlQ/h/eSBu3Pfb15etA==	test5ty@gmail.com	1	64	1	keerti	rastogi	\N	\N	1234	\N	158	503	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
keerti20263	b1qCTKfilaV1q/pYy2g2lQ==	anshikagupta71028@gmail.com	1	64	1	keerti	rastogi	\N	\N	12347890987	\N	159	504	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
keerti20263633	xj3Tc8fwxxMO9MrU/DdKsA==	anshikagupta755028@gmail.com	1	64	1	keerti	rastogi	\N	\N	12347890987	\N	160	505	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
arif20	ffkrBjqMAog=	arif.usman@mailinator.com	101	64	1	arif	usman	\N	1234567890	1234567890	1	128	489	\N	\N	1	\N	mp	india	test	bhopal	6-16-2014	603414bf-bfa0-4698-8937-2ae7e01c3280	t	arifusman
keerti202634	IAYdYf7HZsiGly9S8FWr9w==	keerti2644@mailinator.com	101	36	1	keerti	rastogi	\N	1234567890	1234567890	1	128	496	\N	\N	2	\N					6-16-2014	8cff680c-3fa6-4b69-8b28-c73e7fef09e1	t	keertirastogi
keerti2028	rGpu8yM5yVqukwr21q4TxA==	keerti.rastogi@laitkor.com	4	36	2	keerti	rastogi	\N	1234567890	1234567890	1	128	493	\N	\N	2	\N			test		6-16-2014	091d9ccc-65ca-44d0-a907-0e134dc3e79d	t	keertirastogi
keerti20263	ogplbns40cc+qP2dn9g54A==	keerti.rastogi@mailinator.com	1	36	1	kamolika	Rastogi	\N	1234567890	1234567890	1	128	490	\N	\N	3	\N	mp	test	test	bhopal	6-16-2014	da750dcf-afd7-4622-8a7a-fc02f45c8d11	t	keertirastogi
junetest	ffkrBjqMAog=	junetest@mailinator.com	1	64	1	junetest	junetest	\N	\N	1234512345	1	161	507	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
junetestone	ffkrBjqMAog=	junetestone2@mailinator.com	101	64	1	junetest	one	\N	1234512345	1234512345	1	161	508	\N	\N	2	\N					6-24-2014	d5bbcf34-91a8-4e1f-9f74-86708256364a	t	junetestone
keerti20263trp	BOh3hibaFicC+IJrFmwGsg==	keerti20263trp@mailinator.com	5	64	1	keerti	rastogi	\N	1234567890	878878786867	1	128	498	\N	\N	2	\N			test	bhopal	6-16-2014	fcbc1eca-0152-4752-83ab-20a105e87b17	t	keertirastogi
palak	ffkrBjqMAog=	palak@demo.com	1	36	1	palak	sharma	\N	1234567890	1234567890	1	128	513	\N	\N	2	\N	Antrim	Ireland	test	lucknow	7-9-2014	f3457b54-bb82-4907-ba11-bc23d7052e90	t	palaksharma
test2345	ogplbns40cc+qP2dn9g54A==	test2345@mailinator.com	1	64	1	test	test	\N	\N	1234567890	\N	168	518	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
che	AtOzZmIZxQ0=	chetan.khare@laitkor.com	1	64	1	chetan	khare	\N	\N	1234567890	1	167	517	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
test5ty90	4bPiwlerXy+iP5PCjyHknw==	test5ty90@mailinator.com	1	64	1	test5ty90	test5ty90	\N	\N	12347890987	\N	169	519	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
test34	2oZjygCRfNg=	test34@mailinator.com	1	64	1	test34	test34	\N	\N	12347890987	\N	170	520	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
test34345	UYhhXK27o8bML/MkIIimaQ==	test34345@mailinator.com	1	64	1	test34345	test34345	\N	\N	12347890987	\N	171	521	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
test0806	tMfDbagNZZ8emmV6DNigpQ==	test0806@mailinator.com	1	64	1	test	test	\N	\N	12347890987	1	172	522	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
nbmnbmbm	c9WN7s/AA3es6wIvjVBzxQ==	gupta20aditi@gmail.com	4	36	1	test	t	gfg	86787777766	878878786867	1	128	458	\N	\N	2	bnnvbn	bvn	nbbb	dgv	vb	4-24-2014	9d7ec77d-563f-4780-974a-93f5cdfaea9e	t	testt
keerti20263tr	MtF0vr7dtKHYh2JFnhl2Kw==	keerti20263tr@mailinator.com	1	36	1	keerti	rastogi	\N	1234567890	878878786867	1	128	497	\N	\N	2	\N			test	bhopal	6-16-2014	3325dc19-6c2a-4f95-ad9f-f81a96c5819d	t	keertirastogi
testUser2026	ogplbns40cc+qP2dn9g54A==	keertif78.rastogi@laitkor.com	5	37	2	test user	Gupta	\N	3232322323	878878786867	0	128	469	\N	\N	2	\N	mp	india	test	test	6-3-2014	b9e50e27-c361-4aea-b42a-c816ef1c292b	t	testuserGupta
shalni	ogplbns40cc+qP2dn9g54A==	shalinfi.vishwakarma@laitkor.com	101	\N	1	shalni	vishwakarma	\N	\N	\N	1	136	459	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
user1	eovGDV2J1/U=	abgcgsr@gmail.com	6	36	1	user1	na		+91 999-999-9999	 430-987-7777	1	127	449	\N	\N	3						12-20-2013	f3477823-9f7f-4b71-8f24-fa16a4764584	t	user1na
test10285	ffkrBjqMAog=	krti@mailinator.com	2	36	1	keerti	hgf	\N	1234567890	1234567890	1	128	491	\N	\N	2	\N		india	test	bhopal	6-16-2014	8a206eaa-3664-4c64-8a31-4baf1d510296	t	keertihgf
lisp	ffkrBjqMAog=	lisp@mailinator.com	1	64	1	James	Anderson	\N	\N	\N	1	141	470	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
shalni30	ogplbns40cc+qP2dn9g54A==	shalini.vishwakarma@laitkor.com	1	64	1	shalini	Gupta	\N	\N	\N	1	151	480	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
yasser	ffkrBjqMAog=	yasser@mailinator.com	1	64	1	yasser	Sheikh	\N	\N	\N	1	154	483	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
retest	ffkrBjqMAog=	retest@mailinator.com	1	64	1	retest	retest	\N	\N	\N	1	155	484	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
james	ffkrBjqMAog=	james@mailinator.com	1	64	1	james	james	\N	\N	\N	1	156	485	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
harkamal	ffkrBjqMAog=	harkaml@maillinator.com	147	64	1	harkamal	Singh	\N	234512345	1234512345	0	154	486	\N	\N	1	\N	India	India	India	India	6-13-2014	ad3488fd-0b99-4f44-bd57-4b338d0ec6d0	t	harkamalSingh
newUser2026	ogplbns40cc+qP2dn9g54A==	newUser2026@laitkor.com	1	36	1	New user	test	test	1234567890	1234567890	1	128	466	\N	\N	2	test	mp	india	test	bhopal	5-30-2014	0571de10-75c3-4934-ab0d-e1cd05aa4e97	t	Newusertest
test1august	t6B+eqwXmGv3p+JZkPdPqw==	test1august@mailinator.com	1	64	1	test	test	\N	\N	12347890987	1	173	524	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
xyzr	Mb16q4x6R8g=	xyzr@mailinator.com	101	64	1	xyzr	xyzr	\N	1234567890	1234567890	1	173	525	\N	\N	1	\N					8-11-2014	4d1437af-b8da-4dfc-ada1-7a520b8faed0	t	xyzrxyzr
keerti20263	9CZDDtUsRB06M78q33Dcdg==	keerti20263@mailinator.com	1	64	1	keerti	rastogi	\N	\N	12347890987	\N	174	527	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
keerti0806	wcn+Td2ZFgWgzVZzVdHCCw==	keerti0806@mailinator.com	159	116	1	keerti0806	keerti0806	\N	1234567890		1	128	530	\N	\N	2	\N			test		9-4-2014	25103756-f12d-4be2-b0b3-8db1bfa73ae1	t	keerti0806keerti0806
keerti1234	UV+DexOyR5Y7GeMyXh5j+A==	keerti1234@mailinator.com	1	64	1	keerti	rastogi	\N	\N	12347890987	1	175	531	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
help	ogplbns40cc+qP2dn9g54A==	help@mailainator.com	2	116	1	help	help	\N	123456789012	123456789012	1	128	532	\N	\N	2	\N	help	help	help	help	9-11-2014	5a36884f-7205-4578-b2e3-8473d409231a	t	helphelp
arif455	/O9PBGEI3hk=	arif455@mailinator.com	3	36	3	arif	usman	\N	1234567890	1234567890	1	128	501	\N	\N	1	\N			test		6-16-2014	e92d9cda-69cf-42d8-9213-fde7aacbc1ae	t	arifusman
help	ogplbns40cc+qP2dn9g54A==	help@mailinator.com	101	64	1	help	help	\N	\N	1234567890	\N	176	533	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
help123	ogplbns40cc+qP2dn9g54A==	help123@mailinator.com	101	64	1	help	help	\N	\N	1234567890	1	178	535	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	f	\N
help12	ogplbns40cc+qP2dn9g54A==	hepl@dasd.vom	101	101	1	help1	help1	\N	123456789012		1	128	536	\N	\N	3	\N					9-20-2014	b9bc3609-9bbb-4a8e-b66f-f102e084ad80	t	help1help1
anshika1028	ogplbns40cc+qP2dn9g54A==	anshika.gupta@laitkor.com	101	64	1	Anshika	Gupta	\N	9874563210	1234567890	1	128	450	\N	\N	1	\N	UP	india	NG/123	lucknow	\N	\N	f	AnshikaGupta
\.


--
-- Data for Name: saral_user_candidate; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_user_candidate (id, note, created_on, created_by, candidate_id) FROM stdin;
\.


--
-- Name: saral_user_candidate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_user_candidate_id_seq', 1, false);


--
-- Data for Name: saral_user_dept; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_user_dept (id, user_id, dept_id) FROM stdin;
\.


--
-- Name: saral_user_dept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_user_dept_id_seq', 1, false);


--
-- Name: saral_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_user_id_seq', 537, true);


--
-- Data for Name: saral_user_info; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_user_info (id, user_id, username, password) FROM stdin;
1	10	mukesh	123
3	12	hr_ac	m2n1shlko
2	11	sa_ac	m2n1shlko
4	13	tech_ac	m2n1shlko
5	14	cmp_ac	sa
\.


--
-- Data for Name: saral_user_mailnotifaction; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_user_mailnotifaction (id, user_id, cmp_id, activation_id) FROM stdin;
4	450	128	0
4	450	128	0
4	450	128	0
4	450	128	0
4	450	128	0
4	450	128	0
4	450	128	0
8	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
3	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
2	450	128	0
6	450	128	0
6	450	128	1
5	450	128	0
5	450	128	1
6	450	128	1
5	450	128	1
6	450	128	1
7	450	128	1
\.


--
-- Data for Name: saral_user_role; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY saral_user_role (user_role, active, role_id, rid, dept_id, cmp_id) FROM stdin;
Human Resource	1	6	6	64	128
Project Manager	1	1	1	64	128
Director	1	5	5	70	128
new	0	146	146	\N	151
Human Resource manager	0	147	147	\N	154
gdfgg	1	149	149	\N	128
test	1	155	155	\N	128
12op	1	159	159	\N	128
hjkjhkjhk	0	160	160	\N	128
gggggg434	0	161	161	\N	128
jjhgj      jhjg	0	162	162	\N	128
Raaz	1	2	2	65	128
Super Admin	1	101	101	\N	\N
Team Lead	1	3	3	64	128
Sr. Project Manager	1	4	4	70	128
\.


--
-- Name: saral_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saral_user_role_id_seq', 162, true);


--
-- Name: saralnxtid; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('saralnxtid', 5, true);


--
-- Data for Name: sdept_id; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY sdept_id (dept_id) FROM stdin;
70
\.


--
-- Data for Name: srole_id; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY srole_id (role_id) FROM stdin;
1
\.


--
-- Data for Name: tblcountry; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY tblcountry (country_code, country_name) FROM stdin;
1	India
2	US
\.


--
-- Data for Name: tblstate; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY tblstate (state_code, country_code, state_name) FROM stdin;
1	1	New Delhi
4	1	Tamil Nadu
2	1	Gujarat
3	1	Uttar Pradesh
7	2	California
6	2	Texas
8	2	Hawaii
5	2	Florida
\.


--
-- Data for Name: testde; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY testde (id, mo, clm) FROM stdin;
\.


--
-- Name: update_stage_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('update_stage_id_sequence', 124, true);


--
-- Data for Name: user_interview; Type: TABLE DATA; Schema: public; Owner: laitkor
--

COPY user_interview (id, interview_id, user_id, cmp_id) FROM stdin;
941822	388	500	\N
941823	388	501	\N
941824	388	469	\N
941825	388	466	\N
941826	389	501	\N
941827	389	469	\N
941829	395	500	\N
941830	395	501	\N
941832	396	500	\N
941833	396	469	\N
941834	397	501	\N
941835	397	469	\N
941836	397	466	\N
941837	397	496	\N
941838	397	497	\N
941839	397	498	\N
941843	399	500	\N
941846	402	500	\N
941851	407	500	\N
941852	407	501	\N
941854	408	500	\N
941855	408	501	\N
941856	408	469	\N
941857	408	466	\N
941858	408	496	\N
941859	408	497	\N
941860	408	498	\N
941861	408	499	\N
941862	408	493	\N
941863	408	495	\N
941864	408	494	\N
941865	408	489	\N
941866	408	458	\N
941867	408	491	\N
941868	408	490	\N
941869	408	450	\N
941877	412	500	\N
941878	413	500	\N
941879	413	501	\N
941881	414	500	\N
941882	414	501	\N
941885	416	513	\N
941887	417	513	\N
941888	418	450	\N
941889	419	450	\N
941890	420	450	\N
941893	422	450	\N
941895	423	513	\N
941898	425	513	\N
941899	425	450	\N
941900	426	500	\N
941903	429	513	\N
941904	429	500	\N
941906	430	513	\N
941908	431	513	\N
941909	431	450	\N
941911	432	513	\N
941913	434	513	\N
\.


--
-- Name: user_interview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: laitkor
--

SELECT pg_catalog.setval('user_interview_id_seq', 941916, true);


--
-- Name: cmp_id; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_company
    ADD CONSTRAINT cmp_id PRIMARY KEY (cmp_id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: dept_id; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_department
    ADD CONSTRAINT dept_id UNIQUE (dept_id);


--
-- Name: email; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT email UNIQUE (email);


--
-- Name: email_notifaction_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY email_notifaction
    ADD CONSTRAINT email_notifaction_pkey PRIMARY KEY (id);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- Name: opening_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_opening
    ADD CONSTRAINT opening_pkey PRIMARY KEY (opening_id);


--
-- Name: parse_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY parse_setting
    ADD CONSTRAINT parse_setting_pkey PRIMARY KEY (id);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: pk_saral_user_info; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user_info
    ADD CONSTRAINT pk_saral_user_info PRIMARY KEY (id);


--
-- Name: role_id; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user_role
    ADD CONSTRAINT role_id UNIQUE (role_id);


--
-- Name: saral_addUser_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_adduser
    ADD CONSTRAINT "saral_addUser_pkey" PRIMARY KEY (id);


--
-- Name: saral_candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_candidate
    ADD CONSTRAINT saral_candidate_pkey PRIMARY KEY (candidate_id);


--
-- Name: saral_candidate_todos_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_candidate_todos
    ADD CONSTRAINT saral_candidate_todos_pkey PRIMARY KEY (id);


--
-- Name: saral_company_role_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_company_role
    ADD CONSTRAINT saral_company_role_pkey PRIMARY KEY (id);


--
-- Name: saral_company_saral_user_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_company_saral_user
    ADD CONSTRAINT saral_company_saral_user_pkey PRIMARY KEY (saral_company_cmp_id, user_id);


--
-- Name: saral_company_saral_user_user_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_company_saral_user
    ADD CONSTRAINT saral_company_saral_user_user_id_key UNIQUE (user_id);


--
-- Name: saral_create_interview_interview_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_interview
    ADD CONSTRAINT saral_create_interview_interview_id_key UNIQUE (interview_id);


--
-- Name: saral_department_department_name_cmp_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_department
    ADD CONSTRAINT saral_department_department_name_cmp_id_key UNIQUE (department_name, cmp_id);


--
-- Name: saral_department_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_department
    ADD CONSTRAINT saral_department_id_key UNIQUE (id);


--
-- Name: saral_internal_notes_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_internal_notes
    ADD CONSTRAINT saral_internal_notes_id_key UNIQUE (id);


--
-- Name: saral_internalnotes_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_internalnotes_reply
    ADD CONSTRAINT saral_internalnotes_reply_pkey PRIMARY KEY (r_id);


--
-- Name: saral_interview_feedback_interview_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_interview_feedback
    ADD CONSTRAINT saral_interview_feedback_interview_id_user_id_key UNIQUE (interview_id, user_id);


--
-- Name: saral_interview_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_interview_feedback
    ADD CONSTRAINT saral_interview_feedback_pkey PRIMARY KEY (f_id);


--
-- Name: saral_interview_type_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_interview_type
    ADD CONSTRAINT saral_interview_type_pkey PRIMARY KEY (id);


--
-- Name: saral_launch_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_launch
    ADD CONSTRAINT saral_launch_pkey PRIMARY KEY (id);


--
-- Name: saral_new_update_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_new_update_stage
    ADD CONSTRAINT saral_new_update_stage_pkey PRIMARY KEY (su_id);


--
-- Name: saral_new_update_stage_sorder_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_new_update_stage
    ADD CONSTRAINT saral_new_update_stage_sorder_key UNIQUE (sorder);


--
-- Name: saral_opening_candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_opening_candidate
    ADD CONSTRAINT saral_opening_candidate_pkey PRIMARY KEY (id);


--
-- Name: saral_opening_interview_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_opening_interview
    ADD CONSTRAINT saral_opening_interview_pkey PRIMARY KEY (id);


--
-- Name: saral_opening_stage_opning_stage_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_opening_stage
    ADD CONSTRAINT saral_opening_stage_opning_stage_id_key UNIQUE (opning_stage_id);


--
-- Name: saral_opening_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_opening_stage
    ADD CONSTRAINT saral_opening_stage_pkey PRIMARY KEY (stage_id);


--
-- Name: saral_order_stage_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_order_stage
    ADD CONSTRAINT saral_order_stage_id_key UNIQUE (id);


--
-- Name: saral_permission_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_permission
    ADD CONSTRAINT saral_permission_permission_id_key UNIQUE (permission_id);


--
-- Name: saral_permission_permission_type_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_permission
    ADD CONSTRAINT saral_permission_permission_type_key UNIQUE (permission_type);


--
-- Name: saral_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_permission
    ADD CONSTRAINT saral_permission_pkey PRIMARY KEY (id);


--
-- Name: saral_role_dept_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_role_dept
    ADD CONSTRAINT saral_role_dept_pkey PRIMARY KEY (id);


--
-- Name: saral_stage_assign_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_stage_assign
    ADD CONSTRAINT saral_stage_assign_pkey PRIMARY KEY (id);


--
-- Name: saral_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_stage
    ADD CONSTRAINT saral_stage_pkey PRIMARY KEY (stage_id);


--
-- Name: saral_unassigin_user_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_unassigin_user
    ADD CONSTRAINT saral_unassigin_user_pkey PRIMARY KEY (id);


--
-- Name: saral_user_candidate_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user_candidate
    ADD CONSTRAINT saral_user_candidate_pkey PRIMARY KEY (id);


--
-- Name: saral_user_dept_id_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user_dept
    ADD CONSTRAINT saral_user_dept_id_key UNIQUE (id);


--
-- Name: saral_user_role_cmp_id_user_role_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user_role
    ADD CONSTRAINT saral_user_role_cmp_id_user_role_key UNIQUE (cmp_id, user_role);


--
-- Name: saral_user_role_rid_key; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_user_role
    ADD CONSTRAINT saral_user_role_rid_key UNIQUE (rid);


--
-- Name: stage_id; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY saral_update_stage
    ADD CONSTRAINT stage_id PRIMARY KEY (stage_id);


--
-- Name: tblcity_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY tblstate
    ADD CONSTRAINT tblcity_pkey PRIMARY KEY (state_code);


--
-- Name: tblstate_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY tblcountry
    ADD CONSTRAINT tblstate_pkey PRIMARY KEY (country_code);


--
-- Name: testde_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY testde
    ADD CONSTRAINT testde_pkey PRIMARY KEY (id);


--
-- Name: user_interview_pkey; Type: CONSTRAINT; Schema: public; Owner: laitkor; Tablespace: 
--

ALTER TABLE ONLY user_interview
    ADD CONSTRAINT user_interview_pkey PRIMARY KEY (id);


--
-- Name: cmp_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_department
    ADD CONSTRAINT cmp_id FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cmp_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening
    ADD CONSTRAINT cmp_id FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: country_code; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT country_code FOREIGN KEY (country_code) REFERENCES tblcountry(country_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dept_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_dept
    ADD CONSTRAINT dept_id FOREIGN KEY (dept_id) REFERENCES saral_department(dept_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dept_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_role_dept
    ADD CONSTRAINT dept_id FOREIGN KEY (dept_id) REFERENCES saral_department(dept_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dept_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening
    ADD CONSTRAINT dept_id FOREIGN KEY (dept_id) REFERENCES saral_department(dept_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employee_departmentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES department(id);


--
-- Name: fk4e03c72d4f589e0a; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_company_saral_user
    ADD CONSTRAINT fk4e03c72d4f589e0a FOREIGN KEY (user_id) REFERENCES saral_user(id);


--
-- Name: fk4e03c72ddc404633; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_company_saral_user
    ADD CONSTRAINT fk4e03c72ddc404633 FOREIGN KEY (saral_company_cmp_id) REFERENCES saral_company(cmp_id);


--
-- Name: fkf62b56fb1753ed01; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT fkf62b56fb1753ed01 FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id);


--
-- Name: imterview_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_interview
    ADD CONSTRAINT imterview_id FOREIGN KEY (interview_id) REFERENCES saral_interview(interview_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: interview_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY user_interview
    ADD CONSTRAINT interview_id FOREIGN KEY (interview_id) REFERENCES saral_interview(interview_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: opening_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate
    ADD CONSTRAINT opening_id FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: opening_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_interview
    ADD CONSTRAINT opening_id FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_role_dept
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES saral_user_role(role_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_candidate_stage_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_stage
    ADD CONSTRAINT saral_candidate_stage_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON DELETE CASCADE;


--
-- Name: saral_candidate_stage_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_stage
    ADD CONSTRAINT saral_candidate_stage_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_candidate_stage_su_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_stage
    ADD CONSTRAINT saral_candidate_stage_su_id_fkey FOREIGN KEY (su_id) REFERENCES saral_new_update_stage(su_id) ON DELETE CASCADE;


--
-- Name: saral_candidate_todos_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_todos
    ADD CONSTRAINT saral_candidate_todos_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_candidate_todos_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_todos
    ADD CONSTRAINT saral_candidate_todos_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_candidate_todos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_candidate_todos
    ADD CONSTRAINT saral_candidate_todos_user_id_fkey FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_dFields_cmpid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_dfields
    ADD CONSTRAINT "saral_dFields_cmpid_fkey" FOREIGN KEY (cmpid) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_internal_notes_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_internal_notes
    ADD CONSTRAINT saral_internal_notes_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON DELETE CASCADE;


--
-- Name: saral_internal_notes_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_internal_notes
    ADD CONSTRAINT saral_internal_notes_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_internal_notes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_internal_notes
    ADD CONSTRAINT saral_internal_notes_user_id_fkey FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_internalnotes_reply_note_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_internalnotes_reply
    ADD CONSTRAINT saral_internalnotes_reply_note_id_fkey FOREIGN KEY (note_id) REFERENCES saral_internal_notes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_interview_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview
    ADD CONSTRAINT saral_interview_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON DELETE CASCADE;


--
-- Name: saral_interview_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview
    ADD CONSTRAINT saral_interview_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_interview_feedback_interview_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview_feedback
    ADD CONSTRAINT saral_interview_feedback_interview_id_fkey FOREIGN KEY (interview_id) REFERENCES saral_interview(interview_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_interview_feedback_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview_feedback
    ADD CONSTRAINT saral_interview_feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_interview_openning_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview
    ADD CONSTRAINT saral_interview_openning_id_fkey FOREIGN KEY (openning_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_interview_su_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview
    ADD CONSTRAINT saral_interview_su_id_fkey FOREIGN KEY (su_id) REFERENCES saral_new_update_stage(su_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_interview_type_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_interview_type
    ADD CONSTRAINT saral_interview_type_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_launch_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_launch
    ADD CONSTRAINT saral_launch_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id);


--
-- Name: saral_launch_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_launch
    ADD CONSTRAINT saral_launch_department_fkey FOREIGN KEY (department) REFERENCES saral_department(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_launch_designation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_launch
    ADD CONSTRAINT saral_launch_designation_fkey FOREIGN KEY (designation) REFERENCES saral_user_role(rid);


--
-- Name: saral_mail_notification_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_mail_notification
    ADD CONSTRAINT saral_mail_notification_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES saral_permission(permission_id);


--
-- Name: saral_new_update_stage_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_new_update_stage
    ADD CONSTRAINT saral_new_update_stage_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON DELETE CASCADE;


--
-- Name: saral_opening_assign_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_assign
    ADD CONSTRAINT saral_opening_assign_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON DELETE CASCADE;


--
-- Name: saral_opening_assign_candidate_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_assign
    ADD CONSTRAINT saral_opening_assign_candidate_id_fkey1 FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_opening_assign_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_assign
    ADD CONSTRAINT saral_opening_assign_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON DELETE CASCADE;


--
-- Name: saral_opening_assign_opening_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_assign
    ADD CONSTRAINT saral_opening_assign_opening_id_fkey1 FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON DELETE CASCADE;


--
-- Name: saral_opening_candidate_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_candidate
    ADD CONSTRAINT saral_opening_candidate_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_opening_candidate_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening_candidate
    ADD CONSTRAINT saral_opening_candidate_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_opening_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening
    ADD CONSTRAINT saral_opening_req_id_fkey FOREIGN KEY (req_id) REFERENCES saral_launch(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_stage_user_assign_su_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_stage_user_assign
    ADD CONSTRAINT saral_stage_user_assign_su_id_fkey FOREIGN KEY (su_id) REFERENCES saral_new_update_stage(su_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_todos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_todos_user
    ADD CONSTRAINT saral_todos_user_id_fkey FOREIGN KEY (id) REFERENCES saral_candidate_todos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_todos_user_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_todos_user
    ADD CONSTRAINT saral_todos_user_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_todos_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_todos_user
    ADD CONSTRAINT saral_todos_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_unassigin_user_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_unassigin_user
    ADD CONSTRAINT saral_unassigin_user_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_unassigin_user_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_unassigin_user
    ADD CONSTRAINT saral_unassigin_user_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_unassigin_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_unassigin_user
    ADD CONSTRAINT saral_unassigin_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_update_stage_opening_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_update_stage
    ADD CONSTRAINT saral_update_stage_opening_id_fkey FOREIGN KEY (opening_id) REFERENCES saral_opening(opening_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_candidate_candidate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_candidate
    ADD CONSTRAINT saral_user_candidate_candidate_id_fkey FOREIGN KEY (candidate_id) REFERENCES saral_candidate(candidate_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT saral_user_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_departmentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT saral_user_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES saral_department(dept_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_mailnotifaction_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_mailnotifaction
    ADD CONSTRAINT saral_user_mailnotifaction_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_mailnotifaction_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_mailnotifaction
    ADD CONSTRAINT saral_user_mailnotifaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_perminsion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT saral_user_perminsion_fkey FOREIGN KEY (perminsion) REFERENCES saral_permission(permission_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_role_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_role
    ADD CONSTRAINT saral_user_role_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saral_user_userroleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT saral_user_userroleid_fkey FOREIGN KEY (userroleid) REFERENCES saral_user_role(role_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: stage_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_opening
    ADD CONSTRAINT stage_id FOREIGN KEY (stage_id) REFERENCES saral_stage(stage_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: stage_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_stage_assign
    ADD CONSTRAINT stage_id FOREIGN KEY (stage_id) REFERENCES saral_stage(stage_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: state_code; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user
    ADD CONSTRAINT state_code FOREIGN KEY (state_code) REFERENCES tblstate(state_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tblcity_state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY tblstate
    ADD CONSTRAINT tblcity_state_code_fkey FOREIGN KEY (country_code) REFERENCES tblcountry(country_code) ON DELETE CASCADE;


--
-- Name: user_id; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY saral_user_dept
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_interview_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY user_interview
    ADD CONSTRAINT user_interview_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES saral_company(cmp_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_interview_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: laitkor
--

ALTER TABLE ONLY user_interview
    ADD CONSTRAINT user_interview_user_id_fkey FOREIGN KEY (user_id) REFERENCES saral_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

