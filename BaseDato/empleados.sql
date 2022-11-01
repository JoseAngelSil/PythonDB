--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    idempleado integer NOT NULL,
    nombre character varying(100),
    apepaterno character varying(50),
    apematerno character varying(50),
    fechaingre date,
    cargo character varying(80)
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- Name: empleado_idempleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_idempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_idempleado_seq OWNER TO postgres;

--
-- Name: empleado_idempleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_idempleado_seq OWNED BY public.empleado.idempleado;


--
-- Name: herramienta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.herramienta (
    idherramienta integer NOT NULL,
    empleado integer,
    nombre character varying(100),
    porcentdom double precision,
    timeexpe integer
);


ALTER TABLE public.herramienta OWNER TO postgres;

--
-- Name: herramienta_idherramienta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.herramienta_idherramienta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.herramienta_idherramienta_seq OWNER TO postgres;

--
-- Name: herramienta_idherramienta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.herramienta_idherramienta_seq OWNED BY public.herramienta.idherramienta;


--
-- Name: empleado idempleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN idempleado SET DEFAULT nextval('public.empleado_idempleado_seq'::regclass);


--
-- Name: herramienta idherramienta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.herramienta ALTER COLUMN idherramienta SET DEFAULT nextval('public.herramienta_idherramienta_seq'::regclass);


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (idempleado, nombre, apepaterno, apematerno, fechaingre, cargo) FROM stdin;
1	Jose angel	Silva	Cruz	2022-11-10	Programador Jr
2	Jose Antonio	Chavez	Santiago	2022-02-06	Programador Jr JAVA
3	Santiago	D├¡az	Cruz	2020-03-10	Programador Sr
\.


--
-- Data for Name: herramienta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.herramienta (idherramienta, empleado, nombre, porcentdom, timeexpe) FROM stdin;
1	1	Java	0.56	1
30	1	JAVA	0.56	1
31	2	Python	1	2
32	1	C++	0.23	1
33	2	Ruby	0.4	3
34	2	GO	0.23	1
35	1	C#	0.4	2
36	1	C	0.2	2
\.


--
-- Name: empleado_idempleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_idempleado_seq', 3, true);


--
-- Name: herramienta_idherramienta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.herramienta_idherramienta_seq', 36, true);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);


--
-- Name: herramienta herramienta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.herramienta
    ADD CONSTRAINT herramienta_pkey PRIMARY KEY (idherramienta);


--
-- Name: herramienta empleados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.herramienta
    ADD CONSTRAINT empleados FOREIGN KEY (empleado) REFERENCES public.empleado(idempleado) NOT VALID;


--
-- PostgreSQL database dump complete
--

