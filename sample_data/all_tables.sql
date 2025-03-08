--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

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

--
-- Name: device_type; Type: TYPE; Schema: public; Owner: prescalar
--

CREATE TYPE public.device_type AS ENUM (
    'WIDGET',
    'HESAI_P128',
    'PCBA_01',
    'PCBA_02'
);


ALTER TYPE public.device_type OWNER TO prescalar;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: prescalar
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO prescalar;

--
-- Name: device_types; Type: TABLE; Schema: public; Owner: prescalar
--

CREATE TABLE public.device_types (
    id integer NOT NULL,
    type public.device_type NOT NULL,
    part_number character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.device_types OWNER TO prescalar;

--
-- Name: device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: prescalar
--

CREATE SEQUENCE public.device_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.device_types_id_seq OWNER TO prescalar;

--
-- Name: device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prescalar
--

ALTER SEQUENCE public.device_types_id_seq OWNED BY public.device_types.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: prescalar
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    device_type integer NOT NULL,
    serial_number character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    hardware_version character varying(255) NOT NULL,
    firmware_version integer NOT NULL
);


ALTER TABLE public.devices OWNER TO prescalar;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: prescalar
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devices_id_seq OWNER TO prescalar;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prescalar
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: event_data; Type: TABLE; Schema: public; Owner: prescalar
--

CREATE TABLE public.event_data (
    event_id character varying(36) NOT NULL,
    operator_id character varying(255) NOT NULL,
    tool_id character varying(255) NOT NULL,
    event_start_datetime timestamp without time zone NOT NULL,
    event_end_datetime timestamp without time zone NOT NULL,
    event_outcome character varying(255) NOT NULL,
    fault_codes character varying(255)
);


ALTER TABLE public.event_data OWNER TO prescalar;

--
-- Name: firmware_data; Type: TABLE; Schema: public; Owner: prescalar
--

CREATE TABLE public.firmware_data (
    id integer NOT NULL,
    device_type public.device_type NOT NULL,
    fw_start_version character varying(255) NOT NULL,
    fw_end_version character varying(255) NOT NULL,
    fw_size character varying(255) NOT NULL,
    fw_update_time character varying(255) NOT NULL,
    bootloader_start_version character varying(255) NOT NULL,
    bootloader_end_version character varying(255) NOT NULL
);


ALTER TABLE public.firmware_data OWNER TO prescalar;

--
-- Name: firmware_data_id_seq; Type: SEQUENCE; Schema: public; Owner: prescalar
--

CREATE SEQUENCE public.firmware_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.firmware_data_id_seq OWNER TO prescalar;

--
-- Name: firmware_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prescalar
--

ALTER SEQUENCE public.firmware_data_id_seq OWNED BY public.firmware_data.id;


--
-- Name: firmware_releases; Type: TABLE; Schema: public; Owner: prescalar
--

CREATE TABLE public.firmware_releases (
    id integer NOT NULL,
    device_type integer NOT NULL,
    fw_version character varying(255) NOT NULL,
    fw_size character varying(255) NOT NULL,
    version_alias json
);


ALTER TABLE public.firmware_releases OWNER TO prescalar;

--
-- Name: firmware_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: prescalar
--

CREATE SEQUENCE public.firmware_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.firmware_releases_id_seq OWNER TO prescalar;

--
-- Name: firmware_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prescalar
--

ALTER SEQUENCE public.firmware_releases_id_seq OWNED BY public.firmware_releases.id;


--
-- Name: process_metadata; Type: TABLE; Schema: public; Owner: prescalar
--

CREATE TABLE public.process_metadata (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    device_id integer NOT NULL,
    process_name character varying(255) NOT NULL,
    process_version character varying(255) NOT NULL,
    process_type character varying(255) NOT NULL,
    limit_version character varying(255)
);


ALTER TABLE public.process_metadata OWNER TO prescalar;

--
-- Name: process_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: prescalar
--

CREATE SEQUENCE public.process_metadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.process_metadata_id_seq OWNER TO prescalar;

--
-- Name: process_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: prescalar
--

ALTER SEQUENCE public.process_metadata_id_seq OWNED BY public.process_metadata.id;


