--
-- PostgreSQL database dump
--

\restrict qWsIfMnZKclvIQrhuequ8pWQuxt0uvoK51YZA5W6xBjzC9R7zKPTq6CAeKvhRzO

-- Dumped from database version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.6 (Ubuntu 18.6-0ubuntu0.26.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asig_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asig_servicio (
    id_asignacion integer NOT NULL,
    id_vigilante integer,
    id_servicio integer,
    id_turno integer,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    observaciones text NOT NULL
);


ALTER TABLE public.asig_servicio OWNER TO postgres;

--
-- Name: asig_servicio_id_asignacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.asig_servicio ALTER COLUMN id_asignacion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asig_servicio_id_asignacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargo (
    id_cargo integer NOT NULL,
    nombre_cargo text NOT NULL,
    description text
);


ALTER TABLE public.cargo OWNER TO postgres;

--
-- Name: cargo_id_cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cargo ALTER COLUMN id_cargo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cargo_id_cargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: certificado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificado (
    id_certificado integer NOT NULL,
    nombre_certificado text NOT NULL,
    entidadd_emisora text NOT NULL,
    fecha_emision date NOT NULL,
    fecha_vencimiento date NOT NULL,
    id_vigilante integer
);


ALTER TABLE public.certificado OWNER TO postgres;

--
-- Name: certificado_id_certificado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.certificado ALTER COLUMN id_certificado ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.certificado_id_certificado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    razon_social text NOT NULL,
    nombre_contacto text,
    telefono integer NOT NULL,
    email text NOT NULL,
    direccion text NOT NULL,
    estado boolean DEFAULT true NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cliente ALTER COLUMN id_cliente ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cliente_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    id_servicio integer NOT NULL,
    id_cliente integer,
    nombre_servicio text NOT NULL,
    descriptcion text NOT NULL,
    direccion text NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado boolean DEFAULT true NOT NULL
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- Name: servicio_id_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.servicio ALTER COLUMN id_servicio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.servicio_id_servicio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turno (
    id_turno integer NOT NULL,
    nombre_turno text NOT NULL,
    descripcion text NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- Name: turno_id_turno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.turno ALTER COLUMN id_turno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.turno_id_turno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vigilante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vigilante (
    id_vigilante integer NOT NULL,
    tipo_documento text NOT NULL,
    documento integer NOT NULL,
    nombres text NOT NULL,
    apellidos text NOT NULL,
    fecha_nacimiento date NOT NULL,
    telefono integer NOT NULL,
    email text NOT NULL,
    direccion text NOT NULL,
    fecha_ingreso date NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    id_cargo integer
);


ALTER TABLE public.vigilante OWNER TO postgres;

--
-- Name: vigilante_id_vigilante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.vigilante ALTER COLUMN id_vigilante ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vigilante_id_vigilante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asig_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asig_servicio (id_asignacion, id_vigilante, id_servicio, id_turno, fecha_inicio, fecha_fin, estado, observaciones) FROM stdin;
\.


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargo (id_cargo, nombre_cargo, description) FROM stdin;
\.


--
-- Data for Name: certificado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificado (id_certificado, nombre_certificado, entidadd_emisora, fecha_emision, fecha_vencimiento, id_vigilante) FROM stdin;
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, razon_social, nombre_contacto, telefono, email, direccion, estado) FROM stdin;
\.


--
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicio (id_servicio, id_cliente, nombre_servicio, descriptcion, direccion, fecha_inicio, fecha_fin, estado) FROM stdin;
\.


--
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.turno (id_turno, nombre_turno, descripcion, hora_inicio, hora_fin) FROM stdin;
\.


--
-- Data for Name: vigilante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vigilante (id_vigilante, tipo_documento, documento, nombres, apellidos, fecha_nacimiento, telefono, email, direccion, fecha_ingreso, estado, id_cargo) FROM stdin;
\.


--
-- Name: asig_servicio_id_asignacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asig_servicio_id_asignacion_seq', 1, false);


--
-- Name: cargo_id_cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cargo_id_cargo_seq', 1, false);


--
-- Name: certificado_id_certificado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certificado_id_certificado_seq', 1, false);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);


--
-- Name: servicio_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_id_servicio_seq', 1, false);


--
-- Name: turno_id_turno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turno_id_turno_seq', 1, false);


--
-- Name: vigilante_id_vigilante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vigilante_id_vigilante_seq', 1, false);


--
-- Name: asig_servicio asig_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asig_servicio
    ADD CONSTRAINT asig_servicio_pkey PRIMARY KEY (id_asignacion);


--
-- Name: cargo cargo_nombre_cargo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_nombre_cargo_key UNIQUE (nombre_cargo);


--
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id_cargo);


--
-- Name: certificado certificado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificado
    ADD CONSTRAINT certificado_pkey PRIMARY KEY (id_certificado);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (id_servicio);


--
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (id_turno);


--
-- Name: vigilante vigilante_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vigilante
    ADD CONSTRAINT vigilante_documento_key UNIQUE (documento);


--
-- Name: vigilante vigilante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vigilante
    ADD CONSTRAINT vigilante_pkey PRIMARY KEY (id_vigilante);


--
-- Name: asig_servicio asig_servicio_id_servicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asig_servicio
    ADD CONSTRAINT asig_servicio_id_servicio_fkey FOREIGN KEY (id_servicio) REFERENCES public.servicio(id_servicio);


--
-- Name: asig_servicio asig_servicio_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asig_servicio
    ADD CONSTRAINT asig_servicio_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES public.turno(id_turno);


--
-- Name: asig_servicio asig_servicio_id_vigilante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asig_servicio
    ADD CONSTRAINT asig_servicio_id_vigilante_fkey FOREIGN KEY (id_vigilante) REFERENCES public.vigilante(id_vigilante);


--
-- Name: certificado certificado_id_vigilante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificado
    ADD CONSTRAINT certificado_id_vigilante_fkey FOREIGN KEY (id_vigilante) REFERENCES public.vigilante(id_vigilante);


--
-- Name: servicio servicio_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- Name: vigilante vigilante_id_cargo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vigilante
    ADD CONSTRAINT vigilante_id_cargo_fkey FOREIGN KEY (id_cargo) REFERENCES public.cargo(id_cargo);


--
-- PostgreSQL database dump complete
--

\unrestrict qWsIfMnZKclvIQrhuequ8pWQuxt0uvoK51YZA5W6xBjzC9R7zKPTq6CAeKvhRzO

