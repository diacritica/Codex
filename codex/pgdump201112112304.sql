--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_permission_id_seq', 72, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO django;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 168, true);


--
-- Name: character; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE "character" (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    gender character varying(2),
    level character varying(3),
    "AC" smallint,
    move character varying(100),
    moral character varying(2),
    saveroll character varying(20),
    hitpoints smallint,
    alignment character varying(3),
    description text,
    species character varying(30),
    startdate smallint,
    enddate smallint,
    status character varying(5),
    weapons text,
    pncorpc character varying(3),
    deactivated boolean NOT NULL,
    age character varying(10),
    comments text,
    canon_level character varying(5),
    profession character varying(30),
    strengthstat smallint,
    dexteritystat smallint,
    constitutionstat smallint,
    intelligencestat smallint,
    wisdomstat smallint,
    charismastat smallint,
    treasurevalue character varying(100),
    creation_date date,
    last_updated date,
    quote text
);


ALTER TABLE public."character" OWNER TO django;

--
-- Name: character_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_author (
    id integer NOT NULL,
    character_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.character_author OWNER TO django;

--
-- Name: character_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_author_id_seq OWNER TO django;

--
-- Name: character_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_author_id_seq OWNED BY character_author.id;


--
-- Name: character_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_author_id_seq', 89, true);


--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_id_seq OWNER TO django;

--
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_id_seq OWNED BY "character".id;


--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_id_seq', 35, true);


--
-- Name: character_image; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_image (
    id integer NOT NULL,
    character_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.character_image OWNER TO django;

--
-- Name: character_image_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_image_id_seq OWNER TO django;

--
-- Name: character_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_image_id_seq OWNED BY character_image.id;


--
-- Name: character_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_image_id_seq', 37, true);


--
-- Name: character_languages; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_languages (
    id integer NOT NULL,
    character_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.character_languages OWNER TO django;

--
-- Name: character_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_languages_id_seq OWNER TO django;

--
-- Name: character_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_languages_id_seq OWNED BY character_languages.id;


--
-- Name: character_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_languages_id_seq', 60, true);


--
-- Name: character_relatedlocation; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_relatedlocation (
    id integer NOT NULL,
    character_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.character_relatedlocation OWNER TO django;

--
-- Name: character_relatedlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_relatedlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_relatedlocation_id_seq OWNER TO django;

--
-- Name: character_relatedlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_relatedlocation_id_seq OWNED BY character_relatedlocation.id;


--
-- Name: character_relatedlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_relatedlocation_id_seq', 137, true);


--
-- Name: character_relatedobject; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_relatedobject (
    id integer NOT NULL,
    character_id integer NOT NULL,
    object_id integer NOT NULL
);


ALTER TABLE public.character_relatedobject OWNER TO django;

--
-- Name: character_relatedobject_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_relatedobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_relatedobject_id_seq OWNER TO django;

--
-- Name: character_relatedobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_relatedobject_id_seq OWNED BY character_relatedobject.id;


--
-- Name: character_relatedobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_relatedobject_id_seq', 210, true);


--
-- Name: character_relationship; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_relationship (
    id integer NOT NULL,
    character1_id integer NOT NULL,
    character2_id integer NOT NULL,
    relation12 character varying(10),
    relation21 character varying(10),
    comments text,
    canon_level character varying(5)
);


ALTER TABLE public.character_relationship OWNER TO django;

--
-- Name: character_relationship_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_relationship_author (
    id integer NOT NULL,
    characterrelationship_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.character_relationship_author OWNER TO django;

--
-- Name: character_relationship_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_relationship_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_relationship_author_id_seq OWNER TO django;

--
-- Name: character_relationship_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_relationship_author_id_seq OWNED BY character_relationship_author.id;


--
-- Name: character_relationship_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_relationship_author_id_seq', 8, true);


--
-- Name: character_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_relationship_id_seq OWNER TO django;

--
-- Name: character_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_relationship_id_seq OWNED BY character_relationship.id;


--
-- Name: character_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_relationship_id_seq', 11, true);


--
-- Name: character_religion; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE character_religion (
    id integer NOT NULL,
    character_id integer NOT NULL,
    religion_id integer NOT NULL
);


ALTER TABLE public.character_religion OWNER TO django;

--
-- Name: character_religion_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE character_religion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.character_religion_id_seq OWNER TO django;

--
-- Name: character_religion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE character_religion_id_seq OWNED BY character_religion.id;


--
-- Name: character_religion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('character_religion_id_seq', 35, true);


--
-- Name: charloc_relationship; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE charloc_relationship (
    id integer NOT NULL,
    character_id integer NOT NULL,
    location_id integer NOT NULL,
    relation character varying(10),
    comments text,
    canon_level character varying(5)
);


ALTER TABLE public.charloc_relationship OWNER TO django;

--
-- Name: charloc_relationship_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE charloc_relationship_author (
    id integer NOT NULL,
    characterlocationrelationship_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.charloc_relationship_author OWNER TO django;

--
-- Name: charloc_relationship_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE charloc_relationship_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.charloc_relationship_author_id_seq OWNER TO django;

--
-- Name: charloc_relationship_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE charloc_relationship_author_id_seq OWNED BY charloc_relationship_author.id;


--
-- Name: charloc_relationship_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('charloc_relationship_author_id_seq', 1, false);


--
-- Name: charloc_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE charloc_relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.charloc_relationship_id_seq OWNER TO django;

--
-- Name: charloc_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE charloc_relationship_id_seq OWNED BY charloc_relationship.id;


--
-- Name: charloc_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('charloc_relationship_id_seq', 3, true);


--
-- Name: creature; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    gender character varying(2),
    hitdice character varying(20),
    "AC" character varying(10),
    treasurevalue character varying(100),
    "XPvalue" smallint,
    move character varying(100),
    moral character varying(2),
    saveroll character varying(20),
    alignment character varying(3),
    description text,
    attacks text,
    deactivated boolean DEFAULT false NOT NULL,
    comments text,
    canon_level character varying(5),
    creation_date date,
    last_updated date
);


ALTER TABLE public.creature OWNER TO django;

--
-- Name: creature_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature_author (
    id integer NOT NULL,
    creature_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.creature_author OWNER TO django;

--
-- Name: creature_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_author_id_seq OWNER TO django;

--
-- Name: creature_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_author_id_seq OWNED BY creature_author.id;


--
-- Name: creature_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_author_id_seq', 40, true);


--
-- Name: creature_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_id_seq OWNER TO django;

--
-- Name: creature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_id_seq OWNED BY creature.id;


--
-- Name: creature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_id_seq', 24, true);


--
-- Name: creature_image; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature_image (
    id integer NOT NULL,
    creature_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.creature_image OWNER TO django;

--
-- Name: creature_image_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_image_id_seq OWNER TO django;

--
-- Name: creature_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_image_id_seq OWNED BY creature_image.id;


--
-- Name: creature_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_image_id_seq', 2, true);


--
-- Name: creature_languages; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature_languages (
    id integer NOT NULL,
    creature_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.creature_languages OWNER TO django;

--
-- Name: creature_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_languages_id_seq OWNER TO django;

--
-- Name: creature_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_languages_id_seq OWNED BY creature_languages.id;


--
-- Name: creature_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_languages_id_seq', 19, true);


--
-- Name: creature_relatedlocation; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature_relatedlocation (
    id integer NOT NULL,
    creature_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.creature_relatedlocation OWNER TO django;

--
-- Name: creature_relatedlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_relatedlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_relatedlocation_id_seq OWNER TO django;

--
-- Name: creature_relatedlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_relatedlocation_id_seq OWNED BY creature_relatedlocation.id;


--
-- Name: creature_relatedlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_relatedlocation_id_seq', 18, true);


--
-- Name: creature_relatedobject; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature_relatedobject (
    id integer NOT NULL,
    creature_id integer NOT NULL,
    object_id integer NOT NULL
);


ALTER TABLE public.creature_relatedobject OWNER TO django;

--
-- Name: creature_relatedobject_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_relatedobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_relatedobject_id_seq OWNER TO django;

--
-- Name: creature_relatedobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_relatedobject_id_seq OWNED BY creature_relatedobject.id;


--
-- Name: creature_relatedobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_relatedobject_id_seq', 14, true);


--
-- Name: creature_relationship; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature_relationship (
    id integer NOT NULL,
    creature1_id integer NOT NULL,
    creature2_id integer NOT NULL,
    relation12 character varying(10),
    relation21 character varying(10),
    comments text,
    canon_level character varying(5)
);


ALTER TABLE public.creature_relationship OWNER TO django;

--
-- Name: creature_relationship_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE creature_relationship_author (
    id integer NOT NULL,
    creaturerelationship_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.creature_relationship_author OWNER TO django;

--
-- Name: creature_relationship_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_relationship_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_relationship_author_id_seq OWNER TO django;

--
-- Name: creature_relationship_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_relationship_author_id_seq OWNED BY creature_relationship_author.id;


--
-- Name: creature_relationship_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_relationship_author_id_seq', 1, false);


--
-- Name: creature_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE creature_relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.creature_relationship_id_seq OWNER TO django;

--
-- Name: creature_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE creature_relationship_id_seq OWNED BY creature_relationship.id;


--
-- Name: creature_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('creature_relationship_id_seq', 3, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 531, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_content_type_id_seq', 24, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO django;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO django;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: image; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE image (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    comments text,
    canon_level character varying(5),
    date date NOT NULL,
    image character varying(100)
);


ALTER TABLE public.image OWNER TO django;

--
-- Name: image_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE image_author (
    id integer NOT NULL,
    image_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.image_author OWNER TO django;

--
-- Name: image_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE image_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.image_author_id_seq OWNER TO django;

--
-- Name: image_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE image_author_id_seq OWNED BY image_author.id;


--
-- Name: image_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('image_author_id_seq', 28, true);


--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO django;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE image_id_seq OWNED BY image.id;


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('image_id_seq', 21, true);


--
-- Name: language; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE language (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    comments text,
    canon_level character varying(5)
);


ALTER TABLE public.language OWNER TO django;

--
-- Name: language_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE language_author (
    id integer NOT NULL,
    language_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.language_author OWNER TO django;

--
-- Name: language_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE language_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.language_author_id_seq OWNER TO django;

--
-- Name: language_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE language_author_id_seq OWNED BY language_author.id;


--
-- Name: language_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('language_author_id_seq', 6, true);


--
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.language_id_seq OWNER TO django;

--
-- Name: language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE language_id_seq OWNED BY language.id;


--
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('language_id_seq', 7, true);


--
-- Name: location; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE location (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    location text,
    description text,
    startdate smallint,
    enddate smallint,
    status character varying(5),
    alignment character varying(3),
    loctype character varying(5),
    deactivated boolean NOT NULL,
    comments text,
    canon_level character varying(5),
    population integer,
    creation_date date,
    last_updated date
);


ALTER TABLE public.location OWNER TO django;

--
-- Name: location_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE location_author (
    id integer NOT NULL,
    location_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.location_author OWNER TO django;

--
-- Name: location_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE location_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.location_author_id_seq OWNER TO django;

--
-- Name: location_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE location_author_id_seq OWNED BY location_author.id;


--
-- Name: location_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('location_author_id_seq', 115, true);


--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO django;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE location_id_seq OWNED BY location.id;


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('location_id_seq', 49, true);


--
-- Name: location_image; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE location_image (
    id integer NOT NULL,
    location_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.location_image OWNER TO django;

--
-- Name: location_image_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE location_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.location_image_id_seq OWNER TO django;

--
-- Name: location_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE location_image_id_seq OWNED BY location_image.id;


--
-- Name: location_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('location_image_id_seq', 11, true);


--
-- Name: location_languages; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE location_languages (
    id integer NOT NULL,
    location_id integer NOT NULL,
    language_id integer NOT NULL
);


ALTER TABLE public.location_languages OWNER TO django;

--
-- Name: location_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE location_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.location_languages_id_seq OWNER TO django;

--
-- Name: location_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE location_languages_id_seq OWNED BY location_languages.id;


--
-- Name: location_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('location_languages_id_seq', 1, false);


--
-- Name: location_relatedobject; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE location_relatedobject (
    id integer NOT NULL,
    location_id integer NOT NULL,
    object_id integer NOT NULL
);


ALTER TABLE public.location_relatedobject OWNER TO django;

--
-- Name: location_relatedobject_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE location_relatedobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.location_relatedobject_id_seq OWNER TO django;

--
-- Name: location_relatedobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE location_relatedobject_id_seq OWNED BY location_relatedobject.id;


--
-- Name: location_relatedobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('location_relatedobject_id_seq', 10, true);


--
-- Name: location_religion; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE location_religion (
    id integer NOT NULL,
    location_id integer NOT NULL,
    religion_id integer NOT NULL
);


ALTER TABLE public.location_religion OWNER TO django;

--
-- Name: location_religion_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE location_religion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.location_religion_id_seq OWNER TO django;

--
-- Name: location_religion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE location_religion_id_seq OWNED BY location_religion.id;


--
-- Name: location_religion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('location_religion_id_seq', 1, false);


--
-- Name: object; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE object (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    status character varying(5),
    alignment character varying(3),
    objtype character varying(5),
    rarity character varying(3),
    properties text,
    ppvalue smallint,
    gpvalue smallint,
    spvalue smallint,
    cpvalue smallint,
    fabvalue boolean NOT NULL,
    deactivated boolean NOT NULL,
    comments text,
    canon_level character varying(5),
    creation_date date,
    last_updated date
);


ALTER TABLE public.object OWNER TO django;

--
-- Name: object_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE object_author (
    id integer NOT NULL,
    object_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.object_author OWNER TO django;

--
-- Name: object_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE object_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.object_author_id_seq OWNER TO django;

--
-- Name: object_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE object_author_id_seq OWNED BY object_author.id;


--
-- Name: object_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('object_author_id_seq', 17, true);


--
-- Name: object_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.object_id_seq OWNER TO django;

--
-- Name: object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE object_id_seq OWNED BY object.id;


--
-- Name: object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('object_id_seq', 38, true);


--
-- Name: object_image; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE object_image (
    id integer NOT NULL,
    object_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.object_image OWNER TO django;

--
-- Name: object_image_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE object_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.object_image_id_seq OWNER TO django;

--
-- Name: object_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE object_image_id_seq OWNED BY object_image.id;


--
-- Name: object_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('object_image_id_seq', 4, true);


--
-- Name: object_relationship; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE object_relationship (
    id integer NOT NULL,
    object1_id integer NOT NULL,
    object2_id integer NOT NULL,
    relation12 character varying(10),
    relation21 character varying(10),
    comments text,
    canon_level character varying(5)
);


ALTER TABLE public.object_relationship OWNER TO django;

--
-- Name: object_relationship_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE object_relationship_author (
    id integer NOT NULL,
    objectrelationship_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.object_relationship_author OWNER TO django;

--
-- Name: object_relationship_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE object_relationship_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.object_relationship_author_id_seq OWNER TO django;

--
-- Name: object_relationship_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE object_relationship_author_id_seq OWNED BY object_relationship_author.id;


--
-- Name: object_relationship_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('object_relationship_author_id_seq', 1, false);


--
-- Name: object_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE object_relationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.object_relationship_id_seq OWNER TO django;

--
-- Name: object_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE object_relationship_id_seq OWNED BY object_relationship.id;


--
-- Name: object_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('object_relationship_id_seq', 5, true);


--
-- Name: religion; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE religion (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    comments text,
    canon_level character varying(5)
);


ALTER TABLE public.religion OWNER TO django;

--
-- Name: religion_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE religion_author (
    id integer NOT NULL,
    religion_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.religion_author OWNER TO django;

--
-- Name: religion_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE religion_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.religion_author_id_seq OWNER TO django;

--
-- Name: religion_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE religion_author_id_seq OWNED BY religion_author.id;


--
-- Name: religion_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('religion_author_id_seq', 1, true);


--
-- Name: religion_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE religion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.religion_id_seq OWNER TO django;

--
-- Name: religion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE religion_id_seq OWNED BY religion.id;


--
-- Name: religion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('religion_id_seq', 1, true);


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO django;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO django;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 17, true);


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO django;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO django;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 9, true);


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO django;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO django;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 114, true);


--
-- Name: web_adventure; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_adventure (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    url character varying(200),
    comments text,
    canon_level character varying(5),
    price character varying(50),
    sessions smallint,
    minnumplayers smallint,
    maxnumplayers smallint,
    minlevel smallint,
    maxlevel smallint,
    creation_date date,
    last_updated date
);


ALTER TABLE public.web_adventure OWNER TO django;

--
-- Name: web_adventure_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_adventure_author (
    id integer NOT NULL,
    adventure_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.web_adventure_author OWNER TO django;

--
-- Name: web_adventure_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_adventure_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_adventure_author_id_seq OWNER TO django;

--
-- Name: web_adventure_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_adventure_author_id_seq OWNED BY web_adventure_author.id;


--
-- Name: web_adventure_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_adventure_author_id_seq', 43, true);


--
-- Name: web_adventure_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_adventure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_adventure_id_seq OWNER TO django;

--
-- Name: web_adventure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_adventure_id_seq OWNED BY web_adventure.id;


--
-- Name: web_adventure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_adventure_id_seq', 14, true);


--
-- Name: web_adventure_image; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_adventure_image (
    id integer NOT NULL,
    adventure_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.web_adventure_image OWNER TO django;

--
-- Name: web_adventure_image_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_adventure_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_adventure_image_id_seq OWNER TO django;

--
-- Name: web_adventure_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_adventure_image_id_seq OWNED BY web_adventure_image.id;


--
-- Name: web_adventure_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_adventure_image_id_seq', 29, true);


--
-- Name: web_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_author (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    nickname character varying(100),
    otherdata text,
    url character varying(200)
);


ALTER TABLE public.web_author OWNER TO django;

--
-- Name: web_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_author_id_seq OWNER TO django;

--
-- Name: web_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_author_id_seq OWNED BY web_author.id;


--
-- Name: web_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_author_id_seq', 21, true);


--
-- Name: web_author_photo; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_author_photo (
    id integer NOT NULL,
    author_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.web_author_photo OWNER TO django;

--
-- Name: web_author_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_author_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_author_photo_id_seq OWNER TO django;

--
-- Name: web_author_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_author_photo_id_seq OWNED BY web_author_photo.id;


--
-- Name: web_author_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_author_photo_id_seq', 1, true);


--
-- Name: web_character_relatedlocation; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_character_relatedlocation (
    id integer NOT NULL,
    character_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.web_character_relatedlocation OWNER TO django;

--
-- Name: web_character_relatedlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_character_relatedlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_character_relatedlocation_id_seq OWNER TO django;

--
-- Name: web_character_relatedlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_character_relatedlocation_id_seq OWNED BY web_character_relatedlocation.id;


--
-- Name: web_character_relatedlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_character_relatedlocation_id_seq', 1, false);


--
-- Name: web_character_relatedobject; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_character_relatedobject (
    id integer NOT NULL,
    character_id integer NOT NULL,
    object_id integer NOT NULL
);


ALTER TABLE public.web_character_relatedobject OWNER TO django;

--
-- Name: web_character_relatedobject_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_character_relatedobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_character_relatedobject_id_seq OWNER TO django;

--
-- Name: web_character_relatedobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_character_relatedobject_id_seq OWNED BY web_character_relatedobject.id;


--
-- Name: web_character_relatedobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_character_relatedobject_id_seq', 1, false);


--
-- Name: web_chronicle; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_chronicle (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    url character varying(200),
    comments text,
    canon_level character varying(5),
    adventure_id integer,
    creation_date date,
    last_updated date
);


ALTER TABLE public.web_chronicle OWNER TO django;

--
-- Name: web_chronicle_author; Type: TABLE; Schema: public; Owner: django; Tablespace: 
--

CREATE TABLE web_chronicle_author (
    id integer NOT NULL,
    chronicle_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.web_chronicle_author OWNER TO django;

--
-- Name: web_chronicle_author_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_chronicle_author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_chronicle_author_id_seq OWNER TO django;

--
-- Name: web_chronicle_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_chronicle_author_id_seq OWNED BY web_chronicle_author.id;


--
-- Name: web_chronicle_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_chronicle_author_id_seq', 13, true);


--
-- Name: web_chronicle_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE web_chronicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.web_chronicle_id_seq OWNER TO django;

--
-- Name: web_chronicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE web_chronicle_id_seq OWNED BY web_chronicle.id;


--
-- Name: web_chronicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('web_chronicle_id_seq', 4, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE "character" ALTER COLUMN id SET DEFAULT nextval('character_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_author ALTER COLUMN id SET DEFAULT nextval('character_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_image ALTER COLUMN id SET DEFAULT nextval('character_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_languages ALTER COLUMN id SET DEFAULT nextval('character_languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_relatedlocation ALTER COLUMN id SET DEFAULT nextval('character_relatedlocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_relatedobject ALTER COLUMN id SET DEFAULT nextval('character_relatedobject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_relationship ALTER COLUMN id SET DEFAULT nextval('character_relationship_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_relationship_author ALTER COLUMN id SET DEFAULT nextval('character_relationship_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE character_religion ALTER COLUMN id SET DEFAULT nextval('character_religion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE charloc_relationship ALTER COLUMN id SET DEFAULT nextval('charloc_relationship_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE charloc_relationship_author ALTER COLUMN id SET DEFAULT nextval('charloc_relationship_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature ALTER COLUMN id SET DEFAULT nextval('creature_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature_author ALTER COLUMN id SET DEFAULT nextval('creature_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature_image ALTER COLUMN id SET DEFAULT nextval('creature_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature_languages ALTER COLUMN id SET DEFAULT nextval('creature_languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature_relatedlocation ALTER COLUMN id SET DEFAULT nextval('creature_relatedlocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature_relatedobject ALTER COLUMN id SET DEFAULT nextval('creature_relatedobject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature_relationship ALTER COLUMN id SET DEFAULT nextval('creature_relationship_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE creature_relationship_author ALTER COLUMN id SET DEFAULT nextval('creature_relationship_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE image ALTER COLUMN id SET DEFAULT nextval('image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE image_author ALTER COLUMN id SET DEFAULT nextval('image_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE language ALTER COLUMN id SET DEFAULT nextval('language_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE language_author ALTER COLUMN id SET DEFAULT nextval('language_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE location_author ALTER COLUMN id SET DEFAULT nextval('location_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE location_image ALTER COLUMN id SET DEFAULT nextval('location_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE location_languages ALTER COLUMN id SET DEFAULT nextval('location_languages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE location_relatedobject ALTER COLUMN id SET DEFAULT nextval('location_relatedobject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE location_religion ALTER COLUMN id SET DEFAULT nextval('location_religion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE object ALTER COLUMN id SET DEFAULT nextval('object_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE object_author ALTER COLUMN id SET DEFAULT nextval('object_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE object_image ALTER COLUMN id SET DEFAULT nextval('object_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE object_relationship ALTER COLUMN id SET DEFAULT nextval('object_relationship_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE object_relationship_author ALTER COLUMN id SET DEFAULT nextval('object_relationship_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE religion ALTER COLUMN id SET DEFAULT nextval('religion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE religion_author ALTER COLUMN id SET DEFAULT nextval('religion_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_adventure ALTER COLUMN id SET DEFAULT nextval('web_adventure_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_adventure_author ALTER COLUMN id SET DEFAULT nextval('web_adventure_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_adventure_image ALTER COLUMN id SET DEFAULT nextval('web_adventure_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_author ALTER COLUMN id SET DEFAULT nextval('web_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_author_photo ALTER COLUMN id SET DEFAULT nextval('web_author_photo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_character_relatedlocation ALTER COLUMN id SET DEFAULT nextval('web_character_relatedlocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_character_relatedobject ALTER COLUMN id SET DEFAULT nextval('web_character_relatedobject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_chronicle ALTER COLUMN id SET DEFAULT nextval('web_chronicle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE web_chronicle_author ALTER COLUMN id SET DEFAULT nextval('web_chronicle_author_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
49	Can add Creature	17	add_creature
50	Can change Creature	17	change_creature
51	Can delete Creature	17	delete_creature
52	Can add Creature's Relationship	18	add_creaturerelationship
53	Can change Creature's Relationship	18	change_creaturerelationship
54	Can delete Creature's Relationship	18	delete_creaturerelationship
55	Can add Language	19	add_language
56	Can change Language	19	change_language
57	Can delete Language	19	delete_language
58	Can add religion	20	add_religion
59	Can change religion	20	change_religion
60	Can delete religion	20	delete_religion
61	Can add image	21	add_image
62	Can change image	21	change_image
63	Can delete image	21	delete_image
64	Can add Tag	22	add_tag
65	Can change Tag	22	change_tag
66	Can delete Tag	22	delete_tag
67	Can add Tagged Item	23	add_taggeditem
68	Can change Tagged Item	23	change_taggeditem
69	Can delete Tagged Item	23	delete_taggeditem
70	Can add Character-Location Relationship	24	add_characterlocationrelationship
71	Can change Character-Location Relationship	24	change_characterlocationrelationship
72	Can delete Character-Location Relationship	24	delete_characterlocationrelationship
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
37	Can add migration history	13	add_migrationhistory
38	Can change migration history	13	change_migrationhistory
39	Can delete migration history	13	delete_migrationhistory
40	Can add author	14	add_author
41	Can change author	14	change_author
42	Can delete author	14	delete_author
22	Can add Character	8	add_character
23	Can change Character	8	change_character
24	Can delete Character	8	delete_character
25	Can add Character's Relationship	9	add_characterrelationship
26	Can change Character's Relationship	9	change_characterrelationship
27	Can delete Character's Relationship	9	delete_characterrelationship
28	Can add Location	10	add_location
29	Can change Location	10	change_location
30	Can delete Location	10	delete_location
31	Can add Object	11	add_object
32	Can change Object	11	change_object
33	Can delete Object	11	delete_object
34	Can add Object's Relationship	12	add_objectrelationship
35	Can change Object's Relationship	12	change_objectrelationship
36	Can delete Object's Relationship	12	delete_objectrelationship
43	Can add Adventure	15	add_adventure
44	Can change Adventure	15	change_adventure
45	Can delete Adventure	15	delete_adventure
46	Can add Chronicle	16	add_chronicle
47	Can change Chronicle	16	change_chronicle
48	Can delete Chronicle	16	delete_chronicle
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
3	valver				sha1$n9CoiISzhwY0$8b4acb21bb92722ad8437ec931567a3f942fb0da	t	t	f	2011-10-12 08:32:20+02	2011-09-19 18:11:30+02
1	admin			a@a.es	sha1$UZTMIMvBJcnF$c0700a85e86b2f72ae7aabd81758bc7434a77306	t	t	t	2011-12-11 11:53:14.573468+01	2011-08-21 20:10:04+02
2	steinkel				sha1$l756P8ihcCWK$a4e3e5b57e268183a940667338f1f27fc4b94754	t	t	f	2011-12-11 12:38:27.355642+01	2011-08-23 22:36:39+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
73	2	22
74	2	23
75	2	24
76	2	25
77	2	26
78	2	27
79	2	28
80	2	29
81	2	30
82	2	31
83	2	32
84	2	33
85	2	34
86	2	35
87	2	36
88	2	40
89	2	41
90	2	42
91	2	43
92	2	44
93	2	45
94	2	46
95	2	47
96	2	48
97	2	49
98	2	50
99	2	51
100	2	52
101	2	53
102	2	54
103	2	55
104	2	56
105	2	57
106	2	58
107	2	59
108	2	60
109	2	61
110	2	62
111	2	63
112	2	64
113	2	65
114	2	66
115	2	67
116	2	68
117	2	69
118	2	70
119	2	71
120	2	72
121	3	22
122	3	23
123	3	24
124	3	25
125	3	26
126	3	27
127	3	28
128	3	29
129	3	30
130	3	31
131	3	32
132	3	33
133	3	34
134	3	35
135	3	36
136	3	40
137	3	41
138	3	42
139	3	43
140	3	44
141	3	45
142	3	46
143	3	47
144	3	48
145	3	49
146	3	50
147	3	51
148	3	52
149	3	53
150	3	54
151	3	55
152	3	56
153	3	57
154	3	58
155	3	59
156	3	60
157	3	61
158	3	62
159	3	63
160	3	64
161	3	65
162	3	66
163	3	67
164	3	68
165	3	69
166	3	70
167	3	71
168	3	72
\.


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: django
--

COPY "character" (id, name, gender, level, "AC", move, moral, saveroll, hitpoints, alignment, description, species, startdate, enddate, status, weapons, pncorpc, deactivated, age, comments, canon_level, profession, strengthstat, dexteritystat, constitutionstat, intelligencestat, wisdomstat, charismastat, treasurevalue, creation_date, last_updated, quote) FROM stdin;
17	Zenobia Husai	F	01	9	9	06	G1	5	L	Mujer de mediana edad, de fuerte carácter y aspecto exótico, debido a la sangre visirtaní que corre por sus venas. Su pelo es negro y sus ojos de marrón intenso.	Hum	\N	\N	Al		NPC	f	45		C	Wr	\N	\N	\N	\N	\N	\N		2011-11-05	2011-11-05	\N
16	Darga del Bali	M	05	6	9	08	G5	25	L	Darga es un hombre alto y fuerte, de piel negra, como todos su congeneres del Barambali, vestido descuidadamente con una túnica larga de color marrón, raída por el uso. Su cabeza está tan libre de pelo como un proyectil de catapulta, y brilla bajo la luz del sol, perlada de gotas de sudor y aceite de pescado. Habla con un hilo de voz muy quedo, casi inaudible, arrastrando las últimas letras de cada palabra como si le costase acabar sus frases, con ese particular acento extranjero.	Hum	\N	\N	Al		NPC	f	38	Amigo inseparable de Balazar. Tanto Balazar como Darga están inspirados en la célebre novel de Melville, Moby Dick. Uno de los libros favoritos de Steinkel.	C	Wr	\N	\N	\N	\N	\N	\N		2011-12-06	2011-12-06	
18	Denter Basa	M	03	6	9	06	G3	15	C	El jefe de la casa Basa, enfrentada a los Remesul en los negocios, es Denter Basa, apodado el zorro. Hombre de mediana edad, alto y fornido. Pelo negro largo, ojos marrones oscuros.	Hum	\N	\N	Al		NPC	f	35	El símbolo de los Basa es un kraken con una B incrustada en su cabeza sobre fondo azul marino y reborde dorado.\r\n	C	Wr	\N	\N	\N	\N	\N	\N		2011-11-01	2011-11-01	
11	Valver Regnus	M	14	3	30/10	06	C8	70	N	asdasdas	Hum	300	\N	Al	sadfdsfsd fsd gdfg dfg dfg f gdf	PC	f	24		AP	Rg	\N	\N	\N	\N	\N	\N		2011-11-01	2011-11-01	
7	Saddin Konnin	M	11	-4	30/10	10	G11	63	N	Los duros inicios hicieron que Saddin se forjara en el fuego de la batalla. Allí donde la promesa de nuevas aventuras y desafíos existiera, estaba nuestro héroe.\r\n \r\nBatalla tras batalla, la moral y la esperanza de Saddin, que veía como sus amigos y compañeros morían irremediablemente, se fue debilitando.\r\n \r\nLa crudeza de la guerra y la vileza que llegó a presenciar, fue debilitando la fe que Saddin tenía en el Hombre.	Hum	\N	\N	Al	Espada Bastarda +2\r\nDaga\r\nBallesta ligera	PC	f	31		NEW	Pl	17	17	17	17	17	17	200 mo	2011-11-01	2011-11-01	
8	Galian	F	10	3	30/10	10	L10	57	N	Altura: 168 cm\r\npeso: 55 kg\r\nCabello: castaño\r\nOjos: marrón verdoso\r\n	Hum	\N	\N	Al	Daga +1 (2)\r\nHonda\r\nArco Largo\r\n\r\n	PC	f		Tesoro: 7500 mo	NEW	Ex	\N	\N	\N	\N	\N	\N		2011-12-06	2011-12-06	
9	Sharra Nirthanbei	F	10	2	30/10	10	L10	45	N	Altura: 166 cm<br/>\r\nPeso: 52 kg<br/>\r\nCabello: Rojizo<br/>\r\nOjos: Oscuros<br/>\r\n	Hum	\N	\N	Al	Ballesta Ligera<br/>\r\nCimitarra +2<br/>\r\nDaga<br/>\r\nDardos<br/>\r\n	PC	f	25	Tesoro: +25000	NEW	As	\N	\N	\N	\N	\N	\N		2011-12-07	2011-12-07	...todos mis enemigos están muertos.
15	Balazar Malaespina	M	10	5	9	09	G10	60	L	Una mirada a Balazar basta para darse cuenta de que es en verdad un viejo lobo de mar que ha vivido innumerables aventuras a lo largo de su agitada vida. En sus tiempos mozos sirvió en un ballenero durante muchos años, enfrentándose como arponero de chalupa a estos leviatanes del mar, poderosos como pocas criaturas en los océanos. De hecho, su cuerpo recio y duro como el pedernal muestra mil y una cicatrices, medallas de honor contraidas en su titánicas luchas contras docenas de bestias marinas a lo largo y ancho del mundo.	Hum	\N	\N	Al	1 ataque arma convencional.	NPC	f	52		C	Wr	16	13	12	14	14	15	3000	2011-12-06	2011-12-10	
32	Camil Hojafuerte	M	07	6	9	09	G7	45	L	Camil es un hombre de mediana edad y constitución recia, más bien bajo y algo rechoncho. Su cara es redondeada, adornada con un gran bigote negro de puntas canas. Generalmente viste ropajes oscuros, cota de mallas, espada al cinto larga y capa negra.\r\n\r\nCamil es el burgomaestre de la ciudad de Robleda y Pasoraudo, sólo supeditado al mandato de la corona y el duque de la Marca, Reginbrad.	Hum	\N	\N	Al	1 ataque con su espada larga +2, conocida como Legisladora.	NPC	f	45		C	Wr	16	10	14	12	13	12	2500	2011-12-10	2011-12-10	
10	Lakus	M	10	-1	40/15	10	G10	44	C	Si nunca has visto un elfo antes, lo primero que salta a la vista de Lakus, es la gracia con que se mueve. Los que han tenido más contacto con esta longeva raza percibirán que algo no les encaja. Los movimientos fluidos y precisos típicos de los elfos se encuentran en Lakus mezclados con el estilo de los duelistas de Visirtan, secos y rápidos.<br/><br/>\r\n\r\nLa segunda impresión que da es de gran edad. No tiene canas en su pelo, que no lo lleva corto y suelto al estilo elfico sino largo y en trenzas como los guerreros norteños. Tampoco hay arrugas en su rostro de facciones suaves y regulares capaz de transmitir mucha emoción, quien le conoce bien se da cuenta de que no siempre la emoción que transmite es la que siente. Sin embargo, le rodea un aire crepuscular.<br/><br/>\r\n\r\nSuele llevar ropajes del estilo típico de la marca, ajustados y prácticos, que dejan libertad de movimiento, salpicados aquí y allá  con chilabas de Neferu o petos de Ungoloz de vez en cuando. Lo más destacable de su equipamiento es un alfanje al estilo de Visirtan y un látigo. Habla la lengua de Valion con acento de la Marca, aunque a veces usa palabras y giros arcaicos. Aunque es capaz de usar un registro lingüístico muy elevado, se siente cómodo usando el argot de las calles de Robleda condimentado con juramentos Visirtanies. Lakus es un narrador infatigable y fuente inagotable de anécdotas, aunque tiende a remarcar que los implicados en sus historias están muertos a día de hoy.	Elf	1035	\N	Al	Alfanje +1<br/>\r\nLátigo<br/>\r\nBallesta Ligera<br/>\r\nDaga<br/>	PC	f	172	Surgió como una inspiración	APC	NA	16	15	14	12	13	14	1500 mo	2011-10-30	2011-10-30	«...me la envaino». Crónicas de Sharra Nirthanbei
33	Ethan Ariakos	M	01	4		\N	G1	8	L	<p>Hijo menor de un caballero venido a menos. Ha dedicado su vida a la búsqueda de la justicia.</p>\r\n\r\n<p>Extremadamente leal con sus aliados, es el primero en cargar a la batalla y el último en retirarse.</p>\r\n<p>Siempre se comporta como un caballero, incluso con sus enemigos.</p>\r\n\r\n<p>Como equipo tiene:Mochila, Raciones (5), Manta, 2 Odres, Yesca, S.Sagrado Plata, 8 Antorchas</p>\r\n<p>Como habilidades especiales tiene: Imposición de manos (2pg/niv), Sanar Enfermedad, Inmune a Enfermedad, Detectar el mal 20mts, Aura Protección vs Mal, +2 a los Tiros de Salvación.</p>\r\n\r\n\r\n	Hum	\N	\N	Al	Espada Larga (1d8+2)<br/>\r\nDaga (1d4+2)\r\n	NPC	f			AP	Pl	16	11	10	12	13	13	21 mo y 2 mp	2011-03-09	2011-03-09	
34	Duque Reginbrad	M	\N	-3		\N	\N	0	\N	El Duque Reginbrad, primo de la Reina Vigdis, fue señalado como duque de Robleda, siendo ya él señor de la Marca del Este y general Decurio del Ejército del Este.	Hum	\N	\N	\N		NPC	f	40		C	Wr	\N	\N	\N	\N	\N	\N		2011-12-11	2011-12-11	
35	Turinos Labadía	M	\N	0		\N	\N	0	\N	<p>De los Labadía de Robleda, sirvió a las ordenes de Reginbrad en el ejército del Este distinguiéndose por su coraje ante el enemigo en las campañas para expulsar a los orcos de Lasminas. Turinos presenta una complexión fuerte y un gesto duro, luce cabello azabache y ojos marrones, y podría ser un hombre atractivo de no ser por una gran cicatriz que recorre su cara desde el pómulo derecho hasta la oreja, una herida de guerra que recibió en el asalto de una posición orca en un desfiladero minero al este de las Colinas Azules. </p>\r\n\r\n<p>Turinos habla con inusitada parsimonia, signo de su aplomo y confianza. El capitán de la guardia es un espadachín formidable, fuerte y ágil, que cuenta con la devoción de los guardias a su cargo, fruto de su carácter abierto y sus orígenes humildes.</p>	Hum	\N	\N	\N		NPC	f	0		C	Wr	\N	\N	\N	\N	\N	\N		2011-12-11	2011-12-11	
\.


--
-- Data for Name: character_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_author (id, character_id, author_id) FROM stdin;
49	17	3
66	11	1
67	7	1
72	16	3
73	18	3
76	9	1
81	32	3
82	15	3
83	10	1
84	10	2
86	33	4
87	34	5
89	35	3
\.


--
-- Data for Name: character_image; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_image (id, character_id, image_id) FROM stdin;
28	7	5
33	9	4
35	10	3
37	33	19
\.


--
-- Data for Name: character_languages; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_languages (id, character_id, language_id) FROM stdin;
44	17	1
51	7	1
57	32	1
58	15	1
59	10	1
60	10	2
\.


--
-- Data for Name: character_relatedlocation; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_relatedlocation (id, character_id, location_id) FROM stdin;
93	17	19
108	11	2
109	11	4
110	7	2
111	8	2
117	16	9
118	18	2
121	9	2
129	32	2
130	32	20
131	15	9
132	10	9
133	10	2
134	10	5
135	34	5
137	35	2
\.


--
-- Data for Name: character_relatedobject; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_relatedobject (id, character_id, object_id) FROM stdin;
181	11	37
182	7	16
183	7	3
184	7	6
185	7	7
186	8	3
187	8	2
188	8	11
189	8	21
199	9	32
206	10	24
207	10	3
208	10	11
209	10	6
210	10	7
\.


--
-- Data for Name: character_relationship; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_relationship (id, character1_id, character2_id, relation12, relation21, comments, canon_level) FROM stdin;
2	9	7	GROUP	GROUP		NEW
3	7	10	GROUP	GROUP		NEW
7	15	16	FRIEND	MASTER	Balazar y Darga son compañeros de aventuras desde hace muchos años. Ambos sirvieron en la flota ballenera de Reino Bosque, viviendo mil y una aventuras. Actualmente, ambos viven en el Villorio del Estrecho de las Tormentas.	C
8	10	15	NEMESIS	NEMESIS		AP
11	35	34	UNDERLING	LORD		C
\.


--
-- Data for Name: character_relationship_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_relationship_author (id, characterrelationship_id, author_id) FROM stdin;
4	7	3
5	8	1
8	11	3
\.


--
-- Data for Name: character_religion; Type: TABLE DATA; Schema: public; Owner: django
--

COPY character_religion (id, character_id, religion_id) FROM stdin;
25	17	1
30	7	1
33	32	1
34	15	1
35	10	1
\.


--
-- Data for Name: charloc_relationship; Type: TABLE DATA; Schema: public; Owner: django
--

COPY charloc_relationship (id, character_id, location_id, relation, comments, canon_level) FROM stdin;
2	9	2	L1		AP
3	17	2	3		\N
\.


--
-- Data for Name: charloc_relationship_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY charloc_relationship_author (id, characterlocationrelationship_id, author_id) FROM stdin;
\.


--
-- Data for Name: creature; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature (id, name, gender, hitdice, "AC", treasurevalue, "XPvalue", move, moral, saveroll, alignment, description, attacks, deactivated, comments, canon_level, creation_date, last_updated) FROM stdin;
19	Minotauro	\N	6	6	2000	275	12	12	G6	C	Los minotauros son humanoides enormes con cuerpo cubierto de pelo, pezuñas y cabeza de toro. Son seres antiguos, se dice que creados por los titanes de antaño para custodiar sus tesoros. Hoy, se les puede encontrar en las llanuras y estepas de las Tierras Nómadas, habitando en olvidadas ruinas de antaño, bajo tierra.	1 cornada, 1 mordedura o 1 ataque con arma convencional +2 por FUE\r\n1d6/1d6 o arma +2	f		C	2011-12-10	2011-12-10
8	Zombi	N	2	8	Ninguno	20	9	12	G1	C	Los zombis son muertos vivientes, cadáveres de fallecidos reanimados por las artes oscuras de malvados clérigos y hechiceros.	1 ataque de golpetazo o arma convencional.	f		C	2011-12-10	2011-12-10
5	Doppelganger	N	4	5	1500 mo (1100 mo)	125	9 metros	08	G10	C	Especie de humanoide que adopta la apariencia de cualquier criatura de forma humana que vea.\r\nInmune a los conjuros de dormir y hechizar monstruo.	ataque: 1\r\ndaño: 1d12	f		C	2011-11-06	2011-11-06
21	Goblin	\N	1	6	125	5	9	06	G1	C	Los goblins son los más pequeños de los trasgos, y los más numerosos. Son criaturas ladinas, malvadas y crueles. Suelen vivir en las montañas, lamedales y cavernas. Se pueden encontrar por todo el mundo de la Marca.	1 ataque arma convencional.	f		C	2011-12-10	2011-12-10
6	Gnoll	N	2	5	250 mo	20	9 metros	08	G2	C	Merodeadores a medio camino entre hienas y humanoides. De escasa inteligencia pero particularmente fuertes, tienen un +1 al manejo de armas.\r\nSe reúnen en grandes manadas. Por cada 20 gnolls, destaca un individuo líder con 16 puntos de golpe o más y atacará como un monstruo de 3 dados de golpe.	ataque: 1 arma\r\ndaño: con arma +1\r\n	f		C	2011-12-06	2011-12-06
9	Yeti	\N	5	5	1500	150	12	08	G4	N	Los yetis son seres vagamente humanoides, de aspecto feroz, cubiertos de pelo blanco, duro y espeso, grandes y largos brazos peludos y poderosas piernas. Viven en las montañas nevadas, en lugares inhóspitos y fríos. A pesar de su aspecto, son seres inteligentes y pueden ser muy peligrosos si se les molesta.	2 zarpados o 1 mordedura\r\n1d8/1d8 o 1d4	f		C	2011-12-10	2011-12-10
10	Tiranosaurio Rex	\N	20	3	80.000	2375	36	11	G10	N	Se trata de uno de los dinosaurios depredadores más grandes de la Marca, sólo superados por sus parientes los espinosaurios de Ziyarid.	1 mordisco, 6d6 de daño. Engullen con 1 resultado natural de 20 en 1d20.	f		C	2011-12-10	2011-12-10
12	Oso Lechuza	\N	5	5	1500	175	12	09	G3	C	Una criatura temida como pocas, el oso lechuza es una abominación arcana que mezcla el cuerpo de un enorme oso dotado de horribles garras y cabeza de bestial lechuza. son seres violentos, crueles, que suelen matar por puro placer. Se les encuentra en frondas y cavernas solitarias.	2 zarpazos o 1 mordedura\r\n1d8/1d8 o 1d4	f		C	2011-12-10	2011-12-10
13	Necrófago	\N	2	6	500	25	9	09	G2	C	Muertos vivientes horribles, de aspecto parecido al del zombi, pero más fuertes y potentes. Se alimenta de cadáveres y carne humana y su toque puede paralizar.	2 garras o mordedura\r\n1d4/1d4 o 1d4 + especial	f		C	2011-12-10	2011-12-10
14	Momia	\N	5+1	3	1500	575	18	12	G5	C	Las momias son poderosos muertos vivientes, que han sido sometidos a complicados embalsamamientos y rituales que les mantienen con vida de manera preternatural. Es raro encontrarse con una de estas criaturas, y potencialmente letale. Se les suele encontrar en Neferu, en oscuras y olvidadas catacumbas hipogeas.\r\nToda criatura que encuentre una momia debe superar una tirada de salvación contra parálisis o quedará paralizada de puro terror. También contagian una peligrosa enfermedad por contacto, que sólo puede ser curada con un conjuro de extirpar maldición.	Golpetazo de 1d12 + enfermedad	f		C	2011-12-10	2011-12-10
15	Grifo	\N	7	5	2500	450	36 metros, 120 volando	08	G2	N	Los grifos son antiguas criaturas con cabeza, alas y extremidades frontales de águila y cuerpo de león. Pueden volar y transportar a un jinete en vuelo. Son seres orgullosos, poderosos y fuertes, muy territoriales. Se alimentan de caballos salvajes.	2 garras o 1 mordisco.\r\n1d4/1d4 o 2d8	f		C	2011-12-10	2011-12-10
16	Gusano Carroñero	\N	3+1	7	800	75	12	09	G2	N	Son enormes gusanos que pueden alcanzar un tamaño de 2 o 3 metros. Se mueven arrastrándose sobre su cuerpo, trepando por techos y paredes. Se alimentan con todo lo que encuentren, plantas o animales, que engullen asistidos por sus tentáculos, que rodean sus poderosas mandíbulas. Un golpde uno de sus tentáculos pueden paralizar a sus víctimas si no superan una tirada de salvación contra parálisis.	Tentáculos + paralísis\r\n1d6	f		C	2011-12-10	2011-12-10
17	Orco	\N	1	6	125	10	9	06	G1	C	Los orcos fueron creados por Penumbra en los albores del tiempo, trasuntos horribles de elfos y humanos, retorcidos bajo el poder del mal en Espectra. Odiados por todos, los orcos son poderosas criaturas trasgoides de aspecto bestial, crueles y ladinos. Habitan por toda la Marca, especialmente en las montañas del norte, en las cuencas meridionales de la Marca del los Titanes.	1 ataque arma convencional.	f		C	2011-12-10	2011-12-10
18	Ogro	\N	4+1	5	1100	125	9	10	G4	C	Los ogros son parientes lejanos de los orcos y trasgos. Seres enormes, fuertes, de aspecto humanoide, pero bestiales, alcanzando los 3 o cuatro metros de altura. Son criaturas algo torpes y estúpidas, pero crueles, alimentándose de hombres y animales. Habitan en cuevas y pueden hallarse en compañía de orcos y trasgos.	1 ataque con arma convencional, generalmente un garrote, con +2 o +3 a la FUE.	f		C	2011-12-10	2011-12-10
4	Esqueleto	N	1	7	50 mc	10	6	12	G1	C	Muerto viviente, consistente en un esqueleto humano o humanoide animado mágicamente por hechiceros o clérigos malignos. Generalmente puede portar equipo y armadura, así como armas convencionales.	Arma convencional	f		C	2011-11-06	2011-12-10
22	Hobgoblin	N	1+1	6	125	15	9	08	G2	C	Los hobgoblins, o grandes trasgos, son criaturas similares a los goblins, pero más altos, robustos, fieros e inteligentes. Son hábiles guerreros y muestran buena pericia en el uso de las armas y las técnicas guerreras.	1 ataque de arma convencional.	f		C	2011-12-10	2011-12-10
11	Thoul	N	3	6	800	65	12	10	G3	C	Seres antiguos y malvados, creados por Penumbra en los albores de la civilización. De aspecto trasgoide, tienen la habilidad de paralizar a sus víctimas como los necrófagos. Los thouls regeneran 1 punto de golpe por asalto.	2 garras o arma convencional.	f		C	2011-12-10	2011-12-11
20	Osgo	N	3+1	3	400	75	9 metros	09	G3	C	Los osgos son los más grandes de los trasgos, también conocidos como trasgos negros o gigantes. Generalmente son líderes o jefes tribales, y acaudillan grandes huestes trasgoides.	1 ataque arma convencional con un +2 a la fuerza.	f		C	2011-12-10	2011-12-10
7	Gnomo	N	1	5	250 mo (125 mo)	10	6 metros	08	G1	L	<p>Raza humanoide emparentada con los enanos con gran aprecio por el oro y las gemas.\r\nBuenos trabajadores de la piedra e inclinados a la aventura debido a su curiosidad.\r\nSeres amistosos pero con especial animadversión por kobolds y goblins.</p>\r\n\r\n<p>Suelen tener un líder con 10 puntos de golpe que peleará como un monstruo con 2 dados de golpe. También puede haber un jefe de clan con 18 puntos de golpe y ataque de 4 dados de golpe. Mientras el líder permanece con vida el resto del clan o grupo tiene una moral de 8.</p>\r\n\r\n<p>Infravisión: 30 metros en oscuridad</p>	Ataque: 1 arma\r\nDaño: Con arma	f		C	2011-12-06	2011-12-06
23	Troll	\N	6+3	4	2000	650	36	10	G6	C	Los trolls son seres antiguos y malvados, creados en las mazmorras de Espectra por la misma Penumbra. Se dice en la leyenda, que del lodo de los lamedales oscuros y profundos de las simas subterráneas, Penumbra moldeó al primer troll, convirtiéndolo en una criatura obtusa, retorcida, desgarbada, levemente parecida a un gran trasgo, pero más delgado, encorvado y de largas y potentes extremidades. Hay pocos trolls en el el mundo de la Marca, pero en verdad son seres muy peligrosos, fuertes y crueles. Además, poseen el innatural poder para regenera daño recibio y extremidades amputadas.	2 garras o mordisco\r\n1d6/1d6 o 1d10	f		C	2011-12-10	2011-12-10
24	Banshees	F	7	0	4000	2000	9	12	\N	C	Las bashees son los espíritus errantes de las hembras elfas caídas en desgracia, aquellas que abandonaron la luz lunar de Aneirin para volver a los brazos de la Sombra o el caos de Silas. Seres condenados a vagar por siempre, custodiando a la noche las frondas y los fríos páramos, las criptas y bóvedas en el túmulo. Estas criaturas no pueden ser expulsadas o destruidas por clérigo alguno, pero un conjuro de Disipar el Mal destruirá a la criatura si falla su tirada de salvación contra conjuros.\r\nEl mero toque de este abominación espectral causa un dolor insoportable, debido al frío helador que trasmite. Adicionalmente, la criatura puede emitir un lamento horrible una vez al día que matará a todo aquel que falle su tirada de salvación contra muerte mágica en un radio de 150 metros.\r\nHoy quedan muy pocas banshees sobre la tierra, pero aquellos lo suficientemente desafortunados para trocar sus pasos con una de ellas, harían bien en correr tan rápido como pudieran.\r\n\r\nUna banshee no atacará a alguien de corazón puro que haya contemplado la luz del Nanoc. 	1 ataque o lamento de banshee\r\n\r\n1d8 + 1d4 por toque gélido	f		C	2011-12-11	2011-12-11
\.


--
-- Data for Name: creature_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature_author (id, creature_id, author_id) FROM stdin;
10	5	3
14	6	5
16	9	3
17	10	3
19	12	3
20	13	3
21	15	3
22	16	3
23	17	3
24	18	3
25	19	3
27	8	3
31	21	3
32	22	3
33	20	3
35	7	3
37	11	3
38	23	3
39	4	2
40	24	3
\.


--
-- Data for Name: creature_image; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature_image (id, creature_id, image_id) FROM stdin;
\.


--
-- Data for Name: creature_languages; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature_languages (id, creature_id, language_id) FROM stdin;
7	18	4
8	19	5
12	21	4
13	22	4
14	20	4
16	11	4
17	23	6
18	4	1
19	24	7
\.


--
-- Data for Name: creature_relatedlocation; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature_relatedlocation (id, creature_id, location_id) FROM stdin;
18	4	15
\.


--
-- Data for Name: creature_relatedobject; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature_relatedobject (id, creature_id, object_id) FROM stdin;
13	4	16
14	4	21
\.


--
-- Data for Name: creature_relationship; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature_relationship (id, creature1_id, creature2_id, relation12, relation21, comments, canon_level) FROM stdin;
3	4	5	GROUP	NEMESIS		C
\.


--
-- Data for Name: creature_relationship_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY creature_relationship_author (id, creaturerelationship_id, author_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
36	2011-08-22 20:25:24.499377+02	1	11	21	Honda -W-Cr-NA	1	
37	2011-08-22 20:25:48.487029+02	1	11	22	Jabalina -W-Cr-NA	1	
38	2011-08-22 20:26:10.752864+02	1	11	23	Lanza -W-Cr-NA	1	
39	2011-08-22 20:26:40.149298+02	1	11	24	Látigo -W-Cr-NA	1	
40	2011-08-22 20:27:07.248784+02	1	11	25	Látigo Pesado -W-Cr-NA	1	
41	2011-08-22 20:27:36.354937+02	1	11	26	Lucero del Alba -W-Cr-NA	1	
42	2011-08-22 20:28:13.414176+02	1	11	27	Martillo Ligero -W-Cr-NA	1	
43	2011-08-22 20:28:43.430355+02	1	11	28	Martillo de Guerra -W-Cr-NA	1	
44	2011-08-22 20:29:06.23038+02	1	11	29	Maza -W-Cr-NA	1	
10	2011-08-21 22:52:26.464221+02	1	8	1	Saddin Konnin -M-11-PC	2	Modificado/a description.
45	2011-08-22 20:29:27.098048+02	1	11	30	Pica Pesada -W-Cr-NA	1	
46	2011-08-22 20:29:48.327047+02	1	11	31	Pica Ligera -W-Cr-NA	1	
47	2011-08-22 20:30:12.641743+02	1	11	32	Tridente -W-Cr-NA	1	
48	2011-08-22 20:31:17.778252+02	1	11	33	Moneda de Oro -C-Cr-NA	1	
49	2011-08-22 20:31:58.646218+02	1	11	34	Moneda de Plata -C-Cr-NA	1	
50	2011-08-22 20:32:36.683709+02	1	11	35	Moneda de Cobre -C-Cr-NA	1	
51	2011-08-22 20:37:08.734311+02	1	8	3	Doppelganger -N-04-NA	1	
52	2011-08-22 20:41:07.529538+02	1	8	4	Esqueleto -N-01-NA	1	
53	2011-08-22 20:41:59.540919+02	1	8	3	Doppelganger -N-04-NA	2	Modificado/a weapons.
11	2011-08-22 18:38:08.791512+02	1	8	1	Saddin Konnin -M-11-PC	2	Modificado/a status.
54	2011-08-22 20:44:12.819858+02	1	8	4	Esqueleto -N-01-NA	2	Modificado/a description.
55	2011-08-22 20:48:58.489984+02	1	8	5	Gnoll -N-02-NA	1	
56	2011-08-22 20:49:54.828902+02	1	8	5	Gnoll -N-02-NA	2	Modificado/a description y weapons.
57	2011-08-22 20:50:05.803125+02	1	8	4	Esqueleto -N-01-NA	2	Modificado/a description y weapons.
58	2011-08-22 20:50:19.097264+02	1	8	3	Doppelganger -N-04-NA	2	Modificado/a description y weapons.
59	2011-08-22 20:56:50.655473+02	1	8	6	Gnomo -N-01-NA	1	
60	2011-08-22 20:57:27.670283+02	1	8	2	Sharra Nirthambei -F-10-PJ	3	
61	2011-08-22 20:57:27.681729+02	1	8	1	Saddin Konnin -M-11-PC	3	
62	2011-08-22 21:04:51.164648+02	1	8	7	Saddin Konnin -M-11-PC	1	
9	2011-08-21 22:38:52+02	1	11	1	Talisman Asylum -J-Ds-L	2	Modificado/a image.
8	2011-08-21 22:38:05+02	1	11	1	Talisman Asylum -J-Ds-L	1	
7	2011-08-21 22:36:33+02	1	9	1	Sharra Nirthambei -F-10-PJ -GROUP- Saddin Konnin -M-11-PC -GROUP- Sharra Nirthambei -F-10-PJ	2	Modificado/a canon_level.
6	2011-08-21 22:35:09+02	1	8	1	Saddin Konnin -M-11-PC	2	Modificado/a status, pncorpc, author y canon_level.
5	2011-08-21 20:26:34+02	1	8	2	Sharra Nirthambei -F-10-PJ	2	Modificado/a author y canon_level.
4	2011-08-21 20:26:22+02	1	14	1	Author object	1	
3	2011-08-21 20:16:26+02	1	9	1	Sharra Nirthambei -F-10-PJ -GROUP- Saddin Konnin -M-11-PJ -GROUP- Sharra Nirthambei -F-10-PJ	1	
2	2011-08-21 20:16:13+02	1	8	2	Sharra Nirthambei -F-10-PJ	1	
1	2011-08-21 20:11:00+02	1	8	1	Saddin Konnin -M-11-PJ)	1	
12	2011-08-22 18:51:41.888255+02	1	10	1	Asylum -None-None-None	1	
13	2011-08-22 18:52:06.162312+02	1	10	2	Robleda -Tv-R-N	1	
14	2011-08-22 19:42:20.333312+02	1	8	1	Saddin Konnin -M-11-PC	2	Modificado/a species y profession.
15	2011-08-22 19:58:30.692558+02	1	11	1	Talisman Asylum -J-Ds-L	3	
16	2011-08-22 20:10:53.148141+02	1	11	2	Arco Largo -W-Cr-L	1	
17	2011-08-22 20:14:27.014542+02	1	11	3	Flechas (10) -W-Cr-NA	1	
18	2011-08-22 20:15:21.570484+02	1	11	4	Arco Corto -W-Cr-NA	1	
19	2011-08-22 20:15:28.818864+02	1	11	2	Arco Largo -W-Cr-NA	2	Modificado/a alignment.
20	2011-08-22 20:16:17.913233+02	1	11	5	Ballesta Pesada -W-Cr-NA	1	
21	2011-08-22 20:17:07.072227+02	1	11	6	Virotes (20) -W-Cr-NA	1	
22	2011-08-22 20:17:42.464707+02	1	11	7	Ballesta Ligera -W-Cr-NA	1	
23	2011-08-22 20:18:21.981124+02	1	11	8	Bastón -W-Cr-NA	1	
24	2011-08-22 20:18:52.934893+02	1	11	9	Cachiporra -W-Cr-NA	1	
25	2011-08-22 20:19:20.067188+02	1	11	10	Cimitarra -W-Cr-NA	1	
26	2011-08-22 20:19:51.85603+02	1	11	11	Daga -W-Cr-NA	1	
27	2011-08-22 20:20:34.619723+02	1	11	12	Daga de Plata -W-Cr-N	1	
28	2011-08-22 20:21:03.914001+02	1	11	13	Dardo -W-Cr-NA	1	
29	2011-08-22 20:21:29.892148+02	1	11	14	Espada Corta -W-Cr-NA	1	
30	2011-08-22 20:22:01.100378+02	1	11	15	Espada Larga -W-Cr-NA	1	
31	2011-08-22 20:22:51.379996+02	1	11	16	Espada Bastarda -W-Cr-NA	1	
32	2011-08-22 20:23:33.590955+02	1	11	17	Espada de dos manos -W-Cr-NA	1	
33	2011-08-22 20:24:04.665479+02	1	11	18	Garrote -W-Cr-NA	1	
34	2011-08-22 20:24:28.901984+02	1	11	19	Hacha de Combate -W-Cr-NA	1	
35	2011-08-22 20:24:56.802991+02	1	11	20	Hacha de Mano -W-Cr-NA	1	
63	2011-08-22 21:10:04.158006+02	1	8	8	Galian -F-10-PC	1	
64	2011-08-22 21:13:01.177091+02	1	8	9	Sharra Nirthanbei -F-10-PC	1	
65	2011-08-22 21:15:42.948984+02	1	8	10	Lakus -M-10-PC	1	
66	2011-08-22 21:15:52.725929+02	1	8	9	Sharra Nirthanbei -F-10-PC	2	No ha cambiado ningún campo.
67	2011-08-22 21:16:22.09537+02	1	9	2	Sharra Nirthanbei -F-10-PC -GROUP- Saddin Konnin -M-11-PC -GROUP- Sharra Nirthanbei -F-10-PC	1	
68	2011-08-22 21:16:43.081823+02	1	9	3	Saddin Konnin -M-11-PC -GROUP- Lakus -M-10-PC -GROUP- Saddin Konnin -M-11-PC	1	
69	2011-08-23 08:56:33.983612+02	1	14	2	Angela Rivera Campos -Ghilbrae-	1	
70	2011-08-23 08:57:15.115528+02	1	12	1	Virotes (20) -W-Cr-NA -PAIR- Ballesta Pesada -W-Cr-NA -PAIR- Virotes (20) -W-Cr-NA	1	
71	2011-08-23 08:57:27.388534+02	1	12	2	Virotes (20) -W-Cr-NA -PAIR- Ballesta Ligera -W-Cr-NA -PAIR- Virotes (20) -W-Cr-NA	1	
72	2011-08-23 08:58:18.733961+02	1	12	3	Flechas (10) -W-Cr-NA -PAIR- Arco Largo -W-Cr-NA -PAIR- Flechas (10) -W-Cr-NA	1	
73	2011-08-23 08:58:33.020498+02	1	12	4	Flechas (10) -W-Cr-NA -PAIR- Arco Corto -W-Cr-NA -PAIR- Flechas (10) -W-Cr-NA	1	
74	2011-08-23 22:34:49.501864+02	1	15	2	Cantemos junto al fuego en el camino Mantícora -<django.db.models.fields.related.ManyRelatedManager object at 0x7f463ebb9550>-	1	
75	2011-08-23 22:36:13.453604+02	1	16	1	Reseña de La Profanación -<django.db.models.fields.related.ManyRelatedManager object at 0x7f463ebb9550>-	1	
76	2011-08-23 22:36:39.109208+02	1	3	2	steinkel	1	
77	2011-08-23 22:37:02.711566+02	1	3	2	steinkel	2	Modificado/a is_staff y user_permissions.
78	2011-08-23 22:37:45.23218+02	2	10	3	Castillo de Ermegar -Cs-Ac-None	1	
79	2011-08-23 22:49:43.426144+02	2	11	12	Daga de Plata -W-Cr-N	2	Modificado/a author.
80	2011-08-23 23:00:26.040842+02	2	10	1	Lazareto -PB-R-C	2	Modificado/a name, location, description, status, alignment, loctype, comments y canon_level.
81	2011-08-23 23:01:24.915495+02	2	14	3	Pedro Gil -Steinkel-	1	
82	2011-08-23 23:01:44.587744+02	2	10	1	Lazareto -PB-R-C	2	Modificado/a location y author.
83	2011-08-23 23:16:37.83495+02	2	10	2	Robleda -C-Ac-N	2	Modificado/a location, description, status, loctype y canon_level.
84	2011-08-23 23:18:04.970795+02	2	10	3	Castillo de Ermegar -Cs-Ac-N	2	Modificado/a location, description, alignment y author.
85	2011-08-23 23:21:02.986632+02	2	11	36	Fatana -W-Cr-L	1	
86	2011-08-23 23:22:00.811004+02	2	11	36	Fatana -W-Cr-L	2	Modificado/a author.
87	2011-08-23 23:23:25.729138+02	2	11	36	Fatana -W-Cr-L	2	No ha cambiado ningún campo.
88	2011-09-19 18:11:30.303376+02	1	3	3	valver	1	
89	2011-09-19 18:11:46.244342+02	1	3	3	valver	2	Modificado/a user_permissions.
90	2011-09-19 18:12:00.696108+02	1	3	3	valver	2	Modificado/a is_staff.
91	2011-09-19 18:19:27.896842+02	1	11	30	Pica Pesada -W-Cr-NA	2	Modificado/a canon_level.
92	2011-09-19 18:29:08.281062+02	1	10	4	Asylum -T-R-None	1	
93	2011-09-19 18:30:12.987528+02	1	11	37	Maza demoledora -W-Cr-N	1	
94	2011-09-19 18:30:30.783311+02	1	8	11	Valver Regnus -M-14-PC	1	
95	2011-09-23 23:39:53.454064+02	1	10	5	La Jarra de Oro -Tv-Ac-N	1	
96	2011-09-23 23:45:25.831403+02	1	10	6	Esmeril -Cp-Ac-L	1	
97	2011-09-23 23:53:54.759487+02	1	10	7	La Tienda de Cuero de Gorm -Shp-Ac-N	1	
98	2011-09-23 23:56:18.616907+02	1	8	12	Gorm -M-03-NPC	1	
99	2011-09-23 23:56:36.160833+02	1	8	13	Jano -M-None-None	1	
100	2011-09-23 23:56:49.923608+02	1	8	14	Juno -M-None-None	1	
101	2011-09-23 23:57:17.267758+02	1	9	4	Juno -M-None-None -BROTHER- Jano -M-None-None -BROTHER- Juno -M-None-None	1	
102	2011-09-23 23:57:35.787407+02	1	9	5	Juno -M-None-None -APPRENTICE- Gorm -M-03-NPC -MASTER- Juno -M-None-None	1	
103	2011-09-23 23:57:52.257252+02	1	9	6	Jano -M-None-None -APPRENTICE- Gorm -M-03-NPC -MASTER- Jano -M-None-None	1	
104	2011-09-29 09:14:03.32905+02	2	10	6	Esmeril -Cp-Ac-L	2	Modificado/a location y description.
105	2011-09-29 09:14:30.16737+02	2	10	3	Castillo de Ermegar -Cs-Ac-N	2	Modificado/a location y description.
106	2011-10-09 16:49:18.647673+02	2	10	4	Lazareto -PB-R-C	2	Modificado/a name, location, description, alignment, loctype y comments.
107	2011-10-09 16:49:47.389561+02	2	10	1	Lazareto -PB-R-C	3	
108	2011-10-09 16:53:33.037288+02	2	10	8	La Cañada Siniestra -Wd-Ac-C	1	
109	2011-10-09 16:55:53.081859+02	2	10	9	El Villorio del Estrecho de las Tormentas -Vg-Ac-N	1	
110	2011-10-09 17:00:47.603027+02	2	8	15	Balazar Malaespina -M-10-NPC	1	
111	2011-10-09 17:03:25.165598+02	2	8	16	Darga del Bali -M-05-NPC	1	
112	2011-10-09 17:05:17.140551+02	2	9	7	Balazar Malaespina -M-10-NPC -FRIEND- Darga del Bali -M-05-NPC -MASTER- Balazar Malaespina -M-10-NPC	1	
113	2011-10-09 17:06:37.090882+02	2	10	10	Posada del Dragón Tortuga -Inn-Ac-L	1	
114	2011-10-09 17:08:45.808562+02	2	10	11	La Peña de la Mano Encarnada -Unk-R-N	1	
115	2011-10-09 17:10:16.709543+02	2	10	12	La Llanura de los Centauros -None-Ac-N	1	
116	2011-10-09 17:14:38.411008+02	2	10	13	Puertoeste -C-Ac-N	1	
117	2011-10-09 17:16:30.795848+02	2	10	14	La Llanura de Eltauro -None-Ac-N	1	
118	2011-10-09 17:19:29.10866+02	2	10	15	La Roca Blanca -Cs-R-C	1	
119	2011-10-09 17:20:40.975358+02	2	10	16	La Fonda -Inn-Ac-N	1	
120	2011-10-09 17:22:36.277492+02	2	10	17	El Fuerte Empalizado -Op-Ac-L	1	
121	2011-10-09 17:23:58.333481+02	2	10	18	Alameda -Vg-Ac-N	1	
122	2011-10-09 17:25:06.820631+02	2	10	19	El Señor de los Caballos -Inn-Ac-N	1	
123	2011-10-09 17:29:11.043801+02	2	8	17	Zenobia Husai -F-01-NPC	1	
124	2011-10-16 20:20:02.52545+02	1	17	3	Esqueleto -1	1	
125	2011-10-16 20:20:26.427317+02	1	8	4	Esqueleto -N-01-NA	3	
126	2011-10-16 21:09:14.968713+02	1	17	3	Esqueleto -None	2	Modificado/a hitdice y AC.
127	2011-10-23 17:59:40.807946+02	1	15	2	Cantemos junto al fuego en el camino Mantícora -<django.db.models.fields.related.ManyRelatedManager object at 0x7f6e083f91d0>-	2	Modificado/a price.
128	2011-10-23 18:01:09.871042+02	1	15	2	Cantemos junto al fuego en el camino Mantícora -<django.db.models.fields.related.ManyRelatedManager object at 0x7f6e081ab210>-	2	Modificado/a description y price.
129	2011-10-23 18:10:12.976046+02	1	19	1	Común -<django.db.models.fields.related.ManyRelatedManager object at 0x7f8017b71710>-	1	
130	2011-10-23 18:10:19.931249+02	1	8	17	Zenobia Husai -F-01-NPC	2	Modificado/a languages.
131	2011-10-23 18:11:33.017354+02	1	8	17	Zenobia Husai -F-01-NPC	2	No ha cambiado ningún campo.
132	2011-10-23 18:15:22.738201+02	1	17	4	Esqueleto -2+1	1	
133	2011-10-23 18:43:46.417262+02	1	20	1	Valion -<django.db.models.fields.related.ManyRelatedManager object at 0x7f2a294d5050>-	1	
134	2011-10-23 18:43:55.679629+02	1	8	17	Zenobia Husai -F-01-NPC	2	Modificado/a religion.
135	2011-10-23 19:00:39.179559+02	1	8	17	Zenobia Husai -F-01-NPC	2	Modificado/a tags.
136	2011-10-23 19:32:52.824156+02	1	17	5	Doppelganger -4	1	
137	2011-10-23 19:33:04.948236+02	1	8	3	Doppelganger -N-04-NA	3	
138	2011-10-25 18:45:41.425186+02	2	8	18	Denter Basa -M-03-NPC	1	
139	2011-10-25 18:52:46.350604+02	2	10	20	Pasoraudo -Scn-Ac-N	1	
140	2011-10-25 18:54:22.038176+02	2	10	21	Olmeda -C-Ac-L	1	
141	2011-10-25 18:55:46.016676+02	2	10	22	Lasminas -Scn-A-C	1	
142	2011-10-25 18:56:59.626278+02	2	10	23	Arena -Vg-Ac-N	1	
143	2011-10-25 18:58:05.132909+02	2	10	24	Boscazul -Wd-Ac-N	1	
144	2011-10-25 18:59:56.384005+02	2	10	25	Mansión Monstrasgo -Cs-Ac-L	1	
145	2011-10-25 19:07:30.088696+02	2	10	26	El Valle Sagrado -Scn-R-C	1	
146	2011-10-25 19:09:26.616994+02	2	10	27	Lacarda -Vg-Ac-L	1	
147	2011-10-25 19:11:20.008043+02	2	10	28	Nidaros -Vg-Ac-L	1	
148	2011-10-25 19:12:43.172076+02	2	10	29	Torregnoll -Op-Ac-L	1	
149	2011-10-25 19:15:35.88418+02	2	10	30	Playas Sahuagin -Scn-Ac-N	1	
150	2011-10-25 19:17:22.558281+02	2	10	31	Carcavón de los Druidas -Scn-Ac-N	1	
151	2011-10-25 19:19:01.445794+02	2	10	32	Quebradas del Este -Scn-Ac-N	1	
152	2011-10-25 19:19:18.407779+02	2	10	12	La Llanura de los Centauros -Scn-Ac-N	2	Modificado/a loctype y tags.
153	2011-10-25 19:19:31.239197+02	2	10	14	La Llanura de Eltauro -Scn-Ac-N	2	Modificado/a loctype y tags.
154	2011-10-25 19:19:46.791553+02	2	10	11	La Peña de la Mano Encarnada -Scn-R-N	2	Modificado/a loctype y tags.
155	2011-10-25 19:21:23.169175+02	2	10	33	La Llambría -Scn-Ac-N	1	
156	2011-10-25 19:22:53.396756+02	2	10	34	Campamento de Pegrin -Op-Ac-L	1	
157	2011-10-25 19:24:10.36168+02	2	10	35	Cuencatroll -Scn-Ac-N	1	
158	2011-10-25 19:25:17.946556+02	2	10	36	Lomas Brunas -Scn-Ac-N	1	
159	2011-10-25 19:27:00.65953+02	2	10	37	La choza de la Bruja de los Pantanos -Scn-Ac-N	1	
160	2011-10-25 19:28:27.531427+02	2	10	38	El Bosque Negro -Wd-Ac-N	1	
161	2011-10-25 19:30:00.896083+02	2	10	39	El Gran Pantano -Sw-Ac-C	1	
162	2011-10-25 19:32:18.512308+02	2	10	40	Quebradas de la Ciénaga -Mn-Ac-N	1	
163	2011-10-25 19:33:47.02319+02	2	10	41	Bosque de las Arañas -Wd-Ac-N	1	
164	2011-10-25 19:34:58.269566+02	2	10	42	Menhir de los Ancestros -Scn-R-N	1	
165	2011-10-25 19:36:35.575914+02	2	10	43	El Faro -Op-R-C	1	
166	2011-10-25 19:38:01.874008+02	2	10	44	La Mina Vieja -Scn-Ac-C	1	
167	2011-10-25 19:39:02.586944+02	2	10	45	Coto del Draco -Inn-Ac-L	1	
168	2011-10-25 19:40:25.812177+02	2	10	46	Rocas del Draco -Scn-R-N	1	
169	2011-10-25 19:41:42.275055+02	2	10	47	Fuerteloma -Cs-Ac-L	1	
170	2011-10-25 19:42:40.353857+02	2	10	48	Mantoverde -Scn-Ac-N	1	
171	2011-10-25 19:43:53.04558+02	2	10	49	El Draco -Rv-Ac-N	1	
172	2011-10-30 13:42:20.55681+01	1	8	10	Lakus -M-10-PC	2	Modificado/a strengthstat, dexteritystat, constitutionstat, intelligencestat, wisdomstat, charismastat, religion, treasurevalue, languages, relatedlocation y tags.
173	2011-10-30 13:51:04.947986+01	1	8	10	Lakus -M-10-PC	2	Modificado/a startdate y tags.
174	2011-10-30 13:51:43.67035+01	1	8	10	Lakus -M-10-PC	2	Modificado/a saveroll y tags.
175	2011-10-30 14:00:50.813105+01	1	19	2	Visirtaní	1	
176	2011-10-30 14:00:52.886839+01	1	8	10	Lakus -M-10-PC	2	Modificado/a languages y tags.
177	2011-10-30 14:03:52.699213+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags.
178	2011-10-30 14:07:08.729198+01	1	8	10	Lakus -M-10-PC	2	Modificado/a description, weapons y tags.
179	2011-10-30 14:07:53.295119+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags y comments.
180	2011-10-30 16:27:56.595929+01	1	8	10	Lakus -M-10-PC	2	Modificado/a treasurevalue y tags.
181	2011-10-30 16:38:36.155133+01	1	8	10	Lakus -M-10-PC	2	Modificado/a relatedobject y tags.
182	2011-10-30 17:16:41.024063+01	1	21	1	lakus_ima	1	
183	2011-10-30 17:17:05.084396+01	1	8	10	Lakus -M-10-PC	2	Modificado/a image y tags.
184	2011-10-30 17:18:49.905356+01	1	21	1	lakus_ima	3	
185	2011-10-30 17:19:26.244307+01	1	21	2	Lakus	1	
186	2011-10-30 17:19:36.454497+01	1	8	10	Lakus -M-10-PC	2	Modificado/a image y tags.
187	2011-10-30 17:22:36.8816+01	1	21	2	Lakus	3	
188	2011-10-30 17:22:46.086808+01	1	21	3	Lakus	1	
189	2011-10-30 17:23:03.130095+01	1	8	10	Lakus -M-10-PC	2	Modificado/a image y tags.
190	2011-10-30 17:58:16.709805+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags, creation_date y last_updated.
191	2011-10-30 18:00:33.334453+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags y author.
192	2011-10-30 18:01:07.937486+01	1	14	2	Angela Rivera Campos -Ghilbrae-	2	Modificado/a url.
193	2011-10-30 18:04:12.706113+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags y author.
194	2011-10-30 18:06:39.500556+01	1	21	3	Lakus	2	Modificado/a image.
195	2011-10-30 18:06:49.891986+01	1	21	3	Lakus	2	Modificado/a author.
196	2011-10-30 23:37:44.332191+01	1	21	4	Sharra	1	
197	2011-10-30 23:37:55.465623+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a image, tags, creation_date y last_updated.
198	2011-10-30 23:40:23.132569+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags y author.
199	2011-11-01 10:49:18.347596+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags.
200	2011-11-01 10:49:28.399365+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags.
201	2011-11-01 11:43:17.174125+01	1	9	8	Lakus -M-10-PC -NEMESIS- Balazar Malaespina -M-10-NPC -NEMESIS- Lakus -M-10-PC	1	
202	2011-11-01 15:57:07.054847+01	1	21	5	Saddin Konnin	1	
203	2011-11-01 15:58:06.299202+01	1	8	7	Saddin Konnin -M-11-PC	2	Modificado/a strengthstat, dexteritystat, constitutionstat, intelligencestat, wisdomstat, charismastat, religion, treasurevalue, languages, image, tags, author, creation_date y last_updated.
204	2011-11-01 16:01:25.232453+01	1	8	7	Saddin Konnin -M-11-PC	2	Modificado/a description y tags.
205	2011-11-01 16:06:26.891352+01	1	8	10	Lakus -M-10-PC	2	Modificado/a description y tags.
206	2011-11-01 16:08:49.306014+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags y canon_level.
207	2011-11-01 16:13:03.275284+01	1	8	10	Lakus -M-10-PC	2	Modificado/a alignment y tags.
208	2011-11-01 16:43:11.718392+01	1	8	11	Valver Regnus -M-14-PC	2	Modificado/a tags, creation_date y last_updated.
209	2011-11-01 17:03:00.950979+01	1	8	18	Denter Basa -M-03-NPC	2	Modificado/a tags, creation_date y last_updated.
210	2011-11-01 17:17:48.44941+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a description y tags.
211	2011-11-01 17:21:32.210763+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a tags y comments.
212	2011-11-01 17:30:32.43952+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a startdate y tags.
213	2011-11-01 17:33:39.520811+01	1	21	6	robleda_pq	1	
214	2011-11-01 17:33:44.447097+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a image y tags.
215	2011-11-01 17:37:05.64998+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a tags y author.
216	2011-11-01 17:38:44.536236+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a tags, creation_date y last_updated.
217	2011-11-01 17:39:10.790046+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a tags.
218	2011-11-01 17:41:29.874054+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a relatedobject y tags.
219	2011-11-01 17:46:59.188188+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a population y tags.
220	2011-11-01 19:15:08.835428+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a description, weapons y tags.
221	2011-11-02 20:30:30.789681+01	1	15	3	La Profanación	1	
222	2011-11-02 20:30:35.91313+01	1	16	1	Reseña de La Profanación	2	Modificado/a description, adventure y tags.
223	2011-11-02 20:38:13.380122+01	1	21	7	jmprfoto	1	
224	2011-11-02 20:38:16.310366+01	1	14	4	José Manuel Palacios Rodríguez -JMPR-	1	
225	2011-11-02 20:38:25.837097+01	1	15	4	Ladrones de Cadáveres	1	
226	2011-11-02 20:38:47.014347+01	1	16	2	Ladrones de cadáveres - Crónica del grupo Ithilien	1	
227	2011-11-02 20:39:24.22122+01	1	16	1	Crónica de La Profanación - Grupo Ithilin	2	Modificado/a name, description y tags.
228	2011-11-02 20:40:41.295992+01	1	16	2	Crónica de Ladrones de cadáveres - Grupo Ithilien	2	Modificado/a name y tags.
229	2011-11-02 20:49:46.857769+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a description, url, sessions, minnumplayers, maxnumplayers, minlevel, maxlevel, tags, comments y canon_level.
230	2011-11-04 20:24:03.547824+01	1	21	8	Portada de Cantemos junto al fuego	1	
231	2011-11-04 20:24:06.397762+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a image y tags.
232	2011-11-04 20:26:07.216416+01	1	16	1	Crónica de La Profanación - Grupo Ithilin	2	Modificado/a adventure y tags.
233	2011-11-04 20:27:05.931432+01	1	16	1	Crónica de La Profanación - Grupo Ithilien	2	Modificado/a name y tags.
234	2011-11-04 20:28:12.379828+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a tags, creation_date y last_updated.
235	2011-11-04 20:56:33.742587+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a description y tags.
236	2011-11-04 20:57:00.188389+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a description y tags.
237	2011-11-04 20:57:24.899046+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a description y tags.
238	2011-11-05 12:51:05.009791+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a description y tags.
239	2011-11-05 12:51:14.616231+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a description y tags.
240	2011-11-05 12:52:21.312924+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a description y tags.
241	2011-11-05 14:24:06.720895+01	1	16	2	Crónica de Ladrones de cadáveres - Grupo Ithilien	2	Modificado/a adventure, tags, creation_date y last_updated.
242	2011-11-05 14:24:58.136912+01	1	16	2	Crónica de Ladrones de cadáveres - Grupo Ithilien	2	Modificado/a adventure y tags.
243	2011-11-05 14:25:06.021849+01	1	16	1	Crónica de La Profanación - Grupo Ithilien	2	Modificado/a adventure, tags, creation_date y last_updated.
244	2011-11-05 14:29:29.807581+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a url y tags.
245	2011-11-05 14:45:57.805399+01	1	16	1	Crónica de La Profanación - Grupo Ithilien	2	Modificado/a tags.
246	2011-11-05 14:46:23.982427+01	1	11	37	Maza demoledora -W-Cr-N	2	Modificado/a tags, creation_date y last_updated.
247	2011-11-05 16:43:43.990261+01	1	11	3	Flechas (10) -W-Cr-NA	2	Modificado/a description, properties, image, tags, comments, author, creation_date y last_updated.
248	2011-11-05 17:07:19.44224+01	1	11	3	Flechas (10) -W-Cr-NA	2	Modificado/a tags.
249	2011-11-05 17:15:02.156198+01	1	8	10	Lakus -M-10-PC	2	Modificado/a relatedobject y tags.
250	2011-11-05 17:22:13.182646+01	1	8	17	Zenobia Husai -F-01-NPC	2	Modificado/a tags, creation_date y last_updated.
251	2011-11-05 17:22:57.857242+01	1	8	7	Saddin Konnin -M-11-PC	2	Modificado/a relatedobject y tags.
252	2011-11-05 18:07:07.582579+01	1	12	5	Tridente -W-Cr-NA -ORIGIN- Flechas (10) -W-Cr-NA -PIECE- Tridente -W-Cr-NA	1	
253	2011-11-05 18:07:29.305365+01	1	12	5	Tridente -W-Cr-NA -NEMESIS- Flechas (10) -W-Cr-NA -ORIGIN- Tridente -W-Cr-NA	2	Modificado/a relation12 y relation21.
254	2011-11-05 18:24:41.65532+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a quote y tags.
255	2011-11-05 18:25:30.504211+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a quote y tags.
256	2011-11-05 18:27:40.663836+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a quote y tags.
257	2011-11-05 18:36:40.332684+01	1	8	10	Lakus -M-10-PC	2	Modificado/a quote y tags.
258	2011-11-05 18:37:49.491192+01	1	8	10	Lakus -M-10-PC	2	Modificado/a quote y tags.
259	2011-11-05 18:43:08.497899+01	1	21	4	Sharra	2	Modificado/a author.
260	2011-11-05 19:05:38.263529+01	1	21	4	Sharra	2	Modificado/a author.
261	2011-11-05 19:10:55.125425+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a relatedobject y tags.
262	2011-11-05 19:13:58.811286+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags y author.
263	2011-11-05 19:55:41.713739+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags y relatedobjects.
264	2011-11-05 20:16:47.0929+01	1	15	4	Ladrones de Cadáveres	2	Modificado/a tags, canon_level, creation_date y last_updated.
265	2011-11-05 20:50:18.308745+01	1	21	9	Espada Fatana	1	
266	2011-11-05 20:50:19.532429+01	1	11	36	Fatana -W-Cr-L	2	Modificado/a image, tags, creation_date y last_updated.
267	2011-11-05 20:55:05.948081+01	1	11	34	Moneda de Plata -C-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
268	2011-11-05 20:55:23.103999+01	1	11	33	Moneda de Oro -C-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
269	2011-11-05 20:55:31.909363+01	1	11	35	Moneda de Cobre -C-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
270	2011-11-05 20:56:16.839013+01	1	11	38	Moneda de Platino -C-NA-NA	1	
271	2011-11-05 21:09:56.408816+01	1	11	37	Maza demoledora -W-Cr-N	2	Modificado/a gpvalue, fabvalue y tags.
272	2011-11-05 22:12:47.529167+01	1	14	5	Víctor -El Contemplador-	1	
273	2011-11-05 22:12:59.940094+01	1	15	3	La Profanación	2	Modificado/a tags, author, creation_date y last_updated.
274	2011-11-06 10:43:35.095458+01	1	21	10	Portada La Profanación	1	
275	2011-11-06 10:43:47.11496+01	1	15	3	La Profanación	2	Modificado/a description, url, minlevel, maxlevel, image, tags y canon_level.
276	2011-11-06 16:54:14.185414+01	1	17	4	Esqueleto -2+1	2	Modificado/a attacks, tags, canon_level, creation_date y last_updated.
277	2011-11-06 17:09:57.706379+01	1	17	4	Esqueleto -2+1	2	Modificado/a tags.
278	2011-11-06 17:15:46.760515+01	1	18	3	Esqueleto -2+1 -GROUP- Doppelganger -4 -NEMESIS- Esqueleto -2+1	1	
279	2011-11-06 17:20:02.956654+01	1	17	4	Esqueleto -2+1	2	Modificado/a tags y canon_level.
280	2011-11-06 17:20:10.306927+01	1	17	5	Doppelganger -4	2	Modificado/a tags, creation_date y last_updated.
281	2011-11-06 17:20:43.173237+01	1	17	4	Esqueleto -2+1	2	Modificado/a image y tags.
282	2011-11-06 17:47:41.180463+01	1	24	2	Sharra Nirthanbei -F-10-PC -Robleda -C-Ac-N- L1	1	
283	2011-11-06 17:55:37.058372+01	1	24	3	Zenobia Husai -F-01-NPC -Robleda -C-Ac-N- 3	1	
284	2011-11-06 18:01:20.892626+01	1	8	7	Saddin Konnin -M-11-PC	2	Modificado/a tags.
285	2011-12-06 18:22:23.685695+01	1	10	6	Esmeril -Cp-Ac-L	2	Modificado/a description, tags, creation_date y last_updated.
286	2011-12-06 18:23:25.067518+01	1	10	6	Esmeril -Cp-Ac-L	2	Modificado/a description y tags.
287	2011-12-06 18:23:43.960019+01	1	10	6	Esmeril -Cp-Ac-L	2	Modificado/a description y tags.
288	2011-12-06 18:27:06.288897+01	1	17	6	Gnoll -2	1	
289	2011-12-06 18:27:47.882465+01	1	8	5	Gnoll -N-02-NA	3	
290	2011-12-06 18:29:50.774708+01	1	17	7	Gnomo -1	1	
291	2011-12-06 18:29:54.534553+01	1	8	6	Gnomo -N-01-NA	3	
292	2011-12-06 18:36:53.575734+01	1	10	7	La Tienda de Cuero de Gorm -Shp-Ac-N	2	Modificado/a description, tags, creation_date y last_updated.
293	2011-12-06 18:38:21.331664+01	1	10	5	La Jarra de Oro -Tv-Ac-N	2	Modificado/a description, tags, creation_date y last_updated.
294	2011-12-06 22:34:43.465977+01	1	8	11	Valver Regnus -M-14-PC	2	Modificado/a tags.
295	2011-12-06 22:34:49.444054+01	1	8	7	Saddin Konnin -M-11-PC	2	Modificado/a tags.
296	2011-12-06 22:34:57.984396+01	1	8	8	Galian -F-10-PC	2	Modificado/a tags, creation_date y last_updated.
297	2011-12-06 22:35:04.567124+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags.
298	2011-12-06 22:35:10.121653+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags.
299	2011-12-06 22:35:16.625011+01	1	8	15	Balazar Malaespina -M-10-NPC	2	Modificado/a tags, creation_date y last_updated.
300	2011-12-06 22:35:23.156944+01	1	8	16	Darga del Bali -M-05-NPC	2	Modificado/a tags, creation_date y last_updated.
301	2011-12-06 22:35:40.701769+01	1	8	18	Denter Basa -M-03-NPC	2	Modificado/a tags.
302	2011-12-06 22:36:38.593954+01	1	10	29	Torregnoll -Op-Ac-L	2	Modificado/a tags, creation_date y last_updated.
303	2011-12-06 22:36:44.167893+01	1	10	46	Rocas del Draco -Scn-R-N	2	Modificado/a tags, creation_date y last_updated.
304	2011-12-06 22:36:52.380318+01	1	10	32	Quebradas del Este -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
305	2011-12-06 22:36:57.739718+01	1	10	40	Quebradas de la Ciénaga -Mn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
306	2011-12-06 22:37:03.50135+01	1	10	13	Puertoeste -C-Ac-N	2	Modificado/a tags, creation_date y last_updated.
307	2011-12-06 22:37:08.201889+01	1	10	10	Posada del Dragón Tortuga -Inn-Ac-L	2	Modificado/a tags, creation_date y last_updated.
308	2011-12-06 22:37:12.404726+01	1	10	30	Playas Sahuagin -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
309	2011-12-06 22:37:16.92164+01	1	10	20	Pasoraudo -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
310	2011-12-06 22:37:23.897199+01	1	10	21	Olmeda -C-Ac-L	2	Modificado/a tags, creation_date y last_updated.
311	2011-12-06 22:37:28.190152+01	1	10	28	Nidaros -Vg-Ac-L	2	Modificado/a tags, creation_date y last_updated.
312	2011-12-06 22:37:33.559579+01	1	10	42	Menhir de los Ancestros -Scn-R-N	2	Modificado/a tags, creation_date y last_updated.
313	2011-12-06 22:37:39.089776+01	1	10	48	Mantoverde -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
314	2011-12-06 22:37:43.94151+01	1	10	25	Mansión Monstrasgo -Cs-Ac-L	2	Modificado/a tags, creation_date y last_updated.
315	2011-12-06 22:37:49.321677+01	1	10	36	Lomas Brunas -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
316	2011-12-06 22:37:53.612463+01	1	10	4	Lazareto -PB-R-C	2	Modificado/a tags, creation_date y last_updated.
317	2011-12-06 22:37:59.5866+01	1	10	22	Lasminas -Scn-A-C	2	Modificado/a tags, creation_date y last_updated.
318	2011-12-06 22:38:04.109874+01	1	10	15	La Roca Blanca -Cs-R-C	2	Modificado/a tags, creation_date y last_updated.
319	2011-12-06 22:38:08.766642+01	1	10	11	La Peña de la Mano Encarnada -Scn-R-N	2	Modificado/a tags, creation_date y last_updated.
320	2011-12-06 22:38:13.783061+01	1	10	44	La Mina Vieja -Scn-Ac-C	2	Modificado/a tags, creation_date y last_updated.
321	2011-12-06 22:38:19.427273+01	1	10	12	La Llanura de los Centauros -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
322	2011-12-06 22:38:23.40037+01	1	10	14	La Llanura de Eltauro -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
323	2011-12-06 22:38:27.485532+01	1	10	33	La Llambría -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
324	2011-12-06 22:38:34.361439+01	1	10	16	La Fonda -Inn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
325	2011-12-06 22:38:38.732502+01	1	10	37	La choza de la Bruja de los Pantanos -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
326	2011-12-06 22:38:43.34692+01	1	10	27	Lacarda -Vg-Ac-L	2	Modificado/a tags, creation_date y last_updated.
327	2011-12-06 22:38:48.338193+01	1	10	8	La Cañada Siniestra -Wd-Ac-C	2	Modificado/a tags, creation_date y last_updated.
328	2011-12-06 22:38:53.002776+01	1	10	47	Fuerteloma -Cs-Ac-L	2	Modificado/a tags, creation_date y last_updated.
329	2011-12-06 22:38:59.671249+01	1	10	9	El Villorio del Estrecho de las Tormentas -Vg-Ac-N	2	Modificado/a tags, creation_date y last_updated.
330	2011-12-06 22:39:04.78369+01	1	10	26	El Valle Sagrado -Scn-R-C	2	Modificado/a tags, creation_date y last_updated.
331	2011-12-06 22:39:08.769272+01	1	10	19	El Señor de los Caballos -Inn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
332	2011-12-06 22:39:17.369014+01	1	10	39	El Gran Pantano -Sw-Ac-C	2	Modificado/a tags, creation_date y last_updated.
333	2011-12-06 22:39:21.47325+01	1	10	17	El Fuerte Empalizado -Op-Ac-L	2	Modificado/a tags, creation_date y last_updated.
334	2011-12-06 22:39:25.879871+01	1	10	43	El Faro -Op-R-C	2	Modificado/a tags, creation_date y last_updated.
335	2011-12-06 22:39:30.903609+01	1	10	49	El Draco -Rv-Ac-N	2	Modificado/a tags, creation_date y last_updated.
336	2011-12-06 22:39:37.466739+01	1	10	38	El Bosque Negro -Wd-Ac-N	2	Modificado/a tags, creation_date y last_updated.
337	2011-12-06 22:39:41.925794+01	1	10	35	Cuencatroll -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
338	2011-12-06 22:39:46.016969+01	1	10	45	Coto del Draco -Inn-Ac-L	2	Modificado/a tags, creation_date y last_updated.
339	2011-12-06 22:39:52.251208+01	1	10	3	Castillo de Ermegar -Cs-Ac-N	2	Modificado/a tags, creation_date y last_updated.
340	2011-12-06 22:39:57.574944+01	1	10	31	Carcavón de los Druidas -Scn-Ac-N	2	Modificado/a tags, creation_date y last_updated.
341	2011-12-06 22:40:02.802965+01	1	10	34	Campamento de Pegrin -Op-Ac-L	2	Modificado/a tags, creation_date y last_updated.
342	2011-12-06 22:40:07.226786+01	1	10	41	Bosque de las Arañas -Wd-Ac-N	2	Modificado/a tags, creation_date y last_updated.
343	2011-12-06 22:40:11.779717+01	1	10	24	Boscazul -Wd-Ac-N	2	Modificado/a tags, creation_date y last_updated.
344	2011-12-06 22:40:18.687028+01	1	10	23	Arena -Vg-Ac-N	2	Modificado/a tags, creation_date y last_updated.
345	2011-12-06 22:40:22.973876+01	1	10	18	Alameda -Vg-Ac-N	2	Modificado/a tags, creation_date y last_updated.
346	2011-12-06 22:40:55.345126+01	1	11	6	Virotes (20) -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
347	2011-12-06 22:40:59.766228+01	1	11	32	Tridente -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
348	2011-12-06 22:41:03.996606+01	1	11	30	Pica Pesada -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
349	2011-12-06 22:41:08.773352+01	1	11	31	Pica Ligera -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
350	2011-12-06 22:41:20.64387+01	1	11	29	Maza -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
351	2011-12-06 22:41:24.987951+01	1	11	27	Martillo Ligero -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
352	2011-12-06 22:41:28.782618+01	1	11	28	Martillo de Guerra -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
353	2011-12-06 22:41:33.764362+01	1	11	26	Lucero del Alba -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
354	2011-12-06 22:41:37.93745+01	1	11	25	Látigo Pesado -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
355	2011-12-06 22:41:41.66483+01	1	11	24	Látigo -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
356	2011-12-06 22:41:45.564225+01	1	11	23	Lanza -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
357	2011-12-06 22:41:49.933161+01	1	11	22	Jabalina -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
358	2011-12-06 22:41:54.300908+01	1	11	21	Honda -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
359	2011-12-06 22:41:58.116405+01	1	11	20	Hacha de Mano -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
360	2011-12-06 22:42:02.340784+01	1	11	19	Hacha de Combate -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
361	2011-12-06 22:42:05.827743+01	1	11	18	Garrote -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
362	2011-12-06 22:42:13.158614+01	1	11	15	Espada Larga -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
363	2011-12-06 22:42:17.815453+01	1	11	17	Espada de dos manos -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
364	2011-12-06 22:42:21.295815+01	1	11	14	Espada Corta -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
365	2011-12-06 22:42:25.088415+01	1	11	16	Espada Bastarda -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
366	2011-12-06 22:42:29.393898+01	1	11	13	Dardo -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
367	2011-12-06 22:42:33.323761+01	1	11	12	Daga de Plata -W-Cr-N	2	Modificado/a tags, creation_date y last_updated.
368	2011-12-06 22:42:38.04064+01	1	11	11	Daga -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
369	2011-12-06 22:42:42.181608+01	1	11	10	Cimitarra -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
370	2011-12-06 22:42:46.096996+01	1	11	9	Cachiporra -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
371	2011-12-06 22:42:49.686752+01	1	11	8	Bastón -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
372	2011-12-06 22:42:53.350202+01	1	11	5	Ballesta Pesada -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
373	2011-12-06 22:42:57.3996+01	1	11	7	Ballesta Ligera -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
374	2011-12-06 22:43:01.307607+01	1	11	2	Arco Largo -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
375	2011-12-06 22:43:05.259688+01	1	11	4	Arco Corto -W-Cr-NA	2	Modificado/a tags, creation_date y last_updated.
376	2011-12-06 22:45:25.438975+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags y last_updated.
377	2011-12-06 22:45:37.611143+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags y last_updated.
378	2011-12-06 22:45:50.486649+01	1	8	9	Sharra Nirthanbei -F-10-PC	2	Modificado/a tags y creation_date.
379	2011-12-06 22:47:01.862727+01	1	9	6	Jano -M-None-None -APPRENTICE- Gorm -M-03-NPC -MASTER- Jano -M-None-None	3	
380	2011-12-06 22:47:01.880516+01	1	9	4	Juno -M-None-None -BROTHER- Jano -M-None-None -BROTHER- Juno -M-None-None	3	
381	2011-12-06 22:47:01.88232+01	1	9	5	Juno -M-None-None -APPRENTICE- Gorm -M-03-NPC -MASTER- Juno -M-None-None	3	
382	2011-12-06 22:48:22.970435+01	1	8	14	Juno -M-None-None	3	
383	2011-12-06 22:49:57.260267+01	1	8	19	Juno2 -M-None-None	1	
384	2011-12-06 22:50:16.541851+01	1	8	19	Juno -M-None-None	2	Modificado/a name, hitpoints y tags.
385	2011-12-06 22:59:11.654308+01	1	8	13	Jano -M-None-None	3	
386	2011-12-06 22:59:11.65709+01	1	8	19	Juno -M-None-None	3	
387	2011-12-06 22:59:11.665823+01	1	8	12	Gorm -M-03-NPC	3	
388	2011-12-09 20:48:25.400724+01	1	8	10	Lakus -M-10-PC	2	Modificado/a tags y canon_level.
389	2011-12-09 20:50:04.203791+01	1	10	2	Robleda -C-Ac-N	2	Modificado/a tags y comments.
390	2011-12-09 20:52:49.964063+01	1	8	20	aaaaaaaaaa -None-None-None	1	
391	2011-12-09 20:52:55.144079+01	1	8	20	aaaaaaaaaa -None-None-None	2	Modificado/a move y tags.
392	2011-12-09 21:06:19.79425+01	1	8	20	aaaaaaaaaa -None-None-None	3	
393	2011-12-09 21:10:19.645211+01	1	17	6	Gnoll -2	2	Modificado/a tags.
394	2011-12-10 10:03:10.336579+01	2	8	21	Esqueleto -N-01-NA	1	
395	2011-12-10 10:07:17.18279+01	2	8	22	Gnoll -N-02-NA	1	
396	2011-12-10 10:11:02.586543+01	2	8	23	Hombres Lagarto -N-02-NA	1	
397	2011-12-10 10:14:02.636394+01	2	8	24	Kobold -N-01-NA	1	
398	2011-12-10 10:18:16.008584+01	2	8	25	Mantícora -N-06-NA	1	
399	2011-12-10 10:22:45.786493+01	2	8	26	Minotauro -N-06-None	1	
400	2011-12-10 10:25:57.836514+01	2	8	27	Ogro -N-04-None	1	
401	2011-12-10 10:30:29.113724+01	2	8	28	Orco -None-01-None	1	
402	2011-12-10 10:32:57.777781+01	2	8	29	Goblin -N-01-None	1	
403	2011-12-10 10:35:07.690929+01	2	8	30	Hobgoblin -None-02-None	1	
404	2011-12-10 10:38:35.392048+01	2	8	31	Osgo -None-03-None	1	
405	2011-12-10 10:39:27.565644+01	1	3	2	steinkel	2	Modificado/a user_permissions.
406	2011-12-10 10:42:11.16145+01	2	19	3	Vetusto	1	
407	2011-12-10 10:42:45.302758+01	2	19	4	Trasgoide	1	
408	2011-12-10 10:48:15.653697+01	1	3	3	valver	2	Modificado/a user_permissions.
409	2011-12-10 10:51:21.19471+01	2	17	8	Zombi -2	1	
410	2011-12-10 10:55:03.883104+01	2	17	9	Yeti -5	1	
411	2011-12-10 10:57:38.584217+01	2	17	10	Tiranosaurio Rex -20	1	
412	2011-12-10 11:00:58.227842+01	2	17	11	Thoul -3	1	
413	2011-12-10 11:03:57.963135+01	2	17	12	Oso Lechuza -5	1	
414	2011-12-10 11:06:46.203527+01	2	17	13	Necrófago -2	1	
415	2011-12-10 11:13:01.352747+01	2	17	14	Momia -5+1	1	
416	2011-12-10 11:16:39.428941+01	2	17	15	Grifo -7	1	
417	2011-12-10 11:20:47.126745+01	2	17	16	Gusano Carroñero -3+1	1	
418	2011-12-10 11:27:13.929529+01	2	17	17	Orco -1	1	
419	2011-12-10 11:31:07.988754+01	2	17	18	Ogro -4+1	1	
420	2011-12-10 11:34:09.956238+01	2	19	5	Minotauro	1	
421	2011-12-10 11:35:05.31565+01	2	17	19	Minotauro -6	1	
422	2011-12-10 11:38:07.609808+01	2	17	4	Esqueleto -1	2	Modificado/a hitdice, AC, move, saveroll, description, attacks, relatedlocation, tags, comments, canon_level y last_updated.
423	2011-12-10 12:30:19.972239+01	1	17	8	Zombi -2	2	Modificado/a gender y tags.
424	2011-12-10 15:40:51.393008+01	1	17	20	Osgo -3	1	
425	2011-12-10 15:40:58.335406+01	1	8	31	Osgo -None-03-None	3	
426	2011-12-10 17:33:32.793529+01	1	17	11	Thoul -3	2	Modificado/a tags y last_updated.
427	2011-12-10 17:33:41.911426+01	1	17	11	Thoul -3	2	Modificado/a gender y tags.
428	2011-12-10 18:34:21.211763+01	1	10	5	La Jarra de Oro -Tv-Ac-N	2	Modificado/a tags y canon_level.
429	2011-12-10 18:34:39.571599+01	1	10	5	La Jarra de Oro -Tv-Ac-N	2	Modificado/a tags y canon_level.
430	2011-12-10 19:56:47.603309+01	2	8	30	Hobgoblin -None-02-None	3	
431	2011-12-10 19:56:58.042655+01	2	8	28	Orco -None-01-None	3	
432	2011-12-10 19:57:07.932033+01	2	8	29	Goblin -N-01-None	3	
433	2011-12-10 19:57:17.014364+01	2	8	27	Ogro -N-04-None	3	
434	2011-12-10 19:57:25.815779+01	2	8	25	Mantícora -N-06-NA	3	
435	2011-12-10 19:57:35.460324+01	2	8	24	Kobold -N-01-NA	3	
436	2011-12-10 19:57:43.757854+01	2	8	21	Esqueleto -N-01-NA	3	
437	2011-12-10 19:57:53.462213+01	2	8	26	Minotauro -N-06-None	3	
438	2011-12-10 19:58:03.309554+01	2	8	22	Gnoll -N-02-NA	3	
439	2011-12-10 19:58:12.431528+01	2	8	23	Hombres Lagarto -N-02-NA	3	
440	2011-12-10 20:01:40.884672+01	2	17	21	Goblin -1	1	
441	2011-12-10 20:04:04.231878+01	2	17	22	Hobgoblin -1+1	1	
442	2011-12-10 20:05:09.430401+01	2	17	20	Osgo -3+1	2	Modificado/a hitdice, treasurevalue, XPvalue, languages y tags.
443	2011-12-10 20:09:29.757022+01	1	17	7	Gnomo -1	2	Modificado/a alignment y tags.
444	2011-12-10 20:10:33.085976+01	1	17	7	Gnomo -1	2	Modificado/a alignment y tags.
445	2011-12-10 20:10:56.871965+01	1	17	11	Thoul -3	2	Modificado/a relatedlocation y tags.
446	2011-12-10 20:11:13.640945+01	1	17	11	Thoul -3	2	Modificado/a relatedlocation y tags.
447	2011-12-10 20:14:10.469772+01	2	19	6	Lengua de la Sombra	1	
448	2011-12-10 20:15:04.980403+01	2	17	23	Troll -6+3	1	
449	2011-12-10 20:24:54.141473+01	2	8	32	Camil Hojafuerte -M-07-NPC	1	
450	2011-12-10 20:26:34.380025+01	2	8	15	Balazar Malaespina -M-10-NPC	2	Modificado/a strengthstat, dexteritystat, constitutionstat, intelligencestat, wisdomstat, charismastat, religion, treasurevalue, weapons, languages, tags y last_updated.
451	2011-12-10 20:44:32.0162+01	1	16	1	Crónica de La Profanación - Grupo Ithilien	2	Modificado/a adventure y tags.
452	2011-12-10 20:44:54.259193+01	1	16	1	Crónica de La Profanación - Grupo Ithilien	2	Modificado/a tags y canon_level.
453	2011-12-10 22:30:10.362816+01	1	14	6	A.J. Manzanedo -Manzanedo-	1	
454	2011-12-10 22:30:18.500468+01	1	14	7	José María Campoy --	1	
455	2011-12-10 22:30:27.706184+01	1	14	8	Jorge Carrero --	1	
456	2011-12-10 22:30:37.171776+01	1	14	9	María del Carmen Ruíz Moreno -RU-MOR-	1	
457	2011-12-10 22:30:49.99498+01	1	14	10	Breogán Álvarez Bermúdez --	1	
458	2011-12-10 22:30:58.509723+01	1	14	11	Raquel Cornejo --	1	
459	2011-12-10 22:31:05.167063+01	1	14	12	Manu Sáez --	1	
460	2011-12-10 22:31:11.400901+01	1	14	13	Emilio Martínez Soria --	1	
461	2011-12-10 22:31:17.460602+01	1	14	14	Iván Cordero --	1	
462	2011-12-10 22:31:25.768529+01	1	14	15	Patricia Avilés Peña --	1	
463	2011-12-10 22:31:31.804534+01	1	14	16	Marina García Sánchez --	1	
464	2011-12-10 22:31:39.976215+01	1	14	17	Thanya Castrillón --	1	
465	2011-12-10 22:51:52.72638+01	1	21	11	Escudo de Esmeril	1	
466	2011-12-10 22:54:45.25601+01	1	10	6	Esmeril -Cp-Ac-L	2	Modificado/a image y tags.
467	2011-12-10 22:55:30.991708+01	1	21	11	Escudo de Esmeril	2	Modificado/a image.
468	2011-12-10 22:55:34.750922+01	1	21	11	Escudo de Esmeril	2	Modificado/a image.
469	2011-12-10 22:57:19.596397+01	1	21	9	Espada Fatana	2	Modificado/a image.
470	2011-12-10 22:57:28.346905+01	1	21	9	Espada Fatana	2	Modificado/a image y author.
471	2011-12-11 00:07:55.037063+01	1	17	4	Esqueleto -1	2	Modificado/a image y tags.
472	2011-12-11 01:27:03.106135+01	1	11	36	Fatana -W-Cr-L	2	Modificado/a tags y last_updated.
473	2011-12-11 01:27:43.552678+01	1	8	10	Lakus -M-10-PC	2	Modificado/a relatedobject y tags.
474	2011-12-11 01:39:54.150046+01	1	21	12	Portada de Ig Nagor	1	
475	2011-12-11 01:40:23.475885+01	1	15	5	Ig Nagor	1	
476	2011-12-11 01:42:45.756761+01	1	21	13	Portada de ¡Traición!	1	
477	2011-12-11 01:44:43.646789+01	1	15	6	¡Traición!	1	
478	2011-12-11 01:50:14.237454+01	1	21	14	Portada de La Hija del Gigante de Hielo	1	
479	2011-12-11 01:50:37.261284+01	1	15	7	La Hija del Gigante de Hielo	1	
480	2011-12-11 01:51:15.202222+01	1	15	7	La Hija del Gigante de Hielo	2	Modificado/a description y tags.
481	2011-12-11 01:52:11.64944+01	1	15	7	La Hija del Gigante de Hielo	2	Modificado/a minnumplayers, minlevel y tags.
482	2011-12-11 01:53:50.788513+01	1	21	15	Portada de Ojos de Serpiente	1	
483	2011-12-11 01:55:03.720356+01	1	14	5	Víctor Velázquez -El Contemplador-	2	Modificado/a name.
484	2011-12-11 01:57:00.238657+01	1	15	8	Ojos de Serpiente	1	
485	2011-12-11 02:02:29.488676+01	1	21	16	Portada de la Tumba de los Horrores	1	
486	2011-12-11 02:03:43.703661+01	1	15	9	La Tumba de los Horrores	1	
487	2011-12-11 02:04:26.860673+01	1	15	9	La Tumba de los Horrores	2	Modificado/a description y tags.
488	2011-12-11 02:07:55.031474+01	1	21	17	Portada de la Isla del Terror	1	
489	2011-12-11 02:09:22.891485+01	1	15	10	Isla del Terror	1	
490	2011-12-11 02:15:21.45704+01	1	21	18	Portada de La Fonda	1	
491	2011-12-11 02:16:12.627248+01	1	15	11	La Fonda	1	
492	2011-12-11 02:23:06.521176+01	1	21	19	Imagen de Ethan Ariakos	1	
493	2011-12-11 02:25:02.163921+01	1	8	33	Ethan Ariakos -M-01-NPC	1	
494	2011-12-11 02:25:46.681448+01	1	8	33	Ethan Ariakos -M-01-NPC	2	Modificado/a weapons y tags.
495	2011-12-11 02:31:56.03969+01	1	21	20	Portada de Miedo a la Oscuridad	1	
496	2011-12-11 02:32:00.044791+01	1	15	12	Miedo a la Oscuridad	1	
497	2011-12-11 02:32:19.611643+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a tags y last_updated.
498	2011-12-11 02:33:45.831867+01	1	15	3	La Profanación	2	Modificado/a tags, creation_date y last_updated.
499	2011-12-11 02:34:05.328198+01	1	15	2	Cantemos junto al fuego en el camino Mantícora	2	Modificado/a tags, creation_date y last_updated.
500	2011-12-11 02:41:06.166634+01	1	16	3	Crónicas de la Marca del Este, Volumen II	1	
501	2011-12-11 02:41:37.588804+01	1	16	3	Crónicas de la Marca del Este, Volumen II	2	Modificado/a tags.
502	2011-12-11 02:42:43.498261+01	1	16	4	Crónicas de la Marca del Este, Volumen I	1	
503	2011-12-11 02:44:29.034012+01	1	14	18	Javier Hidalgo -Acróbata 2000-	1	
504	2011-12-11 02:45:01.207933+01	1	14	19	Breogán Álvarez Bermúdez --	1	
505	2011-12-11 02:47:41.776034+01	1	15	13	El Enclave	1	
506	2011-12-11 02:48:57.337372+01	1	21	21	Portada de El Enclave	1	
507	2011-12-11 02:48:59.804787+01	1	15	13	El Enclave	2	Modificado/a image y tags.
508	2011-12-11 02:49:17.762294+01	1	14	10	Breogán Álvarez Bermúdez --	3	
509	2011-12-11 02:49:35.902439+01	1	15	13	El Enclave	2	Modificado/a tags y author.
510	2011-12-11 02:49:46.586568+01	1	21	21	Portada de El Enclave	2	Modificado/a author.
511	2011-12-11 02:52:16.292493+01	1	15	4	Ladrones de Cadáveres	2	Modificado/a tags, creation_date y last_updated.
512	2011-12-11 02:53:00.953385+01	1	14	20	Eduardo Cortés --	1	
513	2011-12-11 02:53:17.259358+01	1	21	20	Portada de Miedo a la Oscuridad	2	Modificado/a author.
514	2011-12-11 02:53:48.847464+01	1	21	20	Portada de Miedo a la Oscuridad	2	No ha cambiado ningún campo.
515	2011-12-11 02:54:16.254418+01	1	21	20	Portada de Miedo a la Oscuridad	2	No ha cambiado ningún campo.
516	2011-12-11 02:59:39.204511+01	1	14	21	El Dado Inquieto --	1	
517	2011-12-11 02:59:57.007262+01	1	15	14	El Pantano de los Suspiros	1	
518	2011-12-11 03:05:23.934992+01	1	15	10	Isla del Terror	2	Modificado/a maxnumplayers y tags.
519	2011-12-11 03:05:32.873183+01	1	15	8	Ojos de Serpiente	2	Modificado/a maxnumplayers, maxlevel y tags.
520	2011-12-11 03:05:37.033532+01	1	15	3	La Profanación	2	Modificado/a tags.
521	2011-12-11 03:05:41.563675+01	1	15	6	¡Traición!	2	Modificado/a tags.
522	2011-12-11 03:05:45.202731+01	1	15	13	El Enclave	2	Modificado/a tags.
523	2011-12-11 03:05:48.496481+01	1	15	4	Ladrones de Cadáveres	2	Modificado/a tags.
524	2011-12-11 03:05:54.081713+01	1	15	5	Ig Nagor	2	Modificado/a maxlevel y tags.
525	2011-12-11 11:57:17.548294+01	1	8	34	Duque Reginbrad -M-None-NPC	1	
526	2011-12-11 12:02:13.255641+01	1	8	35	Turinos Labadía -M-None-None	1	
527	2011-12-11 12:16:13.988705+01	1	9	11	Turinos Labadía -M-None-None -UNDERLING- Duque Reginbrad -M-None-NPC -LORD- Turinos Labadía -M-None-None	1	
528	2011-12-11 12:16:23.131239+01	1	9	11	Turinos Labadía -M-None-None -UNDERLING- Duque Reginbrad -M-None-NPC -LORD- Turinos Labadía -M-None-None	2	Modificado/a author y canon_level.
529	2011-12-11 12:16:51.377152+01	1	8	35	Turinos Labadía -M-None-NPC	2	Modificado/a pncorpc y tags.
530	2011-12-11 12:42:34.81104+01	2	19	7	Élfico	1	
531	2011-12-11 12:44:01.162851+01	2	17	24	Banshees -7	1	
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
15	Adventure	web	adventure
16	Chronicle	web	chronicle
17	Creature	web	creature
18	Creature's Relationship	web	creaturerelationship
19	Language	web	language
20	religion	web	religion
21	image	web	image
22	Tag	taggit	tag
23	Tagged Item	taggit	taggeditem
24	Character-Location Relationship	web	characterlocationrelationship
14	author	web	author
8	Character	web	character
9	Character's Relationship	web	characterrelationship
4	content type	contenttypes	contenttype
2	group	auth	group
10	Location	web	location
7	log entry	admin	logentry
13	migration history	south	migrationhistory
11	Object	web	object
12	Object's Relationship	web	objectrelationship
1	permission	auth	permission
5	session	sessions	session
6	site	sites	site
3	user	auth	user
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
b9c8eb38a691e6c3c97ea9cebe72aaf0	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-09-05 18:34:31.016093+02
ddb4710c9e57927d5986ed0487f4f5c0	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-09-05 19:41:51.395914+02
3e60af4300b2c5b9cebce760f2929845	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-09-05 21:07:11.098043+02
73fbb4c1febe3e95c81152a5bc68ac0e	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-09-05 22:31:58.585579+02
f95f30ccef41e2caa37775f95c103b2f	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-09-06 13:02:41.577182+02
591d77acf739f8c730ac5a3f47562dce	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-09-06 18:07:33.164722+02
c5730094c98bef12bd6f03a6698b2ca7	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-09-06 22:44:09.826466+02
94af1e68a6cb434afe1776bb9ca44999	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-09-06 23:40:55.23263+02
9df049eea39c82756ee2af09d20474d8	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-09-07 15:48:15.32839+02
e855753fee7fd2e2733d4e3e8528518a	MTRmY2U1MmZmZjc4YjJlMGVlOWY3MGZkYjhkOTNmNjAyNDJmOGE1MjqAAn1xAS4=\n	2011-09-07 16:21:18.130741+02
e6c77de765a1eaa4f9bd4f174f7079a4	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-09-10 20:24:59.432871+02
1a4df02ec1a525804f6c029274fcb087	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-09-14 01:21:07.543484+02
d9bbf895820a6287b248aba43b065017	YjcxOWU4MmRiODY2ZGEwNzNlZTUzOTllMTEzMmJhOTNlMTU1NGZmNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLA3Uu\n	2011-10-03 18:12:04.91489+02
7828faa6415ae0fe695883b189df7359	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-07 23:36:21.004611+02
1c0a564c1c50442278446cb2a506f001	NjNmYTA5ZWRiZjQ3YzFlNTU4MjFjMjllMzVjZDBlN2I5MDlhNzUzMTqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n	2011-10-13 08:57:50.254641+02
ddb75496635f7de73ee3d7bbc22c156b	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-15 00:16:19.350512+02
6ea4100549bcd459278d15c4d45470f9	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-10-21 03:37:44.361756+02
dd7d5ef09365f76adcca310995d0cf0d	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-10-23 16:43:34.045977+02
24eedfcfdffec089ddd2c1ea5679223b	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-23 17:57:13.746335+02
e2d48583e0e797eb52510d90dbf7cbe7	YjcxOWU4MmRiODY2ZGEwNzNlZTUzOTllMTEzMmJhOTNlMTU1NGZmNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLA3Uu\n	2011-10-25 18:23:31.047004+02
a5be47d171ab8bb682949a759f8981f7	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-10-26 00:42:22.403732+02
635ac467799d155934e0985d478b0e74	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-10-26 06:09:15.497178+02
c01a44ad66984175bfec2d62b99a30ba	YjcxOWU4MmRiODY2ZGEwNzNlZTUzOTllMTEzMmJhOTNlMTU1NGZmNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLA3Uu\n	2011-10-26 08:32:20.462147+02
d16284822455d10636327f3695e0d05f	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-10-26 11:05:24.536015+02
645843d0e7940ea5234c6bbf0fbbcc94	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-01 13:47:11.949326+01
759537fe6328de60c961f8fca799c59d	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-06 17:35:54.4401+01
229cafa6581b837f2bb33da89d522388	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-06 17:36:34.212169+01
9c30fc7ed7feefde1c11a0729f407abb	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-11-08 18:41:11.270713+01
6ebddf9d8b379d91b744f1a4f0642228	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-09 17:36:25.619815+01
45679684ee5d1d15db857d6d7337424e	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-13 10:26:22.937051+01
52fa98a58e4f39d99413bff4a43a1d5f	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-11-13 13:32:58.753664+01
c5e9307db0075e9230b3b5e8db615945	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-11-15 18:19:09.420208+01
1fae8ee52b095679b861be21e8d23a4b	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-11-18 19:18:24.050546+01
a8620a19fdd81ab4e88286339f704796	ZGZlYTBmMTg4NjFhZjIxYmNmZjczY2MzMmY0ZTVkMTAyN2M0NGVhNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2011-12-06 11:27:53.260055+01
1b174946ee917a30371f5251f91975e3	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-19 23:33:28.360847+01
ac87491c722f91924dfe15ef75a0d3f8	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-12-24 09:54:28.07888+01
6d0aa89410a38f63e09c2c5e961df6dd	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-12-24 19:56:10.086419+01
18dbde4ce9b52b89a83994ae6a18c4b1	M2FlOGUwYzEwYjkzOTNiMjlkZWJjNzhiNDZkZjBjZWQzZWE3NjkwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-25 11:53:14.579293+01
c2341772115a9fb1d25ed2e59b5de564	NWM0N2IyMWRlNjgwMjg0YWI4Mzc1ZjIzMmU2M2U0YWY0ZDdkM2MzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2011-12-25 12:38:27.371788+01
cc2a81381bf10a4e7a7fe02361d8d6c9	NjNmYTA5ZWRiZjQ3YzFlNTU4MjFjMjllMzVjZDBlN2I5MDlhNzUzMTqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n	2011-12-25 18:25:18.774938+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: django
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: django
--

COPY image (id, name, description, comments, canon_level, date, image) FROM stdin;
3	Lakus			\N	2011-10-30	img/lakus_1.jpg
5	Saddin Konnin			AP	2011-11-01	img/saddinkonnin.jpg
6	robleda_pq		Robleda pequeño test	C	2011-11-01	img/robleda.jpg
7	jmprfoto			\N	2011-11-02	img/yojimbo.png
8	Portada de Cantemos junto al fuego			AP	2011-11-04	img/portada_cantemosjuntoalfuego.png
4	Sharra			AP	2011-10-30	img/sharra.jpg
10	Portada La Profanación			AP	2011-11-06	img/profanacion_portada.png
11	Escudo de Esmeril			C	2011-12-10	img/escudoesmeril_1.png
9	Espada Fatana			C	2011-11-05	img/espadafatana.png
12	Portada de Ig Nagor			APC	2011-12-11	img/portadaignagor.png
13	Portada de ¡Traición!			APC	2011-12-11	img/portadatraicion.png
14	Portada de La Hija del Gigante de Hielo			AP	2011-12-11	img/portadahijagigante.png
15	Portada de Ojos de Serpiente			AP	2011-12-11	img/portadaojosserpiente.png
16	Portada de la Tumba de los Horrores			AP	2011-12-11	img/portada_tumbahorrores.png
17	Portada de la Isla del Terror			AP	2011-12-11	img/portadaislaterror.png
18	Portada de La Fonda			AP	2011-12-11	img/portadalafonda.png
19	Imagen de Ethan Ariakos			AP	2011-12-11	img/imagenethan.png
21	Portada de El Enclave			APC	2011-12-11	img/portadaenclave.jpg
20	Portada de Miedo a la Oscuridad			C	2011-12-11	img/portadamiedooscuridad.png
\.


--
-- Data for Name: image_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY image_author (id, image_id, author_id) FROM stdin;
3	3	1
5	8	1
10	4	1
12	10	5
14	9	12
15	12	5
16	13	5
17	14	5
18	15	5
19	16	5
20	17	5
21	18	4
22	19	9
25	21	19
28	20	20
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: django
--

COPY language (id, name, description, comments, canon_level) FROM stdin;
1	Común			C
2	Visirtaní			\N
3	Vetusto	El antiguo lenguaje de la Marca, conformado por runas y símbolos. Es el lenguaje en el que se escribe la magia.		C
4	Trasgoide	La lengua negra de los trasgos, orcos y ogros.		C
5	Minotauro	La gutural y ancestral lengua de los minotauros.		C
6	Lengua de la Sombra	Es un lenguaje antiguo, hoy apenas conocido por uno pocos sabios. Es el idioma de los nigromantes. Se dice que es la lengua de Penumbra, un idioma alienígena, gutural, desagradable al oído, de palabras cortas y sibilantes, que parecieran arrastrase garganta arriba como una serpiente en un lodazal.		C
7	Élfico	El idioma de los hijos de Valion, de los elfos de Esmeril.		C
\.


--
-- Data for Name: language_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY language_author (id, language_id, author_id) FROM stdin;
1	1	1
2	3	3
3	4	3
4	5	3
5	6	3
6	7	3
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: django
--

COPY location (id, name, location, description, startdate, enddate, status, alignment, loctype, deactivated, comments, canon_level, population, creation_date, last_updated) FROM stdin;
36	Lomas Brunas	Muy cerca de la villa de Castamir.	Las Lomas Brunas son un lugar inhóspito, desierto y silencioso de muerte, donde alimañas y cosas aún más horribles deambulan y aguardan a la vera del camino y bajo las raíces de los árboles. Hay docenas de cuevas y cavernas tan profundas como los abismos de Leviatán	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
4	Lazareto	Hacia el sur de Robleda, por el camino de las Colinas Azules que discurre por la ribera occidental del Arroyosauce hasta el Villorio del Estrecho.	En el extremo meridional de la Cañada Siniestra, hay una vieja edificación construida con grandes pilares de sillería, de un color ocre oscuro, que ha tiempo era conocido como El Lazareto de Robleda. En este lugar se confinaba a los más peligrosos delincuentes, tarados y deformes, sometidos a estrecha vigilancia, para el resto de sus días. Cosas horribles se dicen de este lugar dejado de la mano de los dioses, donde la gente moría si ver la luz de sol, encerrados en oscuras mazmorras y sometidos a la crueldad de los guardias y los clérigos paladines de Velex.	\N	\N	R	C	PB	f	En un primer lugar, este sitio era conocido como Asylum o Asilo. Durante el diseño de la caja azul cambió a su actual denominación: lazareto.	C	\N	2011-12-06	2011-12-06
8	La Cañada Siniestra	En medio camino entre Robleda y el Villorio del Estrecho, por el sendero de las colinas azules. 	El camino que discurre entre Robleda y el Villorio del Estrecho atraviesa una hondonada oscura, donde crece una vegetación espesa de árboles viejos y nudosos que abrazan al viajero con sus ramas peladas y retorcidas, alfombrado la vía con hojarasca y musgo esponjoso. Es este un lugar lúgubre, preñado de una quietud preternatural, lo que le ha valido su apelativo, pues son muchos los que creen esta vaguada maldita, un paso embrujado entre este mundo y el más allá. 	\N	\N	Ac	C	Wd	f	Un lugar especial para el grupo de juego original de la Marca, pues vivimos allí algunas aventuras memorables. 	C	\N	2011-12-06	2011-12-06
9	El Villorio del Estrecho de las Tormentas	En la costa del Mar del Dragón. Es la último emplazamiento habitado de Reino Bosque en el estrecho, justo al final del camino de las Colinas Azules.	Este villorrio es un pequeño asentamiento pesquero de temporada, que permanece cerrado durante las semanas tormentosas del crudo invierno, hasta la primavera, una vez que el tiempo se amansa y las bravías aguas del mar del Dragón se aquietan, permitiendo el inicio de las labores pesqueras en la rocosa costa robleña. Es entonces cuando algunas familias de tradición marinera se desplazan desde Robleda a sus cabañas del Villorrio, donde vivirán, compaginando su trabajo en el mar con otras actividades diversas, como el comercio y el cuidado de pequeñas salinas para la obtención de sal. El Villorrio cuenta con una docena escasa de toscas cabañas de madera dispuestas entorno a una plaza central embaldosada que, a la llegada de la temporada, se complementan con amplios pabellones de lona que se unen a la estructura de las construcciones de madera, solapándose. En la parte norte y sur de la aldea existen sendas torres de vigilancia con grandes pebeteros de hierro que por las noches se mantienen encendidos para iluminar los contornos.	\N	\N	Ac	N	Vg	f		C	\N	2011-12-06	2011-12-06
46	Rocas del Draco	A la vera del Camino Viejo de la Mantícora (Camino Mantícora), muy cerca del Coto del Draco.	Extensa y frondosa arboleda que esconde una enigmática construcción de época remota. Se trata de un círculo de dólmenes megalíticos de piedra gris oscura, en torno a una losa central, circular, emplazada sobre cuatro grandes sillares a modo de altar ceremonial.	\N	\N	R	N	Scn	f		C	\N	2011-12-06	2011-12-06
10	Posada del Dragón Tortuga	En el Villorio del Estrecho de las Tormentas.	En el villorrio existe una sola cabaña que ofrece habitaciones para alquilar -en realidad un cobertizo grande construido tras la cabaña y dividido, en su interior, en dos grandes alcobas con 6 incómodos camastros de paja cada una-. Este edificio también es una modesta tabernucha que sirve pintas de cerveza y comidas sencillas a base de pescado (sólo abierta en temporada de pesca). La tasca tiene el pomposo nombre de Posada del Dragón Tortuga (aunque todo el mundo la conoce como la Tortuga, a secas), y está regentada por Nomi Uñaslargas y servida por dos de sus hijos.	\N	\N	Ac	L	Inn	f		C	\N	2011-12-06	2011-12-06
15	La Roca Blanca	Al norte de la Laguna del Liafdag, sobre una farallón boscoso.	Una vieja fortaleza, hoy en estado ruinoso, que se eleva aún orgullosa sobre una colian rocosa y abrupta.	\N	\N	R	C	Cs	f	Un sitio estupendo para colocar un enorme dungeon de varios niveles bajo la fortaleza abandonada.	C	\N	2011-12-06	2011-12-06
11	La Peña de la Mano Encarnada	Entre los campos de los cazadores y la vieja hacienda encantada, por el camino antiguo del Draco hoy prácticamente desaparecido, unas pocas leguas desde la punta septentrional de la cañada del leñador.	La peña es de granito oscuro, de unos cuatro metros de altura y dos metros de diámetro, en forma de cono irregular. Alrededor de la base crecen hierbajos y algunos ramilletes de dientes de león, mientras que por la parte noroeste de la piedra podéis apreciar unos grandes tachones de liquen verde oscuro. En la cara meridional de la peña, sobre una porción lisa de roca, alguien, hace mucho tiempo, grabó y pintó una mano en color encarnado.	\N	\N	R	N	Scn	f	Una localización interesante que puede servir de gancho de aventura para cualquier Narrador con imaginación.	C	\N	2011-12-06	2011-12-06
12	La Llanura de los Centauros	Más allá de las Frondas de los Medianos, entre la vieja Salmanasar y Olmeda, se extienden campos herbosos de suaves lomas onduladas hasta donde alcanza la vista.	Estas planicies son hogar de numerosas criaturas, que campan a sus anchas en las praderas y colinas boscosas que tachonan el hermoso paisaje. Destacan los búfalos y los berrendos de cola negra, así como los perros de las praderas y las águilas imperiales que sobrevuelan el mar de hierba oteando el horizonte en busca de presas, vigiladas por los astutos coyotes, que se mueven con habilidad camuflados entre el matorral y la hierba. 	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
14	La Llanura de Eltauro	Hacia el norte del Bosque Negro, entre el Liafdag y el Gran Pantano.	Estas praderas sin fin están trufadas del ruinas del pasado y ha sido escenario de numerosas batallas y escaramuzas de naciones y pueblos desde los albores del tiempo. Podría decirse que sus campos están regados con la sangre de los soldados, siendo un enorme sagrario. Cientos de túmulos funerarios, fosas y tumbas se ocultan bajo la hierba, esperando ser descubiertas. 	\N	\N	Ac	N	Scn	f	Un lugar imprescindible en la Marca, ideal para ubicar ruinas del pasado, túmulos y tumbas.	C	\N	2011-12-06	2011-12-06
16	La Fonda	En el Camino de la Mantícora, entre Alameda y Robleda, casi a mitad de camino entre ambas localizaciones.	La Fonda es una renombrada posada sita en un pequeño terreno acotado de algo más de media hectárea. Una alta empalizada de madera de abeto reforzada con piedra y argamasa rodea a la propiedad. Varios edificios se distribuyen por el recinto empalizado. El más grande es una hacienda solariega de planta cuadrada, con techumbres de pizarra a dos aguas y muros de mampostería. Es aquí donde el viajero puede encontrar el gran comedor donde se sirven todas las comidas. La cocina y un gran almacén se hayan anexos al salón, mientras en la pared más meridional del conjunto hay una serie de pequeñas estancias o reservados. Dos grandes humeros caldean la habitación en invierno.	\N	\N	Ac	N	Inn	f		C	\N	2011-12-06	2011-12-06
39	El Gran Pantano	Al norte de Pasoraudo. A un par de días de camino desde Robleda a paso tranquilo.	El Gran Pantano es un paraje mítico para todo habitante de la Marca, un lugar que ha desempeñado un importante papel en la historia de Robleda. Desde tiempo inmemorial, los primeros asentamientos humanos en la región se las tuvieron que ver con las belicosas tribus de hombres lagarto que habitan las oscuras marismas, y con cosas aún más horribles, engendradas en la oscuridad del mangle, entre nubes de mosquitos y el olor infecto del cieno.	\N	\N	Ac	C	Sw	f		C	\N	2011-12-06	2011-12-06
38	El Bosque Negro	Al norte de Fonda.	Una vieja floresta que en su día perteneciera al gran bosque de Elverion. Un lugar peligroso y antiguo, lleno de misterios y ruinas de antaño.	\N	\N	Ac	N	Wd	f		C	\N	2011-12-06	2011-12-06
18	Alameda	La villa de Alameda se encuentra en el límite del denso bosque de encinas, robles y acebos que rodea la laguna de Liafdag, llamado Bosqueacebo	Alameda es un pequeño asentamiento rural que subsiste gracias a la recolección de las setas y hongos que crecen en las arboledas fluviales y humedales en torno al lago, así como unas pocas hectáreas de trigo y cebada plantadas cerca de la villa. También es reseñable la pesca de la trucha de cabeza de jarrete en la laguna, que algunos habitantes de Alameda aprovechan para vender en la cercana Fonda del Camino del Comercio consiguiendo no pocos beneficios, ya que la trucha de Liafdag es muy apreciada.	\N	\N	Ac	N	Vg	f		C	\N	2011-12-06	2011-12-06
32	Quebradas del Este	Al suroeste de Robleda.	En estas Quebradas hay docenas de oquedades, grietas y cuevas, misterios enterrados de eras pretéritas.	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
30	Playas Sahuagin	Paraje de costa situado entre Marvalar y el Villorio del Estrecho.	Costa arenosa de playazos y acantilados.	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
20	Pasoraudo	Al norte de Robleda.	Pasoraudo es el vado más importante sobre el Arroyosauce en el Camino del Comercio o de la Mantícora. Fue el primer puente construido sobre el río en tiempo remoto.	\N	\N	Ac	N	Scn	f	Una de las localizaciones más importantes del mundo de la Marca. Un puente muy transitado sobre el Arroyosauce.	C	\N	2011-12-06	2011-12-06
21	Olmeda	Capital provincial de la Marca del Oeste. Ciudad donde se acantona buena parte del Ejército del Oeste.	Olmeda (Ulmus en la lengua ancestral de Elverion) es capital de la Marca del Oeste y base del Ejército del Oeste, cuyo símbolo es un viejo olmo de color negro sobre fondo blanco. Los hombres de la villa son recios, escuetos como el paisaje que se extiende más allá de sus murallas, de ondulados páramos y colinas cubiertas de diente de león y jara.	\N	\N	Ac	L	C	f		C	\N	2011-12-06	2011-12-06
28	Nidaros	Más allá de los Páramos del Pasto, ya muy cerca del Valle Sagrado.	Pequeño pueblo cerca de Carda, apenas habitado por unas cuantas familias de agricultores y ganaderos. Cuenta con una guardia de diez soldados del Ejército del Este.	\N	\N	Ac	L	Vg	f		C	500	2011-12-06	2011-12-06
42	Menhir de los Ancestros	Cerca de la fortaleza de Ermegar.	Misterioso lugar donde puede encontrarse un monolito enorme de una sola pieza de roca oscura que se erige enhiesta en mitad de una planicie herbosa desprovista de arbolado	\N	\N	R	N	Scn	f		C	\N	2011-12-06	2011-12-06
25	Mansión Monstrasgo	Al sur de El Valle Sagrado.	La mansión fortificada del Conde Montrasgo, cuya familia vive aquí desde hace varias generaciones. El Conde Diadematus Lentulo Montrasgo es adelantado de Marvalar y Guardián de la Costa de las Tortugas. en realidad la mansión es un castillo fortificado.	\N	\N	Ac	L	Cs	f		C	175	2011-12-06	2011-12-06
22	Lasminas	En el margen derecho del Arroyosauce, entre Robleda y los Páramos del Pasto.	Sierra minera que ha sido explotada desde hace siglos, aunque en los últimos años ha sido abandonada.	\N	\N	A	C	Scn	f		C	\N	2011-12-06	2011-12-06
33	La Llambría	Cerca de Robleda, al sur de la fortaleza de Ermegar.	Es esta una zona apacible y tranquila, de una belleza natural indiscutible, con grandes peñascos de roca caliza prendidos de líquenes y musgo, resguardados por el boscaje.\r\n\r\nEn este lugar tiene su torre el gran mago Fistan.	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
37	La choza de la Bruja de los Pantanos	En los límites meridionales del Gran Pantano.	En esta pequeña choza de caña y barro vive la bruja Baba Yaga. Es un lugar extremadamente inhóspito y peligroso, infestado de alimañas y rodeado por las aguas estancadas y malolientes del Gran Pantano.	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
27	Lacarda	Pequeña aldea al suroeste de Nidaros.	Lacarda o Carda es una pequeña aldea habitada por unas pocas familias de pastores. En esta villa reside Steinkel y su grupo de aventureros, Lentulus Nobilior.	\N	\N	Ac	L	Vg	f		C	\N	2011-12-06	2011-12-06
19	El Señor de los Caballos	En el pueblo de Alameda.	El Señor de los Caballos es más que una simple taberna y posada, pues cuenta también con un corral grande, otro privado más pequeño y amplias cuadras, amén de dos grandes graneros. A causa de la gran cantidad de caballos que guardan, y los que están de paso, hay un característicos olor a establo en los alrededores de la parada, cosa que ha causado algún problema con los vecinos en no pocas ocasiones.\r\nEl salón de la taberna es un lugar acogedor, caliente y ruidoso, siempre lleno de parroquianos y viajantes venidos de allende la Marca.	\N	\N	Ac	N	Inn	f		C	\N	2011-12-06	2011-12-06
43	El Faro	Al norte del Bosque de las Arañas, cerca de la Mina Vieja.	El Faro de la Marca era un viejo puesto de vigilancia adelantado, guarnecido por una tropa estable de soldados. La fortaleza fue construida aprovechando una vieja construcción enana en el interior de una loma solitaria en la vertiente más septentrional del Valle Angosto de la Linde Norte, cerca del Bosque de las Arañas. Este bastión fue arrasado por una enorme hueste orca hace mucho tiempo.	\N	\N	R	C	Op	f		C	\N	2011-12-06	2011-12-06
35	Cuencatroll	Hacia el suroeste de Robleda.	Hasta donde alcanza la vista, al norte y al sur, al este y oeste, Cuencatroll es una llanura pedregosa, baldía, reseca y salvaje donde los trolls son amos y señores, ocultos durante el día en sus guaridas, para campar a sus anchas por la noche y sembrar el terror por doquiera paseen su desgarbada y monstruosa figura.	\N	\N	Ac	N	Scn	f	Un lugar peligroso, ideal para situar aventuras. Zona con muchos trolls...	C	\N	2011-12-06	2011-12-06
31	Carcavón de los Druidas	Al sur de Robleda, por el camino de las Colinas Azules, cerca de la Cañada Siniestra.	Barrancos y valles cerrados cubiertos de una feraz vegetación, de color verde intenso. Es un lugar sagrado para los druidas.	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
34	Campamento de Pegrin	Muy cerca de Cuencatroll, hacia el este.	Dada la proximidad de Cuencatroll, el Duque de Robleda mandó una compañía de su ejército a este lugar para guardar los vados entre Llambria y el Carcavón de los Druidas y así evitar que los trolls llegaran hasta más allá de las Quebradas del Este. El campamento se llama Pegrin en honor a un centurión heroico que murió en la Batalla de los Tres Ejércitos.	\N	\N	Ac	L	Op	f		C	50	2011-12-06	2011-12-06
41	Bosque de las Arañas	Al oeste de las Quebradas de la Ciénaga.	Una antigua floresta, perteneciente otrora al gran bosque de Elverion. Sin duda, uno de los lugares más peligrosos de la Marca. El Bosque de las Arañas es de una espesura casi sobrenatural, donde las copas de los árboles se entrelazan de manera caprichosa, enredándose en un intrincado diseño que apenas deja pasar la luz, convirtiendo el bosque en un lugar oscuro donde anidan las arañas.	\N	\N	Ac	N	Wd	f		C	\N	2011-12-06	2011-12-06
24	Boscazul	Al este de arena, muy cerca.	Pequeña floresta cercana al pueblo de Arena.	\N	\N	Ac	N	Wd	f		C	\N	2011-12-06	2011-12-06
23	Arena	Un pequeño pueblecito de pescadores en Costortuga.	 Arena es apenas un conjunto de cabañas sencillas construida sobre una zona de dunas conocida como las Dunas Piratas, pues antaño era un lugar elegido por los bucaneros del estrecho para desembarcar y descansar.	\N	\N	Ac	N	Vg	f		C	500	2011-12-06	2011-12-06
29	Torregnoll	Al sur de Alameda, cerca de Sendaelfo.	Vieja torre de vigilancia que aún se mantiene en activo. El Ejército del Este la emplea para vigilar la frontera de la Marca con el reino de Visirtán.	\N	\N	Ac	L	Op	f		C	20	2011-12-06	2011-12-06
7	La Tienda de Cuero de Gorm	Robleda	<p>La Tienda de Cuero de Gorm, situada a las afueras de la ciudad debido a que el terrible hedor del proceso de curtir las pieles tiende a convertir a los buenos vecinos en enemigos, elabora y vende excelentes objetos de cuero. El edificio posee dos habitaciones, una dedicada a la fabricación y la otra dedicada a manufacturar los objetos y despacharlos a la clientela. La ribera de curtido está completamente atestada de barriles y tinajas llenas de pestilentes recurtientes y extractos vegetales. De sus paredes cuelgan los cueros húmedos para que, poco a poco, escurran el exceso de agua. Gorm se encuentra aquí la mayor parte del tiempo, junto a sus dos aprendices, Jano y Juno, dos hermanos gemelos de la estirpe de los Labadía. </p>\r\n\r\n<p>Gorm vende ropas, bolsas, botas, guantes, mochilas y armaduras de gran calidad. Gorm marca todos sus objetos de cuero con motivos de pájaros, generalmente águilas o halcones.</p>	\N	\N	Ac	N	Shp	f		C	\N	2011-12-06	2011-12-06
40	Quebradas de la Ciénaga	Hacia el oeste del Gran Pantano.	La sierra de las Quebradas de la Ciénaga es un lugar malhadado e inhóspito, hogar de todo tipo de criaturas terribles, incluyendo a los trasgos y grandes trasgos, que habitan en complejos subterráneos en el interior de las montañas de la ciénaga. 	\N	\N	Ac	N	Mn	f		C	\N	2011-12-06	2011-12-06
48	Mantoverde	En la ribera occidental del Draco.	Gran extensión herbosa de campos de labranza y praderas de pasto.	\N	\N	Ac	N	Scn	f		C	\N	2011-12-06	2011-12-06
47	Fuerteloma	Cerca del Coto del Draco, en el Camino de la Mantícora. En Mantoverde.	Fuerteloma es una fortaleza de la Marca donde hay acantonado un destacamento de dos batallones del Ejército del Oeste que se encargan de garantizar la seguridad de los campos de labranza de Mantoverde.	\N	\N	Ac	L	Cs	f		C	600	2011-12-06	2011-12-06
49	El Draco	El Draco discurre por Mantoverde y desemboca en Marvalar.	Río principal de la Marca del Este y Reino Bosque	\N	\N	Ac	N	Rv	f		C	\N	2011-12-06	2011-12-06
45	Coto del Draco	El Coto es una famosa posada del Camino Mantícora, un remanso de paz y seguridad en la peligrosa vía, muy próxima en esta zona a Valle Oscuro	El Coto se encuentra en la cima de una pequeña colina, y es el único asentamiento conocido que existe en la zona. Según asciende el sendero por la ladera de la colina, éste se ensancha y allana repentinamente, formando una pequeña vaguada abrigada y cubierta de pinos en la que se alza la empalizada. Cerca de la base de la colina fluye un arroyo pequeño, aunque en época de deshielo se transforma en una rambla muy caudalosa.\r\n\r\nEl establecimiento consta de tres edificios: lo establos, la casa de baños y la posada propiamente dicha.	\N	\N	Ac	L	Inn	f		C	\N	2011-12-06	2011-12-06
6	Esmeril	Esmeril	<p>Esmeril linda al sur con Reino Bosque y las Frondas, al oeste con el Lamedal y al este con el Gran Pantano y las quebradas. Al norte, las densas florestas de Elverion coronan las desfiladeros y acantilados de Edenewen, desde donde, en días despejados, se puede ver con nitidez la sombra de Dormunder a oriente, flotando en las brumas marinas del Mar de Esmeril, Arianwen.</p>\r\n\r\n<p>Con el paso de los siglos y debido a las continuas luchas, guerras y conflictos acaecidos, el gran bosque de Elverion es sólo una sombra de lo que fue en tiempo de Valion, aunque el corazón del mismo se mantiene incólume, acogiendo en su seno la capital de los elfos, Florisel. \r\nFlorisel es una ciudad hermosa, construida sobre los árboles milenarios en el corazón del Bosque Viejo. Hay palacios y mansiones erigidas en el interior de los enormes troncos, y casas colgadas de las frondosas enramadas cargadas de flores azules, rojas y amarillas. La hermosa hierba dorada tapiza el suelo y la corteza de los robles es lisa y gris, suave como el ámbar pulido, que refleja la pálida luz del crepúsculo arrojando destellos azulados sobre los brotes frescos que verdean doquiera uno fije su mirada. El agua corre en libertad entre la hierba, en pequeños cursos áureos que alimentan la tierra como un manojo de arterias ruidosas y efervescentes, y el leve perfume de flores y árboles rebosa en los jardines de Florisel, los más bellos sobre la tierra.\r\n</p>\r\n<p>Muy pocos hombres han visto con sus ojos este enclave privilegiado, pues llegar hasta él sin el permiso de los elfos es poco menos que imposible. Desde los límites del bosque hacia el interior, nada se mueve sin ser detectado por los elfos, que tienen desplegados numerosos grupos de vigilancia en la espesura. Las típicas patrullas de montaraces y guardabosques elfos se componen de unos 50-100 individuos, fuertemente armados con arcos largos compuestos, espadas largas, sables curvos, dagas y jabalinas ligeras, cotas de malla livianas, petos de cuero o simplemente capas élficas. Aparte de las patrullas, el bosque está habitado por muchas criaturas salvajes, muy peligrosas, que no atacarán a los elfos pero no dudarán en asaltar a cualquier intruso descuidado que penetre la espesura.\r\n\r\n\r\n<p>El Bosque Viejo es un lugar misterioso, antiguo y prácticamente virgen, que pocos se han atrevido a explorar. Se dice que numerosas ruinas antiguas, reliquias de otro tiempo y criaturas fabulosas pueblan la espesura. A la noche, la espesura se torna un lugar terrible, oscuro y siniestro patrullado por las almas en pena de los elfos que sucumbieron en la tristeza de un muerte indigna, la traición y la desesperanza. Son los caminantes aullantes, espectros níveos, de luz espectral y llanto mortal... los bashees.</p>\r\n\r\n<p>Esmeril es el reino más antiguo del viejo continente, formado en tiempo inmemorial por la estirpe de Valion en el bosque sagrado de Elverion, llamado el Bosque Viejo por los humanos. Originalmente, esta floresta ocupaba gran parte del continente, desde las llanuras de los centauros más allá del Oxus, hasta las estribaciones arenosas de Eretria, en lo que hoy es Visirtán. Este bosque era conocido como Elverion, Hogar de los Elfos. Un gran camino, Sendaelfo, cruzaba el bosque en diagonal, uniendo las dos ciudades más importantes, Florisel y Calvera. Durante muchos años, los elfos vivieron en paz en el bosque, y prosperaron en sus ciudades. No obstante, al cabo de los siglos, espoleados por la maldad de Penumbra, los trasgos se agitaron en el norte helado de la Marca de los Titanes descendiendo por Eltauro para asentarse en las estribaciones septentrionales de Elverion. Desde allí, sirviéndose del fuego negro de la Sombra, penetraron en la espesura sagrada, arrasando grandes extensiones, quemando y destruyendo los venerables árboles. Luego acudieron los gnolls de las estepas, los lobos que camina erguidos, para ayudar a sus hermanos orcos, y con ellos vinieron los ogros y los trolls, y los pequeños kobolds, y otros criaturas iniestras que se arrastraban y aullaban. Calvera resultó destruida por completo en las Guerras Trasgo, arrasada por el fuego negro de la Sombra: donde antes se erigía la más bella ciudad del mundo, sólo quedó un erial calcinado. Las gentes de Esmeril defendieron su tierra con furia, pero no fue suficiente. Y entonces los elfos acudieron a los humanos, que vivían más allá de las frondas en paz, y pidieron su ayuda para derrotar a las bestias de Penumbra, y estos accedieron, pues vieron la amenaza de la Sombra cerca de sus hogares. Y juntos, humanos y elfos, vencieron a los trasgos y apagaron los fuegos negros que consumían Elverion. Los elfos, agradecidos, consintieron que humanos y halflings se asentaran en los vados del Arroyosauce, en la costa, hasta las Frondas de los Medianos y las montaña del Liafdag y los pasos de Eretria. Desde entonces, humanos y elfos vivieron en paz. \r\n</p>\r\n\r\n<p>Después de la caída de Calvera, y tras la derrota de los trasgos, los hombres se establecieron en la costa y a lo largo del Draco y el Arroyosauce. El hombre comenzó a labrar la tierra, explotar los bosques y pescar en los ríos y mares. Se multiplicaron las recuas de trajín en los campos de labor, y el ganado en los páramos herbosos donde antes había bosques tan frondosos como las junglas del Barambali. Los hombres hubieron de soportar, empero, los repetidos ataques de las bandas de trasgos que se ocultaban en las colinas y las llanuras de Eltauro. Más tarde, se estableció la Marca del Este del Reino Bosque, con su capital en Marvalar (Marvolor en el idioma de Elverion), y se fundó Robleda. La ciudad no tardó en ser atacada por los hombres lagartos del Gran Pantano, que veían con temor la expansión del hombre en los vados. Los saurios de la ciénaga estaban en paz con los elfos desde tiempo inmemorial, pero el hombre era una bestia mucho más peligrosa y ambiciosa que los señores de los árboles. Con todo, la Marca resistió, y aunque la ciudad fue destruida, se reconstruyó poco tiempo después, en el año 222. Tras la refundación de Robleda, se firmó la alianza de hombres y elfos, La Alianza del Roble, por el  cual se reconocían los límites de Reino Bosque y aquellos de Esmeril, circunscritos hoy a la gran extensión del Bosque Viejo de Esmeril o Elverion, el Bosque de las Arañas y el Bosque Negro, pues estas floresta eran todas una con Elverion en tiempos pasados. Así, elfos y humanos se reforzaban mutuamente, guardando sus fronteras contra los trasgos y saurios del Gran Pantano. Por este tratado, los elfos son libres de viajar por Reino Bosque sin ser importunados, mientras que ningún humano penetrará en los bosques de los elfos sin razón de peso. \r\n</p>\r\n<p>Tras la alianza firmada con Reino Bosque, se inició un largo periodo de prosperidad para elfos y humanos. La ciudad de Florisel se convirtió en el más bello enclave del Mundo, desterrando al olvido el aciago recuerdo de la perdida de Calvera. Los elfos reforzaron sus fronteras y entrenaron a sus fuerzas para patrullar más allá de los bosques, en los pantanos y las llanuras cercanas.\r\nLa Luz de los Luceros de Esmeril brilla hoy con más fuerza, a la vera del trono de Florisel, del linaje de Valion el Magno, dios del bosque y de los elfos, aquel que escapó de la sombra a la luz de la Llama de los titanes. Florisel es el rey de Esmeril, del Bosque de las Arañas y el Bosque Negro, y los Pueblos Perdidos, es decir, todos los elfos que son más allá del reino, diseminados por todo el Mundo, desde Salmanasar hasta Endo.\r\n</p>\r\n<h2>Política</h2>\r\n\r\n<p>Esmeril es una monarquía de corte absolutista, pues el rey dispone de un poder casi omnímodo, asistido por un consejo noble de notables. De manera similar, el rey es la cabeza del concilio militar que se reúne cada luna para tratar asuntos relativos a la integridad y seguridad del reino. Este concilio militar cambia su carácter eventual por el de permanente cuando el reino entra en guerra, cosa que no pasa desde hace muchos años. </p>\r\n\r\n<p>Florisel es el rey de Esmeril, descendiente de la estirpe de Valion e hijo de Melangel y Elliehanne, nieto de Tangustel el Grande y Meriawan, señores de Elverion, de la sangre de El Primero en la Luz, hijos de Avaon Angharad y la bella Innogen de Calvera.</p>\r\n\r\n<p>Idris Pendaran es reina consorte de Florisel, la Señora Blanca del Camino de los Elfos y el Taliesin, y primogenita de la casa Pendaran, senescales de antaño, Guardianes del Valle y los Pasos, del Raudo y Einion (La Costa del Sur).</p>\r\n\r\n<h2>Religión</h2>\r\n\r\n<p>Los elfos adoran a Valion, señor del Bosque y los Árboles, del Roble y la Hierba, de todas las criaturas que habitan las frondas, de los elfos y la luz. Valion, el primero de los primeros que abandonaron la Sombra para prender los luceros de Esmeril con la luz de los Titanes.  En ocasiones se representa a Valion como un sol fulgurante despuntando en el horizonte.</p>\r\n\r\n<p>Aneirin es la esposa de Valion, señora del rocío de la mañana y la cálida brisa del atardecer. Aneirin es la luz crepuscular y el brillo de la luna llena derramándose sobre el mundo. Aneirin es la magia de las pequeñas cosas que pasan desatendidas a ojos de Valion. Su símbolo es aquel que muestra la luna menguando sobre la colina.</p>\r\n\r\n<p>La más importante reliquia custodiada en el mundo se encuentra en la sala del trono de Florisel, el Salón de los Siglos, donde brilla la Luz de los Titanes en el Nanoc sagrado de los elfos, la Urna de Luz, un artefacto de poder ignoto.</p>\r\n\r\n<p>Nota para el Narrador: Si bien muchos de los poderes de la Urna de Luz quedan a criterio del Narrador, su poder debe quedar patente, y al menos debería poseer alguna de estas facultades: disipar el mal de forma constante, proyectar luz en un área de 200 metros de intensidad y con efectos iguales a la luz solar, discernir el alineamiento de aquellos presentes en un área de 30 metros a su alrededor, expulsar a todo muerto viviente en un área de 200 metros sin posibilidad de salvación contra dicho efecto. De igual manera, el Rey puede interpelar a los poderes de la Urna una vez al mes y discernir el futuro. Sería también probable que pudiera convocarse a algún tipo de avatar de Valion para proteger la Urna en caso de peligro. Esta defensor tendría que poseer extraordinarias características y poder formidable.</p>\r\n\r\n<p>La Urna es una especie de arca transportable mendiante dos varas paralelas o andas, de forma rectángular, en cuyo interior hay un pebetero donde llamea el fuego primigenio, con una tonalidad verdeazulada. Los paneles laterales del arca son de cristal de roca grabado con escenas mitológicas, mientras que el resto de la estructura está construida con oro, platino y mithril. Sobre la Urna descansa la regalía del Rey: la Corona de Elverion (Auryn), la Espada de las Florestas (Cedifor) y el Arco del Mediodía (Garanhir).</p>	1	\N	Ac	L	Cp	f		C	\N	2011-12-06	2011-12-06
13	Puertoeste	Puertoeste es la segunda ciudad más importante de la Marca del Oeste tras la noble Olmeda. La ciudad se encuentra emplazada en la costa del Mar del Dragón, hacia el oeste desde Marvalar, y cuenta con uno de los puertos navales más importante del reino, sólo superado por los muelles y atarazanas reales de Marvalar, capital del Reino.	En los muelles de Puertoeste recalan naos, carabelas, galeras, galeazas, galeones, esquifes y barcazas de cabotaje comerciales de todo el mundo conocido, cargados de especies de oriente, esclavos de Neferu, armas del Visirtán, extrañas reliquias de Ziyarid y docenas de fardos, cargas, envíos, baúles, mercancías y mercaderías de diversa naturaleza, pelaje y condición. La ciudad es una efervescente caos ahíto de mercachifles, bergantes, marinos, fulanas, soldados de la marina real y buscavidas que luchan por sobrevivir en los pintorescos barrios marineros de la bulliciosa ciudad.	\N	\N	Ac	N	C	f		C	\N	2011-12-06	2011-12-06
44	La Mina Vieja	Al norte de la Marca, muy al norte, más allá de El Faro y la floresta de las arañas.	Aquí, muchos años atrás, hubo una gigantesca explotación minera que horadó la tierra, creando docenas de niveles subterráneos que forman una intrincada red laberíntica en el subsuelo. Los enanos de Moru trabajaron en este desolado terreno durante generaciones, al amparo de los tratados comerciales firmados con las gentes de las marcas y los elfos de Esmeril. No fue fácil trabajar en estos páramos, ya que el trasgo es fuerte al norte y otras muchas criaturas horribles tienen su hogar en estas tierras olvidadas	\N	\N	Ac	C	Scn	f		C	\N	2011-12-06	2011-12-06
26	El Valle Sagrado	 Al este de Lasminas, cerca de Carda y Nidaros	Valle boscoso siempre cubierto por una extraña neblina húmeda que se pega al suelo y zigzaguea entre los troncos de los viejos robles y olmos en la espesura. Al este, unas colinas quebradas se alzan sobre las copas de los árboles. En el centro de los valles hay una pequeña laguna de aguas negras y en su orilla se pueden observar tres viejas edificaciones en ruinas.	\N	\N	R	C	Scn	f	Un lugar ideal para emplazar aventuras y campañas de juego.	C	\N	2011-12-06	2011-12-06
17	El Fuerte Empalizado	En el límite meridional de la sierra del Liafdag.	El fuerte se encuentra emplazado sobre una colina achatada que domina todo el entorno de la llanura herbosa circundante. Una alta y reforzada empalizada construida con recios troncos de roble anudados cierra el recinto por completo, al que sólo se puede acceder mediante una única puerta de doble hoja en la cara sur de la empalizada. La entrada es en realidad un puente levadizo que permite cruzar el profundo foso que rodea el fuerte. Sobre la entrada se ha construido una torre de madera, para controlar la subida y bajada del puente levadizo. En el centro de la loma se ha construido una atalaya cuadrada de sillares de piedra granítica con la planta superior almenada, en la cual se han emplazado dos balistas de guerra pesadas –cada una de ellas encarada en dirección opuesta-.\r\n\r\nEs un lugar que sirve de puesto avanzado de vigía de las tropas de Reino Bosque sobre los territorios de Ungoloz.	\N	\N	Ac	L	Op	f		C	\N	2011-12-06	2011-12-06
3	Castillo de Ermegar	Entre Robleda y el Coto del Draco.	Entre Robleda y el Coto del Draco, el viajero que se aventure por el peligroso Camino de la Manticora, encontrará un lugar seguro donde descansar y avituallarse en el castillo de Ermegar. \r\n\r\nLa fortaleza pertenece desde tiempo inmemorial a la familia Ermegar, representada hoy por el conde de Ermegar, Lucius Scipio Ermegar. Desde hace muchos años, y por mandato real del trono de Marvalar, los condes de Ermegar tienen la misión de proteger a los viajeros que transiten el Camino del Comercio entre el Coto del Draco y Robleda. Para cumplir esta misión, el conde cuenta con tres compañías del Ejército del Este que patrullan constantemente el camino, aparte de proteger la fortaleza de cualquier ataque.\r\nEl castillo propiamente dicho cuenta con numerosas habitaciones para acoger a los viajeros, incluyendo establos para las bestias, taberna con amplios comedores y barracones para la tropa, amén del edificio principal: el palacio fortificado de la familia Ermegar.\r\nAquí vivía Laurana Ermegar antes de su misteriosa desaparición, hija de Lucius y la princesa elfa Laurantia de Florisel, sobrina de Florisel, desposada con el poderoso conde para reforzar la alianza política y militar entre el reino de Esmeril y Reino Bosque. Aunque el enlace tuviera un componente estratégico y político nada desdeñable, entre el conde y la princesa surgió el amor de manera inopinada. Lucius adora a su mujer, fruto de cuyo seno es la hermosa Laurana, que ha heredado la belleza imperecedera de su madre y el ardor guerrero de su padre. Laurana es, por tanto, una semielfa, algo muy poco habitual en la Marca, ya que los elfos son seres esquivos, altivos y orgullosos, que no gustan de relacionarse con otras razas, especialmente los enanos.	\N	\N	Ac	N	Cs	f		C	\N	2011-12-06	2011-12-06
2	Robleda	En pleno centro de la Marca del Este, dentro de Reino Bosque, a la vera del Arroyosauce y muy cerca del Camino del Comercio.	<p>Robleda es una ciudad pequeña, recogida y acogedora. Se encuentra situada sobre una colina que domina los campos circundantes. Alrededor de la ciudad se ha construido una gran muralla de color rojizo sobre un terraplén. Este muro exterior cuenta con torres de vigía, construidas con ladrillo y reforzadas con piedra.</p>\r\n<p>Las calles de la ciudad son estrechas y empedradas, manteniéndose limpias y cuidadas. Las casas son bajas, de una planta, aunque existen algunas más altas, incluso de dos o tres pisos. Las viviendas están construidas con fuerte y nudosa madera de roble, reforzada con piedra de canto en sus esquinas y planta baja. Las techumbres son a dos aguas, de pizarra negra en algunas casas (aquellas de las familias más acomodadas) y de pajizo de cáñamo anudado en las haciendas menos favorecidas. Unos pocos caserones grandes y solariegos, están levantados íntegramente en piedra oscura y gris, con techos y artesonados de madera.</p>\r\n<p>Las calles se abren y distribuyen desde la plaza central de la villa, donde se levanta la casona del Consistorio del Burgomaestre. Muy cerca de ella se alza la Casa de la Mañana, consagrada a Valion. La Casa de la Mañana es un templo construido en granito ocre, algo verdoso debido al musgo que crece en sus arrugas y grietas.</p>\r\n<p>A un lado del Consistorio se encuentra el Alguacilazgo de la Guarda de Robleda y la pequeña prisión anexa. También cerca del Consistorio, pero en el lado opuesto al casón del alguacil, podemos encontrar la oficina del Licurgo de Aduanas, que realiza a su vez funciones de almotacén, recaudador de impuestos e intendente de Marvalar. La casa siempre está guardada por dos soldados apostados en garitas de pie y armados con grandes alabardas.</p> \r\n<p>Muy próxima a la plaza, en una casona cuadrada hecha en madera de roble y techada de pizarra marrón claro, se reúne el influyente Consejo de Vecería. El consejo se dedica a velar por el buen uso y cuidado de las veredas de pastoreo, así como la organización de las recuas de arriendo para el trajín de los campos de labranza. Un pequeño almacén, en la parte trasera de la casona del Consejo, contiene los aperos y armas de los Guardas de Vecería, que cuidan de los campos y colinas, manteniendo a raya a alimañas y ladrones de ganado.</p>	100	\N	Ac	N	C	f		C	75000	2011-11-01	2011-11-01
5	La Jarra de Oro	Robleda	<p>La Jarra de Oro es un edificio de una sola planta con un pequeño sótano privado regentado por Laurus Cortezaverde. Laurus lleva casi toda su vida dedicado al noble arte de la restauración aunque no fue hasta hace diez años que consiguió ahorrar lo suficiente para comprar este edificio cerca de la Puerta del Vado, en mitad del Paso de Elverion, y convertirlo en su propia taberna. Algunos hablan de un Laurus viajero y aventurero en sus años mozos pero él siempre lo ha desmentido.</p>\r\n\r\n<p>De lo que sí presume es de tener la mejor bodega de Robleda, si no la más cuantiosa, la más selecta y cuidada. Cierto es que apenas tiene ocasión de servir sus buenos caldos a los viajeros ya que el oro que pide está por encima de las posibilidades de su clientela habitual, pero aquellos viajeros acomodados que lleguen a Robleda por el Camino Mantícora y quieran refugiarse en su acogedora sala bien harían en dejar que Laurus les sugiera un vino con el que acompañar el estofado de buey del que está enormemente orgulloso.</p>\r\n\r\n<p>No dispone de una carta estable de precios pero una buena aproximación podría ser:\r\n<ul>\r\n<li>Cerveza – 1 mp</li>\r\n<li>Vino de la casa – 5 mp</li>\r\n<li>Vino reserva bodega Rojosauce – 5mo</li>\r\n<li>Vino reserva bodega Rojosauce año 485 – 12 mo</li>\r\n<li>Vino reserva bodega Rojosauce año 485, Lote rojo – preguntar</li>\r\n<li>Sopa de cebolla – 1 mp</li>\r\n<li>Sopa de pollo – 3 mp</li>\r\n<li>Estofado de pollo – 6 mp</li>\r\n<li>Estofado de ternera – 13 mp</li>\r\n<li>Estofado de buey – 19 mp</li>\r\n<li>Chuletas de cabrito – 18 mp</li>\r\n</ul>\r\n<p>\r\nPor otro lado, Laurus es un hombre que ya cumplió los cuarenta aunque su altura y complexión fuerte le hacen parecer más joven.</p>	510	\N	Ac	N	Tv	f	Esta posada aparece en un relato del mismo nombre que sirvió para crearla \r\nhttp://ithilien.eu/?p=731	C	\N	2011-12-06	2011-12-06
\.


--
-- Data for Name: location_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY location_author (id, location_id, author_id) FROM stdin;
66	7	3
68	29	3
69	46	3
70	32	3
71	40	3
72	13	3
73	10	3
74	30	3
75	20	3
76	21	3
77	28	3
78	42	3
79	48	3
80	25	3
81	36	3
82	4	3
83	22	3
84	15	3
85	11	3
86	44	3
87	12	3
88	14	3
89	33	3
90	16	3
91	37	3
92	27	3
93	8	3
94	47	3
95	9	3
96	26	3
97	19	3
98	39	3
99	17	3
100	43	3
101	49	3
102	38	3
103	35	3
104	45	3
105	3	3
106	31	3
107	34	3
108	41	3
109	24	3
110	23	3
111	18	3
112	2	3
114	5	1
115	6	3
\.


--
-- Data for Name: location_image; Type: TABLE DATA; Schema: public; Owner: django
--

COPY location_image (id, location_id, image_id) FROM stdin;
10	2	6
11	6	11
\.


--
-- Data for Name: location_languages; Type: TABLE DATA; Schema: public; Owner: django
--

COPY location_languages (id, location_id, language_id) FROM stdin;
\.


--
-- Data for Name: location_relatedobject; Type: TABLE DATA; Schema: public; Owner: django
--

COPY location_relatedobject (id, location_id, object_id) FROM stdin;
9	4	30
10	2	36
\.


--
-- Data for Name: location_religion; Type: TABLE DATA; Schema: public; Owner: django
--

COPY location_religion (id, location_id, religion_id) FROM stdin;
\.


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: django
--

COPY object (id, name, description, status, alignment, objtype, rarity, properties, ppvalue, gpvalue, spvalue, cpvalue, fabvalue, deactivated, comments, canon_level, creation_date, last_updated) FROM stdin;
14	Espada Corta		Cr	NA	W	C	Daño: 1d6\r\nPeso: 1kg	0	7	0	0	f	f		NEW	2011-12-06	2011-12-06
34	Moneda de Plata	Moneda de plata	Cr	NA	C	C		0	0	1	0	f	f		C	2011-11-05	2011-11-05
3	Flechas (10)	<p>Quisque luctus arcu suscipit est aliquet vulputate. Proin egestas metus ac augue pharetra ultricies. Vivamus at nisi mauris, a rhoncus justo. Nam vitae ullamcorper nulla. In vulputate, elit id luctus varius, lorem tellus adipiscing libero, eget laoreet eros est vitae erat. Nam suscipit tincidunt euismod. Vivamus placerat est at mi iaculis volutpat. Vestibulum euismod scelerisque enim nec egestas. Ut aliquam, felis ut ullamcorper volutpat, nisl nulla laoreet mauris, in posuere nulla purus ut augue. Integer eu arcu vel lorem eleifend mattis quis ultricies augue. Phasellus tempor porttitor libero ac posuere. Suspendisse eu dui id est lobortis varius ac vel nibh. In iaculis faucibus sem, at sodales turpis accumsan eget. Maecenas congue, tellus ut consectetur malesuada, eros felis porta odio, vel egestas nisl arcu ut sapien.</p>	Cr	NA	W	C	<p>Peso: 1/2kg</p>\r\n<p>Quisque luctus arcu suscipit est aliquet vulputate. Proin egestas metus ac augue pharetra ultricies. Vivamus at nisi mauris, a rhoncus justo. Nam vitae ullamcorper nulla. In vulputate.</p>\r\n	0	3	0	0	f	f	<p>Quisque luctus arcu suscipit est aliquet vulputate. Proin egestas metus ac augue pharetra ultricies. Vivamus at nisi mauris, a rhoncus justo. Nam vitae ullamcorper nulla.</p>	NEW	2011-11-05	2011-11-05
33	Moneda de Oro	Moneda de oro	Cr	NA	C	C		0	1	0	0	f	f		C	2011-11-05	2011-11-05
35	Moneda de Cobre	Moneda de cobre	Cr	NA	C	C		0	0	0	1	f	f		C	2011-11-05	2011-11-05
37	Maza demoledora		Cr	N	W	U		0	0	0	0	t	f	Se me ocurrió este objeto cuando fui Carcassonne...	AP	2011-11-05	2011-11-05
6	Virotes (20)		Cr	NA	W	C	Peso: 1kg	0	5	0	0	f	f		NEW	2011-12-06	2011-12-06
32	Tridente		Cr	NA	W	C	Daño: 1d6\r\nPeso: 2kg	0	4	0	0	f	f		NEW	2011-12-06	2011-12-06
30	Pica Pesada		Cr	NA	W	C	Daño: 1d8\r\nPeso: 3kg	0	8	0	0	f	f		C	2011-12-06	2011-12-06
31	Pica Ligera		Cr	NA	W	C	Daño: 1d6\r\nPeso: 2kg	0	5	0	0	f	f		NEW	2011-12-06	2011-12-06
29	Maza		Cr	NA	W	C	Daño: 1d6\r\nPeso: 2kg	0	5	0	0	f	f		NEW	2011-12-06	2011-12-06
27	Martillo Ligero		Cr	NA	W	C	Daño: 1d4\r\nPeso: 1kg	0	1	0	0	f	f		NEW	2011-12-06	2011-12-06
28	Martillo de Guerra		Cr	NA	W	C	Daño: 1d6\r\nPeso: 3kg	0	7	0	0	f	f		NEW	2011-12-06	2011-12-06
26	Lucero del Alba		Cr	NA	W	C	Daño: 1d6\r\nPeso: 3kg	0	5	0	0	f	f		NEW	2011-12-06	2011-12-06
25	Látigo Pesado		Cr	NA	W	C	Daño: 1d8\r\nPeso: 5kg	0	8	0	0	f	f		NEW	2011-12-06	2011-12-06
24	Látigo		Cr	NA	W	C	Daño: 1d6\r\nPeso: 2kg	0	3	0	0	f	f		NEW	2011-12-06	2011-12-06
23	Lanza		Cr	NA	W	C	Daño: 1d6\r\nPeso: 5kg	0	7	0	0	f	f		NEW	2011-12-06	2011-12-06
22	Jabalina		Cr	NA	W	C	Daño: 1d6\r\nPeso: 1kg	0	1	0	0	f	f		NEW	2011-12-06	2011-12-06
21	Honda		Cr	NA	W	C	Daño: 1d4\r\nPeso: 0kg	0	2	0	0	f	f		NEW	2011-12-06	2011-12-06
20	Hacha de Mano		Cr	NA	W	C	Daño: 1d6\r\nPeso: 2kg	0	1	0	0	f	f		NEW	2011-12-06	2011-12-06
19	Hacha de Combate		Cr	NA	W	C	Daño: 1d8\r\nPeso: 3kg	0	6	0	0	f	f		NEW	2011-12-06	2011-12-06
18	Garrote		Cr	NA	W	C	Daño: 1d4\r\nPeso: 1kg	0	3	0	0	f	f		NEW	2011-12-06	2011-12-06
15	Espada Larga		Cr	NA	W	C	Daño: 1d8\r\nPeso: 2kg	0	10	0	0	f	f		NEW	2011-12-06	2011-12-06
17	Espada de dos manos		Cr	NA	W	C	Daño: 1d10\r\nPeso: 8kg	0	15	0	0	f	f		NEW	2011-12-06	2011-12-06
16	Espada Bastarda		Cr	NA	W	C	Daño: 2d4\r\nPeso: 3kg	0	20	0	0	f	f		NEW	2011-12-06	2011-12-06
13	Dardo		Cr	NA	W	C	Daño: 1d4\r\nPeso: 1/2kg	0	0	5	0	f	f		NEW	2011-12-06	2011-12-06
12	Daga de Plata		Cr	N	W	C	Daño: 1d4\r\nPeso: 1/2kg	0	30	0	0	f	f		NEW	2011-12-06	2011-12-06
11	Daga		Cr	NA	W	C	Daño: 1d4\r\nPeso: 1/2kg	0	3	0	0	f	f		NEW	2011-12-06	2011-12-06
10	Cimitarra		Cr	NA	W	C	Daño: 1d8\r\nPeso: 2kg	0	15	0	0	f	f		NEW	2011-12-06	2011-12-06
9	Cachiporra		Cr	NA	W	C	Daño: 1d6\r\nPeso: 2kg	0	2	0	0	f	f		NEW	2011-12-06	2011-12-06
8	Bastón		Cr	NA	W	C	Daño: 1d8\r\nPeso: 8kg	0	7	0	0	f	f		NEW	2011-12-06	2011-12-06
5	Ballesta Pesada		Cr	NA	W	C	Daño: 1d8\r\nPeso: 2kg	0	40	0	0	f	f		NEW	2011-12-06	2011-12-06
7	Ballesta Ligera		Cr	NA	W	C	Daño: 1d6\r\nPeso: 1kg	0	25	0	0	f	f		NEW	2011-12-06	2011-12-06
2	Arco Largo		Cr	NA	W	C	Daño: 1d8\r\nPeso: 4kg	0	25	0	0	f	f		NEW	2011-12-06	2011-12-06
4	Arco Corto		Cr	NA	W	C	Daño: 1d6\r\nPeso: 5kg	0	16	0	0	f	f		NEW	2011-12-06	2011-12-06
38	Moneda de Platino		NA	NA	C	C		1	0	0	0	f	f		C	2011-11-05	2011-11-05
36	Fatana	Forjada por Sirius, en los albores de la Estirpe del Este, la espada Fatana ha acompañado a los señores y reyes de la Marca a lo largo de su historia. La espada ha sufrido varias transformaciones y mejoras desde que fuera forjada por primera vez. Su acero se ha quebrado en dos ocasiones, para volver a resurgir más fuerte y poderoso del fuego de la fragua, añadiéndosele en dichas reconstrucciones metal de armas arrebatadas a señores enemigos en el campo de batalla. Fatana significa destino en el idioma de Visirtán, pues dice la leyenda que el día que ésta se pierda o quiebre por tercera vez, la Estirpe del Este se perderá con ella...	Cr	L	W	U	Las cualidades especiales de Fatana quedan a criterio del Narrador. No obstante, debe siempre considerársela como una espada +3 mágica. Algunas de sus características adicionales, podrían ser,por ejemplo, la capacidad de discernir el alineamiento, inspirar valor a su poseedor y las tropas bajo su mando o cosas por el estilo. Fatana es un artefacto único de poder, y su valor es incalculable. Como su nombre indica, su destino está ineludiblemente unido al de la Marca del Este (Reino Bosque). Una inscripción secreta, que no se puede ver a simple vista, anuncia la muerte próxima del rey, con estas palabras: tus días de gloria muy pronto verán su fin. Esta capacidad profética de la espada, que es capaz de anunciar la muerte de su poseedor, se hace presente en su hoja, con un brillo escarlata, un mes antes de la muerte del rey y su pronóstico es infalible e implacable. Se dice que esta presciencia del arma es otorgada por el mismísimo Valion.	0	0	0	0	t	f		C	2011-11-05	2011-12-11
\.


--
-- Data for Name: object_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY object_author (id, object_id, author_id) FROM stdin;
13	3	3
15	37	1
16	12	1
17	36	3
\.


--
-- Data for Name: object_image; Type: TABLE DATA; Schema: public; Owner: django
--

COPY object_image (id, object_id, image_id) FROM stdin;
2	3	5
4	36	9
\.


--
-- Data for Name: object_relationship; Type: TABLE DATA; Schema: public; Owner: django
--

COPY object_relationship (id, object1_id, object2_id, relation12, relation21, comments, canon_level) FROM stdin;
1	6	5	PAIR	PAIR		C
2	6	7	PAIR	PAIR		C
3	3	2	PAIR	PAIR		C
4	3	4	PAIR	PAIR		C
5	32	3	NEMESIS	ORIGIN		NEW
\.


--
-- Data for Name: object_relationship_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY object_relationship_author (id, objectrelationship_id, author_id) FROM stdin;
\.


--
-- Data for Name: religion; Type: TABLE DATA; Schema: public; Owner: django
--

COPY religion (id, name, description, comments, canon_level) FROM stdin;
1	Valion			C
\.


--
-- Data for Name: religion_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY religion_author (id, religion_id, author_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: django
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	web	0001_initial	2011-10-16 20:06:23.937038+02
2	web	0002_auto__chg_field_creature_AC	2011-10-16 20:07:36.061175+02
3	web	0003_auto__add_field_author_url__add_field_chronicle_adventure	2011-10-23 15:51:41.178089+02
4	web	0004_auto__add_field_adventure_price	2011-10-23 15:57:14.172791+02
5	web	0005_auto__add_language__add_field_adventure_sessions__add_field_adventure_	2011-10-23 16:06:56.34586+02
6	web	0006_auto	2011-10-23 16:09:42.340021+02
7	web	0007_auto__chg_field_creature_treasurevalue	2011-10-23 16:13:38.620329+02
8	web	0008_auto__add_image__add_religion__del_field_character_image__add_field_au	2011-10-23 16:30:13.521736+02
9	web	0009_auto__del_field_author_photo__del_field_creature_image__del_field_loca	2011-10-23 16:38:48.580718+02
10	web	0010_auto__add_field_character_strengthstat__add_field_character_dexteritys	2011-10-23 16:43:18.000182+02
11	web	0011_auto__add_field_character_creation_date__add_field_character_last_upda	2011-10-30 16:55:01.416727+01
12	web	0012_auto__add_field_creature_creation_date__add_field_creature_last_update	2011-11-01 16:38:29.753778+01
13	web	0013_auto__chg_field_location_population	2011-11-01 16:46:43.926274+01
14	web	0014_auto	2011-11-04 19:23:35.392689+01
15	web	0015_auto__add_field_adventure_creation_date__add_field_adventure_last_upda	2011-11-04 19:27:51.919247+01
16	web	0016_auto__add_field_character_quote	2011-11-05 17:22:02.936686+01
17	web	0017_auto__add_characterlocationrelationship__add_unique_characterlocationr	2011-11-06 16:44:30.336218+01
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: django
--

COPY taggit_tag (id, name, slug) FROM stdin;
1	posadero	posadero
2	carismatico	carismatico
3	comerciante	comerciante
4	ABA	aba
5	ithilien	ithilien
6	JMPR	jmpr
7	coin	coin
8	contemplador	contemplador
9	holocubierta	holocubierta
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: django
--

COPY taggit_taggeditem (id, tag_id, object_id, content_type_id) FROM stdin;
79	4	7	8
80	5	7	8
89	4	9	8
90	5	9	8
93	5	2	10
97	5	1	16
98	4	4	17
99	5	4	17
100	4	10	8
101	5	10	8
104	5	2	15
106	9	3	16
107	9	4	16
112	8	3	15
36	5	2	16
113	9	13	15
40	5	3	11
114	6	4	15
43	1	17	8
44	2	17	8
45	3	17	8
65	7	34	11
66	7	33	11
67	7	35	11
68	7	38	11
69	5	37	11
\.


--
-- Data for Name: web_adventure; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_adventure (id, name, description, url, comments, canon_level, price, sessions, minnumplayers, maxnumplayers, minlevel, maxlevel, creation_date, last_updated) FROM stdin;
9	La Tumba de los Horrores	<p>Una obra maestra del roleo de Dungeons.</br>\r\nUna autentica prueba, para novatos y expertos.</br>\r\nUn lugar de pesadilla y de poder.</br>\r\nLa muerte en cada esquina.</br>\r\nLa tumba de los horrores...</br>\r\n</p>\r\n<p>\r\n¡La asesina de aventureros!\r\n</p>	http://el-contemplador.blogspot.com/2011/05/aventura-para-la-marca-del-este-la.html	<p>Eso es para mi la Tumba de los Horrores, una de las mejores aventuras que he leído, porque tras una sencillez increíble, y la práctica ausencia de enemigos, se encuentra uno de los módulos más mortales, y que más raciocinio exige, de cuantas he visto.</p>\r\n\r\n<p>Si bien en ocasiones, presenta una dificultad, tal, que parece impasable, creo que debe ser de obligada prueba para esos personajillos que suelen ir a molestar a la entrada de los Dungeons, y que se hacen llamar héroes.</p>\r\n\r\n<p>Tal es así, que me he animado a remaquetarla, introduciendo los cambios estrictamente necesarios para adaptarla a la Marca, intentando que resulte más atractiva a la vista, y más agradable de leer, algo que no es así en el módulo original, pues casi no existen los puntos y aparte y o se apoya casi en imágenes (algo muy habitual en la época) y que en ocasiones resulta agobiante a la lectura de éste tipo de textos.</p>	APC	FREE	\N	\N	\N	13	17	2011-05-10	2011-05-10
3	La Profanación	La siguiente aventura supone un reto difícil, con criaturas enemigas, trampas y pruebas que podrían acabar rápidamente con cualquier jugador, por lo que se recomienda para jugadores de al menos nivel 4 a 6, aunque no es restrictivo y podría jugarse con un nivel menor, aunque se desaconseja.\r\n	http://el-contemplador.blogspot.com/2011/04/mejorando-documentos-ii.html		AP	FREE	2	2	6	4	6	2011-04-08	2011-04-08
5	Ig Nagor	Hace ya cerca de 60 años el reino enano de Kur-Argor, situado en las Montañas de Lomas Brunas, cayó\r\nbajo asedio de un poderoso ejército de trasgos, venidos desde las tierras de Cuenca Troll aunados bajo el\r\nemblema de Jug an Gaujur (“Jug el grande” en idioma trasgo). Koraz “barba de Sauce” soberano del reino enano estableció una dura defensa que mantuvo en pie a su gente durante una guerra que duró más de dosaños.\r\n	http://www.4shared.com/document/OCVVs2ED/Ig-_Nagor_Mejorado.html	<p>Quisiera dar las gracias a los compañeros de Archi Roleros, de donde he podido extraer algunas de las imágenes que pueblan la aventura. También, quiero dar las gracias a todos aquellos queme han apoyado con ella, ya sea a través de mi Blog, otros sitios de internet o por email, gracias de verdad porque ayuda a seguir adelante.</p>\r\n\r\n<p>Finalmente un especial agradecimiento a Acrobata2000 quien se ha tomado la molestia y el tiempo en rehacer todos los mapas para acabar realizando un trabajo magnífico. Sinceramente estoy en deuda con él. Creo que le ha dado un acabado al trabajo muy bueno. Por eso, los mapas podrán ser encontrados al final del documento en un tamaño A4 para que puedan ser usados con los jugadores o para tomar algún apunte sobre él.</p>\r\n\r\n	\N	FREE	3	3	6	3	4	2011-02-03	2011-02-03
4	Ladrones de Cadáveres	El cementerio de Robleda está sufriendo las visitas Aunque pequeño, el templo alberga a un buen\r\nde ladrones de tumbas y saqueadores. ¿Qué se oculta número de clérigos. Tras una escalera de caracol\r\ntras esos robos? ¿Son sólo ladrones o hay algo llegarán a un despacho de madera con un gran\r\nmaligno detrás?	http://outcastedproject.blogspot.com/2011/02/ladrones-de-cadaveres.html		NEW	FREE	2	3	4	2	3	2011-02-26	2011-02-26
2	Cantemos junto al fuego en el camino Mantícora	Aventura incluida en la Caja Azul del setting. <br/><br/>\r\nEsta aventura está diseñada como una "one shot" perfecta como intermedio entre campañas ya que tiene lugar en el Camino Mantícora. No sería inteligente tratarla como una aventura "aquí te pillo, aquí te mato" ya que es muy exigente con el Director Juego debido a la trama y ciertos momentos de la aventura.<br/>\r\n<br/>\r\nIncluye elementos de ambientación y dinámicas originales dentro del juego.		Se trata de una aventura un tanto particular. Inspirada en parte en Stardust, incorpora elementos especiales de juego y ambientación.	C	N/A	1	3	6	8	12	2011-12-17	2011-12-17
8	Ojos de Serpiente	La aventura que tienes ante ti, pretende presenta una, relativamente, extensa aventura, que transportará a los jugadores hasta las desiertas tierras de Neferu.\r\n	http://el-contemplador.blogspot.com/2011/04/nueva-aventura-para-la-marca-del-este.html	<p>Sin más, creo que es mi mejor trabajo hasta la fecha, y estoy muy contento con el resultado final. La aventura es la respuesta a aquella encuesta que puse hace un tiempo, y que gano la opción de "Una aventura en una ciudad", por lo que espero que con más razón, guste.</p>\r\n<p>También, se incluyen aspectos más sociales, y de toma de decisiones, así como mi monstruo preferido ¡El Contemplador! En un autentico reto, para la inteligencia, la memoria y la paciencia de los jugadores.</p>\r\n<p>Por si me preguntais por el nivel, ya sabeis que no soy mucho de determinar estas cosas, cuando un Master crea que sus jugadores pueden acometerla, que se lo presente, así, leedla, y opinad vosotros, no importa el nivel, importa los jugadores , al fin y al cabo, el Master puede rebajar o subir puntuaciones.</p>	APC	FREE	6	2	6	3	5	2011-04-16	2011-04-16
7	La Hija del Gigante de Hielo	<p>Se trata de una aventura con una estructura lineal, pensada para usarse de varios modos:</p>\r\n<ul>\r\n<li>1 - Como aventura independiente. Es la opción quizás menos interesante, pero se puede jugar así.</li>\r\n\r\n<li>2 - Como parte de una campaña más grande. A modo de interludio, o de submisión. Interesante como digo, para gente que esté planeando campañas a largo plazo.</li>\r\n\r\n<li>3 - Como partida para jornadas o encuentros de una sesión o dos. Quizás la elección más acertada, ya que su estructura y desarrollo se ajusta perfectamente a éste tipo de partidas.</li>\r\n</ul>	http://el-contemplador.blogspot.com/2011/04/aventura-para-la-marca-del-este-la-hija.html	<p>En este caso, he usado para los mapas, una composición mediante el uso de los Dungeon Tiles, en concreto: Caverns of  IceWind Dale, Caves of Carnage y The City (ésta muy poco, tan sólo para añadir una casa al final). He usado éste sistema, para dar la posibilidad a quien se atreva, de usar el tablero y las miniaturas/Tokens en el juego (yo lo hago y la experiencia no está mal. Además así doy un poco de descanso a Acrobata2000 que le tengo explotado.</p>\r\n\r\n<p>En fin, en el interior podréis ver, la influencia de tres historias: La hija del gigante de Hielo, La guarida del Gusano de HIelo y Cenizas sobre Niflheim. Ésta última, sacada del Segundo volumen de Antología Z, que os recomiendo porque es de lo mejor de ese libro, y una delicia para cualquier fan de los Zombis.</p>\r\n\r\n<p>Para concluir, destacar, la gran influencia que el mundo Vikingo ha tenido en su desarrollo, reconociéndose en los nombres de algunas deidades (las he deformado un poco) y de algunos pueblos que aparecen.</p>	APC	FREE	2	2	\N	2	\N	2011-04-08	2011-04-08
11	La Fonda	La Fonda es una aventura corta que puede insertarse dentro del marco de una campaña mas grande o\r\njugarse por separado. Aunque se ha ubicado en la ciudad de Robleda, puede colocarse la ubicación de\r\nla fonda en cualquier otra ciudad grande.\r\n	http://outcastedproject.blogspot.com/p/descargas.html	<p>Idea de José Manuel Palacios Rodrigo (JMPR)<br/>\r\nPlaytesting: Outcasted Project Staff.<br/>\r\nAgradecimientos: Thamish, Iriem y Kamapon.</p>\r\n\r\n<p>La Fonda es material de libre distribución bajo licencia Creative Commons.</p>\r\n	APC	FREE	1	1	4	1	2	2011-01-09	2011-01-09
12	Miedo a la Oscuridad	<p>Se trata de una aventura "crossover" que permitirá a tus personajes visitar por unas horas el escenario de Vermigor y participar en una terrorífica aventura, muy acorde a las fechas en las que nos encontramos.</p>\r\n\r\n<p><em>Afilad las estacas, preparad los símbolos sagrados, las flechas con punta de plata, los ajos, el agua bendita y el acónito... Porque lo vais a necesitar...</em></p>	http://outcastedproject.blogspot.com/p/vermigor.html	<p>Vermigor es un nuevo escenario de campaña para el juego Aventuras en la Marca del Este con un marcado carácter fantástico de terror gótico. Vetustos castillos ruinosos, criptas lúgubres, mausoleos de fría piedra, profecías milenarias, maldiciones familiares, apariciones terrofícas, misterios macabros, pasiones desatadas, traición y muerte... Todos estos son elementos clásicos del terror gótico y romántico que os están esperando si osáis probar suerte y adentraros en la oscuridad de Vermigor. </p>	C	FREE	\N	1	5	4	6	2011-10-31	2011-10-31
13	El Enclave	Primera parte de la Trilogía de la Orden del Libro.\r\n\r\nLa Trilogía de la Orden del Libro es la primera campaña oficial para el juego de rol Aventuras en la Marca del Este. En esta campaña los personajes descubrirán el lado más oscuro y fanático de la ciudad de Robleda y se verán inmersos en un viaje que jamás olvidarán.	http://www.holocubierta.com/index.php?option=com_content&view=article&id=190&Itemid=126	68 páginas en Blanco y Negro en tapa blanda	APC	11-20	4	3	7	1	4	2011-03-01	2011-03-01
14	El Pantano de los Suspiros	<p>Esta aventura está diseñada para ser usada como una partida introductoria al juego Aventuras en La Marca del Este y que puede ser adaptada de forma sencilla a otros juegos de rol de fantasía y que\r\ntambién puede usarse como inicio de una campaña o en transcurso de la misma como una aventura secundaria.</p>\r\n\r\n<p>En principio los jugadores pueden usar cualquier tipo de personaje, pero serianecesario que al menos uno de ellos fuera un clérigo dado el tipo de enemigos a los que van a enfrentarse en la parte final del módulo.</p>\r\n\r\n	http://eldadoinquieto.blogspot.com/2011/08/pantano-de-los-suspiros-modulo-listo.html		NEW	FREE	2	3	4	3	3	2011-08-16	2011-08-16
10	Isla del Terror	<p>Esta aventura que estás comenzando a leer, es una adaptación del clásico “Isle of Dread”, aparecido por vez primera para el juego de rol Dungeons & Dragons, y que es ahora rescatado, para servir como módulo en el juego La Marca del Este. El módulo, ha sido traducido desde el original, intentando respetar el contenido y la forma, pero modificando todo lo necesario para que se adapte al reglamento de la Marca.\r\n</p>	http://el-contemplador.blogspot.com/2011/07/aventura-para-la-marca-del-este-isla.html	<p>Se trata de la Traducción y adaptación del módulo Isle of Dread, de la mítica primera edición de D&D. ¿Qué puedo decir? Pues varias cosas:</p>\r\n\r\n<ul>\r\n<li>Se han omitido las referencias geográficas, por una lógica correspondencia con el mundo de la Marca.</li>\r\n<li>Se han adaptado todo lo posible las reglas, en ocasiones a costa de crear alguna "tabla" básica de efectos climáticos o similares para paliar la falta de estos en el juego, a los que se hace referencia en la aventura.</li>\r\n<li>Se incluye un nuevo bestiario (más animalitos y dinos), que viene a sumarse a los del manual y al estupendo trabajazo que realizaron los compañeros Tel Arin y Sc8rpi8n, en este caso, hay un par que se repiten (Araneas y Rakasta) pero al ser versiones muy diferentes, se han incluido.</li>\r\n<li>Se incluyen algunos mapas que conseguí por "ahí", no se ha podido cambiar algunas anotaciones en ingles, pero son mínimas y no suponen un problema.</li>\r\n<li>Como ya sabéis he tratado de no utilizar imágenes de D&D o Pathfinder, pero aun así hay un par que se me han colado, poca cosa.</li>\r\n<li>Se considera misión tipo A (según mi anotación personal) esto es, de grado Avanzado, para personajes de nivel 6 a 11.</li>\r\n<li>La aventura es estilo Sand Box, muy abierta e interesante, de las que más e han gustado.</li>	APC	FREE	\N	3	6	6	11	2011-07-01	2011-07-01
6	¡Traición!	¡Traición! es una aventura creada por Luis Estrés, en 1985, como aventura de presentación para la mítica caja de Dalmau, y que Ricard Ibañez, al que todos conoceréis por el  juego de rol Alatriste y el famoso Aquelarre (y que pronto contará con una nueva edición espectacular), ha decidido adaptar para la versión de la Marca. De ésta forma Ricard me comentó sobre ella y la maqueté, usando la habitual de todos mis aportes. 	http://el-contemplador.blogspot.com/2011/03/la-marca-del-este-aventura-traicion.html	<p>Esta aventura que tienes en las manos tiene una larga, larga historia. Hace más de veinticinco años, en 1985, Dalmau Carles Pla publicó el primer juego de rol en castellano, Dungeons and Dragons.</p>\r\n\r\n<p>Era la mítica caja roja con la que se iniciaron muchos de los “expertos del rol” de hoy. Se encargó de la distribución un economista e importador de juegos de simulación llamado Francesc Matas.\r\nComo parte de la promoción de lanzamiento, se reclutó a un entusiasta aficionado llamado Luis Estrés para que organizara algunas partidas de demostración, que serían jugadas en centros cívicos, institutos y asociaciones de vecinos. Luis confeccionó una aventura larga, dividida en tres partes, en la que colaboraron varios amigos suyos. De este trabajo surgió la idea de hacer un fanzine dedicado exclusivamente al juego de rol. Así nació Troll, que con el tiempo (mire usted por dónde) se convertiría en libro de estilo y referencia obligada de revistas como mínimo igual de serias.</p>\r\n<p>Lector, se podría decir sin exagerar que esta aventura que tienes delante es el origen del juego de\r\nrol hispano. Que la disfrutes.</p>\r\n	APC	FREE	3	5	7	1	3	2011-03-14	2011-03-14
\.


--
-- Data for Name: web_adventure_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_adventure_author (id, adventure_id, author_id) FROM stdin;
20	7	5
23	11	4
24	12	4
27	2	1
35	14	21
36	10	5
37	8	5
38	3	5
39	6	5
40	13	18
41	13	19
42	4	4
43	5	5
\.


--
-- Data for Name: web_adventure_image; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_adventure_image (id, adventure_id, image_id) FROM stdin;
12	7	14
15	9	16
17	11	18
18	12	20
21	2	8
24	10	17
25	8	15
26	3	10
27	6	13
28	13	21
29	5	12
\.


--
-- Data for Name: web_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_author (id, name, nickname, otherdata, url) FROM stdin;
1	Pablo Ruiz Múzquiz	Diacrítica		\N
3	Pedro Gil	Steinkel		\N
2	Angela Rivera Campos	Ghilbrae	http://ithilien.eu	http://ithilien.eu/
4	José Manuel Palacios Rodríguez	JMPR		http://outcastedproject.blogspot.com/
6	A.J. Manzanedo	Manzanedo		
7	José María Campoy			
8	Jorge Carrero			
9	María del Carmen Ruíz Moreno	RU-MOR		
11	Raquel Cornejo			
12	Manu Sáez			
13	Emilio Martínez Soria			
14	Iván Cordero			
15	Patricia Avilés Peña			
16	Marina García Sánchez			
17	Thanya Castrillón			
5	Víctor Velázquez	El Contemplador		http://el-contemplador.blogspot.com/
18	Javier Hidalgo	Acróbata 2000		http://acrobata2000.blogspot.com/
19	Breogán Álvarez Bermúdez			http://nordheimer.deviantart.com/
20	Eduardo Cortés			
21	El Dado Inquieto			http://eldadoinquieto.blogspot.com/
\.


--
-- Data for Name: web_author_photo; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_author_photo (id, author_id, image_id) FROM stdin;
1	4	7
\.


--
-- Data for Name: web_character_relatedlocation; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_character_relatedlocation (id, character_id, location_id) FROM stdin;
\.


--
-- Data for Name: web_character_relatedobject; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_character_relatedobject (id, character_id, object_id) FROM stdin;
\.


--
-- Data for Name: web_chronicle; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_chronicle (id, name, description, url, comments, canon_level, adventure_id, creation_date, last_updated) FROM stdin;
2	Crónica de Ladrones de cadáveres - Grupo Ithilien	Hace algún tiempo que jugamos una versión algo retocada de la aventura Ladrones de Cadáveres de JMPR para Aventuras en la Marca del Este.\r\n\r\nA continuación la crónica de esa aventura en el mismo estilo de diario de personaje que ya usé para la anterior.	http://ithilien.eu/?p=784		NEW	4	2011-11-05	2011-11-05
1	Crónica de La Profanación - Grupo Ithilien	Crónica del grupo de juego de Ithilien sobre la aventura de El Contemplador	http://ithilien.eu/?p=537		APC	3	2011-11-05	2011-11-05
3	Crónicas de la Marca del Este, Volumen II	Crónicas de la Marca del Este es la primera antología de relatos cortos inspirados en la ambientación del juego de rol Aventuras en la Marca del Este. En este segundo volumen, encontrarás dieciseis relatos cortos que sumergirán al lector en una ambientación de fantasía tradicional donde las mayores gestas pueden ser alcanzadas.	http://www.holocubierta.com/index.php?page=shop.product_details&category_id=2&flypage=flypage.tpl&product_id=17&option=com_virtuemart&Itemid=88&vmcchk=1&Itemid=88	Se trata de un libro a la venta por Holocubierta Ediciones al precio del 18€	C	\N	2011-10-01	2011-10-01
4	Crónicas de la Marca del Este, Volumen I	Crónicas de la Marca del Este es la primera antología de relatos cortos inspirados en la ambientación del juego de rol Aventuras en la Marca del Este. Catorce relatos cortos que sumergirán al lector en una ambientación de fantasía tradicional donde las mayores gestas pueden ser alcanzadas.	http://www.holocubierta.com/index.php?page=shop.product_details&category_id=2&flypage=flypage.tpl&product_id=4&option=com_virtuemart&Itemid=88	Se trata de un libro puesto a la venta por Holocubierta Ediciones al precio de 15€	C	\N	2011-06-01	2011-06-01
\.


--
-- Data for Name: web_chronicle_author; Type: TABLE DATA; Schema: public; Owner: django
--

COPY web_chronicle_author (id, chronicle_id, author_id) FROM stdin;
9	2	2
13	1	2
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: character_author_character_id_12b848360f411330_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_author
    ADD CONSTRAINT character_author_character_id_12b848360f411330_uniq UNIQUE (character_id, author_id);


--
-- Name: character_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_author
    ADD CONSTRAINT character_author_pkey PRIMARY KEY (id);


--
-- Name: character_image_character_id_3007a273911d763c_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_image
    ADD CONSTRAINT character_image_character_id_3007a273911d763c_uniq UNIQUE (character_id, image_id);


--
-- Name: character_image_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_image
    ADD CONSTRAINT character_image_pkey PRIMARY KEY (id);


--
-- Name: character_languages_character_id_5602e6efad7c7bde_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_languages
    ADD CONSTRAINT character_languages_character_id_5602e6efad7c7bde_uniq UNIQUE (character_id, language_id);


--
-- Name: character_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_languages
    ADD CONSTRAINT character_languages_pkey PRIMARY KEY (id);


--
-- Name: character_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- Name: character_relatedlocation_character_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relatedlocation
    ADD CONSTRAINT character_relatedlocation_character_id_key UNIQUE (character_id, location_id);


--
-- Name: character_relatedlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relatedlocation
    ADD CONSTRAINT character_relatedlocation_pkey PRIMARY KEY (id);


--
-- Name: character_relatedobject_character_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relatedobject
    ADD CONSTRAINT character_relatedobject_character_id_key UNIQUE (character_id, object_id);


--
-- Name: character_relatedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relatedobject
    ADD CONSTRAINT character_relatedobject_pkey PRIMARY KEY (id);


--
-- Name: character_relati_characterrelationship_id_6500ec7953c5820a_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relationship_author
    ADD CONSTRAINT character_relati_characterrelationship_id_6500ec7953c5820a_uniq UNIQUE (characterrelationship_id, author_id);


--
-- Name: character_relationship_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relationship_author
    ADD CONSTRAINT character_relationship_author_pkey PRIMARY KEY (id);


--
-- Name: character_relationship_character1_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relationship
    ADD CONSTRAINT character_relationship_character1_id_key UNIQUE (character1_id, character2_id);


--
-- Name: character_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_relationship
    ADD CONSTRAINT character_relationship_pkey PRIMARY KEY (id);


--
-- Name: character_religion_character_id_761d604677b292d4_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_religion
    ADD CONSTRAINT character_religion_character_id_761d604677b292d4_uniq UNIQUE (character_id, religion_id);


--
-- Name: character_religion_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY character_religion
    ADD CONSTRAINT character_religion_pkey PRIMARY KEY (id);


--
-- Name: charloc__characterlocationrelationship_id_634693bed8dbedf2_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY charloc_relationship_author
    ADD CONSTRAINT charloc__characterlocationrelationship_id_634693bed8dbedf2_uniq UNIQUE (characterlocationrelationship_id, author_id);


--
-- Name: charloc_relationship_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY charloc_relationship_author
    ADD CONSTRAINT charloc_relationship_author_pkey PRIMARY KEY (id);


--
-- Name: charloc_relationship_character_id_3f456cf8e10834f4_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY charloc_relationship
    ADD CONSTRAINT charloc_relationship_character_id_3f456cf8e10834f4_uniq UNIQUE (character_id, location_id);


--
-- Name: charloc_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY charloc_relationship
    ADD CONSTRAINT charloc_relationship_pkey PRIMARY KEY (id);


--
-- Name: creature_author_creature_id_1ceef5fae38db45e_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_author
    ADD CONSTRAINT creature_author_creature_id_1ceef5fae38db45e_uniq UNIQUE (creature_id, author_id);


--
-- Name: creature_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_author
    ADD CONSTRAINT creature_author_pkey PRIMARY KEY (id);


--
-- Name: creature_image_creature_id_5a0b360c3e6a261e_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_image
    ADD CONSTRAINT creature_image_creature_id_5a0b360c3e6a261e_uniq UNIQUE (creature_id, image_id);


--
-- Name: creature_image_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_image
    ADD CONSTRAINT creature_image_pkey PRIMARY KEY (id);


--
-- Name: creature_languages_creature_id_51786fe34646da06_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_languages
    ADD CONSTRAINT creature_languages_creature_id_51786fe34646da06_uniq UNIQUE (creature_id, language_id);


--
-- Name: creature_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_languages
    ADD CONSTRAINT creature_languages_pkey PRIMARY KEY (id);


--
-- Name: creature_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (id);


--
-- Name: creature_relatedlocation_creature_id_7d3a2a35c59aafa6_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relatedlocation
    ADD CONSTRAINT creature_relatedlocation_creature_id_7d3a2a35c59aafa6_uniq UNIQUE (creature_id, location_id);


--
-- Name: creature_relatedlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relatedlocation
    ADD CONSTRAINT creature_relatedlocation_pkey PRIMARY KEY (id);


--
-- Name: creature_relatedobject_creature_id_5d96ca6f9027e316_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relatedobject
    ADD CONSTRAINT creature_relatedobject_creature_id_5d96ca6f9027e316_uniq UNIQUE (creature_id, object_id);


--
-- Name: creature_relatedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relatedobject
    ADD CONSTRAINT creature_relatedobject_pkey PRIMARY KEY (id);


--
-- Name: creature_relation_creaturerelationship_id_2f1ea459e2035946_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relationship_author
    ADD CONSTRAINT creature_relation_creaturerelationship_id_2f1ea459e2035946_uniq UNIQUE (creaturerelationship_id, author_id);


--
-- Name: creature_relationship_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relationship_author
    ADD CONSTRAINT creature_relationship_author_pkey PRIMARY KEY (id);


--
-- Name: creature_relationship_creature1_id_4aeef61ffec5b742_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relationship
    ADD CONSTRAINT creature_relationship_creature1_id_4aeef61ffec5b742_uniq UNIQUE (creature1_id, creature2_id);


--
-- Name: creature_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY creature_relationship
    ADD CONSTRAINT creature_relationship_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: image_author_image_id_1487395c252dc08c_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY image_author
    ADD CONSTRAINT image_author_image_id_1487395c252dc08c_uniq UNIQUE (image_id, author_id);


--
-- Name: image_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY image_author
    ADD CONSTRAINT image_author_pkey PRIMARY KEY (id);


--
-- Name: image_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: language_author_language_id_78f10be778ceb4f0_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY language_author
    ADD CONSTRAINT language_author_language_id_78f10be778ceb4f0_uniq UNIQUE (language_id, author_id);


--
-- Name: language_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY language_author
    ADD CONSTRAINT language_author_pkey PRIMARY KEY (id);


--
-- Name: language_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: location_author_location_id_1693dc9f56be1dfe_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_author
    ADD CONSTRAINT location_author_location_id_1693dc9f56be1dfe_uniq UNIQUE (location_id, author_id);


--
-- Name: location_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_author
    ADD CONSTRAINT location_author_pkey PRIMARY KEY (id);


--
-- Name: location_image_location_id_16c95acbc295bc42_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_image
    ADD CONSTRAINT location_image_location_id_16c95acbc295bc42_uniq UNIQUE (location_id, image_id);


--
-- Name: location_image_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_image
    ADD CONSTRAINT location_image_pkey PRIMARY KEY (id);


--
-- Name: location_languages_location_id_18d00b1a8a3f5402_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_languages
    ADD CONSTRAINT location_languages_location_id_18d00b1a8a3f5402_uniq UNIQUE (location_id, language_id);


--
-- Name: location_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_languages
    ADD CONSTRAINT location_languages_pkey PRIMARY KEY (id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: location_relatedobject_location_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_relatedobject
    ADD CONSTRAINT location_relatedobject_location_id_key UNIQUE (location_id, object_id);


--
-- Name: location_relatedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_relatedobject
    ADD CONSTRAINT location_relatedobject_pkey PRIMARY KEY (id);


--
-- Name: location_religion_location_id_5dcd55a634a4b636_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_religion
    ADD CONSTRAINT location_religion_location_id_5dcd55a634a4b636_uniq UNIQUE (location_id, religion_id);


--
-- Name: location_religion_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY location_religion
    ADD CONSTRAINT location_religion_pkey PRIMARY KEY (id);


--
-- Name: object_author_object_id_2e5eec908c256376_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_author
    ADD CONSTRAINT object_author_object_id_2e5eec908c256376_uniq UNIQUE (object_id, author_id);


--
-- Name: object_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_author
    ADD CONSTRAINT object_author_pkey PRIMARY KEY (id);


--
-- Name: object_image_object_id_625c3fec38bd1842_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_image
    ADD CONSTRAINT object_image_object_id_625c3fec38bd1842_uniq UNIQUE (object_id, image_id);


--
-- Name: object_image_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_image
    ADD CONSTRAINT object_image_pkey PRIMARY KEY (id);


--
-- Name: object_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object
    ADD CONSTRAINT object_pkey PRIMARY KEY (id);


--
-- Name: object_relationship_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_relationship_author
    ADD CONSTRAINT object_relationship_author_pkey PRIMARY KEY (id);


--
-- Name: object_relationship_object1_id_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_relationship
    ADD CONSTRAINT object_relationship_object1_id_key UNIQUE (object1_id, object2_id);


--
-- Name: object_relationship_objectrelationship_id_2b3e46c4e0b90a96_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_relationship_author
    ADD CONSTRAINT object_relationship_objectrelationship_id_2b3e46c4e0b90a96_uniq UNIQUE (objectrelationship_id, author_id);


--
-- Name: object_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY object_relationship
    ADD CONSTRAINT object_relationship_pkey PRIMARY KEY (id);


--
-- Name: religion_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY religion_author
    ADD CONSTRAINT religion_author_pkey PRIMARY KEY (id);


--
-- Name: religion_author_religion_id_782f19ee398aa986_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY religion_author
    ADD CONSTRAINT religion_author_religion_id_782f19ee398aa986_uniq UNIQUE (religion_id, author_id);


--
-- Name: religion_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY religion
    ADD CONSTRAINT religion_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: web_adventure_author_adventure_id_29d084a7b41d737f_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_adventure_author
    ADD CONSTRAINT web_adventure_author_adventure_id_29d084a7b41d737f_uniq UNIQUE (adventure_id, author_id);


--
-- Name: web_adventure_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_adventure_author
    ADD CONSTRAINT web_adventure_author_pkey PRIMARY KEY (id);


--
-- Name: web_adventure_image_adventure_id_67abb9fc4f5a2d01_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_adventure_image
    ADD CONSTRAINT web_adventure_image_adventure_id_67abb9fc4f5a2d01_uniq UNIQUE (adventure_id, image_id);


--
-- Name: web_adventure_image_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_adventure_image
    ADD CONSTRAINT web_adventure_image_pkey PRIMARY KEY (id);


--
-- Name: web_adventure_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_adventure
    ADD CONSTRAINT web_adventure_pkey PRIMARY KEY (id);


--
-- Name: web_author_photo_author_id_5c98de736a7ada00_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_author_photo
    ADD CONSTRAINT web_author_photo_author_id_5c98de736a7ada00_uniq UNIQUE (author_id, image_id);


--
-- Name: web_author_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_author_photo
    ADD CONSTRAINT web_author_photo_pkey PRIMARY KEY (id);


--
-- Name: web_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_author
    ADD CONSTRAINT web_author_pkey PRIMARY KEY (id);


--
-- Name: web_character_relatedlocatio_character_id_5857ae55b043c579_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_character_relatedlocation
    ADD CONSTRAINT web_character_relatedlocatio_character_id_5857ae55b043c579_uniq UNIQUE (character_id, location_id);


--
-- Name: web_character_relatedlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_character_relatedlocation
    ADD CONSTRAINT web_character_relatedlocation_pkey PRIMARY KEY (id);


--
-- Name: web_character_relatedobject_character_id_293fc8e94573eef_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_character_relatedobject
    ADD CONSTRAINT web_character_relatedobject_character_id_293fc8e94573eef_uniq UNIQUE (character_id, object_id);


--
-- Name: web_character_relatedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_character_relatedobject
    ADD CONSTRAINT web_character_relatedobject_pkey PRIMARY KEY (id);


--
-- Name: web_chronicle_author_chronicle_id_1f47edb7c95a0be1_uniq; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_chronicle_author
    ADD CONSTRAINT web_chronicle_author_chronicle_id_1f47edb7c95a0be1_uniq UNIQUE (chronicle_id, author_id);


--
-- Name: web_chronicle_author_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_chronicle_author
    ADD CONSTRAINT web_chronicle_author_pkey PRIMARY KEY (id);


--
-- Name: web_chronicle_pkey; Type: CONSTRAINT; Schema: public; Owner: django; Tablespace: 
--

ALTER TABLE ONLY web_chronicle
    ADD CONSTRAINT web_chronicle_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: character_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_author_author_id ON character_author USING btree (author_id);


--
-- Name: character_author_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_author_character_id ON character_author USING btree (character_id);


--
-- Name: character_image_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_image_character_id ON character_image USING btree (character_id);


--
-- Name: character_image_image_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_image_image_id ON character_image USING btree (image_id);


--
-- Name: character_languages_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_languages_character_id ON character_languages USING btree (character_id);


--
-- Name: character_languages_language_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_languages_language_id ON character_languages USING btree (language_id);


--
-- Name: character_relatedlocation_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relatedlocation_character_id ON character_relatedlocation USING btree (character_id);


--
-- Name: character_relatedlocation_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relatedlocation_location_id ON character_relatedlocation USING btree (location_id);


--
-- Name: character_relatedobject_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relatedobject_character_id ON character_relatedobject USING btree (character_id);


--
-- Name: character_relatedobject_object_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relatedobject_object_id ON character_relatedobject USING btree (object_id);


--
-- Name: character_relationship_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relationship_author_author_id ON character_relationship_author USING btree (author_id);


--
-- Name: character_relationship_author_characterrelationship_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relationship_author_characterrelationship_id ON character_relationship_author USING btree (characterrelationship_id);


--
-- Name: character_relationship_character1_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relationship_character1_id ON character_relationship USING btree (character1_id);


--
-- Name: character_relationship_character2_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_relationship_character2_id ON character_relationship USING btree (character2_id);


--
-- Name: character_religion_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_religion_character_id ON character_religion USING btree (character_id);


--
-- Name: character_religion_religion_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX character_religion_religion_id ON character_religion USING btree (religion_id);


--
-- Name: charloc_relationship_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX charloc_relationship_author_author_id ON charloc_relationship_author USING btree (author_id);


--
-- Name: charloc_relationship_author_characterlocationrelationship_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX charloc_relationship_author_characterlocationrelationship_id ON charloc_relationship_author USING btree (characterlocationrelationship_id);


--
-- Name: charloc_relationship_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX charloc_relationship_character_id ON charloc_relationship USING btree (character_id);


--
-- Name: charloc_relationship_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX charloc_relationship_location_id ON charloc_relationship USING btree (location_id);


--
-- Name: creature_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_author_author_id ON creature_author USING btree (author_id);


--
-- Name: creature_author_creature_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_author_creature_id ON creature_author USING btree (creature_id);


--
-- Name: creature_image_creature_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_image_creature_id ON creature_image USING btree (creature_id);


--
-- Name: creature_image_image_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_image_image_id ON creature_image USING btree (image_id);


--
-- Name: creature_languages_creature_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_languages_creature_id ON creature_languages USING btree (creature_id);


--
-- Name: creature_languages_language_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_languages_language_id ON creature_languages USING btree (language_id);


--
-- Name: creature_relatedlocation_creature_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relatedlocation_creature_id ON creature_relatedlocation USING btree (creature_id);


--
-- Name: creature_relatedlocation_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relatedlocation_location_id ON creature_relatedlocation USING btree (location_id);


--
-- Name: creature_relatedobject_creature_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relatedobject_creature_id ON creature_relatedobject USING btree (creature_id);


--
-- Name: creature_relatedobject_object_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relatedobject_object_id ON creature_relatedobject USING btree (object_id);


--
-- Name: creature_relationship_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relationship_author_author_id ON creature_relationship_author USING btree (author_id);


--
-- Name: creature_relationship_author_creaturerelationship_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relationship_author_creaturerelationship_id ON creature_relationship_author USING btree (creaturerelationship_id);


--
-- Name: creature_relationship_creature1_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relationship_creature1_id ON creature_relationship USING btree (creature1_id);


--
-- Name: creature_relationship_creature2_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX creature_relationship_creature2_id ON creature_relationship USING btree (creature2_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: image_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX image_author_author_id ON image_author USING btree (author_id);


--
-- Name: image_author_image_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX image_author_image_id ON image_author USING btree (image_id);


--
-- Name: language_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX language_author_author_id ON language_author USING btree (author_id);


--
-- Name: language_author_language_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX language_author_language_id ON language_author USING btree (language_id);


--
-- Name: location_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_author_author_id ON location_author USING btree (author_id);


--
-- Name: location_author_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_author_location_id ON location_author USING btree (location_id);


--
-- Name: location_image_image_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_image_image_id ON location_image USING btree (image_id);


--
-- Name: location_image_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_image_location_id ON location_image USING btree (location_id);


--
-- Name: location_languages_language_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_languages_language_id ON location_languages USING btree (language_id);


--
-- Name: location_languages_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_languages_location_id ON location_languages USING btree (location_id);


--
-- Name: location_relatedobject_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_relatedobject_location_id ON location_relatedobject USING btree (location_id);


--
-- Name: location_relatedobject_object_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_relatedobject_object_id ON location_relatedobject USING btree (object_id);


--
-- Name: location_religion_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_religion_location_id ON location_religion USING btree (location_id);


--
-- Name: location_religion_religion_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX location_religion_religion_id ON location_religion USING btree (religion_id);


--
-- Name: object_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_author_author_id ON object_author USING btree (author_id);


--
-- Name: object_author_object_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_author_object_id ON object_author USING btree (object_id);


--
-- Name: object_image_image_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_image_image_id ON object_image USING btree (image_id);


--
-- Name: object_image_object_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_image_object_id ON object_image USING btree (object_id);


--
-- Name: object_relationship_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_relationship_author_author_id ON object_relationship_author USING btree (author_id);


--
-- Name: object_relationship_author_objectrelationship_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_relationship_author_objectrelationship_id ON object_relationship_author USING btree (objectrelationship_id);


--
-- Name: object_relationship_object1_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_relationship_object1_id ON object_relationship USING btree (object1_id);


--
-- Name: object_relationship_object2_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX object_relationship_object2_id ON object_relationship USING btree (object2_id);


--
-- Name: religion_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX religion_author_author_id ON religion_author USING btree (author_id);


--
-- Name: religion_author_religion_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX religion_author_religion_id ON religion_author USING btree (religion_id);


--
-- Name: taggit_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_object_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX taggit_taggeditem_object_id ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX taggit_taggeditem_tag_id ON taggit_taggeditem USING btree (tag_id);


--
-- Name: web_adventure_author_adventure_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_adventure_author_adventure_id ON web_adventure_author USING btree (adventure_id);


--
-- Name: web_adventure_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_adventure_author_author_id ON web_adventure_author USING btree (author_id);


--
-- Name: web_adventure_image_adventure_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_adventure_image_adventure_id ON web_adventure_image USING btree (adventure_id);


--
-- Name: web_adventure_image_image_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_adventure_image_image_id ON web_adventure_image USING btree (image_id);


--
-- Name: web_author_photo_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_author_photo_author_id ON web_author_photo USING btree (author_id);


--
-- Name: web_author_photo_image_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_author_photo_image_id ON web_author_photo USING btree (image_id);


--
-- Name: web_character_relatedlocation_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_character_relatedlocation_character_id ON web_character_relatedlocation USING btree (character_id);


--
-- Name: web_character_relatedlocation_location_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_character_relatedlocation_location_id ON web_character_relatedlocation USING btree (location_id);


--
-- Name: web_character_relatedobject_character_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_character_relatedobject_character_id ON web_character_relatedobject USING btree (character_id);


--
-- Name: web_character_relatedobject_object_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_character_relatedobject_object_id ON web_character_relatedobject USING btree (object_id);


--
-- Name: web_chronicle_adventure_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_chronicle_adventure_id ON web_chronicle USING btree (adventure_id);


--
-- Name: web_chronicle_author_author_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_chronicle_author_author_id ON web_chronicle_author USING btree (author_id);


--
-- Name: web_chronicle_author_chronicle_id; Type: INDEX; Schema: public; Owner: django; Tablespace: 
--

CREATE INDEX web_chronicle_author_chronicle_id ON web_chronicle_author USING btree (chronicle_id);


--
-- Name: adventure_id_refs_id_2bf8f0d4e75c1882; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_adventure_author
    ADD CONSTRAINT adventure_id_refs_id_2bf8f0d4e75c1882 FOREIGN KEY (adventure_id) REFERENCES web_adventure(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adventure_id_refs_id_3b8c2233f71412e8; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_chronicle
    ADD CONSTRAINT adventure_id_refs_id_3b8c2233f71412e8 FOREIGN KEY (adventure_id) REFERENCES web_adventure(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: adventure_id_refs_id_6f48f70aaf21cba7; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_adventure_image
    ADD CONSTRAINT adventure_id_refs_id_6f48f70aaf21cba7 FOREIGN KEY (adventure_id) REFERENCES web_adventure(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_1402aeb0e6e97633; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_author
    ADD CONSTRAINT author_id_refs_id_1402aeb0e6e97633 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_154949f8b842de17; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY charloc_relationship_author
    ADD CONSTRAINT author_id_refs_id_154949f8b842de17 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_33bae5b0c9b49cd5; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relationship_author
    ADD CONSTRAINT author_id_refs_id_33bae5b0c9b49cd5 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_45de2bc38dfb0559; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_author
    ADD CONSTRAINT author_id_refs_id_45de2bc38dfb0559 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_565365c5a4c055c8; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_author_photo
    ADD CONSTRAINT author_id_refs_id_565365c5a4c055c8 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_59b72dccc3786654; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_author
    ADD CONSTRAINT author_id_refs_id_59b72dccc3786654 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_622f82d69034c307; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_chronicle_author
    ADD CONSTRAINT author_id_refs_id_622f82d69034c307 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_64c86d1283831e8b; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_author
    ADD CONSTRAINT author_id_refs_id_64c86d1283831e8b FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_6cf93eab0030eafa; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY image_author
    ADD CONSTRAINT author_id_refs_id_6cf93eab0030eafa FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_7a1e2de5af4d131e; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_adventure_author
    ADD CONSTRAINT author_id_refs_id_7a1e2de5af4d131e FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_7c56e9771dfc7717; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_relationship_author
    ADD CONSTRAINT author_id_refs_id_7c56e9771dfc7717 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_8e4ecb4916acad2; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY language_author
    ADD CONSTRAINT author_id_refs_id_8e4ecb4916acad2 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_cca840ba29823f4; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relationship_author
    ADD CONSTRAINT author_id_refs_id_cca840ba29823f4 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: author_id_refs_id_d8428092d6a1c23; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY religion_author
    ADD CONSTRAINT author_id_refs_id_d8428092d6a1c23 FOREIGN KEY (author_id) REFERENCES web_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_id_refs_id_17cb52f02f19919d; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_languages
    ADD CONSTRAINT character_id_refs_id_17cb52f02f19919d FOREIGN KEY (character_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_id_refs_id_3600dbd153f6033f; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_image
    ADD CONSTRAINT character_id_refs_id_3600dbd153f6033f FOREIGN KEY (character_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_id_refs_id_643036e2; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relatedlocation
    ADD CONSTRAINT character_id_refs_id_643036e2 FOREIGN KEY (character_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_id_refs_id_6decb41ea3d69d8c; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_religion
    ADD CONSTRAINT character_id_refs_id_6decb41ea3d69d8c FOREIGN KEY (character_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_id_refs_id_6f62eab8a728aba6; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_author
    ADD CONSTRAINT character_id_refs_id_6f62eab8a728aba6 FOREIGN KEY (character_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_id_refs_id_96dc99a8; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relatedobject
    ADD CONSTRAINT character_id_refs_id_96dc99a8 FOREIGN KEY (character_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_id_refs_id_fd5002db31a221c; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY charloc_relationship
    ADD CONSTRAINT character_id_refs_id_fd5002db31a221c FOREIGN KEY (character_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_relationship_character1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relationship
    ADD CONSTRAINT character_relationship_character1_id_fkey FOREIGN KEY (character1_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: character_relationship_character2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relationship
    ADD CONSTRAINT character_relationship_character2_id_fkey FOREIGN KEY (character2_id) REFERENCES "character"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: characterlocationrelationship_id_refs_id_715e6893d32152; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY charloc_relationship_author
    ADD CONSTRAINT characterlocationrelationship_id_refs_id_715e6893d32152 FOREIGN KEY (characterlocationrelationship_id) REFERENCES charloc_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: characterrelationship_id_refs_id_550b349aec610fd2; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relationship_author
    ADD CONSTRAINT characterrelationship_id_refs_id_550b349aec610fd2 FOREIGN KEY (characterrelationship_id) REFERENCES character_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chronicle_id_refs_id_12a3b1329f1e8f9e; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_chronicle_author
    ADD CONSTRAINT chronicle_id_refs_id_12a3b1329f1e8f9e FOREIGN KEY (chronicle_id) REFERENCES web_chronicle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creature1_id_refs_id_a72abdabb44b91; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relationship
    ADD CONSTRAINT creature1_id_refs_id_a72abdabb44b91 FOREIGN KEY (creature1_id) REFERENCES creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creature2_id_refs_id_a72abdabb44b91; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relationship
    ADD CONSTRAINT creature2_id_refs_id_a72abdabb44b91 FOREIGN KEY (creature2_id) REFERENCES creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creature_id_refs_id_1bf07dbbb63efa45; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_languages
    ADD CONSTRAINT creature_id_refs_id_1bf07dbbb63efa45 FOREIGN KEY (creature_id) REFERENCES creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creature_id_refs_id_246e4b935adf6252; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relatedobject
    ADD CONSTRAINT creature_id_refs_id_246e4b935adf6252 FOREIGN KEY (creature_id) REFERENCES creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creature_id_refs_id_42f57fe0234d5ee3; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_image
    ADD CONSTRAINT creature_id_refs_id_42f57fe0234d5ee3 FOREIGN KEY (creature_id) REFERENCES creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creature_id_refs_id_5dafd867b8a3c67c; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relatedlocation
    ADD CONSTRAINT creature_id_refs_id_5dafd867b8a3c67c FOREIGN KEY (creature_id) REFERENCES creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creature_id_refs_id_62d50a789fd483ce; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_author
    ADD CONSTRAINT creature_id_refs_id_62d50a789fd483ce FOREIGN KEY (creature_id) REFERENCES creature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creaturerelationship_id_refs_id_1c673729418d763a; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relationship_author
    ADD CONSTRAINT creaturerelationship_id_refs_id_1c673729418d763a FOREIGN KEY (creaturerelationship_id) REFERENCES creature_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_29a3f36df33dbd70; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_image
    ADD CONSTRAINT image_id_refs_id_29a3f36df33dbd70 FOREIGN KEY (image_id) REFERENCES image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_5dc9a5f5cd423fb5; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_adventure_image
    ADD CONSTRAINT image_id_refs_id_5dc9a5f5cd423fb5 FOREIGN KEY (image_id) REFERENCES image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_6b2b9caabad261e2; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_image
    ADD CONSTRAINT image_id_refs_id_6b2b9caabad261e2 FOREIGN KEY (image_id) REFERENCES image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_768821eb012757da; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY image_author
    ADD CONSTRAINT image_id_refs_id_768821eb012757da FOREIGN KEY (image_id) REFERENCES image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_7c239c1881bcd2a5; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_image
    ADD CONSTRAINT image_id_refs_id_7c239c1881bcd2a5 FOREIGN KEY (image_id) REFERENCES image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_8dc32d550bfb372; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_image
    ADD CONSTRAINT image_id_refs_id_8dc32d550bfb372 FOREIGN KEY (image_id) REFERENCES image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_d279725282c6a7c; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY web_author_photo
    ADD CONSTRAINT image_id_refs_id_d279725282c6a7c FOREIGN KEY (image_id) REFERENCES image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: language_id_refs_id_21fb2c579a2483b; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_languages
    ADD CONSTRAINT language_id_refs_id_21fb2c579a2483b FOREIGN KEY (language_id) REFERENCES language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: language_id_refs_id_54bc9e4284b2ca; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_languages
    ADD CONSTRAINT language_id_refs_id_54bc9e4284b2ca FOREIGN KEY (language_id) REFERENCES language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: language_id_refs_id_59fd7cb4996aa2d0; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_languages
    ADD CONSTRAINT language_id_refs_id_59fd7cb4996aa2d0 FOREIGN KEY (language_id) REFERENCES language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: language_id_refs_id_7f78358883cb726e; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY language_author
    ADD CONSTRAINT language_id_refs_id_7f78358883cb726e FOREIGN KEY (language_id) REFERENCES language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_3a3243d8a3247a8f; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY charloc_relationship
    ADD CONSTRAINT location_id_refs_id_3a3243d8a3247a8f FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_43ef730550a5b24f; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_languages
    ADD CONSTRAINT location_id_refs_id_43ef730550a5b24f FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_45f4399168d56fae; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_author
    ADD CONSTRAINT location_id_refs_id_45f4399168d56fae FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_645263a194a58544; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_religion
    ADD CONSTRAINT location_id_refs_id_645263a194a58544 FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_7b10da4c9e76d29; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_image
    ADD CONSTRAINT location_id_refs_id_7b10da4c9e76d29 FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_ad6782a3; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relatedlocation
    ADD CONSTRAINT location_id_refs_id_ad6782a3 FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_b322c53abc3abe2; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relatedlocation
    ADD CONSTRAINT location_id_refs_id_b322c53abc3abe2 FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_cf38a706; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_relatedobject
    ADD CONSTRAINT location_id_refs_id_cf38a706 FOREIGN KEY (location_id) REFERENCES location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_id_refs_id_121e0861eb381c8a; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY creature_relatedobject
    ADD CONSTRAINT object_id_refs_id_121e0861eb381c8a FOREIGN KEY (object_id) REFERENCES object(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_id_refs_id_17927632852e304e; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_author
    ADD CONSTRAINT object_id_refs_id_17927632852e304e FOREIGN KEY (object_id) REFERENCES object(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_id_refs_id_2b11e72318f53095; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_image
    ADD CONSTRAINT object_id_refs_id_2b11e72318f53095 FOREIGN KEY (object_id) REFERENCES object(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_id_refs_id_cf9810f0; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_relatedobject
    ADD CONSTRAINT object_id_refs_id_cf9810f0 FOREIGN KEY (object_id) REFERENCES object(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_id_refs_id_de47d67; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_relatedobject
    ADD CONSTRAINT object_id_refs_id_de47d67 FOREIGN KEY (object_id) REFERENCES object(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_relationship_object1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_relationship
    ADD CONSTRAINT object_relationship_object1_id_fkey FOREIGN KEY (object1_id) REFERENCES object(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: object_relationship_object2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_relationship
    ADD CONSTRAINT object_relationship_object2_id_fkey FOREIGN KEY (object2_id) REFERENCES object(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: objectrelationship_id_refs_id_6a2998d0c96d4bca; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY object_relationship_author
    ADD CONSTRAINT objectrelationship_id_refs_id_6a2998d0c96d4bca FOREIGN KEY (objectrelationship_id) REFERENCES object_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: religion_id_refs_id_1a2c05c52c48e94d; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY character_religion
    ADD CONSTRAINT religion_id_refs_id_1a2c05c52c48e94d FOREIGN KEY (religion_id) REFERENCES religion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: religion_id_refs_id_2a1252181af22450; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY location_religion
    ADD CONSTRAINT religion_id_refs_id_2a1252181af22450 FOREIGN KEY (religion_id) REFERENCES religion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: religion_id_refs_id_5ed291ee3ce33bbe; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY religion_author
    ADD CONSTRAINT religion_id_refs_id_5ed291ee3ce33bbe FOREIGN KEY (religion_id) REFERENCES religion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