--
-- Name: device_types id; Type: DEFAULT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.device_types ALTER COLUMN id SET DEFAULT nextval('public.device_types_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: firmware_data id; Type: DEFAULT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.firmware_data ALTER COLUMN id SET DEFAULT nextval('public.firmware_data_id_seq'::regclass);


--
-- Name: firmware_releases id; Type: DEFAULT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.firmware_releases ALTER COLUMN id SET DEFAULT nextval('public.firmware_releases_id_seq'::regclass);


--
-- Name: process_metadata id; Type: DEFAULT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.process_metadata ALTER COLUMN id SET DEFAULT nextval('public.process_metadata_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: prescalar
--

COPY public.alembic_version (version_num) FROM stdin;
0001
\.


--
-- Data for Name: device_types; Type: TABLE DATA; Schema: public; Owner: prescalar
--

COPY public.device_types (id, type, part_number, name) FROM stdin;
9	WIDGET	ABC123	widget board
10	HESAI_P128	ABC124	Pandar 128 LiDAR
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: prescalar
--

COPY public.devices (id, device_type, serial_number, name, hardware_version, firmware_version) FROM stdin;
1	9	ABC123456	Widget 1	1.0	1
2	9	ABC123457	Widget 2	1.0	2
3	10	XYZ98765	lidar 1	1.0	3
4	10	XYZ98766	lidar 2	1.0	3
7	9	ABC123460	Widget4	1.1	2
10	9	ABC123461	Widget5	1.1	2
11	9	ABC123459	Widget3	1.1	2
\.


--
-- Data for Name: event_data; Type: TABLE DATA; Schema: public; Owner: prescalar
--

COPY public.event_data (event_id, operator_id, tool_id, event_start_datetime, event_end_datetime, event_outcome, fault_codes) FROM stdin;
\.


--
-- Data for Name: firmware_data; Type: TABLE DATA; Schema: public; Owner: prescalar
--

COPY public.firmware_data (id, device_type, fw_start_version, fw_end_version, fw_size, fw_update_time, bootloader_start_version, bootloader_end_version) FROM stdin;
\.


--
-- Data for Name: firmware_releases; Type: TABLE DATA; Schema: public; Owner: prescalar
--

COPY public.firmware_releases (id, device_type, fw_version, fw_size, version_alias) FROM stdin;
1	9	1.0.4	1MB	["R2B4", "08_14_2023"]
2	9	1.0.6	1.3MB	["R2B5", "10_05_2023"]
3	10	15.4	26MB	\N
\.


--
-- Data for Name: process_metadata; Type: TABLE DATA; Schema: public; Owner: prescalar
--

COPY public.process_metadata (id, company_name, device_id, process_name, process_version, process_type, limit_version) FROM stdin;
\.


--
-- Name: device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prescalar
--

SELECT pg_catalog.setval('public.device_types_id_seq', 10, true);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prescalar
--

SELECT pg_catalog.setval('public.devices_id_seq', 11, true);


--
-- Name: firmware_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prescalar
--

SELECT pg_catalog.setval('public.firmware_data_id_seq', 1, false);


--
-- Name: firmware_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prescalar
--

SELECT pg_catalog.setval('public.firmware_releases_id_seq', 3, true);


--
-- Name: process_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: prescalar
--

SELECT pg_catalog.setval('public.process_metadata_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: device_types device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.device_types
    ADD CONSTRAINT device_types_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: event_data event_data_pkey; Type: CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.event_data
    ADD CONSTRAINT event_data_pkey PRIMARY KEY (event_id);


--
-- Name: firmware_data firmware_data_pkey; Type: CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.firmware_data
    ADD CONSTRAINT firmware_data_pkey PRIMARY KEY (id);


--
-- Name: firmware_releases firmware_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.firmware_releases
    ADD CONSTRAINT firmware_releases_pkey PRIMARY KEY (id);


--
-- Name: process_metadata process_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.process_metadata
    ADD CONSTRAINT process_metadata_pkey PRIMARY KEY (id);


--
-- Name: devices devices_device_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_device_type_fkey FOREIGN KEY (device_type) REFERENCES public.device_types(id);


--
-- Name: devices devices_firmware_version_fkey; Type: FK CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_firmware_version_fkey FOREIGN KEY (firmware_version) REFERENCES public.firmware_releases(id);


--
-- Name: firmware_releases firmware_releases_device_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.firmware_releases
    ADD CONSTRAINT firmware_releases_device_type_fkey FOREIGN KEY (device_type) REFERENCES public.device_types(id);


--
-- Name: process_metadata process_metadata_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: prescalar
--

ALTER TABLE ONLY public.process_metadata
    ADD CONSTRAINT process_metadata_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- PostgreSQL database dump complete
--

