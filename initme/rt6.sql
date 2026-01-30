--
-- PostgreSQL database dump
--

CREATE DATABASE "rt6";

\connect "rt6";

\restrict m1IRtodZEV7MwGi4UnkLOxO3xk1wUXHmn6psfGDBzx8DPeKcZSxoNzr9ddzzH5P

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: acl_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.acl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.acl_id_seq OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: acl; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.acl (
    id integer DEFAULT nextval('public.acl_id_seq'::regclass) NOT NULL,
    principaltype character varying(25) NOT NULL,
    principalid integer NOT NULL,
    rightname character varying(25) NOT NULL,
    objecttype character varying(25) NOT NULL,
    objectid integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.acl OWNER TO root;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    class integer DEFAULT 0 NOT NULL,
    parent integer DEFAULT 0 NOT NULL,
    uri character varying(255),
    disabled smallint DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.articles OWNER TO root;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.articles_id_seq OWNER TO root;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assets_id_seq OWNER TO root;

--
-- Name: assets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.assets (
    id integer DEFAULT nextval('public.assets_id_seq'::regclass) NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    catalog integer DEFAULT 0 NOT NULL,
    status character varying(64) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.assets OWNER TO root;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attachments_id_seq OWNER TO root;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.attachments (
    id bigint DEFAULT nextval('public.attachments_id_seq'::regclass) NOT NULL,
    transactionid bigint NOT NULL,
    parent bigint DEFAULT 0 NOT NULL,
    messageid character varying(160),
    subject character varying(255),
    filename character varying(255),
    contenttype character varying(80),
    contentencoding character varying(80),
    content text,
    headers text,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.attachments OWNER TO root;

--
-- Name: attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attributes_id_seq OWNER TO root;

--
-- Name: attributes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.attributes (
    id integer DEFAULT nextval('public.attributes_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    content text,
    contenttype character varying(16),
    objecttype character varying(64),
    objectid integer,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.attributes OWNER TO root;

--
-- Name: authtokens_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.authtokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authtokens_id_seq OWNER TO root;

--
-- Name: authtokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authtokens (
    id integer DEFAULT nextval('public.authtokens_id_seq'::regclass) NOT NULL,
    owner integer DEFAULT 0 NOT NULL,
    token character varying(256),
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    lastused timestamp without time zone,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    expires timestamp without time zone
);


ALTER TABLE public.authtokens OWNER TO root;

--
-- Name: cachedgroupmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cachedgroupmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cachedgroupmembers_id_seq OWNER TO root;

--
-- Name: cachedgroupmembers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cachedgroupmembers (
    id integer DEFAULT nextval('public.cachedgroupmembers_id_seq'::regclass) NOT NULL,
    groupid integer,
    memberid integer,
    via integer,
    immediateparentid integer,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cachedgroupmembers OWNER TO root;

--
-- Name: catalogs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.catalogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.catalogs_id_seq OWNER TO root;

--
-- Name: catalogs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.catalogs (
    id integer DEFAULT nextval('public.catalogs_id_seq'::regclass) NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    lifecycle character varying(32) DEFAULT 'assets'::character varying NOT NULL,
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    disabled integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.catalogs OWNER TO root;

--
-- Name: classes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    disabled smallint DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.classes OWNER TO root;

--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classes_id_seq OWNER TO root;

--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.configurations_id_seq OWNER TO root;

--
-- Name: configurations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.configurations (
    id integer DEFAULT nextval('public.configurations_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    content text,
    contenttype character varying(80),
    disabled integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.configurations OWNER TO root;

--
-- Name: customfields_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.customfields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customfields_id_seq OWNER TO root;

--
-- Name: customfields; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.customfields (
    id integer DEFAULT nextval('public.customfields_id_seq'::regclass) NOT NULL,
    name character varying(200),
    type character varying(200),
    rendertype character varying(64),
    maxvalues integer DEFAULT 0 NOT NULL,
    valuesclass character varying(64),
    basedon integer,
    pattern character varying(65536),
    lookuptype character varying(255) NOT NULL,
    entryhint character varying(255),
    validationhint character varying(255),
    description character varying(255),
    sortorder integer DEFAULT 0 NOT NULL,
    uniquevalues integer DEFAULT 0 NOT NULL,
    canonicalizeclass character varying(64),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.customfields OWNER TO root;

--
-- Name: customfieldvalues_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.customfieldvalues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customfieldvalues_id_seq OWNER TO root;

--
-- Name: customfieldvalues; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.customfieldvalues (
    id integer DEFAULT nextval('public.customfieldvalues_id_seq'::regclass) NOT NULL,
    customfield integer NOT NULL,
    name character varying(200),
    description character varying(255),
    sortorder integer DEFAULT 0 NOT NULL,
    category character varying(255),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.customfieldvalues OWNER TO root;

--
-- Name: customroles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.customroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customroles_id_seq OWNER TO root;

--
-- Name: customroles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.customroles (
    id integer DEFAULT nextval('public.customroles_id_seq'::regclass) NOT NULL,
    name character varying(200),
    description character varying(255),
    maxvalues integer DEFAULT 0 NOT NULL,
    entryhint character varying(255),
    lookuptype character varying(255) NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.customroles OWNER TO root;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboards_id_seq OWNER TO root;

--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.dashboards (
    id integer DEFAULT nextval('public.dashboards_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    principalid integer NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dashboards OWNER TO root;

--
-- Name: dashboardsubscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.dashboardsubscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboardsubscriptions_id_seq OWNER TO root;

--
-- Name: dashboardsubscriptions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.dashboardsubscriptions (
    id integer DEFAULT nextval('public.dashboardsubscriptions_id_seq'::regclass) NOT NULL,
    userid integer NOT NULL,
    dashboardid integer NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dashboardsubscriptions OWNER TO root;

--
-- Name: groupmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.groupmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groupmembers_id_seq OWNER TO root;

--
-- Name: groupmembers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.groupmembers (
    id integer DEFAULT nextval('public.groupmembers_id_seq'::regclass) NOT NULL,
    groupid integer DEFAULT 0 NOT NULL,
    memberid integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.groupmembers OWNER TO root;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO root;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.groups (
    id integer DEFAULT nextval('public.groups_id_seq'::regclass) NOT NULL,
    name character varying(200),
    description character varying(255),
    domain character varying(64),
    instance integer,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.groups OWNER TO root;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.links_id_seq OWNER TO root;

--
-- Name: links; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.links (
    id integer DEFAULT nextval('public.links_id_seq'::regclass) NOT NULL,
    base character varying(240),
    target character varying(240),
    type character varying(20) NOT NULL,
    localtarget integer DEFAULT 0 NOT NULL,
    localbase integer DEFAULT 0 NOT NULL,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.links OWNER TO root;

--
-- Name: objectclasses; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.objectclasses (
    id integer NOT NULL,
    class integer NOT NULL,
    objecttype character varying(255) DEFAULT ''::character varying NOT NULL,
    objectid integer NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.objectclasses OWNER TO root;

--
-- Name: objectclasses_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.objectclasses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objectclasses_id_seq OWNER TO root;

--
-- Name: objectclasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.objectclasses_id_seq OWNED BY public.objectclasses.id;


--
-- Name: objectcontents_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.objectcontents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objectcontents_id_seq OWNER TO root;

--
-- Name: objectcontents; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.objectcontents (
    id bigint DEFAULT nextval('public.objectcontents_id_seq'::regclass) NOT NULL,
    objecttype character varying(64) NOT NULL,
    objectid integer NOT NULL,
    contentencoding character varying(64),
    content text,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.objectcontents OWNER TO root;

--
-- Name: objectcustomfields_id_s; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.objectcustomfields_id_s
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objectcustomfields_id_s OWNER TO root;

--
-- Name: objectcustomfields; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.objectcustomfields (
    id integer DEFAULT nextval('public.objectcustomfields_id_s'::regclass) NOT NULL,
    customfield integer NOT NULL,
    objectid integer NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.objectcustomfields OWNER TO root;

--
-- Name: objectcustomfieldvalues_id_s; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.objectcustomfieldvalues_id_s
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objectcustomfieldvalues_id_s OWNER TO root;

--
-- Name: objectcustomfieldvalues; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.objectcustomfieldvalues (
    id integer DEFAULT nextval('public.objectcustomfieldvalues_id_s'::regclass) NOT NULL,
    customfield integer NOT NULL,
    objecttype character varying(255),
    objectid bigint NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    content character varying(255),
    largecontent text,
    contenttype character varying(80),
    contentencoding character varying(80),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.objectcustomfieldvalues OWNER TO root;

--
-- Name: objectscrips_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.objectscrips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objectscrips_id_seq OWNER TO root;

--
-- Name: objectcustomroles; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.objectcustomroles (
    id integer DEFAULT nextval('public.objectscrips_id_seq'::regclass) NOT NULL,
    customrole integer NOT NULL,
    objectid integer NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.objectcustomroles OWNER TO root;

--
-- Name: objectcustomroles_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.objectcustomroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objectcustomroles_id_seq OWNER TO root;

--
-- Name: objectscrips; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.objectscrips (
    id integer DEFAULT nextval('public.objectscrips_id_seq'::regclass) NOT NULL,
    scrip integer NOT NULL,
    stage character varying(32) DEFAULT 'TransactionCreate'::character varying NOT NULL,
    objectid integer NOT NULL,
    sortorder integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.objectscrips OWNER TO root;

--
-- Name: objecttopics; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.objecttopics (
    id integer NOT NULL,
    topic integer NOT NULL,
    objecttype character varying(64) DEFAULT ''::character varying NOT NULL,
    objectid integer NOT NULL
);


ALTER TABLE public.objecttopics OWNER TO root;

--
-- Name: objecttopics_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.objecttopics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.objecttopics_id_seq OWNER TO root;

--
-- Name: objecttopics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.objecttopics_id_seq OWNED BY public.objecttopics.id;


--
-- Name: principals_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.principals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.principals_id_seq OWNER TO root;

--
-- Name: principals; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.principals (
    id integer DEFAULT nextval('public.principals_id_seq'::regclass) NOT NULL,
    principaltype character varying(16) NOT NULL,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.principals OWNER TO root;

--
-- Name: queues_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.queues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.queues_id_seq OWNER TO root;

--
-- Name: queues; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.queues (
    id integer DEFAULT nextval('public.queues_id_seq'::regclass) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(255),
    correspondaddress character varying(120),
    commentaddress character varying(120),
    lifecycle character varying(32),
    subjecttag character varying(120),
    sortorder integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    sladisabled integer DEFAULT 1 NOT NULL,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.queues OWNER TO root;

--
-- Name: savedsearches_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.savedsearches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.savedsearches_id_seq OWNER TO root;

--
-- Name: savedsearches; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.savedsearches (
    id integer DEFAULT nextval('public.savedsearches_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(64) DEFAULT 'Ticket'::character varying NOT NULL,
    principalid integer NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.savedsearches OWNER TO root;

--
-- Name: scripactions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.scripactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scripactions_id_seq OWNER TO root;

--
-- Name: scripactions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scripactions (
    id integer DEFAULT nextval('public.scripactions_id_seq'::regclass) NOT NULL,
    name character varying(200),
    description character varying(255),
    execmodule character varying(60),
    argument character varying(255),
    lookuptype character varying(255) NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.scripactions OWNER TO root;

--
-- Name: scripconditions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.scripconditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scripconditions_id_seq OWNER TO root;

--
-- Name: scripconditions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scripconditions (
    id integer DEFAULT nextval('public.scripconditions_id_seq'::regclass) NOT NULL,
    name character varying(200),
    description character varying(255),
    execmodule character varying(60),
    argument character varying(255),
    applicabletranstypes character varying(60),
    lookuptype character varying(255) NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.scripconditions OWNER TO root;

--
-- Name: scrips_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.scrips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scrips_id_seq OWNER TO root;

--
-- Name: scrips; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scrips (
    id integer DEFAULT nextval('public.scrips_id_seq'::regclass) NOT NULL,
    description character varying(255),
    scripcondition integer DEFAULT 0 NOT NULL,
    scripaction integer DEFAULT 0 NOT NULL,
    customisapplicablecode text,
    custompreparecode text,
    customcommitcode text,
    disabled integer DEFAULT 0 NOT NULL,
    template character varying(200) NOT NULL,
    lookuptype character varying(255) NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.scrips OWNER TO root;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sessions (
    id character(32) NOT NULL,
    a_session bytea,
    lastupdated timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.sessions OWNER TO root;

--
-- Name: shorteners_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.shorteners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shorteners_id_seq OWNER TO root;

--
-- Name: shorteners; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.shorteners (
    id integer DEFAULT nextval('public.shorteners_id_seq'::regclass) NOT NULL,
    code character varying(40) NOT NULL,
    content text NOT NULL,
    permanent integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    lastaccessedby integer DEFAULT 0 NOT NULL,
    lastaccessed timestamp without time zone
);


ALTER TABLE public.shorteners OWNER TO root;

--
-- Name: templates_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.templates_id_seq OWNER TO root;

--
-- Name: templates; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.templates (
    id integer DEFAULT nextval('public.templates_id_seq'::regclass) NOT NULL,
    objectid integer DEFAULT 0 NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(255),
    type character varying(16),
    content text,
    lookuptype character varying(255) NOT NULL,
    lastupdated timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.templates OWNER TO root;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tickets_id_seq OWNER TO root;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.tickets (
    id integer DEFAULT nextval('public.tickets_id_seq'::regclass) NOT NULL,
    effectiveid integer DEFAULT 0 NOT NULL,
    ismerged smallint,
    queue integer DEFAULT 0 NOT NULL,
    type character varying(16),
    owner integer DEFAULT 0 NOT NULL,
    subject character varying(200) DEFAULT '[no subject]'::character varying,
    description text,
    initialpriority integer DEFAULT 0 NOT NULL,
    finalpriority integer DEFAULT 0 NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    timeestimated integer DEFAULT 0 NOT NULL,
    timeworked integer DEFAULT 0 NOT NULL,
    status character varying(64),
    sla character varying(64),
    timeleft integer DEFAULT 0 NOT NULL,
    told timestamp without time zone,
    starts timestamp without time zone,
    started timestamp without time zone,
    due timestamp without time zone,
    resolved timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.tickets OWNER TO root;

--
-- Name: topics; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    parent integer DEFAULT 0 NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT ''::character varying NOT NULL,
    objecttype character varying(64) DEFAULT ''::character varying NOT NULL,
    objectid integer NOT NULL
);


ALTER TABLE public.topics OWNER TO root;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topics_id_seq OWNER TO root;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_id_seq OWNER TO root;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.transactions (
    id bigint DEFAULT nextval('public.transactions_id_seq'::regclass) NOT NULL,
    objecttype character varying(255) NOT NULL,
    objectid integer DEFAULT 0 NOT NULL,
    timetaken integer DEFAULT 0 NOT NULL,
    timeworker integer DEFAULT 0 NOT NULL,
    timeworkeddate date,
    type character varying(20),
    field character varying(255),
    oldvalue character varying(255),
    newvalue character varying(255),
    referencetype character varying(255),
    oldreference integer,
    newreference integer,
    data character varying(255),
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone
);


ALTER TABLE public.transactions OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO root;

--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    name character varying(200) NOT NULL,
    password character varying(256),
    authtoken character varying(16),
    comments text,
    signature text,
    emailaddress character varying(120),
    freeformcontactinfo text,
    organization character varying(200),
    realname character varying(120),
    nickname character varying(16),
    lang character varying(16),
    gecos character varying(16),
    homephone character varying(30),
    workphone character varying(30),
    mobilephone character varying(30),
    pagerphone character varying(30),
    address1 character varying(200),
    address2 character varying(200),
    city character varying(100),
    state character varying(100),
    zip character varying(16),
    country character varying(50),
    timezone character varying(50),
    smimecertificate text,
    imagecontenttype character varying(80),
    image text,
    creator integer DEFAULT 0 NOT NULL,
    created timestamp without time zone,
    lastupdatedby integer DEFAULT 0 NOT NULL,
    lastupdated timestamp without time zone
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- Name: objectclasses id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objectclasses ALTER COLUMN id SET DEFAULT nextval('public.objectclasses_id_seq'::regclass);


--
-- Name: objecttopics id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objecttopics ALTER COLUMN id SET DEFAULT nextval('public.objecttopics_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Data for Name: acl; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.acl (id, principaltype, principalid, rightname, objecttype, objectid, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	Group	2	SuperUser	RT::System	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
2	Group	7	OwnTicket	RT::System	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
3	Group	15	SuperUser	RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
4	Group	4	ShowApprovalsTab	RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
5	Group	4	ShowSearchAdvanced	RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
6	Group	4	ShowSearchBulkUpdate	RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
7	Group	4	SeeSavedSearch	RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
8	Owner	30	ModifyTicket	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
9	Owner	34	ModifyTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
10	Owner	38	ModifyTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
11	Owner	42	ModifyTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
12	Group	27	CreateTicket	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
13	Group	27	ShowTemplate	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
14	Group	27	OwnTicket	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
15	Group	27	CommentOnTicket	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
16	Group	27	SeeQueue	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
17	Group	27	ShowTicket	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
18	Group	27	ShowTicketComments	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
19	Group	27	StealTicket	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
20	Group	27	TakeTicket	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
21	Group	27	Watch	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
22	Group	27	ShowOutgoingEmail	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
23	Group	27	ForwardMessage	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
24	Group	27	CreateTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
25	Group	27	ShowTemplate	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
26	Group	27	OwnTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
27	Group	27	CommentOnTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
28	Group	27	SeeQueue	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
29	Group	27	ShowTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
30	Group	27	ShowTicketComments	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
31	Group	27	StealTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
32	Group	27	TakeTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
33	Group	27	Watch	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
34	Group	27	ShowOutgoingEmail	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
35	Group	27	ForwardMessage	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
36	Group	27	CreateTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
37	Group	27	ShowTemplate	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
38	Group	27	OwnTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
39	Group	27	CommentOnTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
40	Group	27	SeeQueue	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
41	Group	27	ShowTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
42	Group	27	ShowTicketComments	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
43	Group	27	StealTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
44	Group	27	TakeTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
45	Group	27	Watch	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
46	Group	27	ShowOutgoingEmail	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
47	Group	27	ForwardMessage	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
48	Group	27	CreateTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
49	Group	27	ShowTemplate	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
50	Group	27	OwnTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
51	Group	27	CommentOnTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
52	Group	27	SeeQueue	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
53	Group	27	ShowTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
54	Group	27	ShowTicketComments	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
55	Group	27	StealTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
56	Group	27	TakeTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
57	Group	27	Watch	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
58	Group	27	ShowOutgoingEmail	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
59	Group	27	ForwardMessage	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
60	Group	3	ReplyToTicket	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
61	Group	3	CreateTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
62	Group	3	ReplyToTicket	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
63	Group	3	ReplyToTicket	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
64	Group	27	ModifySelf	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
65	Group	27	SeeOwnSavedSearch	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
66	Group	27	AdminOwnSavedSearch	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
67	Group	27	SeeGroupSavedSearch	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
68	Group	27	AdminGroupSavedSearch	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
69	Group	27	SeeOwnDashboard	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
70	Group	27	AdminOwnDashboard	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
71	Group	27	SeeGroupDashboard	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
72	Group	27	AdminGroupDashboard	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
73	Group	27	LoadSavedSearch	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
74	Group	27	AdminSavedSearch	RT::System	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
75	Group	27	SeeCustomField	RT::CustomField	2	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
76	Group	27	ModifyCustomField	RT::CustomField	2	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
77	Group	27	SeeCustomField	RT::CustomField	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
78	Group	27	ModifyCustomField	RT::CustomField	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
79	Group	27	SeeCustomField	RT::CustomField	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
80	Group	27	ModifyCustomField	RT::CustomField	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
81	Group	27	SeeCustomField	RT::CustomField	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
82	Group	27	ModifyCustomField	RT::CustomField	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
83	Group	27	SeeCustomField	RT::CustomField	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
84	Group	27	ModifyCustomField	RT::CustomField	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
85	Group	27	SeeCustomField	RT::CustomField	7	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
86	Group	27	ModifyCustomField	RT::CustomField	7	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
87	Group	27	SeeCustomField	RT::CustomField	8	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
88	Group	27	ModifyCustomField	RT::CustomField	8	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
89	Group	27	SeeCustomField	RT::CustomField	9	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
90	Group	27	ModifyCustomField	RT::CustomField	9	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
91	Group	27	SeeCustomField	RT::CustomField	10	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
92	Group	27	ModifyCustomField	RT::CustomField	10	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
93	Group	27	SeeCustomField	RT::CustomField	11	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
94	Group	27	ModifyCustomField	RT::CustomField	11	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
95	Group	27	SeeCustomField	RT::CustomField	12	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
96	Group	27	ModifyCustomField	RT::CustomField	12	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
97	Group	27	SeeCustomField	RT::CustomField	13	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
98	Group	27	ModifyCustomField	RT::CustomField	13	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
99	Group	27	SeeCustomField	RT::CustomField	14	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
100	Group	27	ModifyCustomField	RT::CustomField	14	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
101	Group	27	SeeCustomField	RT::CustomField	15	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
102	Group	27	ModifyCustomField	RT::CustomField	15	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
103	Group	27	SeeCustomField	RT::CustomField	16	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
104	Group	27	ModifyCustomField	RT::CustomField	16	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
105	Group	27	SeeCustomField	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
106	Group	27	SeeCustomField	RT::CustomField	17	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
107	Group	27	ModifyCustomField	RT::CustomField	17	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
108	Group	27	AdminClass	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
109	Group	27	AdminTopics	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
110	Group	27	CreateArticle	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
111	Group	27	ModifyArticle	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
112	Group	27	ModifyArticleTopics	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
113	Group	27	SeeClass	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
114	Group	27	ShowArticle	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
115	Group	27	ShowArticleHistory	RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
116	Group	27	ShowArticlesMenu	RT::System	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
117	Group	27	ShowArticle	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
118	Group	27	SeeCustomField	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
119	Group	27	AdminClass	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
120	Group	27	AdminTopics	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
121	Group	27	CreateArticle	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
122	Group	27	ModifyArticle	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
123	Group	27	ModifyArticleTopics	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
124	Group	27	SeeClass	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
125	Group	27	ShowArticleHistory	RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
126	Group	4	SeeOwnSavedSearch	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
127	Group	4	ShowAssetsMenu	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
128	Group	4	ShowTicketComments	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
129	Group	4	ForwardMessage	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
130	Group	4	StealTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
131	Group	4	SeeCustomField	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
132	Group	4	SeeGroupSavedSearch	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
133	Group	4	ManageAuthTokens	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
134	Group	4	ShowArticlesMenu	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
135	Group	4	SeeClass	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
136	Group	4	AdminOwnDashboard	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
137	Group	4	CreateTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
138	Group	4	SeeGroup	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
139	Group	4	ShowOutgoingEmail	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
140	Group	4	CommentOnTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
141	Group	4	ModifySelf	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
142	Group	4	SeeQueue	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
143	Group	4	SetInitialCustomField	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
144	Group	4	LoadSavedSearch	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
145	Group	4	SeeSelfServiceGroupTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
146	Group	4	WatchAsAdminCc	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
147	Group	4	ShowGlobalTemplates	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
148	Group	4	ModifyTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
149	Group	4	SeeOwnDashboard	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
150	Group	4	ReplyToTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
151	Group	4	CreateArticle	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
152	Group	4	ShowCatalog	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
153	Group	4	ReassignTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
154	Group	4	DisableArticle	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
155	Group	4	ModifyAsset	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
156	Group	4	ShowArticleHistory	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
157	Group	4	AdminOwnSavedSearch	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
158	Group	4	ShowUserHistory	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
159	Group	4	Watch	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
160	Group	4	ModifyGroupLinks	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
161	Group	4	SeeGroupDashboard	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
162	Group	4	ShowAsset	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
163	Group	4	ModifyOwnMembership	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
164	Group	4	SeeDashboard	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
165	Group	4	DeleteTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
166	Group	4	ModifyArticle	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
167	Group	4	ModifyCustomField	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
168	Group	4	OwnTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
169	Group	4	ModifyArticleTopics	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
170	Group	4	ShowArticle	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
171	Group	4	CreateAsset	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
172	Group	4	TakeTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
173	Group	4	SubscribeDashboard	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
174	Group	4	ShowTicket	RT::System	1	14	2010-10-28 12:43:02	14	2010-10-28 12:43:02
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.articles (id, name, summary, sortorder, class, parent, uri, disabled, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	Spam Process	This is the summary of the process for handling spam	0	3	0	fsck.com-article://example.local/article/1	0	1	2010-10-28 12:40:59	1	2010-10-28 12:41:00
2	System Compromise Process	This is the summary of the process for handling system compromise	0	3	0	fsck.com-article://example.local/article/2	0	1	2010-10-28 12:40:59	1	2010-10-28 12:41:00
3	Query Process	This is the summary of the process for handling queries	0	3	0	fsck.com-article://example.local/article/3	0	1	2010-10-28 12:40:59	1	2010-10-28 12:41:00
4	Scan Process	This is the summary of the process for handling scans	0	3	0	fsck.com-article://example.local/article/4	0	1	2010-10-28 12:40:59	1	2010-10-28 12:41:00
5	Denial of Service Process	This is the summary of the process for handling denial of service	0	3	0	fsck.com-article://example.local/article/5	0	1	2010-10-28 12:40:59	1	2010-10-28 12:41:00
6	Piracy Process	This is the summary of the process for handling piracy	0	3	0	fsck.com-article://example.local/article/6	0	1	2010-10-28 12:40:59	1	2010-10-28 12:41:00
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.assets (id, name, catalog, status, description, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.attachments (id, transactionid, parent, messageid, subject, filename, contenttype, contentencoding, content, headers, creator, created) FROM stdin;
\.


--
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.attributes (id, name, description, content, contenttype, objecttype, objectid, creator, created, lastupdatedby, lastupdated) FROM stdin;
4	ReportsInMenu	Content of the Reports menu	BQsCAAAABQQDAAAAAwoPcmVzb2x2ZWRieW93bmVyAAAAAmlkCh0vUmVwb3J0cy9SZXNvbHZlZEJ5\nT3duZXIuaHRtbAAAAARwYXRoChFSZXNvbHZlZCBieSBvd25lcgAAAAV0aXRsZQQDAAAAAwoTcmVz\nb2x2ZWRpbmRhdGVyYW5nZQAAAAJpZAodL1JlcG9ydHMvUmVzb2x2ZWRCeURhdGVzLmh0bWwAAAAE\ncGF0aAoWUmVzb2x2ZWQgaW4gZGF0ZSByYW5nZQAAAAV0aXRsZQQDAAAAAwoSY3JlYXRlZGluZGF0\nZXJhbmdlAAAAAmlkChwvUmVwb3J0cy9DcmVhdGVkQnlEYXRlcy5odG1sAAAABHBhdGgKF0NyZWF0\nZWQgaW4gYSBkYXRlIHJhbmdlAAAABXRpdGxlBAMAAAADCgl1c2VyX3RpbWUAAAACaWQKHi9SZXBv\ncnRzL1RpbWVXb3JrZWRSZXBvcnQuaHRtbAAAAARwYXRoChBVc2VyIHRpbWUgd29ya2VkAAAABXRp\ndGxlBAMAAAADChd0aW1lX3dvcmtlZF9mcm9tX3NlYXJjaAAAAAJpZAoYL1JlcG9ydHMvVGltZVNl\nYXJjaC5odG1sAAAABHBhdGgKF1RpbWUgd29ya2VkIGZyb20gc2VhcmNoAAAABXRpdGxl\n	storable	RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
5	DefaultDashboard	Default Dashboard	1		RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
6	Skip-EscapeHTML	\N	1		RT::Class	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
7	LinkValueTo	\N	https://nvd.nist.gov/vuln/detail/__CustomField__#vulnCurrentDescriptionTitle		RT::CustomField	7	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
8	LinkValueTo	\N	__WebPath__/RTIR/Tools/Lookup.html?type=ip&q=__CustomField__&ticket=__id__		RT::CustomField	10	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
9	LinkValueTo	\N	__WebPath__/RTIR/Tools/Lookup.html?type=host&q=__CustomField__&ticket=__id__		RT::CustomField	16	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
10	Skip-Name	\N	1		RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
11	Skip-Summary	\N	1		RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
12	Skip-CF-Title-17	\N	1		RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
13	Skip-CF-Title-1	\N	1		RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
14	Skip-CF-Value-1	\N	1		RT::Class	2	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
15	RTIRDefaultDashboard	RTIR Default Dashboard	2		RT::System	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
16	Skip-Name	\N	1		RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
17	Skip-Summary	\N	1		RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
18	Skip-LinkToTicket	\N	1		RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
19	Skip-CF-Title-1	\N	1		RT::Class	3	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
1	UpgradeHistory	\N	BQsDAAAAAgQCAAAAAgQDAAAACAoGaW5zZXJ0AAAABmFjdGlvbgEAAKzwIyBJbml0aWFsIGRhdGEg\nZm9yIGEgZnJlc2ggUlQgaW5zdGFsbGF0aW9uLgoKQFVzZXJzID0gKAogICAgeyAgTmFtZSAgICAg\nICAgICAgICA9PiAncm9vdCcsCiAgICAgICBHZWNvcyAgICAgICAgICAgID0+ICdyb290JywKICAg\nICAgIFJlYWxOYW1lICAgICAgICAgPT4gJ0Vub2NoIFJvb3QnLAogICAgICAgUGFzc3dvcmQgICAg\nICAgICA9PiAncGFzc3dvcmQnLAogICAgICAgRW1haWxBZGRyZXNzICAgICA9PiAicm9vdFxAbG9j\nYWxob3N0IiwKICAgICAgIENvbW1lbnRzICAgICAgICAgPT4gJ1N1cGVyVXNlcicsCiAgICAgICBQ\ncml2aWxlZ2VkICAgICAgID0+ICcxJywKICAgICAgIFNraXBDYW5vbmljYWxpemUgPT4gJzEnLAog\nICAgfSwKKTsKCkBHcm91cHMgPSAoCik7CgpAUXVldWVzID0gKHsgTmFtZSAgICAgICAgICAgICAg\nPT4gJ0dlbmVyYWwnLAogICAgICAgICAgICAgRGVzY3JpcHRpb24gICAgICAgPT4gJ1RoZSBkZWZh\ndWx0IHF1ZXVlJywKICAgICAgICAgICAgIENvcnJlc3BvbmRBZGRyZXNzID0+ICIiLAogICAgICAg\nICAgICAgQ29tbWVudEFkZHJlc3MgICAgPT4gIiIsIH0sCiAgICAgICAgICAgeyBOYW1lICAgICAg\nICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgICAgICAgIExpZmVjeWNsZSAgID0+ICdhcHByb3Zh\nbHMnLAogICAgICAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0Egc3lzdGVtLWludGVybmFsIHF1ZXVl\nIGZvciB0aGUgYXBwcm92YWxzIHN5c3RlbScsCiAgICAgICAgICAgICBEaXNhYmxlZCAgICA9PiAy\nLCB9ICk7CgpAQ2F0YWxvZ3MgPSAoewogICAgTmFtZSAgICAgICAgPT4gIkdlbmVyYWwgYXNzZXRz\nIiwgICAgICAjIGxvYwogICAgRGVzY3JpcHRpb24gPT4gIlRoZSBkZWZhdWx0IGNhdGFsb2ciLCAj\nIGxvYwp9KTsKCkBTY3JpcEFjdGlvbnMgPSAoCgogICAgeyAgTmFtZSAgICAgICAgPT4gJ0F1dG9y\nZXBseSBUbyBSZXF1ZXN0b3JzJywgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+CidBbHdh\neXMgc2VuZHMgYSBtZXNzYWdlIHRvIHRoZSByZXF1ZXN0b3JzIGluZGVwZW5kZW50IG9mIG1lc3Nh\nZ2Ugc2VuZGVyJyAsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj\nIGxvYwogICAgICAgRXhlY01vZHVsZSA9PiAnQXV0b3JlcGx5JywKICAgICAgIEFyZ3VtZW50ICAg\nPT4gJ1JlcXVlc3RvcicgfSwKICAgIHsgTmFtZSAgICAgICAgPT4gJ05vdGlmeSBSZXF1ZXN0b3Jz\nJywgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5kcyBh\nIG1lc3NhZ2UgdG8gdGhlIHJlcXVlc3RvcnMnLCAgICAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9\nPiAnTm90aWZ5JywKICAgICAgQXJndW1lbnQgICAgPT4gJ1JlcXVlc3RvcicgfSwKICAgIHsgTmFt\nZSAgICAgICAgPT4gJ05vdGlmeSBPd25lciBhcyBDb21tZW50JywgICAgICAgICAgICAgICMgbG9j\nCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5kcyBtYWlsIHRvIHRoZSBvd25lcicsICAgICAgICAg\nICAgICAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5QXNDb21tZW50JywKICAgICAg\nQXJndW1lbnQgICAgPT4gJ093bmVyJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93\nbmVyJywgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4g\nJ1NlbmRzIG1haWwgdG8gdGhlIG93bmVyJywgICAgICAgICAgICAgICMgbG9jCiAgICAgIEV4ZWNN\nb2R1bGUgID0+ICdOb3RpZnknLAogICAgICBBcmd1bWVudCAgICA9PiAnT3duZXInIH0sCiAgICB7\nIE5hbWUgICAgICAgID0+ICdOb3RpZnkgQ2NzIGFzIENvbW1lbnQnLCAgICAgICAgICAgICAgIyBs\nb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1NlbmRzIG1haWwgdG8gdGhlIENjcyBhcyBhIGNvbW1l\nbnQnLCAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5QXNDb21tZW50JywKICAgICAg\nQXJndW1lbnQgICAgPT4gJ0NjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IENjcycs\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlv\nbiA9PiAnU2VuZHMgbWFpbCB0byB0aGUgQ2NzJywgICAgICAgICAgICAgICAgICAgICAgICAjIGxv\nYwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5JywKICAgICAgQXJndW1lbnQgICAgPT4gJ0Nj\nJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IEFkbWluQ2NzIGFzIENvbW1lbnQnLCAg\nICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5kcyBt\nYWlsIHRvIHRoZSBhZG1pbmlzdHJhdGl2ZSBDY3MgYXMgYSBjb21tZW50JywgIyBsb2MKICAgICAg\nRXhlY01vZHVsZSAgPT4gJ05vdGlmeUFzQ29tbWVudCcsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdB\nZG1pbkNjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IEFkbWluQ2NzJywgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdT\nZW5kcyBtYWlsIHRvIHRoZSBhZG1pbmlzdHJhdGl2ZSBDY3MnLCAgICAgICAgICAgICAgIyBsb2MK\nICAgICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdBZG1p\nbkNjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93bmVyIGFuZCBBZG1pbkNjcycs\nICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5k\ncyBtYWlsIHRvIHRoZSBPd25lciBhbmQgYWRtaW5pc3RyYXRpdmUgQ2NzJywgICAgIyBsb2MKICAg\nICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdPd25lcixB\nZG1pbkNjJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93bmVyIG9yIEFkbWluQ2Nz\nJywgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1Nl\nbmRzIG1haWwgdG8gdGhlIE93bmVyIGlmIHNldCwgb3RoZXJ3aXNlIGFkbWluaXN0cmF0aXZlIENj\ncycsICAgICMgbG9jCiAgICAgIEV4ZWNNb2R1bGUgID0+ICdOb3RpZnlPd25lck9yQWRtaW5DYycs\nCiAgICB9LAogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IFJlcXVlc3RvcnMgYW5kIENjcyBh\ncyBDb21tZW50JywgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdTZW5k\nIG1haWwgdG8gcmVxdWVzdG9ycyBhbmQgQ2NzIGFzIGEgY29tbWVudCcsICAgICAgIyBsb2MKICAg\nICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeUFzQ29tbWVudCcsCiAgICAgIEFyZ3VtZW50ICAgID0+\nICdSZXF1ZXN0b3IsQ2MnIH0sCgogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IFJlcXVlc3Rv\ncnMgYW5kIENjcycsICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0\naW9uID0+ICdTZW5kIG1haWwgdG8gcmVxdWVzdG9ycyBhbmQgQ2NzJywgICAgICAgICAgICAgICAg\nICAgIyBsb2MKICAgICAgRXhlY01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAg\nID0+ICdSZXF1ZXN0b3IsQ2MnIH0sCgogICAgeyBOYW1lICAgICAgICA9PiAnTm90aWZ5IE93bmVy\nLCBSZXF1ZXN0b3JzLCBDY3MgYW5kIEFkbWluQ2NzIGFzIENvbW1lbnQnLCAgICAjIGxvYwogICAg\nICBEZXNjcmlwdGlvbiA9PiAnU2VuZCBtYWlsIHRvIG93bmVyIGFuZCBhbGwgd2F0Y2hlcnMgYXMg\nYSAiY29tbWVudCInLCAgICAgICAgICAjIGxvYwogICAgICBFeGVjTW9kdWxlICA9PiAnTm90aWZ5\nQXNDb21tZW50JywKICAgICAgQXJndW1lbnQgICAgPT4gJ0FsbCcgfSwKICAgIHsgTmFtZSAgICAg\nICAgPT4gJ05vdGlmeSBPd25lciwgUmVxdWVzdG9ycywgQ2NzIGFuZCBBZG1pbkNjcycsICAgICAg\nICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1NlbmQgbWFpbCB0byBvd25lciBh\nbmQgYWxsIHdhdGNoZXJzJywgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRXhl\nY01vZHVsZSAgPT4gJ05vdGlmeScsCiAgICAgIEFyZ3VtZW50ICAgID0+ICdBbGwnIH0sCiAgICB7\nIE5hbWUgICAgICAgID0+ICdOb3RpZnkgT3RoZXIgUmVjaXBpZW50cyBhcyBDb21tZW50JywgICAg\nICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1NlbmRzIG1haWwgdG8gZXhw\nbGljaXRseSBsaXN0ZWQgQ2NzIGFuZCBCY2NzJywgICAgICAjIGxvYwogICAgICBFeGVjTW9kdWxl\nICA9PiAnTm90aWZ5QXNDb21tZW50JywKICAgICAgQXJndW1lbnQgICAgPT4gJ090aGVyUmVjaXBp\nZW50cycgfSwKICAgIHsgTmFtZSAgICAgICAgPT4gJ05vdGlmeSBPdGhlciBSZWNpcGllbnRzJywg\nICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnU2Vu\nZHMgbWFpbCB0byBleHBsaWNpdGx5IGxpc3RlZCBDY3MgYW5kIEJjY3MnLCAgICAgICMgbG9jCiAg\nICAgIEV4ZWNNb2R1bGUgID0+ICdOb3RpZnknLAogICAgICBBcmd1bWVudCAgICA9PiAnT3RoZXJS\nZWNpcGllbnRzJyB9LAogICAgeyBOYW1lICAgICAgICA9PiAnVXNlciBEZWZpbmVkJywgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uID0+\nICdQZXJmb3JtIGEgdXNlci1kZWZpbmVkIGFjdGlvbicsICAgICAgICAgICAgICAgICAgICAgIyBs\nb2MKICAgICAgRXhlY01vZHVsZSAgPT4gJ1VzZXJEZWZpbmVkJywgfSwKICAgIHsgIE5hbWUgICAg\nICAgID0+ICdDcmVhdGUgVGlja2V0cycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+CiAgICAgICAgICdDcmVhdGUgbmV3IHRpY2tl\ndHMgYmFzZWQgb24gdGhpcyBzY3JpcFwncyB0ZW1wbGF0ZScsICAgICAgICAgICAgICMgbG9jCiAg\nICAgICBFeGVjTW9kdWxlID0+ICdDcmVhdGVUaWNrZXRzJywgfSwKICAgIHsgTmFtZSAgICAgICAg\nPT4gJ09wZW4gVGlja2V0cycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj\nIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnT3BlbiB0aWNrZXRzIG9uIGNvcnJlc3BvbmRlbmNl\nJywgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIEV4ZWNNb2R1bGUgID0+ICdBdXRvT3Bl\nbicgfSwKICAgIHsgTmFtZSAgICAgICAgPT4gJ09wZW4gSW5hY3RpdmUgVGlja2V0cycsICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnT3BlbiBp\nbmFjdGl2ZSB0aWNrZXRzJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAg\nIEV4ZWNNb2R1bGUgID0+ICdBdXRvT3BlbkluYWN0aXZlJyB9LAogICAgeyBOYW1lICAgICAgICA9\nPiAnRXh0cmFjdCBTdWJqZWN0IFRhZycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMg\nbG9jCiAgICAgIERlc2NyaXB0aW9uID0+ICdFeHRyYWN0IHRhZ3MgZnJvbSBhIFRyYW5zYWN0aW9u\nXCdzIHN1YmplY3QgYW5kIGFkZCB0aGVtIHRvIHRoZSBUaWNrZXRcJ3Mgc3ViamVjdC4nLCAjIGxv\nYwogICAgICBFeGVjTW9kdWxlICA9PiAnRXh0cmFjdFN1YmplY3RUYWcnIH0sCiAgICB7IE5hbWUg\nICAgICAgID0+ICdTZW5kIEZvcndhcmQnLCAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVz\nY3JpcHRpb24gPT4gJ1NlbmQgZm9yd2FyZGVkIG1lc3NhZ2UnLCAgICAgICAjIGxvYwogICAgICBF\neGVjTW9kdWxlICA9PiAnU2VuZEZvcndhcmQnLCB9LAogICAgeyAgTmFtZSAgICAgICAgPT4gJ1Nl\ndCBzdGFydHMgZGF0ZSBhY2NvcmRpbmcgdG8gU0xBJywgIyBsb2MKICAgICAgIERlc2NyaXB0aW9u\nID0+ICdTZXQgdGhlIHN0YXJ0cyBkYXRlIGFjY29yZGluZyB0byBhbiBhZ3JlZW1lbnQnICwgIyBs\nb2MKICAgICAgIEV4ZWNNb2R1bGUgID0+ICdTTEFfU2V0U3RhcnRzJywKICAgIH0sCiAgICB7ICBO\nYW1lICAgICAgICA9PiAnU2V0IGR1ZSBkYXRlIGFjY29yZGluZyB0byBTTEEnLCAjIGxvYwogICAg\nICAgRGVzY3JpcHRpb24gPT4gJ1NldCB0aGUgZHVlIGRhdGUgYWNjb3JkaW5nIHRvIGFuIGFncmVl\nbWVudCcgLCAjIGxvYwogICAgICAgRXhlY01vZHVsZSAgPT4gJ1NMQV9TZXREdWUnLAogICAgfSwK\nICAgIHsKICAgICAgTmFtZSA9PiAnQ2xlYXIgQ3VzdG9tIEZpZWxkIFZhbHVlIFRlbXBsYXRlJywg\nIyBsb2MKICAgICAgRGVzY3JpcHRpb24gPT4gJ1RlbXBsYXRlIGFjdGlvbiBmb3IgY2xlYXJpbmcg\nYSBjdXN0b20gZmllbGQuIFVzZSAiQ29weSBBY3Rpb24iIHRvIGNyZWF0ZSBhbiBhY3Rpb24gZm9y\nIHMgc3BlY2lmaWMgY3VzdG9tIGZpZWxkLicsICMgbG9jCiAgICAgIEV4ZWNNb2R1bGUgPT4gJ0Ns\nZWFyQ3VzdG9tRmllbGRWYWx1ZXMnLAogICAgICBBcmd1bWVudCA9PiAnWW91ciBDdXN0b20gRmll\nbGQgTmFtZSBPciBJZCcKICAgIH0sCiAgICB7CiAgICAgICAgTmFtZSAgICAgICAgPT4gJ1VzZXIg\nRGVmaW5lZCcsICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9\nPiAnUGVyZm9ybSBhIHVzZXItZGVmaW5lZCBhY3Rpb24nLCAgICAjIGxvYwogICAgICAgIEV4ZWNN\nb2R1bGUgID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAgTG9va3VwVHlwZSAgPT4gJ1JUOjpDYXRh\nbG9nLVJUOjpBc3NldCcsCiAgICB9LAogICAgewogICAgICAgIE5hbWUgICAgICAgID0+ICdVc2Vy\nIERlZmluZWQnLCAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24g\nPT4gJ1BlcmZvcm0gYSB1c2VyLWRlZmluZWQgYWN0aW9uJywgICAgIyBsb2MKICAgICAgICBFeGVj\nTW9kdWxlICA9PiAnVXNlckRlZmluZWQnLAogICAgICAgIExvb2t1cFR5cGUgID0+ICdSVDo6Q2xh\nc3MtUlQ6OkFydGljbGUnLAogICAgfSwKKTsKCkBTY3JpcENvbmRpdGlvbnMgPSAoCiAgICB7IE5h\nbWUgICAgICAgICAgICAgICAgID0+ICdPbiBDcmVhdGUnLCAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW4gYSB0aWNr\nZXQgaXMgY3JlYXRlZCcsICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBBcHBsaWNhYmxlVHJh\nbnNUeXBlcyA9PiAnQ3JlYXRlJywKICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ0FueVRy\nYW5zYWN0aW9uJywgfSwKCiAgICB7CiAgICAgICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ09u\nIENyZWF0ZSBWaWEgRW1haWwnLAogICAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVu\nIGEgdGlja2V0IGlzIGNyZWF0ZWQgdmlhIEVtYWlsJywKICAgICAgICBBcHBsaWNhYmxlVHJhbnNU\neXBlcyA9PiAnQ3JlYXRlJywKICAgICAgICBBcmd1bWVudCAgICAgICAgICAgICA9PiAnRW1haWwn\nLAogICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdWaWFJbnRlcmZhY2UnLCB9LAogICAg\newogICAgICAgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBDcmVhdGUgVmlhIFdlYicsCiAg\nICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW4gYSB0aWNrZXQgaXMgY3JlYXRlZCB2\naWEgV2ViJywKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ3JlYXRlJywKICAgICAg\nICBBcmd1bWVudCAgICAgICAgICAgICA9PiAnV2ViLE1vYmlsZScsCiAgICAgICAgRXhlY01vZHVs\nZSAgICAgICAgICAgPT4gJ1ZpYUludGVyZmFjZScsIH0sCgogICAgeyBOYW1lICAgICAgICAgICAg\nICAgICA9PiAnT24gVHJhbnNhY3Rpb24nLCAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9j\nCiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuIGFueXRoaW5nIGhhcHBlbnMnLCAg\nICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0Fu\neScsCiAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsIH0sCiAg\nICB7CgogICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gQ29ycmVzcG9uZCcsICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9\nPiAnV2hlbmV2ZXIgY29ycmVzcG9uZGVuY2UgY29tZXMgaW4nLCAgICAgICAgICAjIGxvYwogICAg\nICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29ycmVzcG9uZCcsCiAgICAgIEV4ZWNNb2R1bGUg\nICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsIH0sCgogICAgewoKICAgICAgTmFtZSAgICAg\nICAgICAgICAgICAgPT4gJ09uIEZvcndhcmQnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW5ldmVyIGEgdGlja2V0\nIG9yIHRyYW5zYWN0aW9uIGlzIGZvcndhcmRlZCcsICMgbG9jCiAgICAgIEFwcGxpY2FibGVUcmFu\nc1R5cGVzID0+ICdGb3J3YXJkIFRyYW5zYWN0aW9uLEZvcndhcmQgVGlja2V0JywKICAgICAgRXhl\nY01vZHVsZSAgICAgICAgICAgPT4gJ0FueVRyYW5zYWN0aW9uJywgfSwKCiAgICB7CgogICAgICBO\nYW1lICAgICAgICAgICAgICAgICA9PiAnT24gRm9yd2FyZCBUaWNrZXQnLCAgICAgICAgICAgICAg\nICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIg\nYSB0aWNrZXQgaXMgZm9yd2FyZGVkJywgICAgICAgICAgICAjIGxvYwogICAgICBBcHBsaWNhYmxl\nVHJhbnNUeXBlcyA9PiAnRm9yd2FyZCBUaWNrZXQnLAogICAgICBFeGVjTW9kdWxlICAgICAgICAg\nICA9PiAnQW55VHJhbnNhY3Rpb24nLCB9LAoKICAgIHsKCiAgICAgIE5hbWUgICAgICAgICAgICAg\nICAgID0+ICdPbiBGb3J3YXJkIFRyYW5zYWN0aW9uJywgICAgICAgICAgICAgICAgICAgICMgbG9j\nCiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHRyYW5zYWN0aW9uIGlz\nIGZvcndhcmRlZCcsICAgICAgICMgbG9jCiAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdG\nb3J3YXJkIFRyYW5zYWN0aW9uJywKICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ0FueVRy\nYW5zYWN0aW9uJywgfSwKCiAgICB7CgogICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24g\nQ29tbWVudCcsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNj\ncmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgY29tbWVudHMgY29tZSBpbicsICAgICAgICAg\nICAgICAgICAjIGxvYwogICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29tbWVudCcsCiAg\nICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicgfSwKICAgIHsKCiAg\nICAgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBTdGF0dXMgQ2hhbmdlJywgICAgICAgICAg\nICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVu\nZXZlciBhIHRpY2tldFwncyBzdGF0dXMgY2hhbmdlcycsICAgICAgICMgbG9jCiAgICAgIEFwcGxp\nY2FibGVUcmFuc1R5cGVzID0+ICdTdGF0dXMnLAogICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9\nPiAnQW55VHJhbnNhY3Rpb24nLAoKICAgIH0sCiAgICB7CgogICAgICBOYW1lICAgICAgICAgICAg\nICAgICA9PiAnT24gUHJpb3JpdHkgQ2hhbmdlJywgICAgICAgICAgICAgICAgICAgICAgICMgbG9j\nCiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHRpY2tldFwncyBwcmlv\ncml0eSBjaGFuZ2VzJywgICAgIyBsb2MKICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ1Nl\ndCcsCiAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdQcmlvcml0eUNoYW5nZScsCiAgICB9\nLAogICAgewoKICAgICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ09uIE93bmVyIENoYW5nZScs\nICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgRGVzY3JpcHRpb24gICAgICAg\nICAgPT4gJ1doZW5ldmVyIGEgdGlja2V0XCdzIG93bmVyIGNoYW5nZXMnLCAgICAgICAgIyBsb2MK\nICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0FueScsCiAgICAgIEV4ZWNNb2R1bGUgICAg\nICAgICAgID0+ICdPd25lckNoYW5nZScsCgogICAgfSwKICAgIHsKCiAgICAgIE5hbWUgICAgICAg\nICAgICAgICAgID0+ICdPbiBRdWV1ZSBDaGFuZ2UnLCAgICAgICAgICAgICAgICAgICAgICAgICAg\nICMgbG9jCiAgICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHRpY2tldFwn\ncyBxdWV1ZSBjaGFuZ2VzJywgICAgICAgICMgbG9jCiAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVz\nID0+ICdTZXQnLAogICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnUXVldWVDaGFuZ2UnLAoK\nICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gUmVzb2x2ZScsICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiAgICAgICAg\nICA9PiAnV2hlbmV2ZXIgYSB0aWNrZXQgaXMgcmVzb2x2ZWQnLCAgICAgICAgICAgICMgbG9jCiAg\nICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnU3RhdHVzJywKICAgICAgIEV4ZWNNb2R1bGUg\nICAgICAgICAgID0+ICdTdGF0dXNDaGFuZ2UnLAogICAgICAgQXJndW1lbnQgICAgICAgICAgICAg\nPT4gJ3Jlc29sdmVkJwoKICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24g\nUmVqZWN0JywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNj\ncmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgYSB0aWNrZXQgaXMgcmVqZWN0ZWQnLCAgICAg\nICAgICAgICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnU3RhdHVzJywKICAg\nICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdTdGF0dXNDaGFuZ2UnLAogICAgICAgQXJndW1l\nbnQgICAgICAgICAgICAgPT4gJ3JlamVjdGVkJwoKICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAg\nICAgICAgICA9PiAnVXNlciBEZWZpbmVkJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMg\nbG9jCiAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgYSB1c2VyLWRlZmlu\nZWQgY29uZGl0aW9uIG9jY3VycycsICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9\nPiAnQW55JywKICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdVc2VyRGVmaW5lZCcKCiAg\nICB9LAoKICAgIHsgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBDbG9zZScsICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uICAgICAgICAg\nID0+ICdXaGVuZXZlciBhIHRpY2tldCBpcyBjbG9zZWQnLCAjIGxvYwogICAgICAgQXBwbGljYWJs\nZVRyYW5zVHlwZXMgPT4gJ1N0YXR1cyxTZXQnLAogICAgICAgRXhlY01vZHVsZSAgICAgICAgICAg\nPT4gJ0Nsb3NlVGlja2V0JywKICAgIH0sCiAgICB7ICBOYW1lICAgICAgICAgICAgICAgICA9PiAn\nT24gUmVvcGVuJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBE\nZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbmV2ZXIgYSB0aWNrZXQgaXMgcmVvcGVuZWQnLCAj\nIGxvYwogICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ1N0YXR1cyxTZXQnLAogICAgICAg\nRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1Jlb3BlblRpY2tldCcsCiAgICB9LAogICAgeyAgTmFt\nZSAgICAgICAgPT4gJ1JlcXVpcmUgU3RhcnRzIHNldCBhY2NvcmRpbmcgdG8gU0xBJywgIyBsb2MK\nICAgICAgIERlc2NyaXB0aW9uID0+ICdEZXRlY3QgYSBzaXR1YXRpb24gd2hlbiB3ZSBzaG91bGQg\nc2V0IFN0YXJ0cyBkYXRlJyAsICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAn\nQ3JlYXRlLFNldCcsCiAgICAgICBFeGVjTW9kdWxlID0+ICdTTEFfUmVxdWlyZVN0YXJ0c1NldCcs\nCiAgICB9LAogICAgeyAgTmFtZSAgICAgICAgPT4gJ1JlcXVpcmUgRHVlIHNldCBhY2NvcmRpbmcg\ndG8gU0xBJywgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+ICdEZXRlY3QgYSBzaXR1YXRpb24g\nd2hlbiB3ZSBzaG91bGQgc2V0IER1ZSBkYXRlJyAsICMgbG9jCiAgICAgICBBcHBsaWNhYmxlVHJh\nbnNUeXBlcyA9PiAnQ3JlYXRlLENvcnJlc3BvbmQsU2V0LFN0YXR1cycsCiAgICAgICBFeGVjTW9k\ndWxlID0+ICdTTEFfUmVxdWlyZUR1ZVNldCcsCiAgICB9LAogICAgewogICAgICAgTmFtZSAgICAg\nICAgICAgICAgICAgPT4gJ09uIFRpbWVXb3JrZWQgQ2hhbmdlJywgICAgICAgICAgICAgICAgICAg\nICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbiBUaW1lV29ya2VkIENo\nYW5nZScsICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVz\nID0+ICdBbnknLAogICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1RpbWVXb3JrZWRDaGFu\nZ2UnLAogICAgfSwKCiAgICB7CiAgICAgICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ1VzZXIg\nRGVmaW5lZCcsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERl\nc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuZXZlciBhIHVzZXItZGVmaW5lZCBjb25kaXRpb24g\nb2NjdXJzJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQW55JywK\nICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnVXNlckRlZmluZWQnLAogICAgICAgIExv\nb2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2F0YWxvZy1SVDo6QXNzZXQnLAogICAgfSwKICAg\nIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gVHJhbnNhY3Rpb24nLCAgICAg\nICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hlbiBhbnl0aGlu\nZyBoYXBwZW5zJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQW55\nJywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnQW55VHJhbnNhY3Rpb24nLAogICAg\nICAgIExvb2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2F0YWxvZy1SVDo6QXNzZXQnLAogICAg\nfSwKICAgIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnT24gQ3JlYXRlJywgICAg\nICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiAgICAgICAgICA9PiAnV2hl\nbiBhbiBhc3NldCBpcyBjcmVhdGVkJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNU\neXBlcyA9PiAnQ3JlYXRlJywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnQW55VHJh\nbnNhY3Rpb24nLAogICAgICAgIExvb2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2F0YWxvZy1S\nVDo6QXNzZXQnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAn\nT24gU3RhdHVzIENoYW5nZScsICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVz\nY3JpcHRpb24gICAgICAgICAgPT4gIldoZW5ldmVyIGFuIGFzc2V0J3Mgc3RhdHVzIGNoYW5nZXMi\nLCAgICAjIGxvYwogICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdTdGF0dXMnLAogICAg\nICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsCiAgICAgICAgTG9v\na3VwVHlwZSAgICAgICAgICAgPT4gJ1JUOjpDYXRhbG9nLVJUOjpBc3NldCcsCiAgICB9LAoKICAg\nIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICAgICA9PiAnVXNlciBEZWZpbmVkJywgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gICAgICAg\nICAgPT4gJ1doZW5ldmVyIGEgdXNlci1kZWZpbmVkIGNvbmRpdGlvbiBvY2N1cnMnLCAgICAjIGxv\nYwogICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdBbnknLAogICAgICAgIEV4ZWNNb2R1\nbGUgICAgICAgICAgID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAgTG9va3VwVHlwZSAgICAgICAg\nICAgPT4gJ1JUOjpDbGFzcy1SVDo6QXJ0aWNsZScsCiAgICB9LAogICAgewogICAgICAgIE5hbWUg\nICAgICAgICAgICAgICAgID0+ICdPbiBUcmFuc2FjdGlvbicsICAgICAgICAgICAjIGxvYwogICAg\nICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdXaGVuIGFueXRoaW5nIGhhcHBlbnMnLCAgICAj\nIGxvYwogICAgICAgIEFwcGxpY2FibGVUcmFuc1R5cGVzID0+ICdBbnknLAogICAgICAgIEV4ZWNN\nb2R1bGUgICAgICAgICAgID0+ICdBbnlUcmFuc2FjdGlvbicsCiAgICAgICAgTG9va3VwVHlwZSAg\nICAgICAgICAgPT4gJ1JUOjpDbGFzcy1SVDo6QXJ0aWNsZScsCiAgICB9LAogICAgewogICAgICAg\nIE5hbWUgICAgICAgICAgICAgICAgID0+ICdPbiBDcmVhdGUnLCAgICAgICAgICAgICAgICAgICAg\nICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ1doZW4gYW4gYXJ0aWNsZSBp\ncyBjcmVhdGVkJywgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ3Jl\nYXRlJywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnQW55VHJhbnNhY3Rpb24nLAog\nICAgICAgIExvb2t1cFR5cGUgICAgICAgICAgID0+ICdSVDo6Q2xhc3MtUlQ6OkFydGljbGUnLAog\nICAgfSwKKTsKCkBUZW1wbGF0ZXMgPSAoCiAgICB7IFF1ZXVlICAgICAgID0+ICcwJywKICAgICAg\nTmFtZSAgICAgICAgPT4gJ0JsYW5rJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnQSBibGFuayB0ZW1wbGF0ZScs\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgIENvbnRlbnQgICAg\nID0+ICcnLCB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgTmFtZSAgICAgICAg\nPT4gJ0F1dG9yZXBseScsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj\nIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gJ1BsYWluIHRleHQgQXV0b3Jlc3BvbnNlIHRlbXBs\nYXRlJywgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgQ29udGVudCAgICAgPT4gJ1N1\nYmplY3Q6IEF1dG9SZXBseTogeyRUaWNrZXQtPlN1YmplY3R9CgoKR3JlZXRpbmdzLAoKVGhpcyBt\nZXNzYWdlIGhhcyBiZWVuIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGluIHJlc3BvbnNlIHRvIHRo\nZQpjcmVhdGlvbiBvZiBhIHRyb3VibGUgdGlja2V0IHJlZ2FyZGluZzoKICAgICAgICAieyRUaWNr\nZXQtPlN1YmplY3QoKX0iLCAKYSBzdW1tYXJ5IG9mIHdoaWNoIGFwcGVhcnMgYmVsb3cuCgpUaGVy\nZSBpcyBubyBuZWVkIHRvIHJlcGx5IHRvIHRoaXMgbWVzc2FnZSByaWdodCBub3cuICBZb3VyIHRp\nY2tldCBoYXMgYmVlbgphc3NpZ25lZCBhbiBJRCBvZiB7ICRUaWNrZXQtPlN1YmplY3RUYWcgfS4K\nClBsZWFzZSBpbmNsdWRlIHRoZSBzdHJpbmc6CgogICAgICAgICB7ICRUaWNrZXQtPlN1YmplY3RU\nYWcgfQoKaW4gdGhlIHN1YmplY3QgbGluZSBvZiBhbGwgZnV0dXJlIGNvcnJlc3BvbmRlbmNlIGFi\nb3V0IHRoaXMgaXNzdWUuIFRvIGRvIHNvLCAKeW91IG1heSByZXBseSB0byB0aGlzIG1lc3NhZ2Uu\nCgogICAgICAgICAgICAgICAgICAgICAgICBUaGFuayB5b3UsCiAgICAgICAgICAgICAgICAgICAg\nICAgIHskVGlja2V0LT5RdWV1ZU9iai0+Q29ycmVzcG9uZEFkZHJlc3MoKX0KCi0tLS0tLS0tLS0t\nLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t\nLS0tLS0KeyRUcmFuc2FjdGlvbi0+Q29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAg\nICAgPT4gJzAnLAogICAgICAgTmFtZSAgICAgICAgPT4gJ0F1dG9yZXBseSBpbiBIVE1MJywgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gJ0hU\nTUwgQXV0b3Jlc3BvbnNlIHRlbXBsYXRlJywgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAg\nICAgQ29udGVudCAgICAgPT4gcVtTdWJqZWN0OiBBdXRvUmVwbHk6IHskVGlja2V0LT5TdWJqZWN0\nfQpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKPHA+R3JlZXRpbmdzLDwvcD4KCjxwPlRoaXMgbWVz\nc2FnZSBoYXMgYmVlbiBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBpbiByZXNwb25zZSB0byB0aGUK\nY3JlYXRpb24gb2YgYSB0cm91YmxlIHRpY2tldCByZWdhcmRpbmcgPGI+eyRUaWNrZXQtPlN1Ympl\nY3QoKX08L2I+LAphIHN1bW1hcnkgb2Ygd2hpY2ggYXBwZWFycyBiZWxvdy48L3A+Cgo8cD5UaGVy\nZSBpcyBubyBuZWVkIHRvIHJlcGx5IHRvIHRoaXMgbWVzc2FnZSByaWdodCBub3cuICBZb3VyIHRp\nY2tldCBoYXMgYmVlbgphc3NpZ25lZCBhbiBJRCBvZiA8Yj57JFRpY2tldC0+U3ViamVjdFRhZ308\nL2I+LjwvcD4KCjxwPlBsZWFzZSBpbmNsdWRlIHRoZSBzdHJpbmcgPGI+eyRUaWNrZXQtPlN1Ympl\nY3RUYWd9PC9iPgppbiB0aGUgc3ViamVjdCBsaW5lIG9mIGFsbCBmdXR1cmUgY29ycmVzcG9uZGVu\nY2UgYWJvdXQgdGhpcyBpc3N1ZS4gVG8gZG8gc28sCnlvdSBtYXkgcmVwbHkgdG8gdGhpcyBtZXNz\nYWdlLjwvcD4KCjxwPlRoYW5rIHlvdSw8YnIvPgp7JFRpY2tldC0+UXVldWVPYmotPkNvcnJlc3Bv\nbmRBZGRyZXNzKCl9PC9wPgoKPGhyLz4KeyRUcmFuc2FjdGlvbi0+Q29udGVudChUeXBlID0+ICd0\nZXh0L2h0bWwnKX0KXSwKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9PiAnMCcsCiAgICAgICBO\nYW1lICAgICAgICA9PiAnVHJhbnNhY3Rpb24nLCAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAg\nICAgICBEZXNjcmlwdGlvbiA9PiAnUGxhaW4gdGV4dCB0cmFuc2FjdGlvbiB0ZW1wbGF0ZScsICMg\nbG9jCiAgICAgICBDb250ZW50ICAgICA9PiAnUlQtQXR0YWNoLU1lc3NhZ2U6IHllcwoKCnskVHJh\nbnNhY3Rpb24tPkNyZWF0ZWRBc1N0cmluZ306IFJlcXVlc3QgeyRUaWNrZXQtPmlkfSB3YXMgYWN0\nZWQgdXBvbi4KIFRyYW5zYWN0aW9uOiB7JFRyYW5zYWN0aW9uLT5EZXNjcmlwdGlvbn0KICAgICAg\nIFF1ZXVlOiB7JFRpY2tldC0+UXVldWVPYmotPk5hbWV9CiAgICAgU3ViamVjdDogeyRUcmFuc2Fj\ndGlvbi0+U3ViamVjdCB8fCAkVGlja2V0LT5TdWJqZWN0IHx8ICIoTm8gc3ViamVjdCBnaXZlbiki\nfQogICAgICAgT3duZXI6IHskVGlja2V0LT5Pd25lck9iai0+TmFtZX0KICBSZXF1ZXN0b3JzOiB7\nJFRpY2tldC0+UmVxdWVzdG9yQWRkcmVzc2VzfQogICAgICBTdGF0dXM6IHskVGlja2V0LT5TdGF0\ndXN9CiBUaWNrZXQgPFVSTDoge1JULT5Db25maWctPkdldChcJ1dlYlVSTFwnKX1UaWNrZXQvRGlz\ncGxheS5odG1sP2lkPXskVGlja2V0LT5pZH0gPgoKCnskVHJhbnNhY3Rpb24tPkNvbnRlbnQoKX0K\nJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICcwJywKICAgICAgIE5hbWUgICAgICAgID0+\nICdUcmFuc2FjdGlvbiBpbiBIVE1MJywgICAgICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9u\nID0+ICdIVE1MIHRyYW5zYWN0aW9uIHRlbXBsYXRlJywgICAgIyBsb2MKICAgICAgIENvbnRlbnQg\nICAgID0+ICdSVC1BdHRhY2gtTWVzc2FnZTogeWVzCkNvbnRlbnQtVHlwZTogdGV4dC9odG1sCgo8\nYj57JFRyYW5zYWN0aW9uLT5DcmVhdGVkQXNTdHJpbmd9OiBSZXF1ZXN0IDxhIGhyZWY9IntSVC0+\nQ29uZmlnLT5HZXQoIldlYlVSTCIpfVRpY2tldC9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlk\nfSI+eyRUaWNrZXQtPmlkfTwvYT4gd2FzIGFjdGVkIHVwb24gYnkgeyRUcmFuc2FjdGlvbi0+Q3Jl\nYXRvck9iai0+TmFtZX0uPC9iPgo8YnI+Cjx0YWJsZSBib3JkZXI9IjAiPgo8dHI+PHRkIGFsaWdu\nPSJyaWdodCI+PGI+VHJhbnNhY3Rpb246PC9iPjwvdGQ+PHRkPnskVHJhbnNhY3Rpb24tPkRlc2Ny\naXB0aW9ufTwvdGQ+PC90cj4KPHRyPjx0ZCBhbGlnbj0icmlnaHQiPjxiPlF1ZXVlOjwvYj48L3Rk\nPjx0ZD57JFRpY2tldC0+UXVldWVPYmotPk5hbWV9PC90ZD48L3RyPgo8dHI+PHRkIGFsaWduPSJy\naWdodCI+PGI+U3ViamVjdDo8L2I+PC90ZD48dGQ+eyRUcmFuc2FjdGlvbi0+U3ViamVjdCB8fCAk\nVGlja2V0LT5TdWJqZWN0IHx8ICIoTm8gc3ViamVjdCBnaXZlbikifSA8L3RkPjwvdHI+Cjx0cj48\ndGQgYWxpZ249InJpZ2h0Ij48Yj5Pd25lcjo8L2I+PC90ZD48dGQ+eyRUaWNrZXQtPk93bmVyT2Jq\nLT5OYW1lfTwvdGQ+PC90cj4KPHRyPjx0ZCBhbGlnbj0icmlnaHQiPjxiPlJlcXVlc3RvcnM6PC9i\nPjwvdGQ+PHRkPnskVGlja2V0LT5SZXF1ZXN0b3JBZGRyZXNzZXN9PC90ZD48L3RyPgo8dHI+PHRk\nIGFsaWduPSJyaWdodCI+PGI+U3RhdHVzOjwvYj48L3RkPjx0ZD57JFRpY2tldC0+U3RhdHVzfTwv\ndGQ+PC90cj4KPHRyPjx0ZCBhbGlnbj0icmlnaHQiPjxiPlRpY2tldCBVUkw6PC9iPjwvdGQ+PHRk\nPjxhIGhyZWY9IntSVC0+Q29uZmlnLT5HZXQoIldlYlVSTCIpfVRpY2tldC9EaXNwbGF5Lmh0bWw/\naWQ9eyRUaWNrZXQtPmlkfSI+e1JULT5Db25maWctPkdldCgiV2ViVVJMIil9VGlja2V0L0Rpc3Bs\nYXkuaHRtbD9pZD17JFRpY2tldC0+aWR9PC9hPjwvdGQ+PC90cj4KPC90YWJsZT4KPGJyLz4KPGJy\nLz4KeyRUcmFuc2FjdGlvbi0+Q29udGVudCggVHlwZSA9PiAidGV4dC9odG1sIil9CicKICAgIH0s\nCiAgICAjIFNoYWRvdyB0aGUgZ2xvYmFsIHRlbXBsYXRlcyBvZiB0aGUgc2FtZSBuYW1lIHRvIHN1\ncHByZXNzIGR1cGxpY2F0ZQogICAgIyBub3RpZmljYXRpb25zIHVudGlsIHJ1bGVzIGlzIHJpcHBl\nZCBvdXQuCiAgICB7IFF1ZXVlICAgICA9PiAiX19fQXBwcm92YWxzIiwKICAgICAgTmFtZSAgICAg\nID0+ICJUcmFuc2FjdGlvbiBpbiBIVE1MIiwKICAgICAgQ29udGVudCAgID0+ICIiLAogICAgfSwK\nICAgIHsgUXVldWUgICAgID0+ICJfX19BcHByb3ZhbHMiLAogICAgICBOYW1lICAgICAgPT4gIlRy\nYW5zYWN0aW9uIiwKICAgICAgQ29udGVudCAgID0+ICIiLAogICAgfSwKICAgIHsKCiAgICAgIFF1\nZXVlICAgICAgID0+ICcwJywKICAgICAgTmFtZSAgICAgICAgPT4gJ0FkbWluIENvcnJlc3BvbmRl\nbmNlJywgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnUGxh\naW4gdGV4dCBhZG1pbiBjb3JyZXNwb25kZW5jZSB0ZW1wbGF0ZScsICAgICMgbG9jCiAgICAgIENv\nbnRlbnQgICAgID0+ICdSVC1BdHRhY2gtTWVzc2FnZTogeWVzCgoKPFVSTDoge1JULT5Db25maWct\nPkdldChcJ1dlYlVSTFwnKX1UaWNrZXQvRGlzcGxheS5odG1sP2lkPXskVGlja2V0LT5pZH0gPgoK\neyRUcmFuc2FjdGlvbi0+Q29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4g\nJzAnLAogICAgICAgTmFtZSAgICAgICAgPT4gJ0FkbWluIENvcnJlc3BvbmRlbmNlIGluIEhUTUwn\nLCAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PiAnSFRNTCBh\nZG1pbiBjb3JyZXNwb25kZW5jZSB0ZW1wbGF0ZScsICAgICMgbG9jCiAgICAgICBDb250ZW50ICAg\nICA9PiAnUlQtQXR0YWNoLU1lc3NhZ2U6IHllcwpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKVGlj\na2V0IFVSTDogPGEgaHJlZj0ie1JULT5Db25maWctPkdldCgiV2ViVVJMIil9VGlja2V0L0Rpc3Bs\nYXkuaHRtbD9pZD17JFRpY2tldC0+aWR9Ij57UlQtPkNvbmZpZy0+R2V0KCJXZWJVUkwiKX1UaWNr\nZXQvRGlzcGxheS5odG1sP2lkPXskVGlja2V0LT5pZH08L2E+CjxiciAvPgo8YnIgLz4KeyRUcmFu\nc2FjdGlvbi0+Q29udGVudChUeXBlID0+ICJ0ZXh0L2h0bWwiKTt9CicKICAgIH0sCiAgICB7ICBR\ndWV1ZSAgICAgICA9PiAnMCcsCiAgICAgICBOYW1lICAgICAgICA9PiAnQ29ycmVzcG9uZGVuY2Un\nLCAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+ICdQ\nbGFpbiB0ZXh0IGNvcnJlc3BvbmRlbmNlIHRlbXBsYXRlJywgICAgICAgICAjIGxvYwogICAgICAg\nQ29udGVudCAgICAgPT4gJ1JULUF0dGFjaC1NZXNzYWdlOiB5ZXMKCnskVHJhbnNhY3Rpb24tPkNv\nbnRlbnQoKX0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICcwJywKICAgICAgIE5hbWUg\nICAgICAgID0+ICdDb3JyZXNwb25kZW5jZSBpbiBIVE1MJywgICAgICAgICAgICAgICAgICMgbG9j\nCiAgICAgICBEZXNjcmlwdGlvbiA9PiAnSFRNTCBjb3JyZXNwb25kZW5jZSB0ZW1wbGF0ZScsICAg\nICAgICAgICAjIGxvYwogICAgICAgQ29udGVudCAgICAgPT4gJ1JULUF0dGFjaC1NZXNzYWdlOiB5\nZXMKQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCnskVHJhbnNhY3Rpb24tPkNvbnRlbnQoIFR5cGUg\nPT4gInRleHQvaHRtbCIpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAg\nICAgTmFtZSAgICAgICAgPT4gJ0FkbWluIENvbW1lbnQnLCAgICAgICAgICAgICAgICAgICAgICAg\nICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PiAnUGxhaW4gdGV4dCBhZG1pbiBjb21tZW50\nIHRlbXBsYXRlJywgICAgICAgICAgIyBsb2MKICAgICAgIENvbnRlbnQgICAgID0+CidTdWJqZWN0\nOiBbQ29tbWVudF0ge215ICRzPSgkVHJhbnNhY3Rpb24tPlN1YmplY3R8fCRUaWNrZXQtPlN1Ympl\nY3R8fCIiKTsgJHMgPX4gcy9cXFtDb21tZW50XFxdXFxzKi8vZzsgJHMgPX4gcy9eUmU6XFxzKi8v\naTsgJHM7fQpSVC1BdHRhY2gtTWVzc2FnZTogeWVzCgoKe1JULT5Db25maWctPkdldChcJ1dlYlVS\nTFwnKX1UaWNrZXQvRGlzcGxheS5odG1sP2lkPXskVGlja2V0LT5pZH0KVGhpcyBpcyBhIGNvbW1l\nbnQuICBJdCBpcyBub3Qgc2VudCB0byB0aGUgUmVxdWVzdG9yKHMpOgoKeyRUcmFuc2FjdGlvbi0+\nQ29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgTmFt\nZSAgICAgICAgPT4gJ0FkbWluIENvbW1lbnQgaW4gSFRNTCcsICAgICAgICAgICAgICAgICAgIyBs\nb2MKICAgICAgIERlc2NyaXB0aW9uID0+ICdIVE1MIGFkbWluIGNvbW1lbnQgdGVtcGxhdGUnLCAg\nICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PiAKJ1N1YmplY3Q6IFtDb21tZW50\nXSB7bXkgJHM9KCRUcmFuc2FjdGlvbi0+U3ViamVjdHx8JFRpY2tldC0+U3ViamVjdHx8IiIpOyAk\ncyA9fiBzL1xcW0NvbW1lbnRcXF1cXHMqLy9nOyAkcyA9fiBzL15SZTpcXHMqLy9pOyAkczt9ClJU\nLUF0dGFjaC1NZXNzYWdlOiB5ZXMKQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCjxwPlRoaXMgaXMg\nYSBjb21tZW50IGFib3V0IDxhIGhyZWY9IntSVC0+Q29uZmlnLT5HZXQoIldlYlVSTCIpfVRpY2tl\ndC9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfSI+dGlja2V0IHskVGlja2V0LT5pZH08L2E+\nLiBJdCBpcyBub3Qgc2VudCB0byB0aGUgUmVxdWVzdG9yKHMpOjwvcD4KCnskVHJhbnNhY3Rpb24t\nPkNvbnRlbnQoVHlwZSA9PiAidGV4dC9odG1sIil9CicKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAg\nICA9PiAnMCcsCiAgICAgICBOYW1lICAgICAgICA9PiAnUmVtaW5kZXInLCAgICAgICAgICAgICAg\nICAgICAgICAgICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PiAnRGVmYXVsdCByZW1pbmRl\nciB0ZW1wbGF0ZScsICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PgonU3ViamVj\ndDp7JFRpY2tldC0+U3ViamVjdH0gaXMgZHVlIHskVGlja2V0LT5EdWVPYmotPkFzU3RyaW5nfQoK\nVGhpcyByZW1pbmRlciBpcyBmb3IgdGlja2V0ICN7JFRhcmdldCA9ICRUaWNrZXQtPlJlZmVyc1Rv\nLT5GaXJzdC0+VGFyZ2V0T2JqOyRUYXJnZXQtPklkfS4KCntSVC0+Q29uZmlnLT5HZXQoXCdXZWJV\nUkxcJyl9VGlja2V0L0Rpc3BsYXkuaHRtbD9pZD17JFRhcmdldC0+SWR9CicKICAgIH0sCgogICAg\neyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgTmFtZSAgICAgICAgPT4gJ1N0YXR1cyBDaGFu\nZ2UnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgRGVz\nY3JpcHRpb24gPT4gJ1RpY2tldCBzdGF0dXMgY2hhbmdlZCcsICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAjIGxvYwogICAgICAgQ29udGVudCAgICAgPT4gJ1N1YmplY3Q6IFN0YXR1cyBDaGFu\nZ2VkIHRvOiB7JFRyYW5zYWN0aW9uLT5OZXdWYWx1ZX0KCgp7UlQtPkNvbmZpZy0+R2V0KFwnV2Vi\nVVJMXCcpfVRpY2tldC9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfQoKeyRUcmFuc2FjdGlv\nbi0+Q29udGVudCgpfQonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAg\nTmFtZSAgICAgICAgPT4gJ1N0YXR1cyBDaGFuZ2UgaW4gSFRNTCcsICAgICAgICAgICAgICAjIGxv\nYwogICAgICAgRGVzY3JpcHRpb24gPT4gJ0hUTUwgVGlja2V0IHN0YXR1cyBjaGFuZ2VkJywgICAg\nICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PiAnU3ViamVjdDogU3RhdHVzIENo\nYW5nZWQgdG86IHskVHJhbnNhY3Rpb24tPk5ld1ZhbHVlfQpDb250ZW50LVR5cGU6IHRleHQvaHRt\nbAoKPGEgaHJlZj0ie1JULT5Db25maWctPkdldCgiV2ViVVJMIil9VGlja2V0L0Rpc3BsYXkuaHRt\nbD9pZD17JFRpY2tldC0+aWR9Ij57UlQtPkNvbmZpZy0+R2V0KCJXZWJVUkwiKX1UaWNrZXQvRGlz\ncGxheS5odG1sP2lkPXskVGlja2V0LT5pZH08L2E+Cjxici8+Cjxici8+CnskVHJhbnNhY3Rpb24t\nPkNvbnRlbnQoVHlwZSA9PiAidGV4dC9odG1sIil9CicKICAgIH0sCiAgICB7CgogICAgICBRdWV1\nZSAgICAgICA9PiAnMCcsCiAgICAgIE5hbWUgICAgICAgID0+ICdSZXNvbHZlZCcsICAgICAgICAg\nICAgICAgICAjIGxvYwogICAgICBEZXNjcmlwdGlvbiA9PiAnVGlja2V0IFJlc29sdmVkJywgICAg\nICAgICAgIyBsb2MKICAgICAgQ29udGVudCAgICAgPT4gJ1N1YmplY3Q6IFJlc29sdmVkOiB7JFRp\nY2tldC0+U3ViamVjdH0KCkFjY29yZGluZyB0byBvdXIgcmVjb3JkcywgeW91ciByZXF1ZXN0IGhh\ncyBiZWVuIHJlc29sdmVkLiBJZiB5b3UgaGF2ZSBhbnkKZnVydGhlciBxdWVzdGlvbnMgb3IgY29u\nY2VybnMsIHBsZWFzZSByZXNwb25kIHRvIHRoaXMgbWVzc2FnZS4KJwogICAgfSwKICAgIHsgIFF1\nZXVlICAgICAgID0+ICcwJywKICAgICAgIE5hbWUgICAgICAgID0+ICdSZXNvbHZlZCBpbiBIVE1M\nJywgICAgICAgICAgICAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gJ0hUTUwgVGlja2V0\nIFJlc29sdmVkJywgICAgICAgICAgICMgbG9jCiAgICAgICBDb250ZW50ICAgICA9PiAnU3ViamVj\ndDogUmVzb2x2ZWQ6IHskVGlja2V0LT5TdWJqZWN0fQpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoK\nPHA+QWNjb3JkaW5nIHRvIG91ciByZWNvcmRzLCB5b3VyIHJlcXVlc3QgaGFzIGJlZW4gcmVzb2x2\nZWQuICBJZiB5b3UgaGF2ZSBhbnkgZnVydGhlciBxdWVzdGlvbnMgb3IgY29uY2VybnMsIHBsZWFz\nZSByZXNwb25kIHRvIHRoaXMgbWVzc2FnZS48L3A+CicKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAg\nICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgIE5hbWUgICAgICAgID0+ICJOZXcgUGVuZGluZyBB\ncHByb3ZhbCIsICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAiTm90aWZ5\nIE93bmVycyBhbmQgQWRtaW5DY3Mgb2YgbmV3IGl0ZW1zIHBlbmRpbmcgdGhlaXIgYXBwcm92YWwi\nLCAjIGxvYwogICAgICAgQ29udGVudCA9PiAnU3ViamVjdDogTmV3IFBlbmRpbmcgQXBwcm92YWw6\nIHskVGlja2V0LT5TdWJqZWN0fQoKR3JlZXRpbmdzLAoKVGhlcmUgaXMgYSBuZXcgaXRlbSBwZW5k\naW5nIHlvdXIgYXBwcm92YWw6ICJ7JFRpY2tldC0+U3ViamVjdCgpfSIsIAphIHN1bW1hcnkgb2Yg\nd2hpY2ggYXBwZWFycyBiZWxvdy4KClBsZWFzZSB2aXNpdCB7UlQtPkNvbmZpZy0+R2V0KFwnV2Vi\nVVJMXCcpfUFwcHJvdmFscy9EaXNwbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfQp0byBhcHByb3Zl\nIG9yIHJlamVjdCB0aGlzIHRpY2tldCwgb3Ige1JULT5Db25maWctPkdldChcJ1dlYlVSTFwnKX1B\ncHByb3ZhbHMvIHRvCmJhdGNoLXByb2Nlc3MgYWxsIHlvdXIgcGVuZGluZyBhcHByb3ZhbHMuCgot\nLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t\nLS0tLS0tLS0tLS0tLS0tCnskVHJhbnNhY3Rpb24tPkNvbnRlbnQoKX0KJwogICAgfSwKICAgIHsg\nIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAogICAgICAgTmFtZSAgICAgICAgPT4gIk5l\ndyBQZW5kaW5nIEFwcHJvdmFsIGluIEhUTUwiLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgIyBsb2MKICAgICAgIERlc2NyaXB0aW9uID0+ICJOb3RpZnkgT3duZXJzIGFuZCBBZG1p\nbkNjcyBvZiBuZXcgaXRlbXMgcGVuZGluZyB0aGVpciBhcHByb3ZhbCIsICMgbG9jCiAgICAgICBD\nb250ZW50ICAgICA9PiAnU3ViamVjdDogTmV3IFBlbmRpbmcgQXBwcm92YWw6IHskVGlja2V0LT5T\ndWJqZWN0fQpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKPHA+R3JlZXRpbmdzLDwvcD4KCjxwPlRo\nZXJlIGlzIGEgbmV3IGl0ZW0gcGVuZGluZyB5b3VyIGFwcHJvdmFsOiA8Yj57JFRpY2tldC0+U3Vi\namVjdCgpfTwvYj4sCmEgc3VtbWFyeSBvZiB3aGljaCBhcHBlYXJzIGJlbG93LjwvcD4KCjxwPlBs\nZWFzZSA8YSBocmVmPSJ7UlQtPkNvbmZpZy0+R2V0KFwnV2ViVVJMXCcpfUFwcHJvdmFscy9EaXNw\nbGF5Lmh0bWw/aWQ9eyRUaWNrZXQtPmlkfSI+YXBwcm92ZQpvciByZWplY3QgdGhpcyB0aWNrZXQ8\nL2E+LCBvciB2aXNpdCB0aGUgPGEgaHJlZj0ie1JULT5Db25maWctPkdldChcJ1dlYlVSTFwnKX1B\ncHByb3ZhbHMvIj5hcHByb3ZhbHMKb3ZlcnZpZXc8L2E+IHRvIGJhdGNoLXByb2Nlc3MgYWxsIHlv\ndXIgcGVuZGluZyBhcHByb3ZhbHMuPC9wPgoKPGhyIC8+CnskVHJhbnNhY3Rpb24tPkNvbnRlbnQo\nKX0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAogICAgICAg\nTmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFBhc3NlZCIsICAgICMgbG9jCiAgICAgICBEZXNjcmlw\ndGlvbiA9PgogICAgICAgICAiTm90aWZ5IFJlcXVlc3RvciBvZiB0aGVpciB0aWNrZXQgaGFzIGJl\nZW4gYXBwcm92ZWQgYnkgc29tZSBhcHByb3ZlciIsICMgbG9jCiAgICAgICBDb250ZW50ID0+ICdT\ndWJqZWN0OiBUaWNrZXQgQXBwcm92ZWQ6IHskVGlja2V0LT5TdWJqZWN0fQoKR3JlZXRpbmdzLAoK\nWW91ciB0aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYnkgeyBldmFsIHsgJEFwcHJvdmVyLT5OYW1l\nIH0gfS4KT3RoZXIgYXBwcm92YWxzIG1heSBiZSBwZW5kaW5nLgoKQXBwcm92ZXJcJ3Mgbm90ZXM6\nIHsgJE5vdGVzIH0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMn\nLAogICAgICAgTmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFBhc3NlZCBpbiBIVE1MIiwgICAgIyBs\nb2MKICAgICAgIERlc2NyaXB0aW9uID0+CiAgICAgICAgICJOb3RpZnkgUmVxdWVzdG9yIG9mIHRo\nZWlyIHRpY2tldCBoYXMgYmVlbiBhcHByb3ZlZCBieSBzb21lIGFwcHJvdmVyIiwgIyBsb2MKICAg\nICAgIENvbnRlbnQgPT4gJ1N1YmplY3Q6IFRpY2tldCBBcHByb3ZlZDogeyRUaWNrZXQtPlN1Ympl\nY3R9CkNvbnRlbnQtVHlwZTogdGV4dC9odG1sCgo8cD5HcmVldGluZ3MsPC9wPgoKPHA+WW91ciB0\naWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYnkgPGI+eyBldmFsIHsgJEFwcHJvdmVyLT5OYW1lIH0g\nfTwvYj4uCk90aGVyIGFwcHJvdmFscyBtYXkgYmUgcGVuZGluZy48L3A+Cgo8cD5BcHByb3Zlclwn\ncyBub3Rlczo8L3A+CjxibG9ja3F1b3RlPnsgJE5vdGVzIH08L2Jsb2NrcXVvdGU+CicKICAgIH0s\nCiAgICB7ICBRdWV1ZSAgICAgICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgIE5hbWUgICAgICAg\nID0+ICJBbGwgQXBwcm92YWxzIFBhc3NlZCIsICAgICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9\nPgogICAgICAgICAiTm90aWZ5IFJlcXVlc3RvciBvZiB0aGVpciB0aWNrZXQgaGFzIGJlZW4gYXBw\ncm92ZWQgYnkgYWxsIGFwcHJvdmVycyIsICMgbG9jCiAgICAgICBDb250ZW50ID0+ICdTdWJqZWN0\nOiBUaWNrZXQgQXBwcm92ZWQ6IHskVGlja2V0LT5TdWJqZWN0fQoKR3JlZXRpbmdzLAoKWW91ciB0\naWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYnkgeyBldmFsIHsgJEFwcHJvdmVyLT5OYW1lIH0gfS4K\nSXRzIE93bmVyIG1heSBub3cgc3RhcnQgdG8gYWN0IG9uIGl0LgoKQXBwcm92ZXJcJ3Mgbm90ZXM6\nIHsgJE5vdGVzIH0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMn\nLAogICAgICAgTmFtZSAgICAgICAgPT4gIkFsbCBBcHByb3ZhbHMgUGFzc2VkIGluIEhUTUwiLCAg\nICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIk5vdGlmeSBSZXF1ZXN0b3Ig\nb2YgdGhlaXIgdGlja2V0IGhhcyBiZWVuIGFwcHJvdmVkIGJ5IGFsbCBhcHByb3ZlcnMiLCAjIGxv\nYwogICAgICAgQ29udGVudCA9PiAnU3ViamVjdDogVGlja2V0IEFwcHJvdmVkOiB7JFRpY2tldC0+\nU3ViamVjdH0KQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCjxwPkdyZWV0aW5ncyw8L3A+Cgo8cD5Z\nb3VyIHRpY2tldCBoYXMgYmVlbiBhcHByb3ZlZCBieSA8Yj57IGV2YWwgeyAkQXBwcm92ZXItPk5h\nbWUgfSB9PC9iPi4KSXRzIE93bmVyIG1heSBub3cgc3RhcnQgdG8gYWN0IG9uIGl0LjwvcD4KCjxw\nPkFwcHJvdmVyXCdzIG5vdGVzOjwvcD4KPGJsb2NrcXVvdGU+eyAkTm90ZXMgfTwvYmxvY2txdW90\nZT4KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAogICAgICAg\nTmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFJlamVjdGVkIiwgICAgIyBsb2MKICAgICAgIERlc2Ny\naXB0aW9uID0+CiAgICAgICAgICJOb3RpZnkgT3duZXIgb2YgdGhlaXIgcmVqZWN0ZWQgdGlja2V0\nIiwgIyBsb2MKICAgICAgIENvbnRlbnQgPT4gJ1N1YmplY3Q6IFRpY2tldCBSZWplY3RlZDogeyRU\naWNrZXQtPlN1YmplY3R9CgpHcmVldGluZ3MsCgpZb3VyIHRpY2tldCBoYXMgYmVlbiByZWplY3Rl\nZCBieSB7IGV2YWwgeyAkQXBwcm92ZXItPk5hbWUgfSB9LgoKQXBwcm92ZXJcJ3Mgbm90ZXM6IHsg\nJE5vdGVzIH0KJwogICAgfSwKICAgIHsgIFF1ZXVlICAgICAgID0+ICdfX19BcHByb3ZhbHMnLAog\nICAgICAgTmFtZSAgICAgICAgPT4gIkFwcHJvdmFsIFJlamVjdGVkIGluIEhUTUwiLCAgICAjIGxv\nYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIk5vdGlmeSBPd25lciBvZiB0aGVpciBy\nZWplY3RlZCB0aWNrZXQiLCAjIGxvYwogICAgICAgQ29udGVudCA9PiAnU3ViamVjdDogVGlja2V0\nIFJlamVjdGVkOiB7JFRpY2tldC0+U3ViamVjdH0KQ29udGVudC1UeXBlOiB0ZXh0L2h0bWwKCjxw\nPkdyZWV0aW5ncyw8L3A+Cgo8cD5Zb3VyIHRpY2tldCBoYXMgYmVlbiByZWplY3RlZCBieSA8Yj57\nIGV2YWwgeyAkQXBwcm92ZXItPk5hbWUgfSB9PC9iPi48L3A+Cgo8cD5BcHByb3ZlclwncyBub3Rl\nczo8L3A+CjxibG9ja3F1b3RlPnsgJE5vdGVzIH08L2Jsb2NrcXVvdGU+CicKICAgIH0sCiAgICB7\nICBRdWV1ZSAgICAgICA9PiAnX19fQXBwcm92YWxzJywKICAgICAgIE5hbWUgICAgICAgID0+ICJB\ncHByb3ZhbCBSZWFkeSBmb3IgT3duZXIiLCAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4K\nICAgICAgICAgIk5vdGlmeSBPd25lciBvZiB0aGVpciB0aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQg\nYW5kIGlzIHJlYWR5IHRvIGJlIGFjdGVkIG9uIiwgIyBsb2MKICAgICAgIENvbnRlbnQgPT4gJ1N1\nYmplY3Q6IFRpY2tldCBBcHByb3ZlZDogeyRUaWNrZXQtPlN1YmplY3R9CgpHcmVldGluZ3MsCgpU\naGUgdGlja2V0IGhhcyBiZWVuIGFwcHJvdmVkLCB5b3UgbWF5IG5vdyBzdGFydCB0byBhY3Qgb24g\naXQuCgonCiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gJ19fX0FwcHJvdmFscycsCiAgICAg\nICBOYW1lICAgICAgICA9PiAiQXBwcm92YWwgUmVhZHkgZm9yIE93bmVyIGluIEhUTUwiLCAgICAj\nIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIk5vdGlmeSBPd25lciBvZiB0aGVp\nciB0aWNrZXQgaGFzIGJlZW4gYXBwcm92ZWQgYW5kIGlzIHJlYWR5IHRvIGJlIGFjdGVkIG9uIiwg\nIyBsb2MKICAgICAgIENvbnRlbnQgPT4gJ1N1YmplY3Q6IFRpY2tldCBBcHByb3ZlZDogeyRUaWNr\nZXQtPlN1YmplY3R9CkNvbnRlbnQtVHlwZTogdGV4dC9odG1sCgo8cD5HcmVldGluZ3MsPC9wPgoK\nPHA+VGhlIHRpY2tldCBoYXMgYmVlbiBhcHByb3ZlZCwgeW91IG1heSBub3cgc3RhcnQgdG8gYWN0\nIG9uIGl0LjwvcD4KCicKICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgTmFt\nZSAgICAgICAgPT4gIkZvcndhcmQiLCAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4gIkZv\ncndhcmRlZCBtZXNzYWdlIiwgIyBsb2MKICAgICAgIENvbnRlbnQgPT4gcXsKCnsgJEZvcndhcmRU\ncmFuc2FjdGlvbi0+Q29udGVudCA9fiAvXFMvID8gJEZvcndhcmRUcmFuc2FjdGlvbi0+Q29udGVu\ndCA6ICJUaGlzIGlzIGEgZm9yd2FyZCBvZiB0cmFuc2FjdGlvbiAjIi4kVHJhbnNhY3Rpb24tPmlk\nLiIgb2YgdGlja2V0ICMiLiAkVGlja2V0LT5pZCB9Cn0KICAgIH0sCiAgICB7ICBRdWV1ZSAgICAg\nICA9PiAwLAogICAgICAgTmFtZSAgICAgICAgPT4gIkZvcndhcmQgVGlja2V0IiwgICAgIyBsb2MK\nICAgICAgIERlc2NyaXB0aW9uID0+ICJGb3J3YXJkZWQgdGlja2V0IG1lc3NhZ2UiLCAjIGxvYwog\nICAgICAgQ29udGVudCA9PiBxewoKeyAkRm9yd2FyZFRyYW5zYWN0aW9uLT5Db250ZW50ID1+IC9c\nUy8gPyAkRm9yd2FyZFRyYW5zYWN0aW9uLT5Db250ZW50IDogIlRoaXMgaXMgYSBmb3J3YXJkIG9m\nIHRpY2tldCAjIi4gJFRpY2tldC0+aWQgfQp9CiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4g\nMCwKICAgICAgIE5hbWUgICAgICAgID0+ICJFcnJvcjogdW5lbmNyeXB0ZWQgbWVzc2FnZSIsICAg\nICMgbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCB0\naGVpciB1bmVuY3J5cHRlZCBtYWlsIGhhcyBiZWVuIHJlamVjdGVkIiwgIyBsb2MKICAgICAgIENv\nbnRlbnQgPT4gcXtTdWJqZWN0OiBSVCByZXF1aXJlcyB0aGF0IGFsbCBpbmNvbWluZyBtYWlsIGJl\nIGVuY3J5cHRlZAoKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIFJUIHJlY2VpdmVk\nIG1haWwgZnJvbSB5b3UgdGhhdCB3YXMgbm90IGVuY3J5cHRlZC4gIEFzIHN1Y2gsIGl0IGhhcyBi\nZWVuIHJlamVjdGVkLgp9CiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gMCwKICAgICAgIE5h\nbWUgICAgICAgID0+ICJFcnJvcjogcHVibGljIGtleSIsICAgICMgbG9jCiAgICAgICBEZXNjcmlw\ndGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCBoZSBoYXMgcHJvYmxlbXMgd2l0aCBw\ndWJsaWMga2V5IGFuZCBjb3VsZG4ndCByZWNpZXZlIGVuY3J5cHRlZCBjb250ZW50IiwgIyBsb2MK\nICAgICAgIENvbnRlbnQgPT4gcXtTdWJqZWN0OiBZb3VyIHB1YmxpYyBrZXkgaW4gUlQgaXMgbWlz\nc2luZyBvciB1bnVzYWJsZQoKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHdlIHdl\ncmUgdW5hYmxlIHRvIGVuY3J5cHQgYSBtZXNzYWdlIHRvIHlvdXIgcHVibGljIGtleSwgZWl0aGVy\nIGJlY2F1c2UgaXQgaXMgbWlzc2luZyBvciBoYXMgYSBwcm9ibGVtLiAgUGxlYXNlIGluZm9ybSB0\naGUgYWRtaW5pc3RyYXRvciBhYm91dCB0aGUgcHJvYmxlbS4KfQogICAgfSwKICAgIHsgIFF1ZXVl\nICAgICAgID0+IDAsCiAgICAgICBOYW1lICAgICAgICA9PiAiRXJyb3IgdG8gUlQgb3duZXI6IHB1\nYmxpYyBrZXkiLCAgICAjIGxvYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIkluZm9y\nbSBSVCBvd25lciB0aGF0IHVzZXIocykgaGF2ZSBwcm9ibGVtcyB3aXRoIHB1YmxpYyBrZXlzIiwg\nIyBsb2MKICAgICAgIENvbnRlbnQgPT4gcXtTdWJqZWN0OiBTb21lIHVzZXJzIGhhdmUgcHJvYmxl\nbXMgd2l0aCBwdWJsaWMga2V5cwoKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBhcyBSVCBoYXMg\ncHJvYmxlbXMgd2l0aCBwdWJsaWMga2V5cyBvZiB0aGUgZm9sbG93aW5nIHVzZXI6CnsKICAgIGZv\ncmVhY2ggbXkgJGUgKCBAQmFkUmVjaXBpZW50cyApIHsKICAgICAgICAkT1VUIC49ICIqICIuICRl\nLT57J01lc3NhZ2UnfSAuIlxuIjsKICAgIH0KfX0KICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9\nPiAwLAogICAgICAgTmFtZSAgICAgICAgPT4gIkVycm9yOiBubyBwcml2YXRlIGtleSIsICAgICMg\nbG9jCiAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCB3ZSBy\nZWNlaXZlZCBhbiBlbmNyeXB0ZWQgZW1haWwgYW5kIHdlIGhhdmUgbm8gcHJpdmF0ZSBrZXlzIHRv\nIGRlY3J5cHQiLCAjIGxvYwogICAgICAgQ29udGVudCA9PiBxe1N1YmplY3Q6IHdlIHJlY2VpdmVk\nIG1lc3NhZ2Ugd2UgY2Fubm90IGRlY3J5cHQKCllvdSBzZW50IGFuIGVuY3J5cHRlZCBtZXNzYWdl\nIHdpdGggc3ViamVjdCAneyAkTWVzc2FnZS0+aGVhZC0+Z2V0KCdTdWJqZWN0JykgfScsCmJ1dCB3\nZSBoYXZlIG5vIHByaXZhdGUga2V5IGl0J3MgZW5jcnlwdGVkIHRvLgoKUGxlYXNlLCBjaGVjayB0\naGF0IHlvdSBlbmNyeXB0IG1lc3NhZ2VzIHdpdGggY29ycmVjdCBrZXlzCm9yIGNvbnRhY3QgdGhl\nIHN5c3RlbSBhZG1pbmlzdHJhdG9yLn0KICAgIH0sCiAgICB7ICBRdWV1ZSAgICAgICA9PiAwLAog\nICAgICAgTmFtZSAgICAgICAgPT4gIkVycm9yOiBiYWQgZW5jcnlwdGVkIGRhdGEiLCAgICAjIGxv\nYwogICAgICAgRGVzY3JpcHRpb24gPT4KICAgICAgICAgIkluZm9ybSB1c2VyIHRoYXQgYSBtZXNz\nYWdlIGhlIHNlbnQgaGFzIGludmFsaWQgZW5jcnlwdGlvbiBkYXRhIiwgIyBsb2MKICAgICAgIENv\nbnRlbnQgPT4gcXtTdWJqZWN0OiBXZSByZWNlaXZlZCBhIG1lc3NhZ2Ugd2UgY2Fubm90IGhhbmRs\nZQoKWW91IHNlbnQgdXMgYSBtZXNzYWdlIHRoYXQgd2UgY2Fubm90IGhhbmRsZSBkdWUgdG8gY29y\ncnVwdGVkIHNpZ25hdHVyZSBvciBlbmNyeXB0ZWQgYmxvY2suIHdlIGdldCB0aGUgZm9sbG93aW5n\nIGVycm9yKHMpOgp7IGZvcmVhY2ggbXkgJG1zZyAoIEBNZXNzYWdlcyApIHsKICAgICRPVVQgLj0g\nIiogJG1zZ1xuIjsKICB9Cn19CiAgICB9LAogICAgeyAgUXVldWUgICAgICAgPT4gMCwKICAgICAg\nIE5hbWUgICAgICAgID0+ICJQYXNzd29yZENoYW5nZSIsICAgICMgbG9jCiAgICAgICBEZXNjcmlw\ndGlvbiA9PgogICAgICAgICAiSW5mb3JtIHVzZXIgdGhhdCBoaXMgcGFzc3dvcmQgaGFzIGJlZW4g\ncmVzZXQiLCAjIGxvYwogICAgICAgQ29udGVudCA9PiBxe1N1YmplY3Q6IFt7UlQtPkNvbmZpZy0+\nR2V0KCdydG5hbWUnKX1dIFBhc3N3b3JkIHJlc2V0CgpHcmVldGluZ3MsCgpTb21lb25lIGF0IHsk\nRU5WeydSRU1PVEVfQUREUid9fSByZXF1ZXN0ZWQgYSBwYXNzd29yZCByZXNldCBmb3IgeW91IG9u\nIHtSVC0+Q29uZmlnLT5HZXQoJ1dlYlVSTCcpfQoKWW91ciBuZXcgcGFzc3dvcmQgaXM6CiAgeyRO\nZXdQYXNzd29yZH0KfQogICAgfSwKCiAgICAgICAgICAgICAgIHsgICBRdWV1ZSAgICAgICA9PiAn\nMCcsCiAgICAgICAgICAgICAgICAgICBOYW1lICAgICAgICA9PiAnRW1haWwgRGlnZXN0JywgICAg\nIyBsb2MKICAgICAgICAgICAgICAgICAgIERlc2NyaXB0aW9uID0+ICdFbWFpbCB0ZW1wbGF0ZSBm\nb3IgcGVyaW9kaWMgbm90aWZpY2F0aW9uIGRpZ2VzdHMnLCAgIyBsb2MKICAgICAgICAgICAgICAg\nICAgIENvbnRlbnQgPT4gcVtTdWJqZWN0OiBSVCBFbWFpbCBEaWdlc3QKCnsgJEFyZ3VtZW50IH0K\nXSwKICAgICAgICAgICAgICAgfSwKCnsKICAgIFF1ZXVlICAgICAgID0+IDAsCiAgICBOYW1lICAg\nICAgICA9PiAiRXJyb3I6IE1pc3NpbmcgZGFzaGJvYXJkIiwgICAgIyBsb2MKICAgIERlc2NyaXB0\naW9uID0+CiAgICAgICJJbmZvcm0gdXNlciB0aGF0IGEgZGFzaGJvYXJkIGhlIHN1YnNjcmliZWQg\ndG8gaXMgbWlzc2luZyIsICMgbG9jCiAgICBDb250ZW50ID0+IHF7U3ViamVjdDogW3tSVC0+Q29u\nZmlnLT5HZXQoJ3J0bmFtZScpfV0gTWlzc2luZyBkYXNoYm9hcmQhCgpHcmVldGluZ3MsCgpZb3Ug\nYXJlIHN1YnNjcmliZWQgdG8gYSBkYXNoYm9hcmQgdGhhdCBpcyBjdXJyZW50bHkgbWlzc2luZy4g\nTW9zdCBsaWtlbHksIHRoZSBkYXNoYm9hcmQgd2FzIGRlbGV0ZWQuCgpSVCB3aWxsIHJlbW92ZSB0\naGlzIHN1YnNjcmlwdGlvbiBhcyBpdCBpcyBubyBsb25nZXIgdXNlZnVsLiBIZXJlJ3MgdGhlIGlu\nZm9ybWF0aW9uIFJUIGhhZCBhYm91dCB5b3VyIHN1YnNjcmlwdGlvbjoKCkRhc2hib2FyZElEOiAg\neyAkU3Vic2NyaXB0aW9uT2JqLT5TdWJWYWx1ZSgnRGFzaGJvYXJkSWQnKSB9CkZyZXF1ZW5jeTog\nICAgeyAkU3Vic2NyaXB0aW9uT2JqLT5TdWJWYWx1ZSgnRnJlcXVlbmN5JykgfQpIb3VyOiAgICAg\nICAgIHsgJFN1YnNjcmlwdGlvbk9iai0+U3ViVmFsdWUoJ0hvdXInKSB9CnsKICAgICRTdWJzY3Jp\ncHRpb25PYmotPlN1YlZhbHVlKCdGcmVxdWVuY3knKSBlcSAnd2Vla2x5JwogICAgPyAiRGF5IG9m\nIHdlZWs6ICAiIC4gJFN1YnNjcmlwdGlvbk9iai0+U3ViVmFsdWUoJ0RvdycpCiAgICA6ICRTdWJz\nY3JpcHRpb25PYmotPlN1YlZhbHVlKCdGcmVxdWVuY3knKSBlcSAnbW9udGhseScKICAgICAgPyAi\nRGF5IG9mIG1vbnRoOiAiIC4gJFN1YnNjcmlwdGlvbk9iai0+U3ViVmFsdWUoJ0RvbScpCiAgICAg\nIDogJycKfQp9Cn0sCiAgICB7CiAgICAgICAgUXVldWUgICAgICAgPT4gJzAnLAogICAgICAgIE5h\nbWUgICAgICAgID0+ICdBdXRoIHRva2VucyBleHBpcmluZyBpbiA3IGRheXMgaW4gSFRNTCcsICMg\nbG9jCiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0F1dGggdG9rZW5zIGV4cGlyaW5nIGluIDcgZGF5\ncycsICMgbG9jCiAgICAgICAgQ29udGVudCAgICAgPT4gcVtTdWJqZWN0OiBbe1JULT5Db25maWct\nPkdldCgncnRuYW1lJyl9XSBZb3UgaGF2ZSBhdXRoIHRva2VucyB0aGF0IHdpbGwgZXhwaXJlIGlu\nIDcgZGF5cwpDb250ZW50LVR5cGU6IHRleHQvaHRtbAoKPHA+SGVsbG8geyAkVXNlck9iai0+UmVh\nbE5hbWUgfHwgJFVzZXJPYmotPk5hbWUgfTo8L3A+Cgo8cD4KVGhlIGZvbGxvd2luZyB0b2tlbnMg\nd2lsbCBleHBpcmUgd2l0aGluIHRoZSBuZXh0IDcgZGF5czoKPHVsPgp7CiAgICBmb3IgbXkgJHRv\na2VuIChAQXV0aFRva2VucykgewogICAgICAgICRPVVQgLj0gJzxsaT4nIC4gJHRva2VuLT5EZXNj\ncmlwdGlvbiAuICAnIChleHBpcmVzIGF0ICcgLiAkdG9rZW4tPkV4cGlyZXNPYmotPkFzU3RyaW5n\nIC4gJyk8L2xpPic7CiAgICB9Cn0KPC91bD4KPC9wPgoKewogICAgaWYgKCAgICRVc2VyT2JqLT5I\nYXNSaWdodCggUmlnaHQgPT4gJ01vZGlmeVNlbGYnLCBPYmplY3QgPT4gUlQtPlN5c3RlbSApCiAg\nICAgICAgJiYgJFVzZXJPYmotPkhhc1JpZ2h0KCBSaWdodCA9PiAnTWFuYWdlQXV0aFRva2Vucycs\nIE9iamVjdCA9PiBSVC0+U3lzdGVtICkgKQogICAgewogICAgICAgICRPVVQgLj0gJzxwPllvdSBj\nYW4gcmV2b2tlIHRoZW0gYW5kIGdlbmVyYXRlIG5ldyBvbmVzIG9uIHRoZSA8YSBocmVmPSInIC4g\nUlQtPkNvbmZpZy0+R2V0KCdXZWJVUkwnKSAuICdQcmVmcy9BdXRoVG9rZW5zLmh0bWwnIC4gJyI+\nQXV0aCBUb2tlbnM8L2E+IHBhZ2UgaW4gUlQuPC9wPic7CiAgICB9CiAgICBlbHNlIHsKICAgICAg\nICAkT1VUIC49ICI8cD5JZiB5b3UgYXJlIHN0aWxsIHVzaW5nIHRoZW0sIHBsZWFzZSBjb250YWN0\nIHlvdXIgUlQgbWFuYWdlciB0byBnZW5lcmF0ZSBuZXcgb25lcyBmb3IgeW91LjwvcD4iOwogICAg\nfQp9Cl0sCiAgICB9LAogICAgewogICAgICAgIE9iamVjdElkICAgID0+ICcwJywKICAgICAgICBO\nYW1lICAgICAgICA9PiAnQmxhbmsnLCAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3Jp\ncHRpb24gPT4gJ0EgYmxhbmsgdGVtcGxhdGUnLCAgICAjIGxvYwogICAgICAgIENvbnRlbnQgICAg\nID0+ICcnLAogICAgICAgIExvb2t1cFR5cGUgID0+ICdSVDo6Q2F0YWxvZy1SVDo6QXNzZXQnLAog\nICAgfSwKICAgIHsKICAgICAgICBPYmplY3RJZCAgICA9PiAnMCcsCiAgICAgICAgTmFtZSAgICAg\nICAgPT4gJ0JsYW5rJywgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+\nICdBIGJsYW5rIHRlbXBsYXRlJywgICAgIyBsb2MKICAgICAgICBDb250ZW50ICAgICA9PiAnJywK\nICAgICAgICBMb29rdXBUeXBlICA9PiAnUlQ6OkNsYXNzLVJUOjpBcnRpY2xlJywKICAgIH0sCik7\nCgpAU2NyaXBzID0gKAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIENvbW1lbnQgTm90aWZ5\nIEFkbWluQ2NzIGFzIENvbW1lbnQnLAogICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIENvbW1l\nbnQnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ05vdGlmeSBBZG1pbkNjcyBBcyBDb21tZW50\nJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdBZG1pbiBDb21tZW50IGluIEhUTUwnIH0sCiAg\nICB7ICBEZXNjcmlwdGlvbiAgICA9PiAnT24gQ29tbWVudCBOb3RpZnkgT3RoZXIgUmVjaXBpZW50\ncyBhcyBDb21tZW50JywKICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDb21tZW50JywKICAg\nICAgIFNjcmlwQWN0aW9uICAgID0+ICdOb3RpZnkgT3RoZXIgUmVjaXBpZW50cyBBcyBDb21tZW50\nJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdDb3JyZXNwb25kZW5jZSBpbiBIVE1MJyB9LAog\nICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIENvcnJlc3BvbmQgTm90aWZ5IE93bmVyIGFuZCBB\nZG1pbkNjcycsCiAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ29ycmVzcG9uZCcsCiAgICAg\nICBTY3JpcEFjdGlvbiAgICA9PiAnTm90aWZ5IE93bmVyIGFuZCBBZG1pbkNjcycsCiAgICAgICBU\nZW1wbGF0ZSAgICAgICA9PiAnQWRtaW4gQ29ycmVzcG9uZGVuY2UgaW4gSFRNTCcgfSwKICAgIHsg\nIERlc2NyaXB0aW9uICAgID0+ICdPbiBDb3JyZXNwb25kIE5vdGlmeSBPdGhlciBSZWNpcGllbnRz\nJywKICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDb3JyZXNwb25kJywKICAgICAgIFNjcmlw\nQWN0aW9uICAgID0+ICdOb3RpZnkgT3RoZXIgUmVjaXBpZW50cycsCiAgICAgICBUZW1wbGF0ZSAg\nICAgICA9PiAnQ29ycmVzcG9uZGVuY2UgaW4gSFRNTCcgfSwKICAgIHsgIERlc2NyaXB0aW9uICAg\nID0+ICdPbiBDb3JyZXNwb25kIE5vdGlmeSBSZXF1ZXN0b3JzIGFuZCBDY3MnLAogICAgICAgU2Ny\naXBDb25kaXRpb24gPT4gJ09uIENvcnJlc3BvbmQnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4g\nJ05vdGlmeSBSZXF1ZXN0b3JzIEFuZCBDY3MnLAogICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0Nv\ncnJlc3BvbmRlbmNlIGluIEhUTUwnIH0sCiAgICB7ICBEZXNjcmlwdGlvbiAgICA9PiAnT24gQ29y\ncmVzcG9uZCBPcGVuIEluYWN0aXZlIFRpY2tldHMnLAogICAgICAgU2NyaXBDb25kaXRpb24gPT4g\nJ09uIENvcnJlc3BvbmQnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ09wZW4gSW5hY3RpdmUg\nVGlja2V0cycsCiAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnIH0sCiAgICB7ICBEZXNj\ncmlwdGlvbiAgICA9PiAnT24gQ3JlYXRlIEF1dG9yZXBseSBUbyBSZXF1ZXN0b3JzJywKICAgICAg\nIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDcmVhdGUnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4g\nJ0F1dG9SZXBseSBUbyBSZXF1ZXN0b3JzJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdBdXRv\nUmVwbHkgaW4gSFRNTCcgfSwKICAgIHsgIERlc2NyaXB0aW9uICAgID0+ICdPbiBDcmVhdGUgTm90\naWZ5IE93bmVyIGFuZCBBZG1pbkNjcycsCiAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ3Jl\nYXRlJywKICAgICAgIFNjcmlwQWN0aW9uICAgID0+ICdOb3RpZnkgT3duZXIgYW5kIEFkbWluQ2Nz\nJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdUcmFuc2FjdGlvbiBpbiBIVE1MJyB9LAogICAg\neyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIENyZWF0ZSBOb3RpZnkgQ2NzJywKICAgICAgIFNjcmlw\nQ29uZGl0aW9uID0+ICdPbiBDcmVhdGUnLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ05vdGlm\neSBDY3MnLAogICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0NvcnJlc3BvbmRlbmNlIGluIEhUTUwn\nIH0sCiAgICB7ICBEZXNjcmlwdGlvbiAgICA9PiAnT24gQ3JlYXRlIE5vdGlmeSBPdGhlciBSZWNp\ncGllbnRzJywKICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDcmVhdGUnLAogICAgICAgU2Ny\naXBBY3Rpb24gICAgPT4gJ05vdGlmeSBPdGhlciBSZWNpcGllbnRzJywKICAgICAgIFRlbXBsYXRl\nICAgICAgID0+ICdDb3JyZXNwb25kZW5jZSBpbiBIVE1MJyB9LAogICAgeyAgRGVzY3JpcHRpb24g\nICAgPT4gJ09uIE93bmVyIENoYW5nZSBOb3RpZnkgT3duZXInLAogICAgICAgU2NyaXBDb25kaXRp\nb24gPT4gJ09uIE93bmVyIENoYW5nZScsCiAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnTm90aWZ5\nIE93bmVyJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdUcmFuc2FjdGlvbiBpbiBIVE1MJyB9\nLAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIFJlc29sdmUgTm90aWZ5IFJlcXVlc3RvcnMn\nLAogICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIFJlc29sdmUnLAogICAgICAgU2NyaXBBY3Rp\nb24gICAgPT4gJ05vdGlmeSBSZXF1ZXN0b3JzJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdS\nZXNvbHZlZCBpbiBIVE1MJyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gIk9uIHRyYW5zYWN0\naW9uLCBhZGQgYW55IHRhZ3MgaW4gdGhlIHRyYW5zYWN0aW9uJ3Mgc3ViamVjdCB0byB0aGUgdGlj\na2V0J3Mgc3ViamVjdCIsCiAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gVHJhbnNhY3Rpb24n\nLAogICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ0V4dHJhY3QgU3ViamVjdCBUYWcnLAogICAgICAg\nVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09u\nIEZvcndhcmQgVHJhbnNhY3Rpb24gU2VuZCBmb3J3YXJkZWQgbWVzc2FnZScsCiAgICAgICBTY3Jp\ncENvbmRpdGlvbiA9PiAnT24gRm9yd2FyZCBUcmFuc2FjdGlvbicsCiAgICAgICBTY3JpcEFjdGlv\nbiAgICA9PiAnU2VuZCBGb3J3YXJkJywKICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdGb3J3YXJk\nJyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAgPT4gJ09uIEZvcndhcmQgVGlja2V0IFNlbmQgZm9y\nd2FyZGVkIG1lc3NhZ2UnLAogICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIEZvcndhcmQgVGlj\na2V0JywKICAgICAgIFNjcmlwQWN0aW9uICAgID0+ICdTZW5kIEZvcndhcmQnLAogICAgICAgVGVt\ncGxhdGUgICAgICAgPT4gJ0ZvcndhcmQgVGlja2V0JyB9LAogICAgeyAgRGVzY3JpcHRpb24gICAg\nICAgPT4gIlNldCBzdGFydHMgZGF0ZSBpZiBuZWVkZWQgYWNjb3JkaW5nIHRvIFNMQSIsCiAgICAg\nICBTY3JpcENvbmRpdGlvbiAgICA9PiAnUmVxdWlyZSBzdGFydHMgc2V0IGFjY29yZGluZyB0byBT\nTEEnLAogICAgICAgU2NyaXBBY3Rpb24gICAgICAgPT4gJ1NldCBzdGFydHMgZGF0ZSBhY2NvcmRp\nbmcgdG8gU0xBJywKICAgICAgIFRlbXBsYXRlICAgICAgICAgID0+ICdCbGFuaycgfSwKICAgIHsg\nIERlc2NyaXB0aW9uICAgICAgID0+ICJTZXQgZHVlIGRhdGUgaWYgbmVlZGVkIGFjY29yZGluZyB0\nbyBTTEEiLAogICAgICAgU2NyaXBDb25kaXRpb24gICAgPT4gJ1JlcXVpcmUgZHVlIHNldCBhY2Nv\ncmRpbmcgdG8gU0xBJywKICAgICAgIFNjcmlwQWN0aW9uICAgICAgID0+ICdTZXQgZHVlIGRhdGUg\nYWNjb3JkaW5nIHRvIFNMQScsCiAgICAgICBUZW1wbGF0ZSAgICAgICAgICA9PiAnQmxhbmsnIH0s\nCik7CgpAQUNMID0gKAogICAgeyBVc2VySWQgPT4gJ3Jvb3QnLCAgICAgICAgIyAtIHByaW5jaXBh\nbGlkCiAgICAgIFJpZ2h0ICA9PiAnU3VwZXJVc2VyJywgfSwKCiAgICB7IEdyb3VwRG9tYWluID0+\nICdTeXN0ZW1JbnRlcm5hbCcsCiAgICAgIEdyb3VwVHlwZSA9PiAncHJpdmlsZWdlZCcsCiAgICAg\nIFJpZ2h0ICA9PiAnU2hvd0FwcHJvdmFsc1RhYicsIH0sCgogICAgeyAgIEdyb3VwRG9tYWluID0+\nICdTeXN0ZW1JbnRlcm5hbCcsCiAgICAgICAgR3JvdXBUeXBlICAgPT4gJ1ByaXZpbGVnZWQnLAog\nICAgICAgIFJpZ2h0ICAgICAgID0+ICdTaG93U2VhcmNoQWR2YW5jZWQnLAogICAgfSwKICAgIHsg\nICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwnLAogICAgICAgIEdyb3VwVHlwZSAgID0+\nICdQcml2aWxlZ2VkJywKICAgICAgICBSaWdodCAgICAgICA9PiAnU2hvd1NlYXJjaEJ1bGtVcGRh\ndGUnLAogICAgfSwKICAgIHsgICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwnLAogICAg\nICAgIEdyb3VwVHlwZSAgID0+ICdQcml2aWxlZ2VkJywKICAgICAgICBSaWdodCAgICAgICA9PiAn\nU2VlU2F2ZWRTZWFyY2gnLAogICAgfSwKKTsKCiMgUHJlZGVmaW5lZCBzZWFyY2hlcwoKQFNhdmVk\nU2VhcmNoZXMgPSAoCiAgICB7IE5hbWUgPT4gJ015IFRpY2tldHMnLAogICAgICBEZXNjcmlwdGlv\nbiA9PiAnW18xXSBoaWdoZXN0IHByaW9yaXR5IHRpY2tldHMgSSBvd24nLCAjIGxvYwogICAgICBD\nb250ZW50ICAgICA9PgogICAgICB7IEZvcm1hdCA9PiAgcXsnPGEgaHJlZj0iX19XZWJQYXRoX18v\nVGlja2V0L0Rpc3BsYXkuaHRtbD9pZD1fX2lkX18iPl9faWRfXzwvYT4vVElUTEU6IycsfQogICAg\nICAgICAgICAgICAgIC4gcXsnPGEgaHJlZj0iX19XZWJQYXRoX18vVGlja2V0L0Rpc3BsYXkuaHRt\nbD9pZD1fX2lkX18iPl9fU3ViamVjdF9fPC9hPi9USVRMRTpTdWJqZWN0Jyx9CiAgICAgICAgICAg\nICAgICAgLiBxe1ByaW9yaXR5LCBRdWV1ZU5hbWUsIEV4dGVuZGVkU3RhdHVzfSwKICAgICAgICBR\ndWVyeSAgID0+ICIgT3duZXIgPSAnX19DdXJyZW50VXNlcl9fJyBBTkQgU3RhdHVzID0gJ19fQWN0\naXZlX18nIiwKICAgICAgICBPcmRlckJ5ID0+ICdQcmlvcml0eScsCiAgICAgICAgT3JkZXIgICA9\nPiAnREVTQycKICAgICAgfSwKICAgIH0sCiAgICB7IE5hbWUgPT4gJ1Vub3duZWQgVGlja2V0cycs\nCiAgICAgIERlc2NyaXB0aW9uID0+ICdbXzFdIG5ld2VzdCB1bm93bmVkIHRpY2tldHMnLCAjIGxv\nYwogICAgICBDb250ZW50ICAgICA9PgojICdUYWtlJyAjbG9jCiAgICAgIHsgRm9ybWF0ID0+ICBx\neyc8YSBocmVmPSJfX1dlYlBhdGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP2lkPV9faWRfXyI+X19p\nZF9fPC9hPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgICAgLiBxeyc8YSBocmVmPSJfX1dlYlBh\ndGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP2lkPV9faWRfXyI+X19TdWJqZWN0X188L2E+L1RJVExF\nOlN1YmplY3QnLH0KICAgICAgICAgICAgICAgICAuIHF7UXVldWVOYW1lLCBFeHRlbmRlZFN0YXR1\ncywgQ3JlYXRlZFJlbGF0aXZlLCB9CiAgICAgICAgICAgICAgICAgLiBxeyc8QSBIUkVGPSJfX1dl\nYlBhdGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP0FjdGlvbj1UYWtlJmlkPV9faWRfXyI+X19sb2Mo\nVGFrZSlfXzwvYT4vVElUTEU6TkJTUCd9LAogICAgICAgIFF1ZXJ5ICAgPT4gIiBPd25lciA9ICdO\nb2JvZHknIEFORCBTdGF0dXMgPSAnX19BY3RpdmVfXyciLAogICAgICAgIE9yZGVyQnkgPT4gJ0Ny\nZWF0ZWQnLAogICAgICAgIE9yZGVyICAgPT4gJ0RFU0MnCiAgICAgIH0sCiAgICB9LAogICAgeyBO\nYW1lID0+ICdCb29rbWFya2VkIFRpY2tldHMnLAogICAgICBEZXNjcmlwdGlvbiA9PiAnQm9va21h\ncmtlZCBUaWNrZXRzJywgI2xvYwogICAgICBDb250ZW50ICAgICA9PgogICAgICB7IEZvcm1hdCA9\nPiBxeyc8YSBocmVmPSJfX1dlYlBhdGhfXy9UaWNrZXQvRGlzcGxheS5odG1sP2lkPV9faWRfXyI+\nX19pZF9fPC9hPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgICAuIHF7JzxhIGhyZWY9Il9fV2Vi\nUGF0aF9fL1RpY2tldC9EaXNwbGF5Lmh0bWw/aWQ9X19pZF9fIj5fX1N1YmplY3RfXzwvYT4vVElU\nTEU6U3ViamVjdCcsfQogICAgICAgICAgICAgICAgLiBxe1ByaW9yaXR5LCBRdWV1ZU5hbWUsIEV4\ndGVuZGVkU3RhdHVzLCBCb29rbWFya30sCiAgICAgICAgUXVlcnkgICA9PiAiaWQgPSAnX19Cb29r\nbWFya2VkX18nIiwKICAgICAgICBPcmRlckJ5ID0+ICdMYXN0VXBkYXRlZCcsCiAgICAgICAgT3Jk\nZXIgICA9PiAnREVTQycgfSwKICAgIH0sCik7CgpAQXR0cmlidXRlcyA9ICgKIyBpbml0aWFsIHJl\ncG9ydHMKICAgIHsgTmFtZSA9PiAnUmVwb3J0c0luTWVudScsCiAgICAgIERlc2NyaXB0aW9uID0+\nICdDb250ZW50IG9mIHRoZSBSZXBvcnRzIG1lbnUnLCAjbG9jCiAgICAgIENvbnRlbnQgICAgID0+\nIFsKICAgICAgICAgIHsKICAgICAgICAgICAgICBpZCAgICAgICAgICA9PiAncmVzb2x2ZWRieW93\nbmVyJywKICAgICAgICAgICAgICB0aXRsZSAgICAgICA9PiAnUmVzb2x2ZWQgYnkgb3duZXInLCAj\nIGxvYwogICAgICAgICAgICAgIHBhdGggICAgICAgID0+ICcvUmVwb3J0cy9SZXNvbHZlZEJ5T3du\nZXIuaHRtbCcsCiAgICAgICAgICB9LAogICAgICAgICAgewogICAgICAgICAgICAgIGlkICAgICAg\nICAgID0+ICdyZXNvbHZlZGluZGF0ZXJhbmdlJywKICAgICAgICAgICAgICB0aXRsZSAgICAgICA9\nPiAnUmVzb2x2ZWQgaW4gZGF0ZSByYW5nZScsICMgbG9jCiAgICAgICAgICAgICAgcGF0aCAgICAg\nICAgPT4gJy9SZXBvcnRzL1Jlc29sdmVkQnlEYXRlcy5odG1sJywKICAgICAgICAgIH0sCiAgICAg\nICAgICB7CiAgICAgICAgICAgICAgaWQgICAgICAgICAgPT4gJ2NyZWF0ZWRpbmRhdGVyYW5nZScs\nCiAgICAgICAgICAgICAgdGl0bGUgICAgICAgPT4gJ0NyZWF0ZWQgaW4gYSBkYXRlIHJhbmdlJywg\nIyBsb2MKICAgICAgICAgICAgICBwYXRoICAgICAgICA9PiAnL1JlcG9ydHMvQ3JlYXRlZEJ5RGF0\nZXMuaHRtbCcsCiAgICAgICAgICB9LAogICAgICAgICAgewogICAgICAgICAgICAgIGlkICAgICAg\nICAgID0+ICd1c2VyX3RpbWUnLAogICAgICAgICAgICAgIHRpdGxlICAgICAgID0+ICdVc2VyIHRp\nbWUgd29ya2VkJywgIyBsb2MKICAgICAgICAgICAgICBwYXRoICAgICAgICA9PiAnL1JlcG9ydHMv\nVGltZVdvcmtlZFJlcG9ydC5odG1sJywKICAgICAgICAgIH0sCiAgICAgICAgICB7CiAgICAgICAg\nICAgICAgaWQgICAgICAgICAgPT4gJ3RpbWVfd29ya2VkX2Zyb21fc2VhcmNoJywKICAgICAgICAg\nICAgICB0aXRsZSAgICAgICA9PiAnVGltZSB3b3JrZWQgZnJvbSBzZWFyY2gnLCAjIGxvYwogICAg\nICAgICAgICAgIHBhdGggICAgICAgID0+ICcvUmVwb3J0cy9UaW1lU2VhcmNoLmh0bWwnLAogICAg\nICAgICAgfSwKICAgICAgXSwKICAgIH0sCiAgICB7CiAgICAgICAgJ05hbWUnICAgICAgICA9PiAn\nRGVmYXVsdERhc2hib2FyZCcsCiAgICAgICAgJ0Rlc2NyaXB0aW9uJyA9PiAnRGVmYXVsdCBEYXNo\nYm9hcmQnLAogICAgICAgICdDb250ZW50JyAgICAgPT4gMSwKICAgIH0sCik7CgpAQ2xhc3NlcyA9\nICgKICAgIHsKICAgICAgICBOYW1lICAgICAgICAgICAgICA9PiAnR2VuZXJhbCcsCiAgICAgICAg\nRGVzY3JpcHRpb24gICAgICAgPT4gJ1RoZSBkZWZhdWx0IGNsYXNzJywKICAgICAgICBBdHRyaWJ1\ndGVzICAgICAgICA9PiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE5hbWUgICAgPT4g\nJ1NraXAtRXNjYXBlSFRNTCcsCiAgICAgICAgICAgICAgICBDb250ZW50ID0+IDEsCiAgICAgICAg\nICAgIH0sCiAgICAgICAgXSwKICAgIH0sCik7CgpAQ3VzdG9tRmllbGRzID0gKAogICAgewogICAg\nICAgIE5hbWUgICAgICAgICAgICAgID0+ICdDb250ZW50JywKICAgICAgICBEZXNjcmlwdGlvbiAg\nICAgICA9PiAnQ29udGVudCcsCiAgICAgICAgTG9va3VwVHlwZSAgICAgICAgPT4gJ1JUOjpDbGFz\ncy1SVDo6QXJ0aWNsZScsCiAgICAgICAgVHlwZSAgICAgICAgICAgICAgPT4gJ0hUTUwnLAogICAg\nICAgIE1heFZhbHVlcyAgICAgICAgID0+IDEsCiAgICB9LAopOwoKQERhc2hib2FyZHMgPSAoCiAg\nICB7CiAgICAgICAgTmFtZSAgICAgICAgPT4gJ0hvbWVwYWdlJywKICAgICAgICBEZXNjcmlwdGlv\nbiA9PiAnSG9tZXBhZ2UnLAogICAgICAgIENvbnRlbnQgICAgID0+IHsKICAgICAgICAgICAgRWxl\nbWVudHMgPT4gWwogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIExheW91dCAg\nID0+ICdjb2wtbWQtOCxjb2wtbWQtNCcsCiAgICAgICAgICAgICAgICAgICAgRWxlbWVudHMgPT4g\nWwogICAgICAgICAgICAgICAgICAgICAgICBbCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB7\nCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBlID0+ICdzZWFyY2gn\nLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkICAgICAgICAgICA9PiAxLAogICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uICA9PiAiVGlja2V0OiBNeSBU\naWNrZXRzIiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAg\nICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBl\nID0+ICdzZWFyY2gnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkICAgICAgICAg\nICA9PiAyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uICA9PiAi\nVGlja2V0OiBVbm93bmVkIFRpY2tldHMiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgfSwK\nICAgICAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICBwb3J0bGV0X3R5cGUgPT4gJ3NlYXJjaCcsCiAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgaWQgICAgICAgICAgID0+IDMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nZGVzY3JpcHRpb24gID0+ICJUaWNrZXQ6IEJvb2ttYXJrZWQgVGlja2V0cyIsCiAgICAgICAgICAg\nICAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgewogICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRsZXRfdHlwZSA9PiAnY29tcG9uZW50JywKICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wb25lbnQgICAgPT4gJ1F1aWNrQ3JlYXRl\nJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbiAgPT4gJ1F1aWNr\nQ3JlYXRlJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXRoICAgICAgICAgPT4g\nJy9FbGVtZW50cy9RdWlja0NyZWF0ZScsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB9LAog\nICAgICAgICAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgICAgICAgICBbCiAgICAg\nICAgICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\ncG9ydGxldF90eXBlID0+ICdjb21wb25lbnQnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgIGNvbXBvbmVudCAgICA9PiAnTXlSZW1pbmRlcnMnLAogICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgIGRlc2NyaXB0aW9uICA9PiAnTXlSZW1pbmRlcnMnLAogICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgIHBhdGggICAgICAgICA9PiAnL0VsZW1lbnRzL015UmVtaW5kZXJzJywK\nICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAgICAgICAgICAg\nICB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBlID0+ICdjb21w\nb25lbnQnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBvbmVudCAgICA9PiAn\nUXVldWVMaXN0JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbiAg\nPT4gJ1F1ZXVlTGlzdCcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGF0aCAgICAg\nICAgID0+ICcvRWxlbWVudHMvUXVldWVMaXN0JywKICAgICAgICAgICAgICAgICAgICAgICAgICAg\nIH0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgcG9ydGxldF90eXBlID0+ICdjb21wb25lbnQnLAogICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgIGNvbXBvbmVudCAgICA9PiAnRGFzaGJvYXJkcycsCiAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgZGVzY3JpcHRpb24gID0+ICdEYXNoYm9hcmRzJywKICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICBwYXRoICAgICAgICAgPT4gJy9FbGVtZW50cy9EYXNoYm9h\ncmRzJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAgICAg\nICAgIF0KICAgICAgICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICAgfQogICAgICAgICAg\nICBdLAogICAgICAgIH0sCiAgICB9Cik7CgAAAAdjb250ZW50Chgvb3B0L3J0Ni9ldGMvaW5pdGlh\nbGRhdGEAAAAIZmlsZW5hbWUKJEMyNDVFMkFDLUZEMEYtMTFGMC04RkIzLURDNkVDNjIzMDhFRAAA\nAAdmdWxsX2lkCiRDMjk3MDNFRS1GRDBGLTExRjAtOEZCMy1EQzZFQzYyMzA4RUQAAAANaW5kaXZp\nZHVhbF9pZAoFNi4wLjIAAAAKcnRfdmVyc2lvbgoGYmVmb3JlAAAABXN0YWdlCWl7VVkAAAAJdGlt\nZXN0YW1wBAMAAAAFCiRDMjk3MDNFRS1GRDBGLTExRjAtOEZCMy1EQzZFQzYyMzA4RUQAAAANaW5k\naXZpZHVhbF9pZAQCAAAAAgiBChNEb25lIGluc2VydGluZyBkYXRhAAAADHJldHVybl92YWx1ZQoF\nNi4wLjIAAAAKcnRfdmVyc2lvbgoFYWZ0ZXIAAAAFc3RhZ2UJaXtVWgAAAAl0aW1lc3RhbXAAAAAC\nUlQEAgAAAAIEAwAAAAkKBmluc2VydAAAAAZhY3Rpb24BAACVbiMgSW5pdGlhbCBkYXRhIGZvciBh\nIGZyZXNoIFJUSVIgSW5zdGFsbGF0aW9uLgoKZGllICJQbGVhc2UgYWRkIFJUOjpJUiB0byB5b3Vy\nIFBsdWdpbnMgY29uZmlndXJhdGlvbiBiZWZvcmUgaW5pdGlhbGl6aW5nIHRoZSBkYXRhYmFzZS4g\nU2VlIFJFQURNRSBmb3IgbW9yZSBpbmZvcm1hdGlvbi4iCiAgICB1bmxlc3MgZ3JlcCB7ICRfIGVx\nICdSVDo6SVInIH0gUlQtPkNvbmZpZy0+R2V0KCdQbHVnaW5zJyk7CgpASW5pdGlhbCA9ICgKICAg\nIHN1YiB7CiAgICAgICAgdXNlIFJUOjpJUjsKICAgICAgICBSVDo6TGlmZWN5Y2xlLT5GaWxsQ2Fj\naGU7CiAgICAgICAgcmV0dXJuIDE7CiAgICB9LAopOwoKQFF1ZXVlcyA9IG1hcCB7CiAgICB7ICAg\nTmFtZSAgICAgICAgICAgICAgPT4gUlQ6OklSOjpGcmllbmRseUxpZmVjeWNsZSgkXyksCiAgICAg\nICAgTGlmZWN5Y2xlICAgICAgICAgPT4gJF8sCiAgICAgICAgQ29ycmVzcG9uZEFkZHJlc3MgPT4g\nIiIsCiAgICAgICAgQ29tbWVudEFkZHJlc3MgICAgPT4gIiIsCiAgICAgICAgSW5pdGlhbFByaW9y\naXR5ICAgPT4gKAogICAgICAgICAgICAkXyBlcSAnaW5jaWRlbnRzJwogICAgICAgICAgICA/IDUw\nCiAgICAgICAgICAgIDogMAogICAgICAgICksCiAgICAgICAgU0xBRGlzYWJsZWQgPT4gKCAkXyBl\ncSAnaW5jaWRlbnRzJyA/IDEgOiAwICksCiAgICB9Cn0gUlQ6OklSLT5MaWZlY3ljbGVzOwoKQEN1\nc3RvbUZpZWxkcyA9ICgKICAgIHsgICBOYW1lICAgICAgICA9PiAnUlRJUiBDb25zdGl0dWVuY3kn\nLAogICAgICAgIFR5cGUgICAgICAgID0+ICdTZWxlY3RTaW5nbGUnLAogICAgICAgIERpc2FibGVk\nICAgID0+IDAsCiAgICAgICAgUmVuZGVyVHlwZSAgPT4gJ0Ryb3Bkb3duJywKICAgICAgICBMb29r\ndXBUeXBlICA9PiAnUlQ6OlF1ZXVlJywKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnQXNzb2NpYXRl\ncyBSVElSIHF1ZXVlcyB3aXRoIGNvbnN0aXR1ZW5jaWVzJywKICAgICAgICBWYWx1ZXMgICAgICA9\nPiBbXQogICAgfSwKICAgIHsgICBOYW1lICAgICAgID0+ICdSVElSIGRlZmF1bHQgV0hPSVMgc2Vy\ndmVyJywKICAgICAgICBUeXBlICAgICAgID0+ICdGcmVlZm9ybVNpbmdsZScsCiAgICAgICAgRGlz\nYWJsZWQgICA9PiAwLAogICAgICAgIExvb2t1cFR5cGUgPT4gJ1JUOjpRdWV1ZScsCiAgICAgICAg\nRGVzY3JpcHRpb24gPT4KICAgICAgICAgICAgJ0lmIHNldCwgZGVmaW5lcyB0aGUgZGVmYXVsdCBX\nSE9JUyBzZXJ2ZXIgZm9yIGFuIFJUSVIgUXVldWUnLAogICAgICAgIEFwcGx5VG8gPT4gWyBtYXAg\neyAkXy0+e05hbWV9IH0gQFF1ZXVlcyBdCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdD\nbGFzc2lmaWNhdGlvbicsCiAgICAgICAgVHlwZSAgICAgICAgPT4gJ1NlbGVjdFNpbmdsZScsCiAg\nICAgICAgUmVuZGVyVHlwZSAgPT4gJ0Ryb3Bkb3duJywKICAgICAgICBRdWV1ZSAgICAgICA9PiAn\nSW5jaWRlbnRzJywKICAgICAgICBEaXNhYmxlZCAgICA9PiAwLAogICAgICAgIERlc2NyaXB0aW9u\nID0+ICdDbGFzc2lmaWNhdGlvbiBmb3IgSW5jaWRlbnRzIFJUSVIgcXVldWUnLAogICAgICAgIFZh\nbHVlcyAgICAgID0+IFsKICAgICAgICAgICAgeyBOYW1lID0+ICJTcGFtIiwgICAgICAgICAgICAg\nIFNvcnRPcmRlciA9PiAxIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiU3lzdGVtIENvbXByb21p\nc2UiLCBTb3J0T3JkZXIgPT4gMiB9LAogICAgICAgICAgICB7IE5hbWUgPT4gIlF1ZXJ5IiwgICAg\nICAgICAgICAgU29ydE9yZGVyID0+IDMgfSwKICAgICAgICAgICAgeyBOYW1lID0+ICJTY2FuIiwg\nICAgICAgICAgICAgIFNvcnRPcmRlciA9PiA0IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiRGVu\naWFsIG9mIFNlcnZpY2UiLCBTb3J0T3JkZXIgPT4gNSB9LAogICAgICAgICAgICB7IE5hbWUgPT4g\nIlBpcmFjeSIsICAgICAgICAgICAgU29ydE9yZGVyID0+IDYgfSwKICAgICAgICBdLAogICAgfSwK\nICAgIHsgICBOYW1lICAgICAgICA9PiAnRnVuY3Rpb24nLAogICAgICAgIFR5cGUgICAgICAgID0+\nICdTZWxlY3RTaW5nbGUnLAogICAgICAgIFJlbmRlclR5cGUgID0+ICdEcm9wZG93bicsCiAgICAg\nICAgUXVldWUgICAgICAgPT4gJ0luY2lkZW50cycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwK\nICAgICAgICBEZXNjcmlwdGlvbiA9PiAnRnVuY3Rpb24gZm9yIEluY2lkZW50cyBSVElSIHF1ZXVl\nJywKICAgICAgICBWYWx1ZXMgICAgICA9PiBbCiAgICAgICAgICAgIHsgTmFtZSA9PiAiQWJ1c2VE\nZXNrIiwgICAgIFNvcnRPcmRlciA9PiAxIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiSW5jaWRl\nbnRDb29yZCIsIFNvcnRPcmRlciA9PiAyIH0sCiAgICAgICAgXSwKICAgIH0sCiAgICB7ICAgTmFt\nZSAgICAgICAgPT4gJ1Jlc29sdXRpb24nLAogICAgICAgIFR5cGUgICAgICAgID0+ICdTZWxlY3RT\naW5nbGUnLAogICAgICAgIFJlbmRlclR5cGUgID0+ICdEcm9wZG93bicsCiAgICAgICAgUXVldWUg\nICAgICAgPT4gJ0luY2lkZW50cycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwKICAgICAgICBE\nZXNjcmlwdGlvbiA9PiAnUmVzb2x1dGlvbiBmb3IgSW5jaWRlbnRzIFJUSVIgcXVldWUnLAogICAg\nICAgIFZhbHVlcyAgICAgID0+IFsKICAgICAgICAgICAgeyBOYW1lID0+ICdzdWNjZXNzZnVsbHkg\ncmVzb2x2ZWQnLCAgICAgIFNvcnRPcmRlciA9PiAxIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAn\nbm8gcmVzb2x1dGlvbiByZWFjaGVkJywgICAgICBTb3J0T3JkZXIgPT4gMiB9LAogICAgICAgICAg\nICB7IE5hbWUgPT4gJ25vIHJlc3BvbnNlIGZyb20gY3VzdG9tZXInLCAgU29ydE9yZGVyID0+IDMg\nfSwKICAgICAgICAgICAgeyBOYW1lID0+ICdubyByZXNwb25zZSBmcm9tIG90aGVyIElTUCcsIFNv\ncnRPcmRlciA9PiA0IH0sCiAgICAgICAgXSwKICAgIH0sCiAgICB7CiAgICAgICAgTmFtZSAgICAg\nICAgPT4gJ0NWRSBJRCcsCiAgICAgICAgVHlwZSAgICAgICAgPT4gJ0ZyZWVmb3JtTXVsdGlwbGUn\nLAogICAgICAgIFF1ZXVlICAgICAgID0+IFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRz\nJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBEaXNhYmxl\nZCAgICA9PiAwLAogICAgICAgIERlc2NyaXB0aW9uID0+ICdDVkUgSUQgZm9yIFJUSVIgcXVldWVz\nJywKICAgICAgICBMaW5rVmFsdWVUbyA9PiAnaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRh\naWwvX19DdXN0b21GaWVsZF9fI3Z1bG5DdXJyZW50RGVzY3JpcHRpb25UaXRsZScsCiAgICB9LAoK\nICAgIHsgICBOYW1lICAgICAgID0+ICdIb3cgUmVwb3J0ZWQnLAogICAgICAgIFR5cGUgICAgICAg\nPT4gJ1NlbGVjdFNpbmdsZScsCiAgICAgICAgUmVuZGVyVHlwZSA9PiAnRHJvcGRvd24nLAogICAg\nICAgIFF1ZXVlICAgICAgPT4gJ0luY2lkZW50IFJlcG9ydHMnLAogICAgICAgIERpc2FibGVkICAg\nPT4gMCwKICAgICAgICBEZXNjcmlwdGlvbiA9PgogICAgICAgICAgICAnSG93IHRoZSBpbmNpZGVu\ndCB3YXMgcmVwb3J0ZWQgZm9yIEluY2lkZW50IFJlcG9ydHMgUlRJUiBxdWV1ZScsCiAgICAgICAg\nVmFsdWVzID0+IFsKICAgICAgICAgICAgeyBOYW1lID0+ICJBUEkiLCAgICAgICBTb3J0T3JkZXIg\nPT4gMSB9LAogICAgICAgICAgICB7IE5hbWUgPT4gIkNMSSIsICAgICAgIFNvcnRPcmRlciA9PiAy\nIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAiRW1haWwiLCAgICAgU29ydE9yZGVyID0+IDMgfSwK\nICAgICAgICAgICAgeyBOYW1lID0+ICJSRVNUIiwgICAgICBTb3J0T3JkZXIgPT4gNCB9LAogICAg\nICAgICAgICB7IE5hbWUgPT4gIlJFU1QyIiwgICAgIFNvcnRPcmRlciA9PiA1IH0sCiAgICAgICAg\nICAgIHsgTmFtZSA9PiAiV2ViIiwgICAgICAgU29ydE9yZGVyID0+IDYgfSwKICAgICAgICAgICAg\neyBOYW1lID0+ICJUZWxlcGhvbmUiLCBTb3J0T3JkZXIgPT4gNyB9LAogICAgICAgICAgICB7IE5h\nbWUgPT4gIk90aGVyIiwgICAgIFNvcnRPcmRlciA9PiA4IH0sCiAgICAgICAgXQogICAgfSwKICAg\nIHsgICBOYW1lICAgICAgICA9PiAnUmVwb3J0ZXIgVHlwZScsCiAgICAgICAgVHlwZSAgICAgICAg\nPT4gJ1NlbGVjdFNpbmdsZScsCiAgICAgICAgUmVuZGVyVHlwZSAgPT4gJ0Ryb3Bkb3duJywKICAg\nICAgICBRdWV1ZSAgICAgICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAgICAgRGlzYWJsZWQg\nICAgPT4gMCwKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnUmVwb3J0ZXIgdHlwZSBmb3IgSW5jaWRl\nbnQgUmVwb3J0cyBSVElSIHF1ZXVlJywKICAgICAgICBWYWx1ZXMgICAgICA9PiBbCiAgICAgICAg\nICAgIHsgTmFtZSA9PiAiY3VzdG9tZXIiLCAgICAgICAgICAgIFNvcnRPcmRlciA9PiAxIH0sCiAg\nICAgICAgICAgIHsgTmFtZSA9PiAiZXh0ZXJuYWwgaW5kaXZpZHVhbCIsIFNvcnRPcmRlciA9PiAy\nIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAib3RoZXIgSVNQIiwgICAgICAgICAgIFNvcnRPcmRl\nciA9PiAzIH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAicG9saWNlIiwgICAgICAgICAgICAgIFNv\ncnRPcmRlciA9PiA0IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAib3RoZXIgSVJUIiwgICAgICAg\nICAgIFNvcnRPcmRlciA9PiA1IH0sCiAgICAgICAgICAgIHsgTmFtZSA9PiAib3RoZXIiLCAgICAg\nICAgICAgICAgIFNvcnRPcmRlciA9PiA2IH0sCiAgICAgICAgXQogICAgfSwKICAgIHsgICBOYW1l\nID0+ICdJUCcsCiAgICAgICAgVHlwZSA9PiAnSVBBZGRyZXNzUmFuZ2VNdWx0aXBsZScsCiAgICAg\nICAgUXVldWUgPT4KICAgICAgICAgICAgWyAnSW5jaWRlbnRzJywgJ0luY2lkZW50IFJlcG9ydHMn\nLCAnSW52ZXN0aWdhdGlvbnMnLCAnQ291bnRlcm1lYXN1cmVzJyBdLAogICAgICAgIERpc2FibGVk\nICAgID0+IDAsCiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0lQIGFkZHJlc3MgZm9yIFJUSVIgcXVl\ndWVzJywKICAgICAgICBMaW5rVmFsdWVUbyA9PgogICAgICAgICAgICAnX19XZWJQYXRoX18vUlRJ\nUi9Ub29scy9Mb29rdXAuaHRtbD90eXBlPWlwJnE9X19DdXN0b21GaWVsZF9fJnRpY2tldD1fX2lk\nX18nCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdOZXRtYXNrJywKICAgICAgICBUeXBl\nICAgICAgICA9PiAnRnJlZWZvcm1TaW5nbGUnLAogICAgICAgIFF1ZXVlICAgICAgID0+ICdDb3Vu\ndGVybWVhc3VyZXMnLAogICAgICAgIERpc2FibGVkICAgID0+IDAsCiAgICAgICAgRGVzY3JpcHRp\nb24gPT4gJ05ldHdvcmsgbWFzayBmb3IgQ291bnRlcm1lYXN1cmVzJywKICAgIH0sCiAgICB7ICAg\nTmFtZSAgICAgICAgPT4gJ1BvcnQnLAogICAgICAgIFR5cGUgICAgICAgID0+ICdGcmVlZm9ybVNp\nbmdsZScsCiAgICAgICAgUXVldWUgICAgICAgPT4gJ0NvdW50ZXJtZWFzdXJlcycsCiAgICAgICAg\nRGlzYWJsZWQgICAgPT4gMCwKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnUG9ydCBmb3IgQ291bnRl\ncm1lYXN1cmVzJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1doZXJlIEJsb2NrZWQn\nLAogICAgICAgIFR5cGUgICAgICAgID0+ICdGcmVlZm9ybVNpbmdsZScsCiAgICAgICAgUXVldWUg\nICAgICAgPT4gJ0NvdW50ZXJtZWFzdXJlcycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwKICAg\nICAgICBEZXNjcmlwdGlvbiA9PiAnV2hlcmUgdGhlIGJsb2NrIGlzIHBsYWNlZCBmb3IgQ291bnRl\ncm1lYXN1cmVzJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ0N1c3RvbWVyJywKICAg\nICAgICBUeXBlICAgICAgICA9PiAnU2VsZWN0TXVsdGlwbGUnLAogICAgICAgIFF1ZXVlICAgICAg\nID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBEaXNhYmxlZCAgICA9PiAwLAogICAgICAg\nIFZhbHVlcyAgICAgID0+IFtdLAogICAgICAgIERlc2NyaXB0aW9uID0+ICdDdXN0b21lciBmb3Ig\nSW5jaWRlbnQgUmVwb3J0cyBSVElSIHF1ZXVlJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAg\nPT4gJ0N1c3RvbWVyJywKICAgICAgICBUeXBlICAgICAgICA9PiAnU2VsZWN0U2luZ2xlJywKICAg\nICAgICBSZW5kZXJUeXBlICA9PiAnRHJvcGRvd24nLAogICAgICAgIFF1ZXVlICAgICAgID0+ICdJ\nbnZlc3RpZ2F0aW9ucycsCiAgICAgICAgRGlzYWJsZWQgICAgPT4gMCwKICAgICAgICBWYWx1ZXMg\nICAgICA9PiBbXSwKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnQ3VzdG9tZXIgZm9yIEludmVzdGln\nYXRpb25zIFJUSVIgcXVldWUnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lICAgICAgICA9PiAn\nRG9tYWluJywKICAgICAgICBUeXBlICAgICAgICA9PiAnRnJlZWZvcm1NdWx0aXBsZScsCiAgICAg\nICAgUXVldWUgICAgICAgPT4gWyAnSW5jaWRlbnRzJywgJ0luY2lkZW50IFJlcG9ydHMnLCAnSW52\nZXN0aWdhdGlvbnMnLCAnQ291bnRlcm1lYXN1cmVzJyBdLAogICAgICAgIERpc2FibGVkICAgID0+\nIDAsCiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ0RvbWFpbiBmb3IgUlRJUiBxdWV1ZXMnLAogICAg\nICAgIExpbmtWYWx1ZVRvID0+CiAgICAgICAgICAgICdfX1dlYlBhdGhfXy9SVElSL1Rvb2xzL0xv\nb2t1cC5odG1sP3R5cGU9aG9zdCZxPV9fQ3VzdG9tRmllbGRfXyZ0aWNrZXQ9X19pZF9fJwogICAg\nfSwKKTsKCkBTY3JpcEFjdGlvbnMgPSAoCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgU2V0\nIEluY2lkZW50IER1ZScsICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlv\nbiA9PiAnU2V0IHRoZSBkdWUgZGF0ZSBvZiBwYXJlbnQgSW5jaWRlbnQnLCAgICAjIGxvYwogICAg\nICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX1NldER1ZUluY2lkZW50JywKICAgIH0sCiAgICB7ICAg\nTmFtZSAgICAgICAgPT4gJ1JUSVIgU2V0IEhvdyBSZXBvcnRlZCcsICAgICAgICAgICAgICAgICAg\nICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdTZXQgaG93IHRoZSBJbmNpZGVudCBS\nZXBvcnQgd2FzIHJlcG9ydGVkJywgICAgIyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9PiAnUlRJ\nUl9TZXRIb3dSZXBvcnRlZCcsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdSVElSIFJl\nc29sdmUgQ2hpbGRyZW4nLCAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNj\ncmlwdGlvbiA9PiAiUmVzb2x2ZSBhbiBJbmNpZGVudCdzIGNoaWxkcmVuIiwgICAgICAgICAgICAg\nICMgbG9jCiAgICAgICAgRXhlY01vZHVsZSAgPT4gJ1JUSVJfUmVzb2x2ZUNoaWxkcmVuJywKICAg\nIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgQ2hhbmdlIENoaWxkIE93bmVyc2hpcCcs\nICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICJDaGFuZ2Ug\ndGhlIG93bmVyc2hpcCBvZiBJbmNpZGVudCdzIGNoaWxkcmVuIiwgICAgIyBsb2MKICAgICAgICBF\neGVjTW9kdWxlICA9PiAnUlRJUl9DaGFuZ2VDaGlsZE93bmVyc2hpcCcsCiAgICB9LAogICAgeyAg\nIE5hbWUgICAgICAgID0+ICdSVElSIENoYW5nZSBQYXJlbnQgT3duZXJzaGlwJywgICAgICAgICAg\nICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnQ2hhbmdlIHRoZSBvd25lcnNo\naXAgb2YgdGhlIHBhcmVudCBJbmNpZGVudCcsICAgICMgbG9jCiAgICAgICAgRXhlY01vZHVsZSAg\nPT4gJ1JUSVJfQ2hhbmdlUGFyZW50T3duZXJzaGlwJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAg\nICAgPT4gJ1JUSVIgT3BlbiBQYXJlbnQnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj\nIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdPcGVuIHRoZSBwYXJlbnQgSW5jaWRlbnQgd2hl\nbiBhIGNoaWxkIHJlb3BlbnMnLCAgIyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9PiAnUlRJUl9P\ncGVuUGFyZW50JywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgU2V0IENvdW50\nZXJtZWFzdXJlIFN0YXR1cycsICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0\naW9uID0+ICdTZXQgdGhlIHN0YXR1cyBvZiBhIENvdW50ZXJtZWFzdXJlJywgICAgICAgICAgICAg\nIyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9PiAnUlRJUl9TZXRDb3VudGVybWVhc3VyZVN0YXR1\ncycsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgID0+ICdSVElSIFNldCBJbmNpZGVudCBSZXNv\nbHV0aW9uJywgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9PiAn\nU2V0IHRoZSBkZWZhdWx0IHJlc29sdXRpb24gb2YgYW4gSW5jaWRlbnQnLCAgICAgICMgbG9jCiAg\nICAgICAgRXhlY01vZHVsZSAgPT4gJ1JUSVJfU2V0SW5jaWRlbnRSZXNvbHV0aW9uJywKICAgIH0s\nCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgSVBzJywgICAg\nICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdTZXQgSVAgY3Vz\ndG9tIGZpZWxkIGZyb20gbWVzc2FnZSBjb250ZW50JywgICAgICAgIyBsb2MKICAgICAgICBFeGVj\nTW9kdWxlICA9PiAnUlRJUl9GaW5kSVAnLAogICAgfSwKICAgIHsgICBOYW1lICAgICAgICA9PiAn\nUlRJUiBtZXJnZSBJUHMnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAg\nICAgICAgRGVzY3JpcHRpb24gPT4gJ01lcmdlIG11bHRpcGxlIElQcyBvbiB0aWNrZXQgbWVyZ2Un\nLCAgICAgICAgICAgICAjIGxvYwogICAgICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX01lcmdlSVBz\nJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgQWN0aXZhdGUgVGlja2V0Jywg\nICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdT\nZXQgc3RhdHVzIHRvIGZpcnN0IGFjdGl2ZSBwb3NzaWJsZScsICAgICAgICAgICAgIyBsb2MKICAg\nICAgICBFeGVjTW9kdWxlICA9PiAnUlRJUl9BY3RpdmF0ZScsCiAgICB9LAogICAgeyAgIE5hbWUg\nPT4gJ1JUSVIgQ2hhbmdlIENoaWxkIENvbnN0aXR1ZW5jaWVzJywKICAgICAgICBEZXNjcmlwdGlv\nbiA9PgogICAgICAgICAgICAnTW92ZSBhbGwgdGlja2V0cyByZWxhdGVkIHRvIGFuIGluY2lkZW50\nIHRvIGEgbmV3IGNvbnN0aXR1ZW5jeScsCiAgICAgICAgRXhlY01vZHVsZSA9PiAnUlRJUl9DaGFu\nZ2VDaGlsZENvbnN0aXR1ZW5jaWVzJwogICAgfSwKICAgIHsgICBOYW1lICAgICAgICA9PiAnUlRJ\nUiBwYXJzZSBtZXNzYWdlIGZvciBEb21haW5zJywgICAgICAgICAgICAgICAgICMgbG9jCiAgICAg\nICAgRGVzY3JpcHRpb24gPT4gJ1NldCBEb21haW4gY3VzdG9tIGZpZWxkIGZyb20gbWVzc2FnZSBj\nb250ZW50JywgICAjIGxvYwogICAgICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX0ZpbmREb21haW4n\nLAogICAgfSwKICAgIHsgICBOYW1lICAgICAgICA9PiAnUlRJUiBtZXJnZSBEb21haW5zJywgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+\nICdNZXJnZSBtdWx0aXBsZSBEb21haW5zIG9uIHRpY2tldCBtZXJnZScsICAgICAgICAgICAgICMg\nbG9jCiAgICAgICAgRXhlY01vZHVsZSAgPT4gJ1JUSVJfTWVyZ2VEb21haW5zJywKICAgIH0sCiAg\nICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgQ1ZFcycsICAgICAg\nICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uID0+ICdTZXQgQ1ZFIGN1c3RvbSBm\naWVsZCBmcm9tIG1lc3NhZ2UgY29udGVudCcsICAgIyBsb2MKICAgICAgICBFeGVjTW9kdWxlICA9\nPiAnUlRJUl9GaW5kQ1ZFJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ1JUSVIgbWVy\nZ2UgQ1ZFcycsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBE\nZXNjcmlwdGlvbiA9PiAnTWVyZ2UgbXVsdGlwbGUgQ1ZFcyBvbiB0aWNrZXQgbWVyZ2UnLCAgICAg\nICAgICAgICAjIGxvYwogICAgICAgIEV4ZWNNb2R1bGUgID0+ICdSVElSX01lcmdlQ1ZFcycsCiAg\nICB9LAopOwoKQFNjcmlwQ29uZGl0aW9ucyA9ICgKCiAgICB7ICAgTmFtZSAgICAgICAgICAgICAg\nICAgPT4gJ1JUSVIgQ3VzdG9tZXIgUmVzcG9uc2UnLCAgICAgICAgICAgICAgICAjIGxvYwogICAg\nICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdEZXRlY3QgYW4gZXh0ZXJuYWwgcmVzcG9uc2Un\nLCAgICAgICAgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29ycmVz\ncG9uZCcsCiAgICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1JUSVJfQ3VzdG9tZXJSZXNw\nb25zZScsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAgICAgICAgICAgID0+ICdSVElSIFN0YWZm\nIFJlc3BvbnNlJywgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiAg\nICAgICAgICA9PiAnRGV0ZWN0IGFuIGludGVybmFsIHJlc3BvbnNlJywgICAgICAgICAgICMgbG9j\nCiAgICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0NvcnJlc3BvbmQnLAogICAgICAgIEV4\nZWNNb2R1bGUgICAgICAgICAgID0+ICdSVElSX1N0YWZmUmVzcG9uc2UnLAogICAgfSwKICAgIHsg\nICBOYW1lICAgICAgICAgICAgICAgICA9PiAnUlRJUiBDbG9zZSBUaWNrZXQnLCAgICAgICAgICAg\nICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gICAgICAgICAgPT4gJ0EgdGlja2V0\nIGlzIHJlamVjdGVkIG9yIHJlc29sdmVkJywgICAgICAjIGxvYwogICAgICAgIEFwcGxpY2FibGVU\ncmFuc1R5cGVzID0+ICdBbnknLAogICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdTdGF0\ndXNDaGFuZ2UnLAogICAgICAgIEFyZ3VtZW50ICAgICAgICAgICAgID0+ICdvbGQ6IGluaXRpYWws\nIGFjdGl2ZTsgbmV3OiBpbmFjdHZlJywKICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgICAgICAg\nICAgPT4gJ1JUSVIgUmVvcGVuIFRpY2tldCcsICAgICAgICAgICAgICAgICAgICAjIGxvYwogICAg\nICAgIERlc2NyaXB0aW9uICAgICAgICAgID0+ICdBIGNsb3NlZCB0aWNrZXQgaXMgcmVvcGVuZWQn\nLCAgICAgICAgICAgIyBsb2MKICAgICAgICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQW55JywK\nICAgICAgICBFeGVjTW9kdWxlICAgICAgICAgICA9PiAnU3RhdHVzQ2hhbmdlJywKICAgICAgICBB\ncmd1bWVudCAgICAgICAgICAgICA9PiAnb2xkOiBpbmFjdGl2ZTsgbmV3OiBpbml0aWFsLCBhY3Rp\ndmUnLAogICAgfSwKICAgIHsgICBOYW1lID0+ICdSVElSIFJlcXVpcmUgRHVlIENoYW5nZScsICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgRGVzY3JpcHRpb24gPT4K\nICAgICAgICAgICAgJ1RoZSBkdWUgZGF0ZSBvZiB0aGUgcGFyZW50IGluY2lkZW50IG11c3QgYmUg\nY2hhbmdlZCcsICAgICAgICMgbG9jCiAgICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4gJ0Fu\neScsCiAgICAgICAgRXhlY01vZHVsZSAgICAgICAgICAgPT4gJ1JUSVJfUmVxdWlyZUR1ZUNoYW5n\nZScsCiAgICB9LAogICAgeyAgIE5hbWUgPT4gJ1JUSVIgTGlua2luZyBUbyBJbmNpZGVudCcsICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBsb2MKICAgICAgICBEZXNjcmlwdGlvbiA9Pgog\nICAgICAgICAgICAnV2hlbmV2ZXIgdGlja2V0IGlzIGxpbmtlZCB0byBpbmNpZGVudCBvciBjcmVh\ndGVkIHdpdGggbGluaycKICAgICAgICAsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg\nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgbG9jCiAgICAgICAgQXBwbGljYWJsZVRy\nYW5zVHlwZXMgPT4gJ0NyZWF0ZSxBZGRMaW5rJywKICAgICAgICBFeGVjTW9kdWxlICAgICAgICAg\nICA9PiAnUlRJUl9MaW5raW5nVG9JbmNpZGVudCcsCiAgICB9LAogICAgeyAgIE5hbWUgICAgICAg\nID0+ICdSVElSIE1lcmdlJywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBs\nb2MKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnV2hlbmV2ZXIgdGlja2V0IGlzIG1lcmdlZCBpbnRv\nIGFub3RoZXIgb25lJywgICAgICMgbG9jCiAgICAgICAgQXBwbGljYWJsZVRyYW5zVHlwZXMgPT4g\nJ0FkZExpbmsnLAogICAgICAgIEV4ZWNNb2R1bGUgICAgICAgICAgID0+ICdSVElSX01lcmdlJywK\nICAgIH0sCiAgICB7ICAgTmFtZSAgICAgICAgICAgICAgICAgPT4gJ1JUSVIgUmVxdWlyZSBJUnMg\nQWN0aXZhdGlvbicsICAgICAgICAgICAjIGxvYwogICAgICAgIERlc2NyaXB0aW9uICAgICAgICAg\nID0+ICJXaGVuZXZlciBpdCdzIHRpbWUgdG8gYWN0aXZhdGUgcmVwb3J0IiwgIyBsb2MKICAgICAg\nICBBcHBsaWNhYmxlVHJhbnNUeXBlcyA9PiAnQ29ycmVzcG9uZCcsCiAgICAgICAgRXhlY01vZHVs\nZSAgICAgICAgICAgPT4gJ1JUSVJfUmVxdWlyZVJlcG9ydEFjdGl2YXRpb24nLAogICAgfSwKKTsK\nCkBTY3JpcHMgPSAoCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIlNldEhvd1JlcG9ydGVkIiwK\nICAgICAgICBRdWV1ZSAgICAgICAgICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAgICAgU2Ny\naXBDb25kaXRpb24gPT4gJ09uIENyZWF0ZScsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JU\nSVIgU2V0IEhvdyBSZXBvcnRlZCcsCiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJwog\nICAgfSwKCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIk9uIENvcnJlc3BvbmQgQ2hhbmdlIFN0\nYXR1cyBvZiB0aGUgQ291bnRlcm1lYXN1cmUiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdD\nb3VudGVybWVhc3VyZXMnLAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBDb3JyZXNwb25k\nJywKICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnUlRJUiBTZXQgQ291bnRlcm1lYXN1cmUgU3Rh\ndHVzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnLAogICAgfSwKICAgIHsgICBE\nZXNjcmlwdGlvbiAgICA9PiAiT24gTGlua2luZyBUbyBJbmNpZGVudCBBY3RpdmF0ZSBSZXBvcnQi\nLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBT\nY3JpcENvbmRpdGlvbiA9PiAnUlRJUiBMaW5raW5nIFRvIEluY2lkZW50JywKICAgICAgICBTY3Jp\ncEFjdGlvbiAgICA9PiAnUlRJUiBBY3RpdmF0ZSBUaWNrZXQnLAogICAgICAgIFRlbXBsYXRlICAg\nICAgID0+ICdCbGFuaycKICAgIH0sCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIk9uIENvcnJl\nc3BvbmQgKG5vdCBldmVyeSkgQWN0aXZhdGUgUmVwb3J0IiwKICAgICAgICBRdWV1ZSAgICAgICAg\nICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ1JUSVIg\nUmVxdWlyZSBJUnMgQWN0aXZhdGlvbicsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIg\nQWN0aXZhdGUgVGlja2V0JywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9\nLAogICAgeyAgIERlc2NyaXB0aW9uICAgID0+ICJPbiBMaW5raW5nIFRvIEluY2lkZW50IENvcHkg\nSVBzIiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiAnSW5jaWRlbnQgUmVwb3J0cycsCiAgICAg\nICAgU2NyaXBDb25kaXRpb24gPT4gJ1JUSVIgTGlua2luZyBUbyBJbmNpZGVudCcsCiAgICAgICAg\nU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVyZ2UgSVBzJywKICAgICAgICBUZW1wbGF0ZSAgICAg\nICA9PiAnQmxhbmsnCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0IER1ZSBE\nYXRlIE9uIEluY2lkZW50IiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiBbICdJbmNpZGVudCBS\nZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBT\nY3JpcENvbmRpdGlvbiA9PiAnUlRJUiBSZXF1aXJlIER1ZSBDaGFuZ2UnLAogICAgICAgIFNjcmlw\nQWN0aW9uICAgID0+ICdSVElSIFNldCBJbmNpZGVudCBEdWUnLAogICAgICAgIFRlbXBsYXRlICAg\nICAgID0+ICdCbGFuaycsCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAiUmVzb2x2\nZUFsbENoaWxkcmVuIiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiAnSW5jaWRlbnRzJywKICAg\nICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gU3RhdHVzIENoYW5nZScsCiAgICAgICAgU2NyaXBB\nY3Rpb24gICAgPT4gJ1JUSVIgUmVzb2x2ZSBDaGlsZHJlbicsCiAgICAgICAgVGVtcGxhdGUgICAg\nICAgPT4gJ0JsYW5rJywKICAgIH0sCgogICAgeyAgIERlc2NyaXB0aW9uICAgID0+ICJQcm9wYWdh\ndGUgQ29uc3RpdHVlbmN5IENoYW5nZXMiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJbmNp\nZGVudHMnLAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBRdWV1ZSBDaGFuZ2UnLAogICAg\nICAgIFNjcmlwQWN0aW9uICAgID0+ICdSVElSIENoYW5nZSBDaGlsZCBDb25zdGl0dWVuY2llcycs\nCiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJywKICAgIH0sCgogICAgeyAgIERlc2Ny\naXB0aW9uICAgID0+ICJGaXhPd25lcnNoaXAiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJ\nbmNpZGVudHMnLAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBPd25lciBDaGFuZ2UnLAog\nICAgICAgIFNjcmlwQWN0aW9uICAgID0+ICdSVElSIENoYW5nZSBDaGlsZCBPd25lcnNoaXAnLAog\nICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdCbGFuaycsCiAgICB9LAogICAgeyAgIERlc2NyaXB0\naW9uICAgID0+ICJGaXhPd25lcnNoaXAiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0lu\nY2lkZW50IFJlcG9ydHMnLCAnSW52ZXN0aWdhdGlvbnMnLCAnQ291bnRlcm1lYXN1cmVzJyBdLAog\nICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdPbiBPd25lciBDaGFuZ2UnLAogICAgICAgIFNjcmlw\nQWN0aW9uICAgID0+ICdSVElSIENoYW5nZSBQYXJlbnQgT3duZXJzaGlwJywKICAgICAgICBUZW1w\nbGF0ZSAgICAgICA9PiAnQmxhbmsnLAogICAgfSwKCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4g\nIlJlb3BlbkluY2lkZW50IiwKICAgICAgICBRdWV1ZSAgICAgICAgICA9PiBbICdJbmNpZGVudCBS\nZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBT\nY3JpcENvbmRpdGlvbiA9PiAnT24gU3RhdHVzIENoYW5nZScsCiAgICAgICAgU2NyaXBBY3Rpb24g\nICAgPT4gJ1JUSVIgT3BlbiBQYXJlbnQnLAogICAgICAgIFRlbXBsYXRlICAgICAgID0+ICdCbGFu\naycsCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0RGVmYXVsdEluY2lkZW50\nUmVzb2x1dGlvbiIsCiAgICAgICAgUXVldWUgICAgICAgICAgPT4gJ0luY2lkZW50cycsCiAgICAg\nICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIFN0YXR1cyBDaGFuZ2UnLAogICAgICAgIFNjcmlwQWN0\naW9uICAgID0+ICdSVElSIFNldCBJbmNpZGVudCBSZXNvbHV0aW9uJywKICAgICAgICBUZW1wbGF0\nZSAgICAgICA9PiAnQmxhbmsnLAogICAgfSwKCiAgICB7ICAgRGVzY3JpcHRpb24gICAgPT4gIk5v\ndGlmeU9uQ2xvc2UiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdDb3VudGVybWVhc3VyZXMn\nLAogICAgICAgIFNjcmlwQ29uZGl0aW9uID0+ICdSVElSIENsb3NlIFRpY2tldCcsCiAgICAgICAg\nU2NyaXBBY3Rpb24gICAgPT4gJ05vdGlmeSBSZXF1ZXN0b3JzJywKICAgICAgICBUZW1wbGF0ZSAg\nICAgICA9PiAnQ291bnRlcm1lYXN1cmVSZW1vdmVkJwogICAgfSwKCiAgICB7ICAgRGVzY3JpcHRp\nb24gPT4gIlNldElQRnJvbUNvbnRlbnQiLAogICAgICAgIFF1ZXVlID0+CiAgICAgICAgICAgIFsg\nJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50\nZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ29ycmVzcG9uZCcs\nCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgSVBzJywK\nICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAogICAgeyAgIERlc2NyaXB0\naW9uID0+ICJTZXRJUEZyb21Db250ZW50IiwKICAgICAgICBRdWV1ZSA9PgogICAgICAgICAgICBb\nICdJbmNpZGVudHMnLCAnSW5jaWRlbnQgUmVwb3J0cycsICdJbnZlc3RpZ2F0aW9ucycsICdDb3Vu\ndGVybWVhc3VyZXMnIF0sCiAgICAgICAgU2NyaXBDb25kaXRpb24gPT4gJ09uIENyZWF0ZScsCiAg\nICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgSVBzJywKICAg\nICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAoKICAgIHsgICBEZXNjcmlwdGlv\nbiA9PiAiTWVyZ2VJUHMiLAogICAgICAgIFF1ZXVlID0+CiAgICAgICAgICAgIFsgJ0luY2lkZW50\ncycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJl\ncycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnUlRJUiBNZXJnZScsCiAgICAgICAgU2Ny\naXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVyZ2UgSVBzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9\nPiAnQmxhbmsnCiAgICB9LAoKICAgIHsKICAgICAgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0RG9t\nYWluRnJvbUNvbnRlbnQiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0luY2lkZW50cycs\nICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycg\nXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ29ycmVzcG9uZCcsCiAgICAgICAgU2Ny\naXBBY3Rpb24gICAgPT4gJ1JUSVIgcGFyc2UgbWVzc2FnZSBmb3IgRG9tYWlucycsCiAgICAgICAg\nVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJwogICAgfSwKICAgIHsKICAgICAgICBEZXNjcmlwdGlv\nbiAgICA9PiAiU2V0RG9tYWluRnJvbUNvbnRlbnQiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+\nIFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0Nv\ndW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnT24gQ3JlYXRlJywK\nICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnUlRJUiBwYXJzZSBtZXNzYWdlIGZvciBEb21haW5z\nJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAogICAgeyAgIERlc2Ny\naXB0aW9uID0+ICJNZXJnZURvbWFpbnMiLAogICAgICAgIFF1ZXVlID0+CiAgICAgICAgICAgIFsg\nJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50\nZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnUlRJUiBNZXJnZScsCiAg\nICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVyZ2UgRG9tYWlucycsCiAgICAgICAgVGVt\ncGxhdGUgICAgICAgPT4gJ0JsYW5rJwogICAgfSwKICAgIHsgICBEZXNjcmlwdGlvbiAgICA9PiAi\nT24gTGlua2luZyBUbyBJbmNpZGVudCBDb3B5IERvbWFpbnMiLAogICAgICAgIFF1ZXVlICAgICAg\nICAgID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBTY3JpcENvbmRpdGlvbiA9PiAnUlRJ\nUiBMaW5raW5nIFRvIEluY2lkZW50JywKICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAnUlRJUiBt\nZXJnZSBEb21haW5zJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAnQmxhbmsnCiAgICB9LAoK\nICAgIHsKICAgICAgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0Q1ZFRnJvbUNvbnRlbnQiLAogICAg\nICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywg\nJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRp\ndGlvbiA9PiAnT24gQ29ycmVzcG9uZCcsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIg\ncGFyc2UgbWVzc2FnZSBmb3IgQ1ZFcycsCiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5r\nJwogICAgfSwKICAgIHsKICAgICAgICBEZXNjcmlwdGlvbiAgICA9PiAiU2V0Q1ZFRnJvbUNvbnRl\nbnQiLAogICAgICAgIFF1ZXVlICAgICAgICAgID0+IFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBS\nZXBvcnRzJywgJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBT\nY3JpcENvbmRpdGlvbiA9PiAnT24gQ3JlYXRlJywKICAgICAgICBTY3JpcEFjdGlvbiAgICA9PiAn\nUlRJUiBwYXJzZSBtZXNzYWdlIGZvciBDVkVzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAn\nQmxhbmsnCiAgICB9LAogICAgeyAgIERlc2NyaXB0aW9uID0+ICJNZXJnZUNWRXMiLAogICAgICAg\nIFF1ZXVlID0+CiAgICAgICAgICAgIFsgJ0luY2lkZW50cycsICdJbmNpZGVudCBSZXBvcnRzJywg\nJ0ludmVzdGlnYXRpb25zJywgJ0NvdW50ZXJtZWFzdXJlcycgXSwKICAgICAgICBTY3JpcENvbmRp\ndGlvbiA9PiAnUlRJUiBNZXJnZScsCiAgICAgICAgU2NyaXBBY3Rpb24gICAgPT4gJ1JUSVIgbWVy\nZ2UgQ1ZFcycsCiAgICAgICAgVGVtcGxhdGUgICAgICAgPT4gJ0JsYW5rJwogICAgfSwKICAgIHsg\nICBEZXNjcmlwdGlvbiAgICA9PiAiT24gTGlua2luZyBUbyBJbmNpZGVudCBDb3B5IENWRXMiLAog\nICAgICAgIFF1ZXVlICAgICAgICAgID0+ICdJbmNpZGVudCBSZXBvcnRzJywKICAgICAgICBTY3Jp\ncENvbmRpdGlvbiA9PiAnUlRJUiBMaW5raW5nIFRvIEluY2lkZW50JywKICAgICAgICBTY3JpcEFj\ndGlvbiAgICA9PiAnUlRJUiBtZXJnZSBDVkVzJywKICAgICAgICBUZW1wbGF0ZSAgICAgICA9PiAn\nQmxhbmsnCiAgICB9LAopOwoKIyBXQVJOSU5HOiBJZiB5b3UgY2hhbmdlIGNvbnRlbnQgb2YgdGhl\nIHRlbXBsYXRlcywgZG9uJ3QgZm9yZ2V0IHRvCiMgbWVudGlvbiBpdCBpbiB0aGUgVVBHUkFESU5H\nIGZpbGUKCkBUZW1wbGF0ZXMgPSAoCiAgICB7ICAgUXVldWUgICAgICAgPT4gJ0NvdW50ZXJtZWFz\ndXJlcycsCiAgICAgICAgTmFtZSAgICAgICAgPT4gJ0F1dG9yZXBseScsCiAgICAgICAgRGVzY3Jp\ncHRpb24gPT4gJ1NlbnQgd2hlbiBhIGNvdW50ZXJtZWFzdXJlIGlzIGNyZWF0ZWQnLAogICAgICAg\nIENvbnRlbnQgICAgID0+ICdSVC1BdHRhY2gtTWVzc2FnZTogeWVzClN1YmplY3Q6IHsgJFRpY2tl\ndC0+U3ViamVjdCB9Cgp7ICRUcmFuc2FjdGlvbi0+Q29udGVudCB9Cgp7IG15ICRvdXRwdXQgPSAi\nIjsKICBteSBAbWFpbGZpZWxkcyA9ICggIklQIiwgIk5ldG1hc2siLCAiUG9ydCIsICJXaGVyZSBC\nbG9ja2VkIiApOwoKICBteSAkQ3VzdG9tRmllbGRzID0gJFRpY2tldC0+UXVldWVPYmotPlRpY2tl\ndEN1c3RvbUZpZWxkczsKICB3aGlsZSAoIG15ICRDdXN0b21GaWVsZCA9ICRDdXN0b21GaWVsZHMt\nPk5leHQgKSB7CiAgICBteSAkbmFtZSA9ICRDdXN0b21GaWVsZC0+TmFtZTsKICAgIG5leHQgdW5s\nZXNzIGdyZXAgbGMgJF8gZXEgbGMgJG5hbWUsIEBtYWlsZmllbGRzOwoKICAgIG15ICRWYWx1ZXMg\nPSAkVGlja2V0LT5DdXN0b21GaWVsZFZhbHVlcyggJEN1c3RvbUZpZWxkLT5JZCApOwogICAgd2hp\nbGUgKCBteSAkVmFsdWUgPSAkVmFsdWVzLT5OZXh0ICkgewogICAgICAkb3V0cHV0IC49ICRuYW1l\nIC4iOiAiLiAkVmFsdWUtPkNvbnRlbnQgLiJcbiI7CiAgICB9CiAgfQogIHJldHVybiAkb3V0cHV0\nOwp9Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t\nLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGxlYXNlIGluY2x1ZGUgdGhlIHN0cmluZzoKCiAgICAgICAg\nIFt7ICRUaWNrZXQtPlN1YmplY3RUYWcgfSAjeyAkVGlja2V0LT5pZCB9XQoKaW4gdGhlIHN1Ympl\nY3QgbGluZSBvZiBhbGwgZnV0dXJlIGNvcnJlc3BvbmRlbmNlIGFib3V0IHRoaXMgaXNzdWUuIFRv\nIGRvIHNvLCAKeW91IG1heSByZXBseSB0byB0aGlzIG1lc3NhZ2UuCgogICAgICAgICAgICAgICAg\nICAgICAgICBUaGFuayB5b3UsCiAgICAgICAgICAgICAgICAgICAgICAgIHsgJFRpY2tldC0+UXVl\ndWVPYmotPkNvcnJlc3BvbmRBZGRyZXNzIH0nLAogICAgfSwKICAgIHsgICBRdWV1ZSAgICAgICA9\nPiAnQ291bnRlcm1lYXN1cmVzJywKICAgICAgICBOYW1lICAgICAgICA9PiAnQ291bnRlcm1lYXN1\ncmVSZW1vdmVkJywKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnU2VudCB3aGVuIGEgY291bnRlcm1l\nYXN1cmUgaXMgcmVtb3ZlZCcsCiAgICAgICAgQ29udGVudCAgICAgPT4gJ1N1YmplY3Q6IHskVGlj\na2V0LT5TdWJqZWN0fQoKQ291bnRlcm1lYXN1cmUgI3skVGlja2V0LT5pZH0gd2FzIHJlbW92ZWQu\nCgp7IG15ICRvdXRwdXQgPSAiIjsKICBteSBAbWFpbGZpZWxkcyA9ICggIklQIiwgIk5ldG1hc2si\nLCAiUG9ydCIsICJXaGVyZSBCbG9ja2VkIiApOwoKICBteSAkQ3VzdG9tRmllbGRzID0gJFRpY2tl\ndC0+UXVldWVPYmotPlRpY2tldEN1c3RvbUZpZWxkczsKICB3aGlsZSAoIG15ICRDdXN0b21GaWVs\nZCA9ICRDdXN0b21GaWVsZHMtPk5leHQgKSB7CiAgICBteSAkbmFtZSA9ICRDdXN0b21GaWVsZC0+\nTmFtZTsKICAgIG5leHQgdW5sZXNzIGdyZXAgbGMgJF8gZXEgbGMgJG5hbWUsIEBtYWlsZmllbGRz\nOwoKICAgIG15ICRWYWx1ZXMgPSAkVGlja2V0LT5DdXN0b21GaWVsZFZhbHVlcyggJEN1c3RvbUZp\nZWxkLT5JZCApOwogICAgd2hpbGUgKCBteSAkVmFsdWUgPSAkVmFsdWVzLT5OZXh0ICkgewogICAg\nICAkb3V0cHV0IC49ICRuYW1lIC4iOiAiLiAkVmFsdWUtPkNvbnRlbnQgLiJcbiI7CiAgICB9CiAg\nfQogIHJldHVybiAkb3V0cHV0Owp9Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t\nLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUGxlYXNlIGluY2x1ZGUgdGhl\nIHN0cmluZzoKCiAgICAgICAgIFt7ICRUaWNrZXQtPlN1YmplY3RUYWcgfSAjeyRUaWNrZXQtPmlk\nfV0KCmluIHRoZSBzdWJqZWN0IGxpbmUgb2YgYWxsIGZ1dHVyZSBjb3JyZXNwb25kZW5jZSBhYm91\ndCB0aGlzIGlzc3VlLiBUbyBkbyBzbywgCnlvdSBtYXkgcmVwbHkgdG8gdGhpcyBtZXNzYWdlLgoK\nICAgICAgICAgICAgICAgICAgICAgICAgVGhhbmsgeW91LAogICAgICAgICAgICAgICAgICAgICAg\nICB7JFRpY2tldC0+UXVldWVPYmotPkNvcnJlc3BvbmRBZGRyZXNzKCl9JywKICAgIH0sCiAgICB7\nICAgUXVldWUgICAgICAgPT4gJ0ludmVzdGlnYXRpb25zJywKICAgICAgICBOYW1lICAgICAgICA9\nPiAnQXV0b3JlcGx5JywKICAgICAgICBEZXNjcmlwdGlvbiA9PiAnU2VudCB3aGVuIGFuIGludmVz\ndGlnYXRpb24gaXMgbGF1bmNoZWQnLAogICAgICAgIENvbnRlbnQgICAgID0+ICdSVC1BdHRhY2gt\nTWVzc2FnZTogeWVzClN1YmplY3Q6IHskVGlja2V0LT5TdWJqZWN0fQoKeyRUcmFuc2FjdGlvbi0+\nQ29udGVudCgpfQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t\nLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQbGVhc2UgaW5jbHVkZSB0aGUgc3RyaW5nOgoK\nICAgICAgICAgW3sgJFRpY2tldC0+U3ViamVjdFRhZyB9ICN7JFRpY2tldC0+aWR9XQoKaW4gdGhl\nIHN1YmplY3QgbGluZSBvZiBhbGwgZnV0dXJlIGNvcnJlc3BvbmRlbmNlIGFib3V0IHRoaXMgaXNz\ndWUuIFRvIGRvIHNvLCAKeW91IG1heSByZXBseSB0byB0aGlzIG1lc3NhZ2UuCgogICAgICAgICAg\nICAgICAgICAgICAgICBUaGFuayB5b3UsCiAgICAgICAgICAgICAgICAgICAgICAgIHskVGlja2V0\nLT5RdWV1ZU9iai0+Q29ycmVzcG9uZEFkZHJlc3MoKX0nLAogICAgfSwKKTsKCkBHcm91cHMgPSAo\nCiAgICB7ICAgTmFtZSAgICAgICAgPT4gJ0R1dHlUZWFtJywKICAgICAgICBEb21haW4gICAgICA9\nPiAnVXNlckRlZmluZWQnLAogICAgICAgIEluc3RhbmNlICAgID0+ICcnLAogICAgICAgIERlc2Ny\naXB0aW9uID0+ICdEdXR5IFRlYW0gTWVtYmVycycsICAgICMgbG9jCiAgICB9LAopOwoKQEFDTCA9\nICgpOwpmb3IgbXkgJHF1ZXVlICggbWFwIHsgJF8tPntOYW1lfSB9IEBRdWV1ZXMgKSB7CiAgICBm\nb3JlYWNoIG15ICRyaWdodCAoIFJUOjpJUi0+T3duZXJBbGxRdWV1ZVJpZ2h0cyApIHsKICAgICAg\nICBwdXNoIEBBQ0wsCiAgICAgICAgICAgICgKICAgICAgICAgICAgeyAgIEdyb3VwRG9tYWluID0+\nICdSVDo6UXVldWUtUm9sZScsCiAgICAgICAgICAgICAgICBHcm91cFR5cGUgICA9PiAnT3duZXIn\nLAogICAgICAgICAgICAgICAgUXVldWUgICAgICAgPT4gJHF1ZXVlLAogICAgICAgICAgICAgICAg\nUmlnaHQgICAgICAgPT4gJHJpZ2h0CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICk7CiAgICB9\nCn0KCmZvciBteSAkcXVldWUgKCBtYXAgeyAkXy0+e05hbWV9IH0gQFF1ZXVlcyApIHsKICAgIGZv\ncmVhY2ggbXkgJHJpZ2h0ICggUlQ6OklSLT5EdXR5VGVhbUFsbFF1ZXVlUmlnaHRzICkgewogICAg\nICAgIHB1c2ggQEFDTCwgewogICAgICAgICAgICBHcm91cElkICAgICA9PiAnRHV0eVRlYW0nLCAg\nICAgICMgLSBwcmluY2lwYWxJZAogICAgICAgICAgICBHcm91cERvbWFpbiA9PiAnVXNlckRlZmlu\nZWQnLAogICAgICAgICAgICBRdWV1ZSAgICAgICA9PiAkcXVldWUsCiAgICAgICAgICAgIFJpZ2h0\nICAgICAgID0+ICRyaWdodAogICAgICAgICAgICB9LAoKICAgIH0KfQoKcHVzaCBAQUNMLCBtYXAg\newogICAgeyAgIFF1ZXVlICAgICAgID0+ICdJbnZlc3RpZ2F0aW9ucycsCiAgICAgICAgR3JvdXBU\neXBlICAgPT4gJ0V2ZXJ5b25lJywKICAgICAgICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJu\nYWwnLAoKICAgICAgICBSaWdodCA9PiAkXwogICAgfQp9IFJUOjpJUi0+RXZlcnlvbmVJbnZlc3Rp\nZ2F0aW9uUmlnaHRzKCk7CgpwdXNoIEBBQ0wsIG1hcCB7CiAgICB7ICAgUXVldWUgICAgICAgPT4g\nJ0luY2lkZW50cycsCiAgICAgICAgR3JvdXBUeXBlICAgPT4gJ0V2ZXJ5b25lJywKICAgICAgICBH\ncm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwnLAoKICAgICAgICBSaWdodCA9PiAkXwogICAg\nfQp9IFJUOjpJUi0+RXZlcnlvbmVJbmNpZGVudFJpZ2h0cygpOwoKcHVzaCBAQUNMLCBtYXAgewoK\nICAgIHsgICBHcm91cFR5cGUgICA9PiAnRXZlcnlvbmUnLAogICAgICAgIEdyb3VwRG9tYWluID0+\nICdTeXN0ZW1JbnRlcm5hbCcsCiAgICAgICAgUXVldWUgICAgICAgPT4gJ0luY2lkZW50IFJlcG9y\ndHMnLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICRfCiAgICB9Cn0gUlQ6OklSLT5FdmVyeW9uZUlu\nY2lkZW50UmVwb3J0UmlnaHRzKCk7CgpwdXNoIEBBQ0wsIG1hcCB7CiAgICB7ICAgR3JvdXBUeXBl\nICAgPT4gJ0V2ZXJ5b25lJywKICAgICAgICBHcm91cERvbWFpbiA9PiAnU3lzdGVtSW50ZXJuYWwn\nLAogICAgICAgIFF1ZXVlICAgICAgID0+ICdDb3VudGVybWVhc3VyZXMnLAogICAgICAgIFJpZ2h0\nICAgICAgID0+ICRfCiAgICB9Cn0gUlQ6OklSLT5FdmVyeW9uZUNvdW50ZXJtZWFzdXJlUmlnaHRz\nKCk7CgpwdXNoIEBBQ0wsICgKICAgIHsgICBHcm91cElkICAgICA9PiAnRHV0eVRlYW0nLCAgICAg\nICMgLSBwcmluY2lwYWxJZAogICAgICAgIEdyb3VwRG9tYWluID0+ICdVc2VyRGVmaW5lZCcsCiAg\nICAgICAgUXVldWUgICAgICAgPT4gMCwKICAgICAgICBSaWdodCAgICAgICA9PiAnTW9kaWZ5U2Vs\nZicsCiAgICB9LAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAg\nIyAtIHByaW5jaXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAg\nICAgICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdTZWVPd25TYXZl\nZFNlYXJjaCcsCiAgICB9LAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAg\nICAgICAgIyAtIHByaW5jaXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVk\nJywKICAgICAgICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1p\nbk93blNhdmVkU2VhcmNoJywKICAgIH0sCiAgICB7ICAgR3JvdXBJZCAgICAgPT4gJ0R1dHlUZWFt\nJywgICAgICAgICAgICAjIC0gcHJpbmNpcGFsSWQKICAgICAgICBHcm91cERvbWFpbiA9PiAnVXNl\nckRlZmluZWQnLAogICAgICAgIFF1ZXVlICAgICAgID0+IDAsCiAgICAgICAgUmlnaHQgICAgICAg\nPT4gJ1NlZUdyb3VwU2F2ZWRTZWFyY2gnLAogICAgfSwKICAgIHsgICBHcm91cElkICAgICA9PiAn\nRHV0eVRlYW0nLCAgICAgICAgICAgICMgLSBwcmluY2lwYWxJZAogICAgICAgIEdyb3VwRG9tYWlu\nID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAgUXVldWUgICAgICAgPT4gMCwKICAgICAgICBSaWdo\ndCAgICAgICA9PiAnQWRtaW5Hcm91cFNhdmVkU2VhcmNoJywKICAgIH0sCiAgICB7ICAgR3JvdXBJ\nZCAgICAgPT4gJ0R1dHlUZWFtJywgICAgICAgICAgICAjIC0gcHJpbmNpcGFsSWQKICAgICAgICBH\ncm91cERvbWFpbiA9PiAnVXNlckRlZmluZWQnLAogICAgICAgIFF1ZXVlICAgICAgID0+IDAsCiAg\nICAgICAgUmlnaHQgICAgICAgPT4gJ1NlZU93bkRhc2hib2FyZCcsCiAgICB9LAogICAgeyAgIEdy\nb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAgIyAtIHByaW5jaXBhbElkCiAgICAg\nICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICBRdWV1ZSAgICAgICA9PiAw\nLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1pbk93bkRhc2hib2FyZCcsCiAgICB9LAogICAg\neyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAgIyAtIHByaW5jaXBhbElk\nCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICBRdWV1ZSAgICAg\nICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdTZWVHcm91cERhc2hib2FyZCcsCiAgICB9\nLAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAgICAgIyAtIHByaW5j\naXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICBRdWV1\nZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1pbkdyb3VwRGFzaGJvYXJk\nJywKICAgIH0sCiAgICB7ICAgR3JvdXBJZCAgICAgPT4gJ0R1dHlUZWFtJywgICAgICAgICAgICAj\nIC0gcHJpbmNpcGFsSWQKICAgICAgICBHcm91cERvbWFpbiA9PiAnVXNlckRlZmluZWQnLAogICAg\nICAgIFF1ZXVlICAgICAgID0+IDAsCiAgICAgICAgUmlnaHQgICAgICAgPT4gJ0xvYWRTYXZlZFNl\nYXJjaCcsCiAgICB9LAogICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5VGVhbScsICAgICAgICAg\nICAgIyAtIHByaW5jaXBhbElkCiAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywK\nICAgICAgICBRdWV1ZSAgICAgICA9PiAwLAogICAgICAgIFJpZ2h0ICAgICAgID0+ICdBZG1pblNh\ndmVkU2VhcmNoJywKICAgIH0sCik7CgojIFByZWRlZmluZWQgc2VhcmNoZXMKCkBTYXZlZFNlYXJj\naGVzID0gKAogICAgeyBOYW1lID0+ICdOZXcgdW5saW5rZWQgSW5jaWRlbnQgUmVwb3J0cycsCiAg\nICAgIERlc2NyaXB0aW9uID0+ICdOZXcgdW5saW5rZWQgSW5jaWRlbnQgUmVwb3J0cycsICMgbG9j\nCiAgICAgIENvbnRlbnQgPT4gewogICAgICAgICAgRXh0cmFRdWVyeVBhcmFtcyA9PiAnUlRJUics\nCiAgICAgICAgICBGb3JtYXQgICAgICAgICAgID0+IHF7JzxiPjxhIGhyZWY9Il9fUlRJUlRpY2tl\ndFVSSV9fIj5fX2lkX188L2E+PC9iPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgLiBxeyc8Yj48\nYSBocmVmPSJfX1JUSVJUaWNrZXRVUklfXyI+X19TdWJqZWN0X188L2E+PC9iPi9USVRMRTpTdWJq\nZWN0Jyx9CiAgICAgICAgICAgICAgLiBxe1JlcXVlc3RvcnMsT3duZXJOYW1lLER1ZVJlbGF0aXZl\nLFF1ZXVlTmFtZSxUYWtlfSwKICAgICAgICAgIE9yZGVyICAgICAgICAgICAgID0+ICdBU0N8QVND\nfEFTQ3xBU0MnLAogICAgICAgICAgT3JkZXJCeSAgICAgICAgICAgPT4gJ0R1ZScsCiAgICAgICAg\nICBRdWVyeSAgICAgICAgICAgICA9PiAnTGlmZWN5Y2xlID0gXCdpbmNpZGVudF9yZXBvcnRzXCcg\nQU5EIFN0YXR1cyA9IFwnbmV3XCcnLAogICAgICAgICAgUlRJUiAgICAgICAgICAgICAgPT4gMSwK\nICAgICAgICAgIFJUSVJTZWFyY2hFbmFibGVkID0+IDEsCiAgICAgICAgICBSb3dzUGVyUGFnZSAg\nICAgICA9PiAxMCwKICAgICAgfSwKICAgIH0sCiAgICB7IE5hbWUgPT4gJ015IG1vc3QgZHVlIGlu\nY2lkZW50cycsCiAgICAgIERlc2NyaXB0aW9uID0+ICdNb3N0IGR1ZSBpbmNpZGVudHMgSSBvd24n\nLCAjIGxvYwogICAgICBDb250ZW50ID0+IHsKICAgICAgICAgIEV4dHJhUXVlcnlQYXJhbXMgPT4g\nJ1JUSVInLAogICAgICAgICAgRm9ybWF0ICAgICAgICAgICA9PiBxeyc8Yj48YSBocmVmPSJfX1JU\nSVJUaWNrZXRVUklfXyI+X19pZF9fPC9hPjwvYj4vVElUTEU6IycsfQogICAgICAgICAgICAgIC4g\ncXsnPGI+PGEgaHJlZj0iX19SVElSVGlja2V0VVJJX18iPl9fU3ViamVjdF9fPC9hPjwvYj4vVElU\nTEU6U3ViamVjdCcsfQogICAgICAgICAgICAgIC4gcXtEdWVSZWxhdGl2ZSwgT3duZXJOYW1lLCBf\nX1ByaW9yaXR5X18sfQogICAgICAgICAgICAgIC4gcXsnVW5yZWFkTWVzc2FnZXMvVElUTEU6VXBk\nYXRlcyd9LAogICAgICAgICAgT3JkZXIgICAgICAgICAgICAgPT4gJ0FTQ3xERVNDfEFTQ3xBU0Mn\nLAogICAgICAgICAgT3JkZXJCeSAgICAgICAgICAgPT4gJ0R1ZXxQcmlvcml0eScsCiAgICAgICAg\nICBRdWVyeSAgICAgICAgICAgICA9PiAnTGlmZWN5Y2xlID0gXCdpbmNpZGVudHNcJyBBTkQgU3Rh\ndHVzID0gXCdfX0FjdGl2ZV9fXCcgQU5EIE93bmVyID0gXCdfX0N1cnJlbnRVc2VyX19cJycsCiAg\nICAgICAgICBSVElSICAgICAgICAgICAgICA9PiAxLAogICAgICAgICAgUlRJUlNlYXJjaEVuYWJs\nZWQgPT4gMSwKICAgICAgICAgIFJvd3NQZXJQYWdlICAgICAgID0+IDEwLAogICAgICB9LAogICAg\nfSwKICAgIHsgTmFtZSA9PiAnTW9zdCBkdWUgdW5vd25lZCBpbmNpZGVudHMnLAogICAgICBEZXNj\ncmlwdGlvbiA9PiAnTW9zdCBkdWUgdW5vd25lZCBpbmNpZGVudHMnLCAjIGxvYwogICAgICBDb250\nZW50ID0+IHsKICAgICAgICAgIEV4dHJhUXVlcnlQYXJhbXMgPT4gJ1JUSVInLAogICAgICAgICAg\nRm9ybWF0ICAgICAgICAgICA9PiBxeyc8Yj48YSBocmVmPSJfX1JUSVJUaWNrZXRVUklfXyI+X19p\nZF9fPC9hPjwvYj4vVElUTEU6IycsfQogICAgICAgICAgICAgIC4gcXsnPGI+PGEgaHJlZj0iX19S\nVElSVGlja2V0VVJJX18iPl9fU3ViamVjdF9fPC9hPjwvYj4vVElUTEU6U3ViamVjdCcsfQogICAg\nICAgICAgICAgIC4gcXtEdWVSZWxhdGl2ZSwgT3duZXJOYW1lLCBfX1ByaW9yaXR5X18sfQogICAg\nICAgICAgICAgIC4gcXsnVW5yZWFkTWVzc2FnZXMvVElUTEU6VXBkYXRlcyd9LAogICAgICAgICAg\nT3JkZXIgICAgICAgICAgICAgPT4gJ0FTQ3xERVNDfEFTQ3xBU0MnLAogICAgICAgICAgT3JkZXJC\neSAgICAgICAgICAgPT4gJ0R1ZXxQcmlvcml0eScsCiAgICAgICAgICBRdWVyeSAgICAgICAgICAg\nICA9PiAnTGlmZWN5Y2xlID0gXCdpbmNpZGVudHNcJyBBTkQgU3RhdHVzID0gXCdfX0FjdGl2ZV9f\nXCcgQU5EIE93bmVyID0gXCdOb2JvZHlcJycsCiAgICAgICAgICBSVElSICAgICAgICAgICAgICA9\nPiAxLAogICAgICAgICAgUlRJUlNlYXJjaEVuYWJsZWQgPT4gMSwKICAgICAgICAgIFJvd3NQZXJQ\nYWdlICAgICAgID0+IDEwLAogICAgICB9LAogICAgfSwKICAgIHsgTmFtZSA9PiAnTW9zdCBkdWUg\naW5jaWRlbnRzJywKICAgICAgRGVzY3JpcHRpb24gPT4gJ01vc3QgZHVlIGluY2lkZW50cycsICMg\nbG9jCiAgICAgIENvbnRlbnQgPT4gewogICAgICAgICAgRXh0cmFRdWVyeVBhcmFtcyA9PiAnUlRJ\nUicsCiAgICAgICAgICBGb3JtYXQgICAgICAgICAgID0+IHF7JzxiPjxhIGhyZWY9Il9fUlRJUlRp\nY2tldFVSSV9fIj5fX2lkX188L2E+PC9iPi9USVRMRTojJyx9CiAgICAgICAgICAgICAgLiBxeyc8\nYj48YSBocmVmPSJfX1JUSVJUaWNrZXRVUklfXyI+X19TdWJqZWN0X188L2E+PC9iPi9USVRMRTpT\ndWJqZWN0Jyx9CiAgICAgICAgICAgICAgLiBxe0R1ZVJlbGF0aXZlLCBPd25lck5hbWUsIF9fUHJp\nb3JpdHlfXyx9CiAgICAgICAgICAgICAgLiBxeydVbnJlYWRNZXNzYWdlcy9USVRMRTpVcGRhdGVz\nJ30sCiAgICAgICAgICBPcmRlciAgICAgICAgICAgICA9PiAnQVNDfERFU0N8QVNDfEFTQycsCiAg\nICAgICAgICBPcmRlckJ5ICAgICAgICAgICA9PiAnRHVlfFByaW9yaXR5JywKICAgICAgICAgIFF1\nZXJ5ICAgICAgICAgICAgID0+ICdMaWZlY3ljbGUgPSBcJ2luY2lkZW50c1wnIEFORCBTdGF0dXMg\nPSBcJ19fQWN0aXZlX19cJycsCiAgICAgICAgICBSVElSICAgICAgICAgICAgICA9PiAxLAogICAg\nICAgICAgUlRJUlNlYXJjaEVuYWJsZWQgPT4gMSwKICAgICAgICAgIFJvd3NQZXJQYWdlICAgICAg\nID0+IDEwLAogICAgICB9LAogICAgfSwKKTsKCmZvciBteSAkY2YgKEBDdXN0b21GaWVsZHMpIHsK\nICAgIHB1c2ggQEFDTCwKICAgICAgICAoCiAgICAgICAgeyAgIEdyb3VwSWQgICAgID0+ICdEdXR5\nVGVhbScsCiAgICAgICAgICAgIEdyb3VwRG9tYWluID0+ICdVc2VyRGVmaW5lZCcsCiAgICAgICAg\nICAgIENGICAgICAgICAgID0+ICRjZi0+e05hbWV9LAogICAgICAgICAgICBRdWV1ZSAgICAgICA9\nPiAkY2YtPntRdWV1ZX0sCiAgICAgICAgICAgIFJpZ2h0ICAgICAgID0+ICdTZWVDdXN0b21GaWVs\nZCcsCiAgICAgICAgfSwKICAgICAgICB7ICAgR3JvdXBJZCAgICAgPT4gJ0R1dHlUZWFtJywKICAg\nICAgICAgICAgR3JvdXBEb21haW4gPT4gJ1VzZXJEZWZpbmVkJywKICAgICAgICAgICAgQ0YgICAg\nICAgICAgPT4gJGNmLT57TmFtZX0sCiAgICAgICAgICAgIFF1ZXVlICAgICAgID0+ICRjZi0+e1F1\nZXVlfSwKICAgICAgICAgICAgUmlnaHQgICAgICAgPT4gJ01vZGlmeUN1c3RvbUZpZWxkJywKICAg\nICAgICB9LAogICAgICAgICk7Cn0KCkBDbGFzc2VzID0gKAogICAgewogICAgICAgIE5hbWUgICAg\nICAgID0+ICdUZW1wbGF0ZXMnLAogICAgICAgIERlc2NyaXB0aW9uID0+ICdSZXNwb25zZSB0ZW1w\nbGF0ZXMnLAogICAgICAgIEFwcGx5VG8gICAgID0+IFsgbWFwIHsgJF8tPntOYW1lfSB9IEBRdWV1\nZXMgXSwKICAgIH0sCiAgICB7CiAgICAgICAgTmFtZSA9PiAnSW5jaWRlbnRzIFByb2Nlc3Nlcycs\nCiAgICAgICAgRGVzY3JpcHRpb24gPT4gJ1Byb2Nlc3NlcyB0byBiZSBmb2xsb3dlZCBpbiB0aGUg\nZXZlbnQgb2YgYW4gaW5jaWRlbnQnLAogICAgICAgIEFwcGx5VG8gPT4gW10sCiAgICB9Cik7CgpA\nQXJ0aWNsZXMgPSAoCiAgICB7CiAgICAgICAgTmFtZSA9PiAnU3BhbSBQcm9jZXNzJywKICAgICAg\nICBTdW1tYXJ5ID0+ICdUaGlzIGlzIHRoZSBzdW1tYXJ5IG9mIHRoZSBwcm9jZXNzIGZvciBoYW5k\nbGluZyBzcGFtJywKICAgICAgICBDdXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7CiAgICAg\nICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAgICAgQ29u\ndGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcg\nc3BhbScsCiAgICAgICAgICAgIH0sCiAgICAgICAgXSwKICAgICAgICBDbGFzcyA9PiAnSW5jaWRl\nbnRzIFByb2Nlc3NlcycsCiAgICB9LAogICAgewogICAgICAgIE5hbWUgPT4gJ1N5c3RlbSBDb21w\ncm9taXNlIFByb2Nlc3MnLAogICAgICAgIFN1bW1hcnkgPT4gJ1RoaXMgaXMgdGhlIHN1bW1hcnkg\nb2YgdGhlIHByb2Nlc3MgZm9yIGhhbmRsaW5nIHN5c3RlbSBjb21wcm9taXNlJywKICAgICAgICBD\ndXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBDdXN0b21GaWVs\nZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAgICAgQ29udGVudCA9PiAnVGhpcyBpcyB0aGUg\nY29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgc3lzdGVtIGNvbXByb21pc2UnLAog\nICAgICAgICAgICB9LAogICAgICAgIF0sCiAgICAgICAgQ2xhc3MgPT4gJ0luY2lkZW50cyBQcm9j\nZXNzZXMnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lID0+ICdRdWVyeSBQcm9jZXNzJywKICAg\nICAgICBTdW1tYXJ5ID0+ICdUaGlzIGlzIHRoZSBzdW1tYXJ5IG9mIHRoZSBwcm9jZXNzIGZvciBo\nYW5kbGluZyBxdWVyaWVzJywKICAgICAgICBDdXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7\nCiAgICAgICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAg\nICAgQ29udGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFu\nZGxpbmcgcXVlcmllcycsCiAgICAgICAgICAgIH0sCiAgICAgICAgXSwKICAgICAgICBDbGFzcyA9\nPiAnSW5jaWRlbnRzIFByb2Nlc3NlcycsCiAgICB9LAogICAgewogICAgICAgIE5hbWUgPT4gJ1Nj\nYW4gUHJvY2VzcycsCiAgICAgICAgU3VtbWFyeSA9PiAnVGhpcyBpcyB0aGUgc3VtbWFyeSBvZiB0\naGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgc2NhbnMnLAogICAgICAgIEN1c3RvbUZpZWxkcyA9PiBb\nCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIEN1c3RvbUZpZWxkICA9PiAnQ29udGVudCcs\nCiAgICAgICAgICAgICAgICBDb250ZW50ID0+ICdUaGlzIGlzIHRoZSBjb250ZW50IG9mIHRoZSBw\ncm9jZXNzIGZvciBoYW5kbGluZyBzY2FucycsCiAgICAgICAgICAgIH0sCiAgICAgICAgXSwKICAg\nICAgICBDbGFzcyA9PiAnSW5jaWRlbnRzIFByb2Nlc3NlcycsCiAgICB9LAogICAgewogICAgICAg\nIE5hbWUgPT4gJ0RlbmlhbCBvZiBTZXJ2aWNlIFByb2Nlc3MnLAogICAgICAgIFN1bW1hcnkgPT4g\nJ1RoaXMgaXMgdGhlIHN1bW1hcnkgb2YgdGhlIHByb2Nlc3MgZm9yIGhhbmRsaW5nIGRlbmlhbCBv\nZiBzZXJ2aWNlJywKICAgICAgICBDdXN0b21GaWVsZHMgPT4gWwogICAgICAgICAgICB7CiAgICAg\nICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0NvbnRlbnQnLAogICAgICAgICAgICAgICAgQ29u\ndGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcg\nZGVuaWFsIG9mIHNlcnZpY2UnLAogICAgICAgICAgICB9LAogICAgICAgIF0sCiAgICAgICAgQ2xh\nc3MgPT4gJ0luY2lkZW50cyBQcm9jZXNzZXMnLAogICAgfSwKICAgIHsKICAgICAgICBOYW1lID0+\nICdQaXJhY3kgUHJvY2VzcycsCiAgICAgICAgU3VtbWFyeSA9PiAnVGhpcyBpcyB0aGUgc3VtbWFy\neSBvZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgcGlyYWN5JywKICAgICAgICBDdXN0b21GaWVs\nZHMgPT4gWwogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBDdXN0b21GaWVsZCAgPT4gJ0Nv\nbnRlbnQnLAogICAgICAgICAgICAgICAgQ29udGVudCA9PiAnVGhpcyBpcyB0aGUgY29udGVudCBv\nZiB0aGUgcHJvY2VzcyBmb3IgaGFuZGxpbmcgcGlyYWN5JywKICAgICAgICAgICAgfSwKICAgICAg\nICBdLAogICAgICAgIENsYXNzID0+ICdJbmNpZGVudHMgUHJvY2Vzc2VzJywKICAgIH0KKTsKCkBG\naW5hbCA9ICgKICAgIHN1YiB7CiAgICAgICAgJHwgPSAxOwogICAgICAgIG15ICRDdXJyZW50VXNl\nciA9IFJUOjpDdXJyZW50VXNlci0+bmV3KCk7CiAgICAgICAgJEN1cnJlbnRVc2VyLT5Mb2FkQnlO\nYW1lKCdSVF9TeXN0ZW0nKTsKCiAgICAgICAgcmVxdWlyZSBSVDo6Q2xhc3M7CiAgICAgICAgbXkg\nJGNsYXNzID0gUlQ6OkNsYXNzLT5uZXcoJEN1cnJlbnRVc2VyKTsKICAgICAgICAkY2xhc3MtPkxv\nYWQoJ1RlbXBsYXRlcycpOwoKICAgICAgICByZXF1aXJlIFJUOjpBcnRpY2xlOwogICAgICAgIG15\nICRyZXNwb25zZSA9IFJUOjpDdXN0b21GaWVsZC0+bmV3KCRDdXJyZW50VXNlcik7CiAgICAgICAg\nJHJlc3BvbnNlLT5Mb2FkKCdSZXNwb25zZScpOwogICAgICAgIHVubGVzcyAoJHJlc3BvbnNlLT5J\nZAogICAgICAgICAgICBhbmQgJHJlc3BvbnNlLT5Mb29rdXBUeXBlIGVxIFJUOjpBcnRpY2xlLT5D\ndXN0b21GaWVsZExvb2t1cFR5cGUgKQogICAgICAgIHsKICAgICAgICAgICAgJFJUOjpMb2dnZXIt\nPmluZm8oIkNyZWF0aW5nICdSZXNwb25zZScgQXJ0aWNsZSBjdXN0b20gZmllbGQuIik7CiAgICAg\nICAgICAgIG15ICggJGlkLCAkbXNnICkgPSAkcmVzcG9uc2UtPkNyZWF0ZSgKICAgICAgICAgICAg\nICAgIE5hbWUgICAgICAgID0+ICdSZXNwb25zZScsCiAgICAgICAgICAgICAgICBUeXBlICAgICAg\nICA9PiAnVGV4dCcsCiAgICAgICAgICAgICAgICBNYXhWYWx1ZXMgICA9PiAxLAogICAgICAgICAg\nICAgICAgRGVzY3JpcHRpb24gPT4gJ1Jlc3BvbnNlIHRvIGJlIGluc2VydGVkIGludG8gdGhlIHRp\nY2tldCcsCiAgICAgICAgICAgICAgICBMb29rdXBUeXBlICA9PiBSVDo6QXJ0aWNsZS0+Q3VzdG9t\nRmllbGRMb29rdXBUeXBlLAogICAgICAgICAgICApOwogICAgICAgICAgICBkaWUgJG1zZyB1bmxl\nc3MgJGlkOwogICAgICAgIH0KCiAgICAgICAgJHJlc3BvbnNlLT5BZGRUb09iamVjdCgkY2xhc3Mp\nOwoKICAgICAgICBteSBAc2tpcHMgPSAoICJOYW1lIiwgIlN1bW1hcnkiLCAiQ0YtVGl0bGUtIiAu\nICRyZXNwb25zZS0+SWQgKTsKCiAgICAgICAgbXkgJGNvbnRlbnQgPSBSVDo6Q3VzdG9tRmllbGQt\nPm5ldygkQ3VycmVudFVzZXIpOwogICAgICAgICRjb250ZW50LT5Mb2FkQnlOYW1lKCBOYW1lID0+\nICdDb250ZW50JywgTG9va3VwVHlwZSA9PiBSVDo6QXJ0aWNsZS0+Q3VzdG9tRmllbGRMb29rdXBU\neXBlICk7CiAgICAgICAgaWYgKCAkY29udGVudC0+SWQgJiYgKCAkY29udGVudC0+SXNHbG9iYWwg\nfHwgJGNvbnRlbnQtPklzQWRkZWQoICRjbGFzcy0+SWQgKSApICkgewogICAgICAgICAgICBwdXNo\nIEBza2lwcywgIkNGLVRpdGxlLSIgLiAkY29udGVudC0+SWQsICJDRi1WYWx1ZS0iIC4gJGNvbnRl\nbnQtPklkOwogICAgICAgIH0KCiAgICAgICAgJGNsYXNzLT5TZXRBdHRyaWJ1dGUoIE5hbWUgPT4g\nIlNraXAtJF8iLCBDb250ZW50ID0+IDEgKSBmb3IgQHNraXBzOwoKICAgICAgICBteSAkZ3JvdXAg\nPSBSVDo6R3JvdXAtPm5ldygkQ3VycmVudFVzZXIpOwogICAgICAgICRncm91cC0+TG9hZFVzZXJE\nZWZpbmVkR3JvdXAoIkR1dHlUZWFtIik7CiAgICAgICAgZGllICJDYW4ndCBsb2FkIGdyb3VwIiB1\nbmxlc3MgJGdyb3VwLT5JZDsKCiAgICAgICAgKG15ICRyZXQsICRtc2cpID0gJGdyb3VwLT5Qcmlu\nY2lwYWxPYmotPkdyYW50UmlnaHQoIFJpZ2h0ID0+ICdTZWVDdXN0b21GaWVsZCcsIE9iamVjdCA9\nPiAkY2xhc3MgKTsKICAgICAgICBkaWUgIkNvdWxkIG5vdCBncmFudCBEdXR5VGVhbSAnU2VlQ3Vz\ndG9tRmllbGQnIG9uIGNsYXNzICdUZW1wbGF0ZXMnOiAkbXNnIiB1bmxlc3MgJHJldDsKCiAgICAg\nICAgJGdyb3VwLT5QcmluY2lwYWxPYmotPkdyYW50UmlnaHQoIFJpZ2h0ID0+ICRfLCBPYmplY3Qg\nPT4gJHJlc3BvbnNlICkKICAgICAgICAgICAgZm9yIHF3L1NlZUN1c3RvbUZpZWxkIE1vZGlmeUN1\nc3RvbUZpZWxkLzsKICAgICAgICAkZ3JvdXAtPlByaW5jaXBhbE9iai0+R3JhbnRSaWdodCggUmln\naHQgPT4gJF8sIE9iamVjdCA9PiAkY2xhc3MgKQogICAgICAgICAgICBmb3IKICAgICAgICAgICAg\ncXcvQWRtaW5DbGFzcyBBZG1pblRvcGljcyBDcmVhdGVBcnRpY2xlIE1vZGlmeUFydGljbGUgTW9k\naWZ5QXJ0aWNsZVRvcGljcyBTZWVDbGFzcyBTaG93QXJ0aWNsZSBTaG93QXJ0aWNsZUhpc3Rvcnkg\nRGVsZXRlQXJ0aWNsZS87CiAgICAgICAgJGdyb3VwLT5QcmluY2lwYWxPYmotPkdyYW50UmlnaHQo\nCiAgICAgICAgICAgIFJpZ2h0ICA9PiBTaG93QXJ0aWNsZXNNZW51LAogICAgICAgICAgICBPYmpl\nY3QgPT4gUlQtPlN5c3RlbQogICAgICAgICk7CgogICAgfSwKICAgIHN1YiB7CiAgICAgICAgIyBU\naGUgbGFzdCA0IHNhdmVkIHNlYXJjaGVzIHNob3VsZCBiZSB0aGUgb25lcyBhZGRlZCBhYm92ZS4K\nICAgICAgICAjIERvbid0IGxvYWQgYnkgbmFtZSBzaW5jZSB0aGVyZSBjb3VsZCBiZSBvdGhlciBl\neGlzdGluZyBzZWFyY2hlcyB3aXRoCiAgICAgICAgIyB0aGVzZSBuYW1lcy4KICAgICAgICBteSAo\nJG5ld19yZXBvcnRzLCAkdXNlcl9pbmNpZGVudHMsICRub2JvZHlfaW5jaWRlbnRzLCAkZHVlX2lu\nY2lkZW50cyk7CiAgICAgICAgbXkgJHNhdmVkX3NlYXJjaGVzID0gUlQ6OlNhdmVkU2VhcmNoZXMt\nPm5ldyhSVC0+U3lzdGVtVXNlcik7CiAgICAgICAgJHNhdmVkX3NlYXJjaGVzLT5VbkxpbWl0Owog\nICAgICAgICRkdWVfaW5jaWRlbnRzID0gJHNhdmVkX3NlYXJjaGVzLT5MYXN0OwoKICAgICAgICAk\nbmV3X3JlcG9ydHMgPSBSVDo6U2F2ZWRTZWFyY2gtPm5ldyhSVC0+U3lzdGVtVXNlcik7CiAgICAg\nICAgJG5ld19yZXBvcnRzLT5Mb2FkKCAkZHVlX2luY2lkZW50cy0+SWQgLSAzICk7CgogICAgICAg\nICR1c2VyX2luY2lkZW50cyA9IFJUOjpTYXZlZFNlYXJjaC0+bmV3KFJULT5TeXN0ZW1Vc2VyKTsK\nICAgICAgICAkdXNlcl9pbmNpZGVudHMtPkxvYWQoICRkdWVfaW5jaWRlbnRzLT5JZCAtIDIgKTsK\nCiAgICAgICAgJG5vYm9keV9pbmNpZGVudHMgPSBSVDo6U2F2ZWRTZWFyY2gtPm5ldyhSVC0+U3lz\ndGVtVXNlcik7CiAgICAgICAgJG5vYm9keV9pbmNpZGVudHMtPkxvYWQoICRkdWVfaW5jaWRlbnRz\nLT5JZCAtIDEgKTsKCiAgICAgICAgbXkgJHJ0aXJfZGFzaGJvYXJkID0gewogICAgICAgICAgICBF\nbGVtZW50cyA9PiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgTGF5b3V0\nICAgPT4gJ2NvbC1tZC04LGNvbC1tZC00JywKICAgICAgICAgICAgICAgICAgICBFbGVtZW50cyA9\nPiBbCiAgICAgICAgICAgICAgICAgICAgICAgIFsKICAgICAgICAgICAgICAgICAgICAgICAgewog\nICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydGxldF90eXBlID0+ICdzZWFyY2gnLAogICAg\nICAgICAgICAgICAgICAgICAgICAgICAgaWQgICAgICAgICAgID0+ICRuZXdfcmVwb3J0cy0+SWQs\nCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbiAgPT4gJ1RpY2tldDogJyAu\nICRuZXdfcmVwb3J0cy0+RGVzY3JpcHRpb24sCiAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAg\nICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRs\nZXRfdHlwZSA9PiAnc2VhcmNoJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlkICAgICAg\nICAgICA9PiAkdXNlcl9pbmNpZGVudHMtPklkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg\nZGVzY3JpcHRpb24gID0+ICdUaWNrZXQ6ICcgLiAkdXNlcl9pbmNpZGVudHMtPkRlc2NyaXB0aW9u\nLAogICAgICAgICAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgICAgICAgICB7CiAg\nICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0bGV0X3R5cGUgPT4gJ3NlYXJjaCcsCiAgICAg\nICAgICAgICAgICAgICAgICAgICAgICBpZCAgICAgICAgICAgPT4gJG5vYm9keV9pbmNpZGVudHMt\nPklkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVzY3JpcHRpb24gID0+ICdUaWNrZXQ6\nICcgLiAkbm9ib2R5X2luY2lkZW50cy0+RGVzY3JpcHRpb24sCiAgICAgICAgICAgICAgICAgICAg\nICAgIH0sCiAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAg\nICAgIHBvcnRsZXRfdHlwZSA9PiAnc2VhcmNoJywKICAgICAgICAgICAgICAgICAgICAgICAgICAg\nIGlkICAgICAgICAgICA9PiAkZHVlX2luY2lkZW50cy0+SWQsCiAgICAgICAgICAgICAgICAgICAg\nICAgICAgICBkZXNjcmlwdGlvbiAgPT4gJ1RpY2tldDogJyAuICRkdWVfaW5jaWRlbnRzLT5EZXNj\ncmlwdGlvbiwKICAgICAgICAgICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgICAgICAg\nICAgXSwKICAgICAgICAgICAgICAgICAgICAgICAgWwogICAgICAgICAgICAgICAgICAgICAgICB7\nCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0bGV0X3R5cGUgPT4gJ2NvbXBvbmVudCcs\nCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wb25lbnQgICAgPT4gJy9SVElSL0VsZW1l\nbnRzL1dvcmtXaXRoQ29uc3RpdHVlbmN5JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRl\nc2NyaXB0aW9uICA9PiAnL1JUSVIvRWxlbWVudHMvV29ya1dpdGhDb25zdGl0dWVuY3knLAogICAg\nICAgICAgICAgICAgICAgICAgICAgICAgcGF0aCAgICAgICAgID0+ICcvUlRJUi9FbGVtZW50cy9X\nb3JrV2l0aENvbnN0aXR1ZW5jeScsCiAgICAgICAgICAgICAgICAgICAgICAgIH0sCiAgICAgICAg\nICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRsZXRfdHlw\nZSA9PiAnY29tcG9uZW50JywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBvbmVudCAg\nICA9PiAnL1JUSVIvRWxlbWVudHMvUXVldWVTdW1tYXJ5JywKICAgICAgICAgICAgICAgICAgICAg\nICAgICAgIGRlc2NyaXB0aW9uICA9PiAnL1JUSVIvRWxlbWVudHMvUXVldWVTdW1tYXJ5JywKICAg\nICAgICAgICAgICAgICAgICAgICAgICAgIHBhdGggICAgICAgICA9PiAnL1JUSVIvRWxlbWVudHMv\nUXVldWVTdW1tYXJ5JywKICAgICAgICAgICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAg\nICAgICAgICAgXQogICAgICAgICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgICB9CiAgICAg\nICAgICAgIF0sCiAgICAgICAgfTsKCiAgICAgICAgbXkgJGRhc2hib2FyZCA9IFJUOjpEYXNoYm9h\ncmQtPm5ldyggUlQtPlN5c3RlbVVzZXIgKTsKICAgICAgICBteSAoICRyZXQsICRtc2cgKSA9ICRk\nYXNoYm9hcmQtPkNyZWF0ZSgKICAgICAgICAgICAgTmFtZSAgICAgICAgPT4gJ1JUSVJEZWZhdWx0\nRGFzaGJvYXJkJywKICAgICAgICAgICAgRGVzY3JpcHRpb24gPT4gJ1JUSVIgRGVmYXVsdCBEYXNo\nYm9hcmQnLAogICAgICAgICAgICBQcmluY2lwYWxJZCA9PiBSVC0+U3lzdGVtVXNlci0+UHJpbmNp\ncGFsSWQsCiAgICAgICAgICAgIENvbnRlbnQgPT4gJHJ0aXJfZGFzaGJvYXJkLAogICAgICAgICk7\nCgogICAgICAgIGlmICggISRyZXQgKSB7CiAgICAgICAgICAgIFJULT5Mb2dnZXItPmVycm9yKCJD\nb3VsZG4ndCBjcmVhdGUgUlRJUkRlZmF1bHREYXNoYm9hcmQ6ICRtc2ciKTsKICAgICAgICB9Cgog\nICAgICAgIGlmICggJHJldCApIHsKICAgICAgICAgICAgKCAkcmV0LCAkbXNnICkgPSBSVC0+U3lz\ndGVtLT5TZXRBdHRyaWJ1dGUoCiAgICAgICAgICAgICAgICAnTmFtZScgICAgICAgID0+ICdSVElS\nRGVmYXVsdERhc2hib2FyZCcsCiAgICAgICAgICAgICAgICAnRGVzY3JpcHRpb24nID0+ICdSVElS\nIERlZmF1bHQgRGFzaGJvYXJkJywKICAgICAgICAgICAgICAgICdDb250ZW50JyAgICAgPT4gJGRh\nc2hib2FyZC0+SWQsCiAgICAgICAgICAgICk7CiAgICAgICAgICAgIGlmICggISRyZXQgKSB7CiAg\nICAgICAgICAgICAgICBSVC0+TG9nZ2VyLT5lcnJvcigiQ291bGRuJ3Qgc2V0IFJUSVJEZWZhdWx0\nRGFzaGJvYXJkOiAkbXNnIik7CiAgICAgICAgICAgIH0KICAgICAgICB9CiAgICB9LAogICAgc3Vi\nIHsKICAgICAgICBteSAkY2xhc3MgPSBSVDo6Q2xhc3MtPm5ldyggUlQtPlN5c3RlbVVzZXIgKTsK\nICAgICAgICBteSAoJG9rLCAkbXNnKSA9ICRjbGFzcy0+TG9hZCgnSW5jaWRlbnRzIFByb2Nlc3Nl\ncycpOwogICAgICAgIFJULT5Mb2dnZXItPmVycm9yKCJVbmFibGUgdG8gbG9hZCBjbGFzcyBJbmNp\nZGVudHMgUHJvY2Vzc2VzOiAkbXNnIikgdW5sZXNzICRvazsKCiAgICAgICAgbXkgJGNvbnRlbnQg\nPSBSVDo6Q3VzdG9tRmllbGQtPm5ldyggUlQtPlN5c3RlbVVzZXIgKTsKICAgICAgICAkY29udGVu\ndC0+TG9hZEJ5TmFtZSggTmFtZSA9PiAnQ29udGVudCcsIExvb2t1cFR5cGUgPT4gUlQ6OkFydGlj\nbGUtPkN1c3RvbUZpZWxkTG9va3VwVHlwZSApOwoKICAgICAgICBteSBAc2tpcHMgPSAoICJOYW1l\nIiwgIlN1bW1hcnkiLCAiTGlua1RvVGlja2V0IiwgJGNvbnRlbnQtPklkID8gIkNGLVRpdGxlLSIg\nLiAkY29udGVudC0+SWQgOiAoKSApOwogICAgICAgICRjbGFzcy0+U2V0QXR0cmlidXRlKE5hbWUg\nPT4gIlNraXAtJF8iLCBDb250ZW50ID0+IDEpIGZvciBAc2tpcHM7CgogICAgICAgIG15ICRncm91\ncCA9IFJUOjpHcm91cC0+bmV3KCBSVC0+U3lzdGVtVXNlciApOwogICAgICAgICRncm91cC0+TG9h\nZFVzZXJEZWZpbmVkR3JvdXAoIkR1dHlUZWFtIik7CiAgICAgICAgZGllICJDYW4ndCBsb2FkIGdy\nb3VwIiB1bmxlc3MgJGdyb3VwLT5JZDsKICAgICAgICAkZ3JvdXAtPlByaW5jaXBhbE9iai0+R3Jh\nbnRSaWdodCggUmlnaHQgPT4gJF8sIE9iamVjdCA9PiAkY2xhc3MgKQogICAgICAgICAgICBmb3Ig\ncXcvU2hvd0FydGljbGUgU2VlQ3VzdG9tRmllbGQgQWRtaW5DbGFzcyBBZG1pblRvcGljcyBDcmVh\ndGVBcnRpY2xlIE1vZGlmeUFydGljbGUgTW9kaWZ5QXJ0aWNsZVRvcGljcyBTZWVDbGFzcyBTaG93\nQXJ0aWNsZUhpc3RvcnkgRGVsZXRlQXJ0aWNsZS87CiAgICAgICAgfQopOwoAAAAHY29udGVudAoF\nNi4wLjEAAAALZXh0X3ZlcnNpb24KGS9hcHAvcnRpci9ldGMvaW5pdGlhbGRhdGEAAAAIZmlsZW5h\nbWUKJEMzM0JDQzc2LUZEMEYtMTFGMC1BRUU2LUFCQUYwOUE3MzcwMQAAAAdmdWxsX2lkCiRDMzYx\nRDdBRS1GRDBGLTExRjAtQUVFNi1BQkFGMDlBNzM3MDEAAAANaW5kaXZpZHVhbF9pZAoFNi4wLjIA\nAAAKcnRfdmVyc2lvbgoGYmVmb3JlAAAABXN0YWdlCWl7VVsAAAAJdGltZXN0YW1wBAMAAAAFCiRD\nMzYxRDdBRS1GRDBGLTExRjAtQUVFNi1BQkFGMDlBNzM3MDEAAAANaW5kaXZpZHVhbF9pZAQCAAAA\nAgiBChNEb25lIGluc2VydGluZyBkYXRhAAAADHJldHVybl92YWx1ZQoFNi4wLjIAAAAKcnRfdmVy\nc2lvbgoFYWZ0ZXIAAAAFc3RhZ2UJaXtVXAAAAAl0aW1lc3RhbXAAAAAGUlQ6OklS\n	storable	RT::System	1	1	2010-10-28 12:40:57	1	2010-10-28 12:41:00
3	CatalogCacheNeedsUpdate	\N	1769690582.39932		RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:43:02
2	QueueCacheNeedsUpdate	\N	1769690582.40837		RT::System	1	1	2010-10-28 12:40:58	1	2010-10-28 12:43:02
\.


--
-- Data for Name: authtokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.authtokens (id, owner, token, description, lastused, creator, created, lastupdatedby, lastupdated, expires) FROM stdin;
1	14	!bcrypt!12!icSsOoWzNgX5TkBkrhk3P.5vAWOB6peqU0tMqn.18Gdw1cvDRQVPe	My init token	\N	14	2010-10-28 12:47:11	14	2010-10-28 12:47:11	\N
2	44	!bcrypt!12!IZEPXVnX3qmwpdJWRyRuaOJn5vcWLcSccvjNVln2iw6qpYsEuInke	HeroToken	\N	44	2010-10-28 12:47:54	44	2010-10-28 12:47:54	\N
3	46	!bcrypt!12!lyAZE/XJmBj2d5L9p0/tqOh8ZRv.fP/B4SdoskjmVO86lvgmKpS8O	Invisible token	\N	46	2010-10-28 12:48:45	46	2010-10-28 12:48:45	\N
4	48	!bcrypt!12!HJZDKny6rD2x/30ZfpNVs.Y2VCr/jpy0YvDPpmmg1mHcaw9wg/GXC	Madness is like token	\N	48	2010-10-28 12:49:27	48	2010-10-28 12:49:27	\N
\.


--
-- Data for Name: cachedgroupmembers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.cachedgroupmembers (id, groupid, memberid, via, immediateparentid, disabled) FROM stdin;
1	2	2	1	2	0
56	45	45	56	45	0
2	2	1	2	2	0
3	3	3	3	3	0
57	45	44	57	45	0
4	4	4	4	4	0
5	5	5	5	5	0
58	3	44	58	3	0
6	7	7	6	7	0
7	7	6	7	7	0
59	4	44	59	4	0
8	3	6	8	3	0
9	5	6	9	5	0
60	47	47	60	47	0
10	8	8	10	8	0
11	8	6	11	8	0
61	47	46	61	47	0
12	9	9	12	9	0
13	10	10	13	10	0
62	3	46	62	3	0
14	11	11	14	11	0
15	12	12	15	12	0
63	4	46	63	4	0
16	13	13	16	13	0
17	15	15	17	15	0
64	49	49	64	49	0
18	15	14	18	15	0
19	3	14	19	3	0
65	49	48	65	49	0
20	4	14	20	4	0
21	16	16	21	16	0
66	3	48	66	3	0
22	17	17	22	17	0
23	18	18	23	18	0
67	4	48	67	4	0
24	18	6	24	18	0
25	19	19	25	19	0
26	20	20	26	20	0
27	21	21	27	21	0
28	22	22	28	22	0
29	22	6	29	22	0
30	23	23	30	23	0
31	24	24	31	24	0
32	24	6	32	24	0
33	25	25	33	25	0
34	26	26	34	26	0
35	27	27	35	27	0
36	28	28	36	28	0
37	29	29	37	29	0
38	30	30	38	30	0
39	30	6	39	30	0
40	31	31	40	31	0
41	32	32	41	32	0
42	33	33	42	33	0
43	34	34	43	34	0
44	34	6	44	34	0
45	35	35	45	35	0
46	36	36	46	36	0
47	37	37	47	37	0
48	38	38	48	38	0
49	38	6	49	38	0
50	39	39	50	39	0
51	40	40	51	40	0
52	41	41	52	41	0
53	42	42	53	42	0
54	42	6	54	42	0
55	43	43	55	43	0
\.


--
-- Data for Name: catalogs; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.catalogs (id, name, lifecycle, description, disabled, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	General assets	assets	The default catalog	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.classes (id, name, description, sortorder, disabled, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	General	The default class	0	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	Templates	Response templates	0	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
3	Incidents Processes	Processes to be followed in the event of an incident	0	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
\.


--
-- Data for Name: configurations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.configurations (id, name, content, contenttype, disabled, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: customfields; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.customfields (id, name, type, rendertype, maxvalues, valuesclass, basedon, pattern, lookuptype, entryhint, validationhint, description, sortorder, uniquevalues, canonicalizeclass, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
1	Content	HTML	\N	1	\N	\N		RT::Class-RT::Article	Fill in one HTML area	\N	Content	0	0	\N	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
2	RTIR Constituency	Select	\N	1	\N	\N		RT::Queue	Select one value	\N	Associates RTIR queues with constituencies	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
3	RTIR default WHOIS server	Freeform	\N	1	\N	\N		RT::Queue	Enter one value	\N	If set, defines the default WHOIS server for an RTIR Queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
4	Classification	Select	\N	1	\N	\N		RT::Queue-RT::Ticket	Select one value	\N	Classification for Incidents RTIR queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
5	Function	Select	\N	1	\N	\N		RT::Queue-RT::Ticket	Select one value	\N	Function for Incidents RTIR queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
6	Resolution	Select	\N	1	\N	\N		RT::Queue-RT::Ticket	Select one value	\N	Resolution for Incidents RTIR queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
7	CVE ID	Freeform	\N	0	\N	\N		RT::Queue-RT::Ticket	Enter multiple values	\N	CVE ID for RTIR queues	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
8	How Reported	Select	\N	1	\N	\N		RT::Queue-RT::Ticket	Select one value	\N	How the incident was reported for Incident Reports RTIR queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
9	Reporter Type	Select	\N	1	\N	\N		RT::Queue-RT::Ticket	Select one value	\N	Reporter type for Incident Reports RTIR queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
10	IP	IPAddressRange	\N	0	\N	\N		RT::Queue-RT::Ticket	Enter multiple IP address ranges	\N	IP address for RTIR queues	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
11	Netmask	Freeform	\N	1	\N	\N		RT::Queue-RT::Ticket	Enter one value	\N	Network mask for Countermeasures	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
12	Port	Freeform	\N	1	\N	\N		RT::Queue-RT::Ticket	Enter one value	\N	Port for Countermeasures	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
13	Where Blocked	Freeform	\N	1	\N	\N		RT::Queue-RT::Ticket	Enter one value	\N	Where the block is placed for Countermeasures	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
14	Customer	Select	\N	0	\N	\N		RT::Queue-RT::Ticket	Select multiple values	\N	Customer for Incident Reports RTIR queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
15	Customer	Select	\N	1	\N	\N		RT::Queue-RT::Ticket	Select one value	\N	Customer for Investigations RTIR queue	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
16	Domain	Freeform	\N	0	\N	\N		RT::Queue-RT::Ticket	Enter multiple values	\N	Domain for RTIR queues	0	0	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0
17	Response	Text	\N	1	\N	\N		RT::Class-RT::Article	Fill in one text area	\N	Response to be inserted into the ticket	0	0	\N	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
\.


--
-- Data for Name: customfieldvalues; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.customfieldvalues (id, customfield, name, description, sortorder, category, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	4	Spam	\N	1	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
2	4	System Compromise	\N	2	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
3	4	Query	\N	3	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
4	4	Scan	\N	4	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
5	4	Denial of Service	\N	5	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
6	4	Piracy	\N	6	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
7	5	AbuseDesk	\N	1	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
8	5	IncidentCoord	\N	2	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
9	6	successfully resolved	\N	1	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
10	6	no resolution reached	\N	2	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
11	6	no response from customer	\N	3	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
12	6	no response from other ISP	\N	4	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
13	8	API	\N	1	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
14	8	CLI	\N	2	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
15	8	Email	\N	3	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
16	8	REST	\N	4	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
17	8	REST2	\N	5	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
18	8	Web	\N	6	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
19	8	Telephone	\N	7	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
20	8	Other	\N	8	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
21	9	customer	\N	1	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
22	9	external individual	\N	2	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
23	9	other ISP	\N	3	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
24	9	police	\N	4	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
25	9	other IRT	\N	5	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
26	9	other	\N	6	\N	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
\.


--
-- Data for Name: customroles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.customroles (id, name, description, maxvalues, entryhint, lookuptype, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
\.


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.dashboards (id, name, description, principalid, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
1	Homepage	Homepage	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
2	RTIRDefaultDashboard	RTIR Default Dashboard	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
\.


--
-- Data for Name: dashboardsubscriptions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.dashboardsubscriptions (id, userid, dashboardid, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
\.


--
-- Data for Name: groupmembers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.groupmembers (id, groupid, memberid, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	2	1	0	2010-10-28 12:40:57	0	2010-10-28 12:40:57
2	7	6	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
3	3	6	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
4	5	6	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
5	8	6	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
6	15	14	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
7	3	14	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
8	4	14	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
9	18	6	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
10	22	6	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
11	24	6	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
12	30	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
13	34	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
14	38	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
15	42	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
16	45	44	14	2010-10-28 12:44:10	14	2010-10-28 12:44:10
17	3	44	14	2010-10-28 12:44:10	14	2010-10-28 12:44:10
18	4	44	14	2010-10-28 12:44:10	14	2010-10-28 12:44:10
19	47	46	14	2010-10-28 12:45:22	14	2010-10-28 12:45:22
20	3	46	14	2010-10-28 12:45:22	14	2010-10-28 12:45:22
21	4	46	14	2010-10-28 12:45:22	14	2010-10-28 12:45:22
22	49	48	14	2010-10-28 12:46:15	14	2010-10-28 12:46:15
23	3	48	14	2010-10-28 12:46:15	14	2010-10-28 12:46:15
24	4	48	14	2010-10-28 12:46:15	14	2010-10-28 12:46:15
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.groups (id, name, description, domain, instance, creator, created, lastupdatedby, lastupdated) FROM stdin;
2	UserEquiv	ACL equiv. for user 1	ACLEquivalence	1	0	2010-10-28 12:40:57	0	2010-10-28 12:40:57
3	Everyone	Pseudogroup for internal use	SystemInternal	0	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
4	Privileged	Pseudogroup for internal use	SystemInternal	0	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
5	Unprivileged	Pseudogroup for internal use	SystemInternal	0	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
7	UserEquiv	ACL equiv. for user 6	ACLEquivalence	6	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
8	Owner	\N	RT::System-Role	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
9	Requestor	\N	RT::System-Role	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
10	Cc	\N	RT::System-Role	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
11	AdminCc	\N	RT::System-Role	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
12	HeldBy	\N	RT::System-Role	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
13	Contact	\N	RT::System-Role	1	1	2010-10-28 12:40:57	1	2010-10-28 12:40:57
15	UserEquiv	ACL equiv. for user 14	ACLEquivalence	14	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
16	AdminCc	\N	RT::Queue-Role	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
17	Cc	\N	RT::Queue-Role	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
18	Owner	\N	RT::Queue-Role	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
19	Requestor	\N	RT::Queue-Role	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
20	AdminCc	\N	RT::Queue-Role	2	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
21	Cc	\N	RT::Queue-Role	2	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
22	Owner	\N	RT::Queue-Role	2	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
23	Requestor	\N	RT::Queue-Role	2	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
24	Owner	\N	RT::Catalog-Role	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
25	HeldBy	\N	RT::Catalog-Role	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
26	Contact	\N	RT::Catalog-Role	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
27	DutyTeam	Duty Team Members	UserDefined	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
28	AdminCc	\N	RT::Queue-Role	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
29	Cc	\N	RT::Queue-Role	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
30	Owner	\N	RT::Queue-Role	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
31	Requestor	\N	RT::Queue-Role	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
32	AdminCc	\N	RT::Queue-Role	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
33	Cc	\N	RT::Queue-Role	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
34	Owner	\N	RT::Queue-Role	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
35	Requestor	\N	RT::Queue-Role	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
36	AdminCc	\N	RT::Queue-Role	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
37	Cc	\N	RT::Queue-Role	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
38	Owner	\N	RT::Queue-Role	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
39	Requestor	\N	RT::Queue-Role	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
40	AdminCc	\N	RT::Queue-Role	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
41	Cc	\N	RT::Queue-Role	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
42	Owner	\N	RT::Queue-Role	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
43	Requestor	\N	RT::Queue-Role	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
45	UserEquiv	ACL equiv. for user 44	ACLEquivalence	44	14	2010-10-28 12:44:10	14	2010-10-28 12:44:10
47	UserEquiv	ACL equiv. for user 46	ACLEquivalence	46	14	2010-10-28 12:45:22	14	2010-10-28 12:45:22
49	UserEquiv	ACL equiv. for user 48	ACLEquivalence	48	14	2010-10-28 12:46:15	14	2010-10-28 12:46:15
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.links (id, base, target, type, localtarget, localbase, lastupdatedby, lastupdated, creator, created) FROM stdin;
1	dashboard://example.local/1	savedsearch://example.local/1	DependsOn	0	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	dashboard://example.local/1	savedsearch://example.local/2	DependsOn	0	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
3	dashboard://example.local/1	savedsearch://example.local/3	DependsOn	0	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
4	attribute://example.local/5	dashboard://example.local/1	DependsOn	0	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
5	dashboard://example.local/2	savedsearch://example.local/5	DependsOn	0	0	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
6	dashboard://example.local/2	savedsearch://example.local/4	DependsOn	0	0	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
7	dashboard://example.local/2	savedsearch://example.local/7	DependsOn	0	0	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
8	dashboard://example.local/2	savedsearch://example.local/6	DependsOn	0	0	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
9	attribute://example.local/15	dashboard://example.local/2	DependsOn	0	0	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
\.


--
-- Data for Name: objectclasses; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.objectclasses (id, class, objecttype, objectid, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	1	RT::System	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	2	RT::Queue	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
3	2	RT::Queue	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
4	2	RT::Queue	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
5	2	RT::Queue	6	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
\.


--
-- Data for Name: objectcontents; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.objectcontents (id, objecttype, objectid, contentencoding, content, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
1	RT::SavedSearch	1	json	{"Format":"'<a href=\\"__WebPath__/Ticket/Display.html?id=__id__\\">__id__</a>/TITLE:#','<a href=\\"__WebPath__/Ticket/Display.html?id=__id__\\">__Subject__</a>/TITLE:Subject',Priority, QueueName, ExtendedStatus","Order":"DESC","OrderBy":"Priority","Query":" Owner = '__CurrentUser__' AND Status = '__Active__'"}	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
2	RT::SavedSearch	2	json	{"Format":"'<a href=\\"__WebPath__/Ticket/Display.html?id=__id__\\">__id__</a>/TITLE:#','<a href=\\"__WebPath__/Ticket/Display.html?id=__id__\\">__Subject__</a>/TITLE:Subject',QueueName, ExtendedStatus, CreatedRelative, '<A HREF=\\"__WebPath__/Ticket/Display.html?Action=Take&id=__id__\\">__loc(Take)__</a>/TITLE:NBSP'","Order":"DESC","OrderBy":"Created","Query":" Owner = 'Nobody' AND Status = '__Active__'"}	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
3	RT::SavedSearch	3	json	{"Format":"'<a href=\\"__WebPath__/Ticket/Display.html?id=__id__\\">__id__</a>/TITLE:#','<a href=\\"__WebPath__/Ticket/Display.html?id=__id__\\">__Subject__</a>/TITLE:Subject',Priority, QueueName, ExtendedStatus, Bookmark","Order":"DESC","OrderBy":"LastUpdated","Query":"id = '__Bookmarked__'"}	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
4	RT::Dashboard	1	json	{"Elements":[{"Elements":[[{"description":"Ticket: My Tickets","id":1,"portlet_type":"search"},{"description":"Ticket: Unowned Tickets","id":2,"portlet_type":"search"},{"description":"Ticket: Bookmarked Tickets","id":3,"portlet_type":"search"},{"component":"QuickCreate","description":"QuickCreate","path":"/Elements/QuickCreate","portlet_type":"component"}],[{"component":"MyReminders","description":"MyReminders","path":"/Elements/MyReminders","portlet_type":"component"},{"component":"QueueList","description":"QueueList","path":"/Elements/QueueList","portlet_type":"component"},{"component":"Dashboards","description":"Dashboards","path":"/Elements/Dashboards","portlet_type":"component"}]],"Layout":"col-md-8,col-md-4"}]}	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
5	RT::SavedSearch	4	json	{"ExtraQueryParams":"RTIR","Format":"'<b><a href=\\"__RTIRTicketURI__\\">__id__</a></b>/TITLE:#','<b><a href=\\"__RTIRTicketURI__\\">__Subject__</a></b>/TITLE:Subject',Requestors,OwnerName,DueRelative,QueueName,Take","Order":"ASC|ASC|ASC|ASC","OrderBy":"Due","Query":"Lifecycle = 'incident_reports' AND Status = 'new'","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
6	RT::SavedSearch	5	json	{"ExtraQueryParams":"RTIR","Format":"'<b><a href=\\"__RTIRTicketURI__\\">__id__</a></b>/TITLE:#','<b><a href=\\"__RTIRTicketURI__\\">__Subject__</a></b>/TITLE:Subject',DueRelative, OwnerName, __Priority__,'UnreadMessages/TITLE:Updates'","Order":"ASC|DESC|ASC|ASC","OrderBy":"Due|Priority","Query":"Lifecycle = 'incidents' AND Status = '__Active__' AND Owner = '__CurrentUser__'","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
7	RT::SavedSearch	6	json	{"ExtraQueryParams":"RTIR","Format":"'<b><a href=\\"__RTIRTicketURI__\\">__id__</a></b>/TITLE:#','<b><a href=\\"__RTIRTicketURI__\\">__Subject__</a></b>/TITLE:Subject',DueRelative, OwnerName, __Priority__,'UnreadMessages/TITLE:Updates'","Order":"ASC|DESC|ASC|ASC","OrderBy":"Due|Priority","Query":"Lifecycle = 'incidents' AND Status = '__Active__' AND Owner = 'Nobody'","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
8	RT::SavedSearch	7	json	{"ExtraQueryParams":"RTIR","Format":"'<b><a href=\\"__RTIRTicketURI__\\">__id__</a></b>/TITLE:#','<b><a href=\\"__RTIRTicketURI__\\">__Subject__</a></b>/TITLE:Subject',DueRelative, OwnerName, __Priority__,'UnreadMessages/TITLE:Updates'","Order":"ASC|DESC|ASC|ASC","OrderBy":"Due|Priority","Query":"Lifecycle = 'incidents' AND Status = '__Active__'","RTIR":1,"RTIRSearchEnabled":1,"RowsPerPage":10}	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
9	RT::Dashboard	2	json	{"Elements":[{"Elements":[[{"description":"Ticket: New unlinked Incident Reports","id":4,"portlet_type":"search"},{"description":"Ticket: Most due incidents I own","id":5,"portlet_type":"search"},{"description":"Ticket: Most due unowned incidents","id":6,"portlet_type":"search"},{"description":"Ticket: Most due incidents","id":7,"portlet_type":"search"}],[{"component":"/RTIR/Elements/WorkWithConstituency","description":"/RTIR/Elements/WorkWithConstituency","path":"/RTIR/Elements/WorkWithConstituency","portlet_type":"component"},{"component":"/RTIR/Elements/QueueSummary","description":"/RTIR/Elements/QueueSummary","path":"/RTIR/Elements/QueueSummary","portlet_type":"component"}]],"Layout":"col-md-8,col-md-4"}]}	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
\.


--
-- Data for Name: objectcustomfields; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.objectcustomfields (id, customfield, objectid, sortorder, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	1	0	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	2	0	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
3	3	3	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
4	3	4	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
5	3	5	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
6	3	6	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
7	4	3	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
8	5	3	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
9	6	3	2	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
10	7	3	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
11	7	4	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
12	7	5	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
13	7	6	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
14	8	4	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
15	9	4	2	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
16	10	3	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
17	10	4	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
18	10	5	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
19	10	6	1	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
20	11	6	2	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
21	12	6	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
22	13	6	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
23	14	4	4	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
24	15	5	2	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
25	16	3	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
26	16	4	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
27	16	5	3	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
28	16	6	5	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
29	17	2	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
\.


--
-- Data for Name: objectcustomfieldvalues; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.objectcustomfieldvalues (id, customfield, objecttype, objectid, sortorder, content, largecontent, contenttype, contentencoding, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
1	1	RT::Article	1	0	This is the content of the process for handling spam	\N	\N		1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
2	1	RT::Article	2	0	This is the content of the process for handling system compromise	\N	\N		1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
3	1	RT::Article	3	0	This is the content of the process for handling queries	\N	\N		1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
4	1	RT::Article	4	0	This is the content of the process for handling scans	\N	\N		1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
5	1	RT::Article	5	0	This is the content of the process for handling denial of service	\N	\N		1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
6	1	RT::Article	6	0	This is the content of the process for handling piracy	\N	\N		1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
\.


--
-- Data for Name: objectcustomroles; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.objectcustomroles (id, customrole, objectid, sortorder, creator, created, lastupdatedby, lastupdated) FROM stdin;
\.


--
-- Data for Name: objectscrips; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.objectscrips (id, scrip, stage, objectid, sortorder, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	1	TransactionCreate	0	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	2	TransactionCreate	0	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
3	3	TransactionCreate	0	2	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
4	4	TransactionCreate	0	3	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
5	5	TransactionCreate	0	4	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
6	6	TransactionCreate	0	5	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
7	7	TransactionCreate	0	6	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
8	8	TransactionCreate	0	7	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
9	9	TransactionCreate	0	8	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
10	10	TransactionCreate	0	9	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
11	11	TransactionCreate	0	10	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
12	12	TransactionCreate	0	11	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
13	13	TransactionCreate	0	12	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
14	14	TransactionCreate	0	13	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
15	15	TransactionCreate	0	14	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
16	16	TransactionCreate	0	15	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
17	17	TransactionCreate	0	16	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
18	18	TransactionCreate	4	17	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
19	19	TransactionCreate	6	17	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
20	20	TransactionCreate	4	18	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
21	21	TransactionCreate	4	19	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
22	22	TransactionCreate	4	20	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
23	23	TransactionCreate	4	21	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
24	23	TransactionCreate	5	17	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
25	23	TransactionCreate	6	18	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
26	24	TransactionCreate	3	17	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
27	25	TransactionCreate	3	18	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
28	26	TransactionCreate	3	19	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
29	27	TransactionCreate	4	22	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
30	27	TransactionCreate	5	18	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
31	27	TransactionCreate	6	19	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
32	28	TransactionCreate	4	23	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
33	28	TransactionCreate	5	19	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
34	28	TransactionCreate	6	20	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
35	29	TransactionCreate	3	20	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
36	30	TransactionCreate	6	21	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
37	31	TransactionCreate	3	21	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
38	31	TransactionCreate	4	24	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
39	31	TransactionCreate	5	20	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
40	31	TransactionCreate	6	22	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
41	32	TransactionCreate	3	22	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
42	32	TransactionCreate	4	25	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
43	32	TransactionCreate	5	21	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
44	32	TransactionCreate	6	23	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
45	33	TransactionCreate	3	23	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
46	33	TransactionCreate	4	26	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
47	33	TransactionCreate	5	22	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
48	33	TransactionCreate	6	24	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
49	34	TransactionCreate	3	24	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
50	34	TransactionCreate	4	27	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
51	34	TransactionCreate	5	23	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
52	34	TransactionCreate	6	25	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
53	35	TransactionCreate	3	25	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
54	35	TransactionCreate	4	28	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
55	35	TransactionCreate	5	24	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
56	35	TransactionCreate	6	26	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
57	36	TransactionCreate	3	26	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
58	36	TransactionCreate	4	29	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
59	36	TransactionCreate	5	25	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
60	36	TransactionCreate	6	27	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
61	37	TransactionCreate	4	30	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
62	38	TransactionCreate	3	27	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
63	38	TransactionCreate	4	31	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
64	38	TransactionCreate	5	26	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
65	38	TransactionCreate	6	28	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
66	39	TransactionCreate	3	28	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
67	39	TransactionCreate	4	32	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
68	39	TransactionCreate	5	27	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
69	39	TransactionCreate	6	29	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
70	40	TransactionCreate	3	29	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
71	40	TransactionCreate	4	33	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
72	40	TransactionCreate	5	28	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
73	40	TransactionCreate	6	30	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
74	41	TransactionCreate	4	34	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
\.


--
-- Data for Name: objecttopics; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.objecttopics (id, topic, objecttype, objectid) FROM stdin;
\.


--
-- Data for Name: principals; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.principals (id, principaltype, disabled) FROM stdin;
1	User	0
2	Group	0
3	Group	0
4	Group	0
5	Group	0
6	User	0
7	Group	0
8	Group	0
9	Group	0
10	Group	0
11	Group	0
12	Group	0
13	Group	0
14	User	0
15	Group	0
16	Group	0
17	Group	0
18	Group	0
19	Group	0
20	Group	0
21	Group	0
22	Group	0
23	Group	0
24	Group	0
25	Group	0
26	Group	0
27	Group	0
28	Group	0
29	Group	0
30	Group	0
31	Group	0
32	Group	0
33	Group	0
34	Group	0
35	Group	0
36	Group	0
37	Group	0
38	Group	0
39	Group	0
40	Group	0
41	Group	0
42	Group	0
43	Group	0
44	User	0
45	Group	0
46	User	0
47	Group	0
48	User	0
49	Group	0
\.


--
-- Data for Name: queues; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.queues (id, name, description, correspondaddress, commentaddress, lifecycle, subjecttag, sortorder, creator, created, lastupdatedby, lastupdated, sladisabled, disabled) FROM stdin;
1	General	The default queue			default	\N	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	1	0
2	___Approvals	A system-internal queue for the approvals system			approvals	\N	0	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	1	2
3	Incidents				incidents	\N	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	1	0
4	Incident Reports				incident_reports	\N	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0	0
5	Investigations				investigations	\N	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0	0
6	Countermeasures				countermeasures	\N	0	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59	0	0
\.


--
-- Data for Name: savedsearches; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.savedsearches (id, name, description, type, principalid, creator, created, lastupdatedby, lastupdated, disabled) FROM stdin;
1	My Tickets	[_1] highest priority tickets I own	Ticket	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
2	Unowned Tickets	[_1] newest unowned tickets	Ticket	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
3	Bookmarked Tickets	Bookmarked Tickets	Ticket	1	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58	0
4	New unlinked Incident Reports	New unlinked Incident Reports	Ticket	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
5	My most due incidents	Most due incidents I own	Ticket	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
6	Most due unowned incidents	Most due unowned incidents	Ticket	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
7	Most due incidents	Most due incidents	Ticket	1	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00	0
\.


--
-- Data for Name: scripactions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scripactions (id, name, description, execmodule, argument, lookuptype, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	Autoreply To Requestors	Always sends a message to the requestors independent of message sender	Autoreply	Requestor	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	Notify Requestors	Sends a message to the requestors	Notify	Requestor	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
3	Notify Owner as Comment	Sends mail to the owner	NotifyAsComment	Owner	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
4	Notify Owner	Sends mail to the owner	Notify	Owner	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
5	Notify Ccs as Comment	Sends mail to the Ccs as a comment	NotifyAsComment	Cc	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
6	Notify Ccs	Sends mail to the Ccs	Notify	Cc	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
7	Notify AdminCcs as Comment	Sends mail to the administrative Ccs as a comment	NotifyAsComment	AdminCc	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
8	Notify AdminCcs	Sends mail to the administrative Ccs	Notify	AdminCc	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
9	Notify Owner and AdminCcs	Sends mail to the Owner and administrative Ccs	Notify	Owner,AdminCc	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
10	Notify Owner or AdminCcs	Sends mail to the Owner if set, otherwise administrative Ccs	NotifyOwnerOrAdminCc	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
11	Notify Requestors and Ccs as Comment	Send mail to requestors and Ccs as a comment	NotifyAsComment	Requestor,Cc	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
12	Notify Requestors and Ccs	Send mail to requestors and Ccs	Notify	Requestor,Cc	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
13	Notify Owner, Requestors, Ccs and AdminCcs as Comment	Send mail to owner and all watchers as a "comment"	NotifyAsComment	All	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
14	Notify Owner, Requestors, Ccs and AdminCcs	Send mail to owner and all watchers	Notify	All	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
15	Notify Other Recipients as Comment	Sends mail to explicitly listed Ccs and Bccs	NotifyAsComment	OtherRecipients	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
16	Notify Other Recipients	Sends mail to explicitly listed Ccs and Bccs	Notify	OtherRecipients	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
17	User Defined	Perform a user-defined action	UserDefined	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
18	Create Tickets	Create new tickets based on this scrip's template	CreateTickets	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
19	Open Tickets	Open tickets on correspondence	AutoOpen	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
20	Open Inactive Tickets	Open inactive tickets	AutoOpenInactive	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
21	Extract Subject Tag	Extract tags from a Transaction's subject and add them to the Ticket's subject.	ExtractSubjectTag	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
22	Send Forward	Send forwarded message	SendForward	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
23	Set starts date according to SLA	Set the starts date according to an agreement	SLA_SetStarts	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
24	Set due date according to SLA	Set the due date according to an agreement	SLA_SetDue	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
25	Clear Custom Field Value Template	Template action for clearing a custom field. Use "Copy Action" to create an action for s specific custom field.	ClearCustomFieldValues	Your Custom Field Name Or Id	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
26	User Defined	Perform a user-defined action	UserDefined	\N	RT::Catalog-RT::Asset	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
27	User Defined	Perform a user-defined action	UserDefined	\N	RT::Class-RT::Article	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
28	RTIR Set Incident Due	Set the due date of parent Incident	RTIR_SetDueIncident	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
29	RTIR Set How Reported	Set how the Incident Report was reported	RTIR_SetHowReported	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
30	RTIR Resolve Children	Resolve an Incident's children	RTIR_ResolveChildren	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
31	RTIR Change Child Ownership	Change the ownership of Incident's children	RTIR_ChangeChildOwnership	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
32	RTIR Change Parent Ownership	Change the ownership of the parent Incident	RTIR_ChangeParentOwnership	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
33	RTIR Open Parent	Open the parent Incident when a child reopens	RTIR_OpenParent	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
34	RTIR Set Countermeasure Status	Set the status of a Countermeasure	RTIR_SetCountermeasureStatus	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
35	RTIR Set Incident Resolution	Set the default resolution of an Incident	RTIR_SetIncidentResolution	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
36	RTIR parse message for IPs	Set IP custom field from message content	RTIR_FindIP	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
37	RTIR merge IPs	Merge multiple IPs on ticket merge	RTIR_MergeIPs	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
38	RTIR Activate Ticket	Set status to first active possible	RTIR_Activate	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
39	RTIR Change Child Constituencies	Move all tickets related to an incident to a new constituency	RTIR_ChangeChildConstituencies	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
40	RTIR parse message for Domains	Set Domain custom field from message content	RTIR_FindDomain	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
41	RTIR merge Domains	Merge multiple Domains on ticket merge	RTIR_MergeDomains	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
42	RTIR parse message for CVEs	Set CVE custom field from message content	RTIR_FindCVE	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
43	RTIR merge CVEs	Merge multiple CVEs on ticket merge	RTIR_MergeCVEs	\N	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
\.


--
-- Data for Name: scripconditions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scripconditions (id, name, description, execmodule, argument, applicabletranstypes, lookuptype, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	On Create	When a ticket is created	AnyTransaction	\N	Create	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	On Create Via Email	When a ticket is created via Email	ViaInterface	Email	Create	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
3	On Create Via Web	When a ticket is created via Web	ViaInterface	Web,Mobile	Create	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
4	On Transaction	When anything happens	AnyTransaction	\N	Any	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
5	On Correspond	Whenever correspondence comes in	AnyTransaction	\N	Correspond	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
6	On Forward	Whenever a ticket or transaction is forwarded	AnyTransaction	\N	Forward Transaction,Forward Ticket	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
7	On Forward Ticket	Whenever a ticket is forwarded	AnyTransaction	\N	Forward Ticket	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
8	On Forward Transaction	Whenever a transaction is forwarded	AnyTransaction	\N	Forward Transaction	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
9	On Comment	Whenever comments come in	AnyTransaction	\N	Comment	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
10	On Status Change	Whenever a ticket's status changes	AnyTransaction	\N	Status	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
11	On Priority Change	Whenever a ticket's priority changes	PriorityChange	\N	Set	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
12	On Owner Change	Whenever a ticket's owner changes	OwnerChange	\N	Any	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
13	On Queue Change	Whenever a ticket's queue changes	QueueChange	\N	Set	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
14	On Resolve	Whenever a ticket is resolved	StatusChange	resolved	Status	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
15	On Reject	Whenever a ticket is rejected	StatusChange	rejected	Status	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
16	User Defined	Whenever a user-defined condition occurs	UserDefined	\N	Any	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
17	On Close	Whenever a ticket is closed	CloseTicket	\N	Status,Set	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
18	On Reopen	Whenever a ticket is reopened	ReopenTicket	\N	Status,Set	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
19	Require Starts set according to SLA	Detect a situation when we should set Starts date	SLA_RequireStartsSet	\N	Create,Set	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
20	Require Due set according to SLA	Detect a situation when we should set Due date	SLA_RequireDueSet	\N	Create,Correspond,Set,Status	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
21	On TimeWorked Change	When TimeWorked Change	TimeWorkedChange	\N	Any	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
22	User Defined	Whenever a user-defined condition occurs	UserDefined	\N	Any	RT::Catalog-RT::Asset	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
23	On Transaction	When anything happens	AnyTransaction	\N	Any	RT::Catalog-RT::Asset	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
24	On Create	When an asset is created	AnyTransaction	\N	Create	RT::Catalog-RT::Asset	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
25	On Status Change	Whenever an asset's status changes	AnyTransaction	\N	Status	RT::Catalog-RT::Asset	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
26	User Defined	Whenever a user-defined condition occurs	UserDefined	\N	Any	RT::Class-RT::Article	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
27	On Transaction	When anything happens	AnyTransaction	\N	Any	RT::Class-RT::Article	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
28	On Create	When an article is created	AnyTransaction	\N	Create	RT::Class-RT::Article	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
29	RTIR Customer Response	Detect an external response	RTIR_CustomerResponse	\N	Correspond	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
30	RTIR Staff Response	Detect an internal response	RTIR_StaffResponse	\N	Correspond	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
31	RTIR Close Ticket	A ticket is rejected or resolved	StatusChange	old: initial, active; new: inactve	Any	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
32	RTIR Reopen Ticket	A closed ticket is reopened	StatusChange	old: inactive; new: initial, active	Any	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
33	RTIR Require Due Change	The due date of the parent incident must be changed	RTIR_RequireDueChange	\N	Any	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
34	RTIR Linking To Incident	Whenever ticket is linked to incident or created with link	RTIR_LinkingToIncident	\N	Create,AddLink	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
35	RTIR Merge	Whenever ticket is merged into another one	RTIR_Merge	\N	AddLink	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
36	RTIR Require IRs Activation	Whenever it's time to activate report	RTIR_RequireReportActivation	\N	Correspond	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
\.


--
-- Data for Name: scrips; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scrips (id, description, scripcondition, scripaction, customisapplicablecode, custompreparecode, customcommitcode, disabled, template, lookuptype, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	On Comment Notify AdminCcs as Comment	9	7	\N	\N	\N	0	Admin Comment in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
2	On Comment Notify Other Recipients as Comment	9	15	\N	\N	\N	0	Correspondence in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
3	On Correspond Notify Owner and AdminCcs	5	9	\N	\N	\N	0	Admin Correspondence in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
4	On Correspond Notify Other Recipients	5	16	\N	\N	\N	0	Correspondence in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
5	On Correspond Notify Requestors and Ccs	5	12	\N	\N	\N	0	Correspondence in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
6	On Correspond Open Inactive Tickets	5	20	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
7	On Create Autoreply To Requestors	1	1	\N	\N	\N	0	Autoreply in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
8	On Create Notify Owner and AdminCcs	1	9	\N	\N	\N	0	Transaction in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
9	On Create Notify Ccs	1	6	\N	\N	\N	0	Correspondence in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
10	On Create Notify Other Recipients	1	16	\N	\N	\N	0	Correspondence in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
11	On Owner Change Notify Owner	12	4	\N	\N	\N	0	Transaction in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
12	On Resolve Notify Requestors	14	2	\N	\N	\N	0	Resolved in HTML	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
13	On transaction, add any tags in the transaction's subject to the ticket's subject	4	21	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
14	On Forward Transaction Send forwarded message	8	22	\N	\N	\N	0	Forward	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
15	On Forward Ticket Send forwarded message	7	22	\N	\N	\N	0	Forward Ticket	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
16	Set starts date if needed according to SLA	19	23	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
17	Set due date if needed according to SLA	20	24	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:58	1	2010-10-28 12:40:58
18	SetHowReported	1	29	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
19	On Correspond Change Status of the Countermeasure	5	34	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
20	On Linking To Incident Activate Report	34	38	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
21	On Correspond (not every) Activate Report	36	38	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
22	On Linking To Incident Copy IPs	34	37	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
23	Set Due Date On Incident	33	28	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
24	ResolveAllChildren	10	30	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
25	Propagate Constituency Changes	13	39	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
26	FixOwnership	12	31	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
27	FixOwnership	12	32	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
28	ReopenIncident	10	33	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
29	SetDefaultIncidentResolution	10	35	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
30	NotifyOnClose	31	2	\N	\N	\N	0	CountermeasureRemoved	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
31	SetIPFromContent	5	36	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
32	SetIPFromContent	1	36	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
33	MergeIPs	35	37	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
34	SetDomainFromContent	5	40	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
35	SetDomainFromContent	1	40	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
36	MergeDomains	35	41	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:40:59	1	2010-10-28 12:40:59
37	On Linking To Incident Copy Domains	34	41	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
38	SetCVEFromContent	5	42	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
39	SetCVEFromContent	1	42	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
40	MergeCVEs	35	43	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
41	On Linking To Incident Copy CVEs	34	43	\N	\N	\N	0	Blank	RT::Queue-RT::Ticket	1	2010-10-28 12:41:00	1	2010-10-28 12:41:00
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sessions (id, a_session, lastupdated) FROM stdin;
9be0e7d7a8ee28ca88e839fdf8415ae9	\\x425173444141414142434d4141414145556b56545641514441414141415151444141414141516f424c77414141414e31636d774141414167596d59344d575a6c4d44597a4d5755334d6a67340a4f544135597a4d314f4467344d6a6b344e6a56685954494141414149546d5634644642685a32554b49446c695a54426c4e3251335954686c5a544934593245344f4755344d7a6c6d5a4759340a4e44453159575535414141414331397a5a584e7a6157397558326c6b434959414141414261513d3d0a	2010-10-28 12:49:43.544593
\.


--
-- Data for Name: shorteners; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.shorteners (id, code, content, permanent, creator, created, lastupdatedby, lastupdated, lastaccessedby, lastaccessed) FROM stdin;
1	e5b1c18e	Format='%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__id__%3C%2Fa%3E%2FTITLE%3A%23'%2C'%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__Subject__%3C%2Fa%3E%2FTITLE%3ASubject'%2CPriority%2C+QueueName%2C+ExtendedStatus&Order=DESC&OrderBy=Priority&Query=+Owner+%3D+'__CurrentUser__'+AND+Status+%3D+'__Active__'	0	14	2010-10-28 12:41:57	14	2010-10-28 12:41:57	14	2010-10-28 12:41:57
2	a5b363a4	Format='%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__id__%3C%2Fa%3E%2FTITLE%3A%23'%2C'%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__Subject__%3C%2Fa%3E%2FTITLE%3ASubject'%2CQueueName%2C+ExtendedStatus%2C+CreatedRelative%2C+'%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3FAction%3DTake%26amp%3Bid%3D__id__%22%3ETake%3C%2Fa%3E%2FTITLE%3ANBSP'&Order=DESC&OrderBy=Created&Query=+Owner+%3D+'Nobody'+AND+Status+%3D+'__Active__'	0	14	2010-10-28 12:41:57	14	2010-10-28 12:41:57	14	2010-10-28 12:41:57
3	1ca4eda9	Format='%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__id__%3C%2Fa%3E%2FTITLE%3A%23'%2C'%3Ca+href%3D%22__WebPath__%2FTicket%2FDisplay.html%3Fid%3D__id__%22%3E__Subject__%3C%2Fa%3E%2FTITLE%3ASubject'%2CPriority%2C+QueueName%2C+ExtendedStatus%2C+Bookmark&Order=DESC&OrderBy=LastUpdated&Query=id+%3D+'__Bookmarked__'	0	14	2010-10-28 12:41:57	14	2010-10-28 12:41:57	14	2010-10-28 12:41:57
\.


--
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.templates (id, objectid, name, description, type, content, lookuptype, lastupdated, lastupdatedby, creator, created) FROM stdin;
1	0	Blank	A blank template	Perl		RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
2	0	Autoreply	Plain text Autoresponse template	Perl	Subject: AutoReply: {$Ticket->Subject}\n\n\nGreetings,\n\nThis message has been automatically generated in response to the\ncreation of a trouble ticket regarding:\n        "{$Ticket->Subject()}", \na summary of which appears below.\n\nThere is no need to reply to this message right now.  Your ticket has been\nassigned an ID of { $Ticket->SubjectTag }.\n\nPlease include the string:\n\n         { $Ticket->SubjectTag }\n\nin the subject line of all future correspondence about this issue. To do so, \nyou may reply to this message.\n\n                        Thank you,\n                        {$Ticket->QueueObj->CorrespondAddress()}\n\n-------------------------------------------------------------------------\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
3	0	Autoreply in HTML	HTML Autoresponse template	Perl	Subject: AutoReply: {$Ticket->Subject}\nContent-Type: text/html\n\n<p>Greetings,</p>\n\n<p>This message has been automatically generated in response to the\ncreation of a trouble ticket regarding <b>{$Ticket->Subject()}</b>,\na summary of which appears below.</p>\n\n<p>There is no need to reply to this message right now.  Your ticket has been\nassigned an ID of <b>{$Ticket->SubjectTag}</b>.</p>\n\n<p>Please include the string <b>{$Ticket->SubjectTag}</b>\nin the subject line of all future correspondence about this issue. To do so,\nyou may reply to this message.</p>\n\n<p>Thank you,<br/>\n{$Ticket->QueueObj->CorrespondAddress()}</p>\n\n<hr/>\n{$Transaction->Content(Type => 'text/html')}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
4	0	Transaction	Plain text transaction template	Perl	RT-Attach-Message: yes\n\n\n{$Transaction->CreatedAsString}: Request {$Ticket->id} was acted upon.\n Transaction: {$Transaction->Description}\n       Queue: {$Ticket->QueueObj->Name}\n     Subject: {$Transaction->Subject || $Ticket->Subject || "(No subject given)"}\n       Owner: {$Ticket->OwnerObj->Name}\n  Requestors: {$Ticket->RequestorAddresses}\n      Status: {$Ticket->Status}\n Ticket <URL: {RT->Config->Get('WebURL')}Ticket/Display.html?id={$Ticket->id} >\n\n\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
5	0	Transaction in HTML	HTML transaction template	Perl	RT-Attach-Message: yes\nContent-Type: text/html\n\n<b>{$Transaction->CreatedAsString}: Request <a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{$Ticket->id}</a> was acted upon by {$Transaction->CreatorObj->Name}.</b>\n<br>\n<table border="0">\n<tr><td align="right"><b>Transaction:</b></td><td>{$Transaction->Description}</td></tr>\n<tr><td align="right"><b>Queue:</b></td><td>{$Ticket->QueueObj->Name}</td></tr>\n<tr><td align="right"><b>Subject:</b></td><td>{$Transaction->Subject || $Ticket->Subject || "(No subject given)"} </td></tr>\n<tr><td align="right"><b>Owner:</b></td><td>{$Ticket->OwnerObj->Name}</td></tr>\n<tr><td align="right"><b>Requestors:</b></td><td>{$Ticket->RequestorAddresses}</td></tr>\n<tr><td align="right"><b>Status:</b></td><td>{$Ticket->Status}</td></tr>\n<tr><td align="right"><b>Ticket URL:</b></td><td><a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}</a></td></tr>\n</table>\n<br/>\n<br/>\n{$Transaction->Content( Type => "text/html")}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
6	2	Transaction in HTML	[no description]	Perl		RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
7	2	Transaction	[no description]	Perl		RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
8	0	Admin Correspondence	Plain text admin correspondence template	Perl	RT-Attach-Message: yes\n\n\n<URL: {RT->Config->Get('WebURL')}Ticket/Display.html?id={$Ticket->id} >\n\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
9	0	Admin Correspondence in HTML	HTML admin correspondence template	Perl	RT-Attach-Message: yes\nContent-Type: text/html\n\nTicket URL: <a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}</a>\n<br />\n<br />\n{$Transaction->Content(Type => "text/html");}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
10	0	Correspondence	Plain text correspondence template	Perl	RT-Attach-Message: yes\n\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
11	0	Correspondence in HTML	HTML correspondence template	Perl	RT-Attach-Message: yes\nContent-Type: text/html\n\n{$Transaction->Content( Type => "text/html")}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
12	0	Admin Comment	Plain text admin comment template	Perl	Subject: [Comment] {my $s=($Transaction->Subject||$Ticket->Subject||""); $s =~ s/\\[Comment\\]\\s*//g; $s =~ s/^Re:\\s*//i; $s;}\nRT-Attach-Message: yes\n\n\n{RT->Config->Get('WebURL')}Ticket/Display.html?id={$Ticket->id}\nThis is a comment.  It is not sent to the Requestor(s):\n\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
13	0	Admin Comment in HTML	HTML admin comment template	Perl	Subject: [Comment] {my $s=($Transaction->Subject||$Ticket->Subject||""); $s =~ s/\\[Comment\\]\\s*//g; $s =~ s/^Re:\\s*//i; $s;}\nRT-Attach-Message: yes\nContent-Type: text/html\n\n<p>This is a comment about <a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">ticket {$Ticket->id}</a>. It is not sent to the Requestor(s):</p>\n\n{$Transaction->Content(Type => "text/html")}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
14	0	Reminder	Default reminder template	Perl	Subject:{$Ticket->Subject} is due {$Ticket->DueObj->AsString}\n\nThis reminder is for ticket #{$Target = $Ticket->RefersTo->First->TargetObj;$Target->Id}.\n\n{RT->Config->Get('WebURL')}Ticket/Display.html?id={$Target->Id}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
15	0	Status Change	Ticket status changed	Perl	Subject: Status Changed to: {$Transaction->NewValue}\n\n\n{RT->Config->Get('WebURL')}Ticket/Display.html?id={$Ticket->id}\n\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
16	0	Status Change in HTML	HTML Ticket status changed	Perl	Subject: Status Changed to: {$Transaction->NewValue}\nContent-Type: text/html\n\n<a href="{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}">{RT->Config->Get("WebURL")}Ticket/Display.html?id={$Ticket->id}</a>\n<br/>\n<br/>\n{$Transaction->Content(Type => "text/html")}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
17	0	Resolved	Ticket Resolved	Perl	Subject: Resolved: {$Ticket->Subject}\n\nAccording to our records, your request has been resolved. If you have any\nfurther questions or concerns, please respond to this message.\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
18	0	Resolved in HTML	HTML Ticket Resolved	Perl	Subject: Resolved: {$Ticket->Subject}\nContent-Type: text/html\n\n<p>According to our records, your request has been resolved.  If you have any further questions or concerns, please respond to this message.</p>\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
19	2	New Pending Approval	Notify Owners and AdminCcs of new items pending their approval	Perl	Subject: New Pending Approval: {$Ticket->Subject}\n\nGreetings,\n\nThere is a new item pending your approval: "{$Ticket->Subject()}", \na summary of which appears below.\n\nPlease visit {RT->Config->Get('WebURL')}Approvals/Display.html?id={$Ticket->id}\nto approve or reject this ticket, or {RT->Config->Get('WebURL')}Approvals/ to\nbatch-process all your pending approvals.\n\n-------------------------------------------------------------------------\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
20	2	New Pending Approval in HTML	Notify Owners and AdminCcs of new items pending their approval	Perl	Subject: New Pending Approval: {$Ticket->Subject}\nContent-Type: text/html\n\n<p>Greetings,</p>\n\n<p>There is a new item pending your approval: <b>{$Ticket->Subject()}</b>,\na summary of which appears below.</p>\n\n<p>Please <a href="{RT->Config->Get('WebURL')}Approvals/Display.html?id={$Ticket->id}">approve\nor reject this ticket</a>, or visit the <a href="{RT->Config->Get('WebURL')}Approvals/">approvals\noverview</a> to batch-process all your pending approvals.</p>\n\n<hr />\n{$Transaction->Content()}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
21	2	Approval Passed	Notify Requestor of their ticket has been approved by some approver	Perl	Subject: Ticket Approved: {$Ticket->Subject}\n\nGreetings,\n\nYour ticket has been approved by { eval { $Approver->Name } }.\nOther approvals may be pending.\n\nApprover's notes: { $Notes }\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
22	2	Approval Passed in HTML	Notify Requestor of their ticket has been approved by some approver	Perl	Subject: Ticket Approved: {$Ticket->Subject}\nContent-Type: text/html\n\n<p>Greetings,</p>\n\n<p>Your ticket has been approved by <b>{ eval { $Approver->Name } }</b>.\nOther approvals may be pending.</p>\n\n<p>Approver's notes:</p>\n<blockquote>{ $Notes }</blockquote>\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
23	2	All Approvals Passed	Notify Requestor of their ticket has been approved by all approvers	Perl	Subject: Ticket Approved: {$Ticket->Subject}\n\nGreetings,\n\nYour ticket has been approved by { eval { $Approver->Name } }.\nIts Owner may now start to act on it.\n\nApprover's notes: { $Notes }\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
24	2	All Approvals Passed in HTML	Notify Requestor of their ticket has been approved by all approvers	Perl	Subject: Ticket Approved: {$Ticket->Subject}\nContent-Type: text/html\n\n<p>Greetings,</p>\n\n<p>Your ticket has been approved by <b>{ eval { $Approver->Name } }</b>.\nIts Owner may now start to act on it.</p>\n\n<p>Approver's notes:</p>\n<blockquote>{ $Notes }</blockquote>\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
25	2	Approval Rejected	Notify Owner of their rejected ticket	Perl	Subject: Ticket Rejected: {$Ticket->Subject}\n\nGreetings,\n\nYour ticket has been rejected by { eval { $Approver->Name } }.\n\nApprover's notes: { $Notes }\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
26	2	Approval Rejected in HTML	Notify Owner of their rejected ticket	Perl	Subject: Ticket Rejected: {$Ticket->Subject}\nContent-Type: text/html\n\n<p>Greetings,</p>\n\n<p>Your ticket has been rejected by <b>{ eval { $Approver->Name } }</b>.</p>\n\n<p>Approver's notes:</p>\n<blockquote>{ $Notes }</blockquote>\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
27	2	Approval Ready for Owner	Notify Owner of their ticket has been approved and is ready to be acted on	Perl	Subject: Ticket Approved: {$Ticket->Subject}\n\nGreetings,\n\nThe ticket has been approved, you may now start to act on it.\n\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
28	2	Approval Ready for Owner in HTML	Notify Owner of their ticket has been approved and is ready to be acted on	Perl	Subject: Ticket Approved: {$Ticket->Subject}\nContent-Type: text/html\n\n<p>Greetings,</p>\n\n<p>The ticket has been approved, you may now start to act on it.</p>\n\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
29	0	Forward	Forwarded message	Perl	\n\n{ $ForwardTransaction->Content =~ /\\S/ ? $ForwardTransaction->Content : "This is a forward of transaction #".$Transaction->id." of ticket #". $Ticket->id }\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
30	0	Forward Ticket	Forwarded ticket message	Perl	\n\n{ $ForwardTransaction->Content =~ /\\S/ ? $ForwardTransaction->Content : "This is a forward of ticket #". $Ticket->id }\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
31	0	Error: unencrypted message	Inform user that their unencrypted mail has been rejected	Perl	Subject: RT requires that all incoming mail be encrypted\n\nYou received this message because RT received mail from you that was not encrypted.  As such, it has been rejected.\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
32	0	Error: public key	Inform user that he has problems with public key and couldn't recieve encrypted content	Perl	Subject: Your public key in RT is missing or unusable\n\nYou received this message because we were unable to encrypt a message to your public key, either because it is missing or has a problem.  Please inform the administrator about the problem.\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
33	0	Error to RT owner: public key	Inform RT owner that user(s) have problems with public keys	Perl	Subject: Some users have problems with public keys\n\nYou received this message as RT has problems with public keys of the following user:\n{\n    foreach my $e ( @BadRecipients ) {\n        $OUT .= "* ". $e->{'Message'} ."\\n";\n    }\n}	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
34	0	Error: no private key	Inform user that we received an encrypted email and we have no private keys to decrypt	Perl	Subject: we received message we cannot decrypt\n\nYou sent an encrypted message with subject '{ $Message->head->get('Subject') }',\nbut we have no private key it's encrypted to.\n\nPlease, check that you encrypt messages with correct keys\nor contact the system administrator.	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
35	0	Error: bad encrypted data	Inform user that a message he sent has invalid encryption data	Perl	Subject: We received a message we cannot handle\n\nYou sent us a message that we cannot handle due to corrupted signature or encrypted block. we get the following error(s):\n{ foreach my $msg ( @Messages ) {\n    $OUT .= "* $msg\\n";\n  }\n}	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
36	0	PasswordChange	Inform user that his password has been reset	Perl	Subject: [{RT->Config->Get('rtname')}] Password reset\n\nGreetings,\n\nSomeone at {$ENV{'REMOTE_ADDR'}} requested a password reset for you on {RT->Config->Get('WebURL')}\n\nYour new password is:\n  {$NewPassword}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
37	0	Email Digest	Email template for periodic notification digests	Perl	Subject: RT Email Digest\n\n{ $Argument }\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
38	0	Error: Missing dashboard	Inform user that a dashboard he subscribed to is missing	Perl	Subject: [{RT->Config->Get('rtname')}] Missing dashboard!\n\nGreetings,\n\nYou are subscribed to a dashboard that is currently missing. Most likely, the dashboard was deleted.\n\nRT will remove this subscription as it is no longer useful. Here's the information RT had about your subscription:\n\nDashboardID:  { $SubscriptionObj->SubValue('DashboardId') }\nFrequency:    { $SubscriptionObj->SubValue('Frequency') }\nHour:         { $SubscriptionObj->SubValue('Hour') }\n{\n    $SubscriptionObj->SubValue('Frequency') eq 'weekly'\n    ? "Day of week:  " . $SubscriptionObj->SubValue('Dow')\n    : $SubscriptionObj->SubValue('Frequency') eq 'monthly'\n      ? "Day of month: " . $SubscriptionObj->SubValue('Dom')\n      : ''\n}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
39	0	Auth tokens expiring in 7 days in HTML	Auth tokens expiring in 7 days	Perl	Subject: [{RT->Config->Get('rtname')}] You have auth tokens that will expire in 7 days\nContent-Type: text/html\n\n<p>Hello { $UserObj->RealName || $UserObj->Name }:</p>\n\n<p>\nThe following tokens will expire within the next 7 days:\n<ul>\n{\n    for my $token (@AuthTokens) {\n        $OUT .= '<li>' . $token->Description .  ' (expires at ' . $token->ExpiresObj->AsString . ')</li>';\n    }\n}\n</ul>\n</p>\n\n{\n    if (   $UserObj->HasRight( Right => 'ModifySelf', Object => RT->System )\n        && $UserObj->HasRight( Right => 'ManageAuthTokens', Object => RT->System ) )\n    {\n        $OUT .= '<p>You can revoke them and generate new ones on the <a href="' . RT->Config->Get('WebURL') . 'Prefs/AuthTokens.html' . '">Auth Tokens</a> page in RT.</p>';\n    }\n    else {\n        $OUT .= "<p>If you are still using them, please contact your RT manager to generate new ones for you.</p>";\n    }\n}\n	RT::Queue-RT::Ticket	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
40	0	Blank	A blank template	Perl		RT::Catalog-RT::Asset	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
41	0	Blank	A blank template	Perl		RT::Class-RT::Article	2010-10-28 12:40:58	1	1	2010-10-28 12:40:58
42	6	Autoreply	Sent when a countermeasure is created	Perl	RT-Attach-Message: yes\nSubject: { $Ticket->Subject }\n\n{ $Transaction->Content }\n\n{ my $output = "";\n  my @mailfields = ( "IP", "Netmask", "Port", "Where Blocked" );\n\n  my $CustomFields = $Ticket->QueueObj->TicketCustomFields;\n  while ( my $CustomField = $CustomFields->Next ) {\n    my $name = $CustomField->Name;\n    next unless grep lc $_ eq lc $name, @mailfields;\n\n    my $Values = $Ticket->CustomFieldValues( $CustomField->Id );\n    while ( my $Value = $Values->Next ) {\n      $output .= $name .": ". $Value->Content ."\\n";\n    }\n  }\n  return $output;\n}\n-------------------------------------------------------------------------\nPlease include the string:\n\n         [{ $Ticket->SubjectTag } #{ $Ticket->id }]\n\nin the subject line of all future correspondence about this issue. To do so, \nyou may reply to this message.\n\n                        Thank you,\n                        { $Ticket->QueueObj->CorrespondAddress }	RT::Queue-RT::Ticket	2010-10-28 12:40:59	1	1	2010-10-28 12:40:59
43	6	CountermeasureRemoved	Sent when a countermeasure is removed	Perl	Subject: {$Ticket->Subject}\n\nCountermeasure #{$Ticket->id} was removed.\n\n{ my $output = "";\n  my @mailfields = ( "IP", "Netmask", "Port", "Where Blocked" );\n\n  my $CustomFields = $Ticket->QueueObj->TicketCustomFields;\n  while ( my $CustomField = $CustomFields->Next ) {\n    my $name = $CustomField->Name;\n    next unless grep lc $_ eq lc $name, @mailfields;\n\n    my $Values = $Ticket->CustomFieldValues( $CustomField->Id );\n    while ( my $Value = $Values->Next ) {\n      $output .= $name .": ". $Value->Content ."\\n";\n    }\n  }\n  return $output;\n}\n-------------------------------------------------------------------------\nPlease include the string:\n\n         [{ $Ticket->SubjectTag } #{$Ticket->id}]\n\nin the subject line of all future correspondence about this issue. To do so, \nyou may reply to this message.\n\n                        Thank you,\n                        {$Ticket->QueueObj->CorrespondAddress()}	RT::Queue-RT::Ticket	2010-10-28 12:40:59	1	1	2010-10-28 12:40:59
44	5	Autoreply	Sent when an investigation is launched	Perl	RT-Attach-Message: yes\nSubject: {$Ticket->Subject}\n\n{$Transaction->Content()}\n\n-------------------------------------------------------------------------\nPlease include the string:\n\n         [{ $Ticket->SubjectTag } #{$Ticket->id}]\n\nin the subject line of all future correspondence about this issue. To do so, \nyou may reply to this message.\n\n                        Thank you,\n                        {$Ticket->QueueObj->CorrespondAddress()}	RT::Queue-RT::Ticket	2010-10-28 12:40:59	1	1	2010-10-28 12:40:59
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.tickets (id, effectiveid, ismerged, queue, type, owner, subject, description, initialpriority, finalpriority, priority, timeestimated, timeworked, status, sla, timeleft, told, starts, started, due, resolved, lastupdatedby, lastupdated, creator, created) FROM stdin;
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.topics (id, parent, name, description, objecttype, objectid) FROM stdin;
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.transactions (id, objecttype, objectid, timetaken, timeworker, timeworkeddate, type, field, oldvalue, newvalue, referencetype, oldreference, newreference, data, creator, created) FROM stdin;
1	RT::Group	3	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
2	RT::Group	4	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
3	RT::Group	5	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
4	RT::User	6	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
5	RT::System	1	0	0	\N	GrantRight	7	\N	OwnTicket	\N	\N	\N		1	2010-10-28 12:40:57
6	RT::Group	8	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
7	RT::Group	9	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
8	RT::Group	10	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
9	RT::Group	11	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
10	RT::Group	12	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
11	RT::Group	13	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:57
12	RT::User	14	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
13	RT::Group	16	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
14	RT::Group	17	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
15	RT::Group	18	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
16	RT::Group	19	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
17	RT::Queue	1	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
18	RT::Group	20	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
19	RT::Group	21	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
20	RT::Group	22	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
21	RT::Group	23	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
22	RT::Queue	2	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
23	RT::Group	24	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
24	RT::Group	25	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
25	RT::Group	26	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
26	RT::Catalog	1	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
27	RT::System	1	0	0	\N	GrantRight	15	\N	SuperUser	\N	\N	\N		1	2010-10-28 12:40:58
28	RT::System	1	0	0	\N	GrantRight	4	\N	ShowApprovalsTab	\N	\N	\N		1	2010-10-28 12:40:58
29	RT::System	1	0	0	\N	GrantRight	4	\N	ShowSearchAdvanced	\N	\N	\N		1	2010-10-28 12:40:58
30	RT::System	1	0	0	\N	GrantRight	4	\N	ShowSearchBulkUpdate	\N	\N	\N		1	2010-10-28 12:40:58
31	RT::System	1	0	0	\N	GrantRight	4	\N	SeeSavedSearch	\N	\N	\N		1	2010-10-28 12:40:58
32	RT::SavedSearch	1	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
33	RT::SavedSearch	2	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
34	RT::SavedSearch	3	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
35	RT::Dashboard	1	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:58
36	RT::Group	27	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
37	RT::Group	28	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
38	RT::Group	29	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
39	RT::Group	30	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
40	RT::Group	31	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
41	RT::Queue	3	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
42	RT::Group	32	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
43	RT::Group	33	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
44	RT::Group	34	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
45	RT::Group	35	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
46	RT::Queue	4	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
47	RT::Group	36	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
48	RT::Group	37	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
49	RT::Group	38	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
50	RT::Group	39	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
51	RT::Queue	5	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
52	RT::Group	40	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
53	RT::Group	41	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
54	RT::Group	42	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
55	RT::Group	43	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
56	RT::Queue	6	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
57	RT::Article	1	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
58	RT::Article	2	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
59	RT::Article	3	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
60	RT::Article	4	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
61	RT::Article	5	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
62	RT::Article	6	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:40:59
63	RT::Queue	3	0	0	\N	GrantRight	30	\N	ModifyTicket	\N	\N	\N		1	2010-10-28 12:40:59
64	RT::Queue	4	0	0	\N	GrantRight	34	\N	ModifyTicket	\N	\N	\N		1	2010-10-28 12:40:59
65	RT::Queue	5	0	0	\N	GrantRight	38	\N	ModifyTicket	\N	\N	\N		1	2010-10-28 12:40:59
66	RT::Queue	6	0	0	\N	GrantRight	42	\N	ModifyTicket	\N	\N	\N		1	2010-10-28 12:40:59
67	RT::Queue	3	0	0	\N	GrantRight	27	\N	CreateTicket	\N	\N	\N		1	2010-10-28 12:40:59
68	RT::Queue	3	0	0	\N	GrantRight	27	\N	ShowTemplate	\N	\N	\N		1	2010-10-28 12:40:59
69	RT::Queue	3	0	0	\N	GrantRight	27	\N	OwnTicket	\N	\N	\N		1	2010-10-28 12:40:59
70	RT::Queue	3	0	0	\N	GrantRight	27	\N	CommentOnTicket	\N	\N	\N		1	2010-10-28 12:40:59
71	RT::Queue	3	0	0	\N	GrantRight	27	\N	SeeQueue	\N	\N	\N		1	2010-10-28 12:40:59
72	RT::Queue	3	0	0	\N	GrantRight	27	\N	ShowTicket	\N	\N	\N		1	2010-10-28 12:40:59
73	RT::Queue	3	0	0	\N	GrantRight	27	\N	ShowTicketComments	\N	\N	\N		1	2010-10-28 12:40:59
74	RT::Queue	3	0	0	\N	GrantRight	27	\N	StealTicket	\N	\N	\N		1	2010-10-28 12:40:59
75	RT::Queue	3	0	0	\N	GrantRight	27	\N	TakeTicket	\N	\N	\N		1	2010-10-28 12:40:59
76	RT::Queue	3	0	0	\N	GrantRight	27	\N	Watch	\N	\N	\N		1	2010-10-28 12:40:59
77	RT::Queue	3	0	0	\N	GrantRight	27	\N	ShowOutgoingEmail	\N	\N	\N		1	2010-10-28 12:40:59
78	RT::Queue	3	0	0	\N	GrantRight	27	\N	ForwardMessage	\N	\N	\N		1	2010-10-28 12:40:59
79	RT::Queue	4	0	0	\N	GrantRight	27	\N	CreateTicket	\N	\N	\N		1	2010-10-28 12:40:59
80	RT::Queue	4	0	0	\N	GrantRight	27	\N	ShowTemplate	\N	\N	\N		1	2010-10-28 12:40:59
81	RT::Queue	4	0	0	\N	GrantRight	27	\N	OwnTicket	\N	\N	\N		1	2010-10-28 12:40:59
82	RT::Queue	4	0	0	\N	GrantRight	27	\N	CommentOnTicket	\N	\N	\N		1	2010-10-28 12:40:59
83	RT::Queue	4	0	0	\N	GrantRight	27	\N	SeeQueue	\N	\N	\N		1	2010-10-28 12:40:59
84	RT::Queue	4	0	0	\N	GrantRight	27	\N	ShowTicket	\N	\N	\N		1	2010-10-28 12:40:59
85	RT::Queue	4	0	0	\N	GrantRight	27	\N	ShowTicketComments	\N	\N	\N		1	2010-10-28 12:40:59
86	RT::Queue	4	0	0	\N	GrantRight	27	\N	StealTicket	\N	\N	\N		1	2010-10-28 12:40:59
87	RT::Queue	4	0	0	\N	GrantRight	27	\N	TakeTicket	\N	\N	\N		1	2010-10-28 12:40:59
88	RT::Queue	4	0	0	\N	GrantRight	27	\N	Watch	\N	\N	\N		1	2010-10-28 12:40:59
89	RT::Queue	4	0	0	\N	GrantRight	27	\N	ShowOutgoingEmail	\N	\N	\N		1	2010-10-28 12:40:59
90	RT::Queue	4	0	0	\N	GrantRight	27	\N	ForwardMessage	\N	\N	\N		1	2010-10-28 12:40:59
91	RT::Queue	5	0	0	\N	GrantRight	27	\N	CreateTicket	\N	\N	\N		1	2010-10-28 12:40:59
92	RT::Queue	5	0	0	\N	GrantRight	27	\N	ShowTemplate	\N	\N	\N		1	2010-10-28 12:40:59
93	RT::Queue	5	0	0	\N	GrantRight	27	\N	OwnTicket	\N	\N	\N		1	2010-10-28 12:40:59
94	RT::Queue	5	0	0	\N	GrantRight	27	\N	CommentOnTicket	\N	\N	\N		1	2010-10-28 12:40:59
95	RT::Queue	5	0	0	\N	GrantRight	27	\N	SeeQueue	\N	\N	\N		1	2010-10-28 12:40:59
96	RT::Queue	5	0	0	\N	GrantRight	27	\N	ShowTicket	\N	\N	\N		1	2010-10-28 12:40:59
97	RT::Queue	5	0	0	\N	GrantRight	27	\N	ShowTicketComments	\N	\N	\N		1	2010-10-28 12:40:59
98	RT::Queue	5	0	0	\N	GrantRight	27	\N	StealTicket	\N	\N	\N		1	2010-10-28 12:40:59
99	RT::Queue	5	0	0	\N	GrantRight	27	\N	TakeTicket	\N	\N	\N		1	2010-10-28 12:40:59
100	RT::Queue	5	0	0	\N	GrantRight	27	\N	Watch	\N	\N	\N		1	2010-10-28 12:40:59
101	RT::Queue	5	0	0	\N	GrantRight	27	\N	ShowOutgoingEmail	\N	\N	\N		1	2010-10-28 12:40:59
102	RT::Queue	5	0	0	\N	GrantRight	27	\N	ForwardMessage	\N	\N	\N		1	2010-10-28 12:40:59
103	RT::Queue	6	0	0	\N	GrantRight	27	\N	CreateTicket	\N	\N	\N		1	2010-10-28 12:40:59
104	RT::Queue	6	0	0	\N	GrantRight	27	\N	ShowTemplate	\N	\N	\N		1	2010-10-28 12:40:59
105	RT::Queue	6	0	0	\N	GrantRight	27	\N	OwnTicket	\N	\N	\N		1	2010-10-28 12:40:59
106	RT::Queue	6	0	0	\N	GrantRight	27	\N	CommentOnTicket	\N	\N	\N		1	2010-10-28 12:40:59
107	RT::Queue	6	0	0	\N	GrantRight	27	\N	SeeQueue	\N	\N	\N		1	2010-10-28 12:40:59
108	RT::Queue	6	0	0	\N	GrantRight	27	\N	ShowTicket	\N	\N	\N		1	2010-10-28 12:40:59
109	RT::Queue	6	0	0	\N	GrantRight	27	\N	ShowTicketComments	\N	\N	\N		1	2010-10-28 12:40:59
110	RT::Queue	6	0	0	\N	GrantRight	27	\N	StealTicket	\N	\N	\N		1	2010-10-28 12:40:59
111	RT::Queue	6	0	0	\N	GrantRight	27	\N	TakeTicket	\N	\N	\N		1	2010-10-28 12:40:59
112	RT::Queue	6	0	0	\N	GrantRight	27	\N	Watch	\N	\N	\N		1	2010-10-28 12:40:59
113	RT::Queue	6	0	0	\N	GrantRight	27	\N	ShowOutgoingEmail	\N	\N	\N		1	2010-10-28 12:40:59
114	RT::Queue	6	0	0	\N	GrantRight	27	\N	ForwardMessage	\N	\N	\N		1	2010-10-28 12:40:59
115	RT::Queue	5	0	0	\N	GrantRight	3	\N	ReplyToTicket	\N	\N	\N		1	2010-10-28 12:40:59
116	RT::Queue	4	0	0	\N	GrantRight	3	\N	CreateTicket	\N	\N	\N		1	2010-10-28 12:40:59
117	RT::Queue	4	0	0	\N	GrantRight	3	\N	ReplyToTicket	\N	\N	\N		1	2010-10-28 12:40:59
118	RT::Queue	6	0	0	\N	GrantRight	3	\N	ReplyToTicket	\N	\N	\N		1	2010-10-28 12:40:59
119	RT::System	1	0	0	\N	GrantRight	27	\N	ModifySelf	\N	\N	\N		1	2010-10-28 12:40:59
120	RT::System	1	0	0	\N	GrantRight	27	\N	SeeOwnSavedSearch	\N	\N	\N		1	2010-10-28 12:40:59
121	RT::System	1	0	0	\N	GrantRight	27	\N	AdminOwnSavedSearch	\N	\N	\N		1	2010-10-28 12:40:59
122	RT::System	1	0	0	\N	GrantRight	27	\N	SeeGroupSavedSearch	\N	\N	\N		1	2010-10-28 12:40:59
123	RT::System	1	0	0	\N	GrantRight	27	\N	AdminGroupSavedSearch	\N	\N	\N		1	2010-10-28 12:40:59
124	RT::System	1	0	0	\N	GrantRight	27	\N	SeeOwnDashboard	\N	\N	\N		1	2010-10-28 12:40:59
125	RT::System	1	0	0	\N	GrantRight	27	\N	AdminOwnDashboard	\N	\N	\N		1	2010-10-28 12:40:59
126	RT::System	1	0	0	\N	GrantRight	27	\N	SeeGroupDashboard	\N	\N	\N		1	2010-10-28 12:40:59
127	RT::System	1	0	0	\N	GrantRight	27	\N	AdminGroupDashboard	\N	\N	\N		1	2010-10-28 12:40:59
128	RT::System	1	0	0	\N	GrantRight	27	\N	LoadSavedSearch	\N	\N	\N		1	2010-10-28 12:40:59
129	RT::System	1	0	0	\N	GrantRight	27	\N	AdminSavedSearch	\N	\N	\N		1	2010-10-28 12:40:59
130	RT::CustomField	2	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
131	RT::CustomField	2	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
132	RT::CustomField	3	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
133	RT::CustomField	3	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
134	RT::CustomField	4	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
135	RT::CustomField	4	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
136	RT::CustomField	5	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
137	RT::CustomField	5	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
138	RT::CustomField	6	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
139	RT::CustomField	6	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
140	RT::CustomField	7	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
141	RT::CustomField	7	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
142	RT::CustomField	8	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
143	RT::CustomField	8	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
144	RT::CustomField	9	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
145	RT::CustomField	9	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
146	RT::CustomField	10	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
147	RT::CustomField	10	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
148	RT::CustomField	11	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
149	RT::CustomField	11	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
150	RT::CustomField	12	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
151	RT::CustomField	12	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
152	RT::CustomField	13	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
153	RT::CustomField	13	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
154	RT::CustomField	14	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
155	RT::CustomField	14	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
156	RT::CustomField	15	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
157	RT::CustomField	15	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
158	RT::CustomField	16	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:40:59
159	RT::CustomField	16	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:40:59
160	RT::Article	1	0	0	\N	CustomField	1	\N	\N	RT::ObjectCustomFieldValue	\N	1	\N	1	2010-10-28 12:41:00
161	RT::Article	2	0	0	\N	CustomField	1	\N	\N	RT::ObjectCustomFieldValue	\N	2	\N	1	2010-10-28 12:41:00
162	RT::Article	3	0	0	\N	CustomField	1	\N	\N	RT::ObjectCustomFieldValue	\N	3	\N	1	2010-10-28 12:41:00
163	RT::Article	4	0	0	\N	CustomField	1	\N	\N	RT::ObjectCustomFieldValue	\N	4	\N	1	2010-10-28 12:41:00
164	RT::Article	5	0	0	\N	CustomField	1	\N	\N	RT::ObjectCustomFieldValue	\N	5	\N	1	2010-10-28 12:41:00
165	RT::Article	6	0	0	\N	CustomField	1	\N	\N	RT::ObjectCustomFieldValue	\N	6	\N	1	2010-10-28 12:41:00
166	RT::SavedSearch	4	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:41:00
167	RT::SavedSearch	5	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:41:00
168	RT::SavedSearch	6	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:41:00
169	RT::SavedSearch	7	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:41:00
170	RT::Class	2	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:41:00
171	RT::CustomField	17	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:41:00
172	RT::CustomField	17	0	0	\N	GrantRight	27	\N	ModifyCustomField	\N	\N	\N		1	2010-10-28 12:41:00
173	RT::Class	2	0	0	\N	GrantRight	27	\N	AdminClass	\N	\N	\N		1	2010-10-28 12:41:00
174	RT::Class	2	0	0	\N	GrantRight	27	\N	AdminTopics	\N	\N	\N		1	2010-10-28 12:41:00
175	RT::Class	2	0	0	\N	GrantRight	27	\N	CreateArticle	\N	\N	\N		1	2010-10-28 12:41:00
176	RT::Class	2	0	0	\N	GrantRight	27	\N	ModifyArticle	\N	\N	\N		1	2010-10-28 12:41:00
177	RT::Class	2	0	0	\N	GrantRight	27	\N	ModifyArticleTopics	\N	\N	\N		1	2010-10-28 12:41:00
178	RT::Class	2	0	0	\N	GrantRight	27	\N	SeeClass	\N	\N	\N		1	2010-10-28 12:41:00
179	RT::Class	2	0	0	\N	GrantRight	27	\N	ShowArticle	\N	\N	\N		1	2010-10-28 12:41:00
180	RT::Class	2	0	0	\N	GrantRight	27	\N	ShowArticleHistory	\N	\N	\N		1	2010-10-28 12:41:00
181	RT::System	1	0	0	\N	GrantRight	27	\N	ShowArticlesMenu	\N	\N	\N		1	2010-10-28 12:41:00
182	RT::Dashboard	2	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	1	2010-10-28 12:41:00
183	RT::Class	3	0	0	\N	GrantRight	27	\N	ShowArticle	\N	\N	\N		1	2010-10-28 12:41:00
184	RT::Class	3	0	0	\N	GrantRight	27	\N	SeeCustomField	\N	\N	\N		1	2010-10-28 12:41:00
185	RT::Class	3	0	0	\N	GrantRight	27	\N	AdminClass	\N	\N	\N		1	2010-10-28 12:41:00
186	RT::Class	3	0	0	\N	GrantRight	27	\N	AdminTopics	\N	\N	\N		1	2010-10-28 12:41:00
187	RT::Class	3	0	0	\N	GrantRight	27	\N	CreateArticle	\N	\N	\N		1	2010-10-28 12:41:00
188	RT::Class	3	0	0	\N	GrantRight	27	\N	ModifyArticle	\N	\N	\N		1	2010-10-28 12:41:00
189	RT::Class	3	0	0	\N	GrantRight	27	\N	ModifyArticleTopics	\N	\N	\N		1	2010-10-28 12:41:00
190	RT::Class	3	0	0	\N	GrantRight	27	\N	SeeClass	\N	\N	\N		1	2010-10-28 12:41:00
191	RT::Class	3	0	0	\N	GrantRight	27	\N	ShowArticleHistory	\N	\N	\N		1	2010-10-28 12:41:00
192	RT::System	1	0	0	\N	GrantRight	4	\N	SeeOwnSavedSearch	\N	\N	\N		14	2010-10-28 12:43:02
193	RT::System	1	0	0	\N	GrantRight	4	\N	ShowAssetsMenu	\N	\N	\N		14	2010-10-28 12:43:02
194	RT::System	1	0	0	\N	GrantRight	4	\N	ShowTicketComments	\N	\N	\N		14	2010-10-28 12:43:02
195	RT::System	1	0	0	\N	GrantRight	4	\N	ForwardMessage	\N	\N	\N		14	2010-10-28 12:43:02
196	RT::System	1	0	0	\N	GrantRight	4	\N	StealTicket	\N	\N	\N		14	2010-10-28 12:43:02
197	RT::System	1	0	0	\N	GrantRight	4	\N	SeeCustomField	\N	\N	\N		14	2010-10-28 12:43:02
198	RT::System	1	0	0	\N	GrantRight	4	\N	SeeGroupSavedSearch	\N	\N	\N		14	2010-10-28 12:43:02
199	RT::System	1	0	0	\N	GrantRight	4	\N	ManageAuthTokens	\N	\N	\N		14	2010-10-28 12:43:02
200	RT::System	1	0	0	\N	GrantRight	4	\N	ShowArticlesMenu	\N	\N	\N		14	2010-10-28 12:43:02
201	RT::System	1	0	0	\N	GrantRight	4	\N	SeeClass	\N	\N	\N		14	2010-10-28 12:43:02
202	RT::System	1	0	0	\N	GrantRight	4	\N	AdminOwnDashboard	\N	\N	\N		14	2010-10-28 12:43:02
203	RT::System	1	0	0	\N	GrantRight	4	\N	CreateTicket	\N	\N	\N		14	2010-10-28 12:43:02
204	RT::System	1	0	0	\N	GrantRight	4	\N	SeeGroup	\N	\N	\N		14	2010-10-28 12:43:02
205	RT::System	1	0	0	\N	GrantRight	4	\N	ShowOutgoingEmail	\N	\N	\N		14	2010-10-28 12:43:02
206	RT::System	1	0	0	\N	GrantRight	4	\N	CommentOnTicket	\N	\N	\N		14	2010-10-28 12:43:02
207	RT::System	1	0	0	\N	GrantRight	4	\N	ModifySelf	\N	\N	\N		14	2010-10-28 12:43:02
208	RT::System	1	0	0	\N	GrantRight	4	\N	SeeQueue	\N	\N	\N		14	2010-10-28 12:43:02
209	RT::System	1	0	0	\N	GrantRight	4	\N	SetInitialCustomField	\N	\N	\N		14	2010-10-28 12:43:02
210	RT::System	1	0	0	\N	GrantRight	4	\N	LoadSavedSearch	\N	\N	\N		14	2010-10-28 12:43:02
211	RT::System	1	0	0	\N	GrantRight	4	\N	SeeSelfServiceGroupTicket	\N	\N	\N		14	2010-10-28 12:43:02
212	RT::System	1	0	0	\N	GrantRight	4	\N	WatchAsAdminCc	\N	\N	\N		14	2010-10-28 12:43:02
213	RT::System	1	0	0	\N	GrantRight	4	\N	ShowGlobalTemplates	\N	\N	\N		14	2010-10-28 12:43:02
214	RT::System	1	0	0	\N	GrantRight	4	\N	ModifyTicket	\N	\N	\N		14	2010-10-28 12:43:02
215	RT::System	1	0	0	\N	GrantRight	4	\N	SeeOwnDashboard	\N	\N	\N		14	2010-10-28 12:43:02
216	RT::System	1	0	0	\N	GrantRight	4	\N	ReplyToTicket	\N	\N	\N		14	2010-10-28 12:43:02
217	RT::System	1	0	0	\N	GrantRight	4	\N	CreateArticle	\N	\N	\N		14	2010-10-28 12:43:02
218	RT::System	1	0	0	\N	GrantRight	4	\N	ShowCatalog	\N	\N	\N		14	2010-10-28 12:43:02
219	RT::System	1	0	0	\N	GrantRight	4	\N	ReassignTicket	\N	\N	\N		14	2010-10-28 12:43:02
220	RT::System	1	0	0	\N	GrantRight	4	\N	DisableArticle	\N	\N	\N		14	2010-10-28 12:43:02
221	RT::System	1	0	0	\N	GrantRight	4	\N	ModifyAsset	\N	\N	\N		14	2010-10-28 12:43:02
222	RT::System	1	0	0	\N	GrantRight	4	\N	ShowArticleHistory	\N	\N	\N		14	2010-10-28 12:43:02
223	RT::System	1	0	0	\N	GrantRight	4	\N	AdminOwnSavedSearch	\N	\N	\N		14	2010-10-28 12:43:02
224	RT::System	1	0	0	\N	GrantRight	4	\N	ShowUserHistory	\N	\N	\N		14	2010-10-28 12:43:02
225	RT::System	1	0	0	\N	GrantRight	4	\N	Watch	\N	\N	\N		14	2010-10-28 12:43:02
226	RT::System	1	0	0	\N	GrantRight	4	\N	ModifyGroupLinks	\N	\N	\N		14	2010-10-28 12:43:02
227	RT::System	1	0	0	\N	GrantRight	4	\N	SeeGroupDashboard	\N	\N	\N		14	2010-10-28 12:43:02
228	RT::System	1	0	0	\N	GrantRight	4	\N	ShowAsset	\N	\N	\N		14	2010-10-28 12:43:02
229	RT::System	1	0	0	\N	GrantRight	4	\N	ModifyOwnMembership	\N	\N	\N		14	2010-10-28 12:43:02
230	RT::System	1	0	0	\N	GrantRight	4	\N	SeeDashboard	\N	\N	\N		14	2010-10-28 12:43:02
231	RT::System	1	0	0	\N	GrantRight	4	\N	DeleteTicket	\N	\N	\N		14	2010-10-28 12:43:02
232	RT::System	1	0	0	\N	GrantRight	4	\N	ModifyArticle	\N	\N	\N		14	2010-10-28 12:43:02
233	RT::System	1	0	0	\N	GrantRight	4	\N	ModifyCustomField	\N	\N	\N		14	2010-10-28 12:43:02
234	RT::System	1	0	0	\N	GrantRight	4	\N	OwnTicket	\N	\N	\N		14	2010-10-28 12:43:02
235	RT::System	1	0	0	\N	GrantRight	4	\N	ModifyArticleTopics	\N	\N	\N		14	2010-10-28 12:43:02
236	RT::System	1	0	0	\N	GrantRight	4	\N	ShowArticle	\N	\N	\N		14	2010-10-28 12:43:02
237	RT::System	1	0	0	\N	GrantRight	4	\N	CreateAsset	\N	\N	\N		14	2010-10-28 12:43:02
238	RT::System	1	0	0	\N	GrantRight	4	\N	TakeTicket	\N	\N	\N		14	2010-10-28 12:43:02
239	RT::System	1	0	0	\N	GrantRight	4	\N	SubscribeDashboard	\N	\N	\N		14	2010-10-28 12:43:02
240	RT::System	1	0	0	\N	GrantRight	4	\N	ShowTicket	\N	\N	\N		14	2010-10-28 12:43:02
241	RT::User	44	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	14	2010-10-28 12:44:10
242	RT::User	44	0	0	\N	Set	Password	********	********	\N	\N	\N	\N	14	2010-10-28 12:44:11
243	RT::User	46	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	14	2010-10-28 12:45:22
244	RT::User	46	0	0	\N	Set	Password	********	********	\N	\N	\N	\N	14	2010-10-28 12:45:23
245	RT::User	48	0	0	\N	Create	\N	\N	\N	\N	\N	\N	\N	14	2010-10-28 12:46:15
246	RT::User	48	0	0	\N	Set	Password	********	********	\N	\N	\N	\N	14	2010-10-28 12:46:15
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, name, password, authtoken, comments, signature, emailaddress, freeformcontactinfo, organization, realname, nickname, lang, gecos, homephone, workphone, mobilephone, pagerphone, address1, address2, city, state, zip, country, timezone, smimecertificate, imagecontenttype, image, creator, created, lastupdatedby, lastupdated) FROM stdin;
1	RT_System	*NO-PASSWORD*	\N	Do not delete or modify this user. It is integral to RT's internal database structures	\N	\N	\N	\N	The RT System itself	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2026-01-29 12:40:57	1	2026-01-29 12:40:57
6	Nobody	*NO-PASSWORD*	\N	Do not delete or modify this user. It is integral to RT's internal data structures	\N		\N	\N	Nobody in particular	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2026-01-29 12:40:57	1	2026-01-29 12:40:57
44	tony	!bcrypt!12!QE8W8tgS3RqTnlSFIPxC6ug0/APMJLb/WZVAP/dxzAKCWk/GU1Q/q	\N	\N	Best regards\r\n\r\nTony - genius, inventor, Incident Handler	tony@localhost	\N	\N	Tony Stark	ironman	en	tony	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14	2011-01-29 12:44:10	14	2011-01-29 12:44:11
48	joker	!bcrypt!12!giCksf5PEWgJ48DCeksRaO0s1/R3mh0StPwQ1YVsNd2mPU1yY2lGu	\N	\N	Best regards\r\n\r\nJoker - chaos agent, prankster, Incident Handler	joker@localhost	\N	\N	The Joker	jo"ker;;😈	en	joker	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	UTC	\N	\N	\N	14	2015-04-25 12:46:15	14	2015-04-25 12:46:15
46	yoda	!bcrypt!12!4Ftt6e79y8Rktd117/SOZ.Vg5d89gItZC9/oUkwgMO0GUQDRYq8UO	\N	\N	Best regards\r\n\r\nYoda - Jedi Master, mentor, Incident Handler	yoda@localhost	\N	\N	Master Yoda	grandmaster	en	yoda	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	UTC	\N	\N	\N	14	2012-05-21 12:45:22	14	2012-05-21 12:45:23
14	root	!bcrypt!12!Ufy60KCVGtHa2BfbAlw8nuTh0qsujfSicB5tGInHSW9QWB.ssJi/u	\N	Yes, I am SuperUser	\N	admin@localhost	\N	\N	Jon Snow	WhiteWolf	en	root	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2010-01-29 12:40:58	1	2010-01-29 12:40:58
\.


--
-- Name: acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.acl_id_seq', 174, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.articles_id_seq', 6, true);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.assets_id_seq', 1, false);


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, false);


--
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.attributes_id_seq', 19, true);


--
-- Name: authtokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.authtokens_id_seq', 4, true);


--
-- Name: cachedgroupmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cachedgroupmembers_id_seq', 67, true);


--
-- Name: catalogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.catalogs_id_seq', 1, true);


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.classes_id_seq', 3, true);


--
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.configurations_id_seq', 1, false);


--
-- Name: customfields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.customfields_id_seq', 17, true);


--
-- Name: customfieldvalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.customfieldvalues_id_seq', 26, true);


--
-- Name: customroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.customroles_id_seq', 1, false);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 2, true);


--
-- Name: dashboardsubscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.dashboardsubscriptions_id_seq', 1, false);


--
-- Name: groupmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.groupmembers_id_seq', 24, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.links_id_seq', 9, true);


--
-- Name: objectclasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.objectclasses_id_seq', 5, true);


--
-- Name: objectcontents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.objectcontents_id_seq', 9, true);


--
-- Name: objectcustomfields_id_s; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.objectcustomfields_id_s', 29, true);


--
-- Name: objectcustomfieldvalues_id_s; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.objectcustomfieldvalues_id_s', 6, true);


--
-- Name: objectcustomroles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.objectcustomroles_id_seq', 1, false);


--
-- Name: objectscrips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.objectscrips_id_seq', 74, true);


--
-- Name: objecttopics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.objecttopics_id_seq', 1, false);


--
-- Name: principals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.principals_id_seq', 49, true);


--
-- Name: queues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.queues_id_seq', 6, true);


--
-- Name: savedsearches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.savedsearches_id_seq', 7, true);


--
-- Name: scripactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.scripactions_id_seq', 43, true);


--
-- Name: scripconditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.scripconditions_id_seq', 36, true);


--
-- Name: scrips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.scrips_id_seq', 41, true);


--
-- Name: shorteners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shorteners_id_seq', 3, true);


--
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.templates_id_seq', 44, true);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.topics_id_seq', 1, false);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.transactions_id_seq', 246, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: acl acl_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.acl
    ADD CONSTRAINT acl_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- Name: authtokens authtokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authtokens
    ADD CONSTRAINT authtokens_pkey PRIMARY KEY (id);


--
-- Name: cachedgroupmembers cachedgroupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cachedgroupmembers
    ADD CONSTRAINT cachedgroupmembers_pkey PRIMARY KEY (id);


--
-- Name: catalogs catalogs_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.catalogs
    ADD CONSTRAINT catalogs_pkey PRIMARY KEY (id);


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- Name: configurations configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- Name: customfields customfields_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customfields
    ADD CONSTRAINT customfields_pkey PRIMARY KEY (id);


--
-- Name: customfieldvalues customfieldvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customfieldvalues
    ADD CONSTRAINT customfieldvalues_pkey PRIMARY KEY (id);


--
-- Name: customroles customroles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.customroles
    ADD CONSTRAINT customroles_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: dashboardsubscriptions dashboardsubscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.dashboardsubscriptions
    ADD CONSTRAINT dashboardsubscriptions_pkey PRIMARY KEY (id);


--
-- Name: groupmembers groupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.groupmembers
    ADD CONSTRAINT groupmembers_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: objectclasses objectclasses_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objectclasses
    ADD CONSTRAINT objectclasses_pkey PRIMARY KEY (id);


--
-- Name: objectcontents objectcontents_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objectcontents
    ADD CONSTRAINT objectcontents_pkey PRIMARY KEY (id);


--
-- Name: objectcustomfields objectcustomfields_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objectcustomfields
    ADD CONSTRAINT objectcustomfields_pkey PRIMARY KEY (id);


--
-- Name: objectcustomfieldvalues objectcustomfieldvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objectcustomfieldvalues
    ADD CONSTRAINT objectcustomfieldvalues_pkey PRIMARY KEY (id);


--
-- Name: objectcustomroles objectcustomroles_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objectcustomroles
    ADD CONSTRAINT objectcustomroles_pkey PRIMARY KEY (id);


--
-- Name: objectscrips objectscrips_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objectscrips
    ADD CONSTRAINT objectscrips_pkey PRIMARY KEY (id);


--
-- Name: objecttopics objecttopics_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.objecttopics
    ADD CONSTRAINT objecttopics_pkey PRIMARY KEY (id);


--
-- Name: principals principals_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.principals
    ADD CONSTRAINT principals_pkey PRIMARY KEY (id);


--
-- Name: queues queues_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.queues
    ADD CONSTRAINT queues_pkey PRIMARY KEY (id);


--
-- Name: savedsearches savedsearches_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.savedsearches
    ADD CONSTRAINT savedsearches_pkey PRIMARY KEY (id);


--
-- Name: scripactions scripactions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scripactions
    ADD CONSTRAINT scripactions_pkey PRIMARY KEY (id);


--
-- Name: scripconditions scripconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scripconditions
    ADD CONSTRAINT scripconditions_pkey PRIMARY KEY (id);


--
-- Name: scrips scrips_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scrips
    ADD CONSTRAINT scrips_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: shorteners shorteners_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shorteners
    ADD CONSTRAINT shorteners_pkey PRIMARY KEY (id);


--
-- Name: templates templates_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: acl1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX acl1 ON public.acl USING btree (rightname, objecttype, objectid, principaltype, principalid);


--
-- Name: assetscatalog; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX assetscatalog ON public.assets USING btree (catalog);


--
-- Name: assetsname; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX assetsname ON public.assets USING btree (lower((name)::text));


--
-- Name: assetsstatus; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX assetsstatus ON public.assets USING btree (status);


--
-- Name: attachments1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX attachments1 ON public.attachments USING btree (parent);


--
-- Name: attachments2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX attachments2 ON public.attachments USING btree (transactionid);


--
-- Name: attachments3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX attachments3 ON public.attachments USING btree (parent, transactionid);


--
-- Name: attachments4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX attachments4 ON public.attachments USING btree (filename);


--
-- Name: attributes1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX attributes1 ON public.attributes USING btree (name);


--
-- Name: attributes2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX attributes2 ON public.attributes USING btree (objecttype, objectid);


--
-- Name: authtokensowner; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX authtokensowner ON public.authtokens USING btree (owner);


--
-- Name: cachedgroupmembers2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX cachedgroupmembers2 ON public.cachedgroupmembers USING btree (memberid, groupid, disabled);


--
-- Name: cachedgroupmembers3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX cachedgroupmembers3 ON public.cachedgroupmembers USING btree (memberid, immediateparentid);


--
-- Name: cachedgroupmembers4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX cachedgroupmembers4 ON public.cachedgroupmembers USING btree (via);


--
-- Name: catalogsdisabled; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogsdisabled ON public.catalogs USING btree (disabled);


--
-- Name: catalogsname; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogsname ON public.catalogs USING btree (lower((name)::text));


--
-- Name: configurations1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX configurations1 ON public.configurations USING btree (lower((name)::text), disabled);


--
-- Name: configurations2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX configurations2 ON public.configurations USING btree (disabled);


--
-- Name: customfieldvalues1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customfieldvalues1 ON public.customfieldvalues USING btree (customfield);


--
-- Name: dashboards1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboards1 ON public.dashboards USING btree (name);


--
-- Name: dashboards2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboards2 ON public.dashboards USING btree (principalid, disabled);


--
-- Name: dashboardsubscriptions1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboardsubscriptions1 ON public.dashboardsubscriptions USING btree (userid);


--
-- Name: dashboardsubscriptions2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dashboardsubscriptions2 ON public.dashboardsubscriptions USING btree (dashboardid);


--
-- Name: disgroumem; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX disgroumem ON public.cachedgroupmembers USING btree (groupid, memberid, disabled);


--
-- Name: groupmembers1; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX groupmembers1 ON public.groupmembers USING btree (groupid, memberid);


--
-- Name: groups1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX groups1 ON public.groups USING btree (lower((domain)::text), lower((name)::text), instance);


--
-- Name: groups2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX groups2 ON public.groups USING btree (instance);


--
-- Name: links1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX links1 ON public.links USING btree (base);


--
-- Name: links2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX links2 ON public.links USING btree (target);


--
-- Name: links3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX links3 ON public.links USING btree (localbase);


--
-- Name: links4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX links4 ON public.links USING btree (localtarget);


--
-- Name: links5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX links5 ON public.links USING btree (type);


--
-- Name: objectcontents1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX objectcontents1 ON public.objectcontents USING btree (objecttype, objectid, disabled);


--
-- Name: objectcustomfields1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX objectcustomfields1 ON public.objectcustomfields USING btree (objectid);


--
-- Name: objectcustomfieldvalues1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX objectcustomfieldvalues1 ON public.objectcustomfieldvalues USING btree (customfield, objecttype, objectid, content);


--
-- Name: objectcustomfieldvalues2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX objectcustomfieldvalues2 ON public.objectcustomfieldvalues USING btree (customfield, objecttype, objectid);


--
-- Name: objectcustomfieldvalues3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX objectcustomfieldvalues3 ON public.objectcustomfieldvalues USING btree (sortorder);


--
-- Name: objectcustomroles1; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX objectcustomroles1 ON public.objectcustomroles USING btree (objectid, customrole);


--
-- Name: objectscrips1; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX objectscrips1 ON public.objectscrips USING btree (objectid, scrip);


--
-- Name: queues1; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX queues1 ON public.queues USING btree (lower((name)::text));


--
-- Name: savedsearches1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX savedsearches1 ON public.savedsearches USING btree (name);


--
-- Name: savedsearches2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX savedsearches2 ON public.savedsearches USING btree (principalid, disabled);


--
-- Name: shorteners1; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX shorteners1 ON public.shorteners USING btree (code);


--
-- Name: tickets1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tickets1 ON public.tickets USING btree (queue, status);


--
-- Name: tickets2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tickets2 ON public.tickets USING btree (owner);


--
-- Name: tickets3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tickets3 ON public.tickets USING btree (effectiveid);


--
-- Name: tickets7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tickets7 ON public.tickets USING gin (to_tsvector('simple'::regconfig, description));


--
-- Name: transactions1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX transactions1 ON public.transactions USING btree (objecttype, objectid);


--
-- Name: users1; Type: INDEX; Schema: public; Owner: root
--

CREATE UNIQUE INDEX users1 ON public.users USING btree (lower((name)::text));


--
-- Name: users4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users4 ON public.users USING btree (lower((emailaddress)::text));


--
-- Name: cachedgroupmembers cachedgroupmembers_via_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cachedgroupmembers
    ADD CONSTRAINT cachedgroupmembers_via_fkey FOREIGN KEY (via) REFERENCES public.cachedgroupmembers(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict m1IRtodZEV7MwGi4UnkLOxO3xk1wUXHmn6psfGDBzx8DPeKcZSxoNzr9ddzzH5P

