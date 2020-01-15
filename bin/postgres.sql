--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.16
-- Dumped by pg_dump version 9.5.16

-- Started on 2019-12-02 11:32:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 16710)
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    cl_telephone character varying(30),
    cl_info character varying(50),
    fk_cl_telephone integer NOT NULL,
    contact_list_id integer NOT NULL,
    oldnum boolean DEFAULT false,
    internum boolean DEFAULT false
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16735)
-- Name: contacts_contact_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_contact_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_contact_list_id_seq OWNER TO postgres;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 209
-- Name: contacts_contact_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_contact_list_id_seq OWNED BY public.contacts.contact_list_id;


--
-- TOC entry 204 (class 1259 OID 16704)
-- Name: zk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zk (
    lastname character varying(20),
    name character varying(10),
    mid_name character varying(20),
    birth_date date,
    reg_city character varying(20),
    reg_street character varying(20),
    reg_home character varying(5),
    reg_corp character varying(5),
    reg_flat character varying(5),
    liv_city character varying(20),
    liv_street character varying(20),
    liv_home character varying(5),
    liv_corp character varying(5),
    liv_flat character varying(5),
    dop_info character varying(150),
    check_for character varying(25),
    zk_id integer NOT NULL,
    date_upd character varying(20),
    date_add date,
    time_add character varying(10),
    linked_id character varying(50),
    row_id uuid DEFAULT public.uuid_generate_v1()
);


ALTER TABLE public.zk OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16748)
-- Name: customer_golutvin; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.customer_golutvin AS
 SELECT zk.lastname,
    zk.name,
    zk.mid_name
   FROM public.zk
  WHERE ((zk.reg_city)::text = 'Москва'::text);


ALTER TABLE public.customer_golutvin OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16516)
-- Name: official_tel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.official_tel (
    tel_num character varying(20),
    service_name character varying(25),
    of_t_id integer NOT NULL
);


ALTER TABLE public.official_tel OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16519)
-- Name: official_tel_of_t_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.official_tel_of_t_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.official_tel_of_t_id_seq OWNER TO postgres;

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 203
-- Name: official_tel_of_t_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.official_tel_of_t_id_seq OWNED BY public.official_tel.of_t_id;


--
-- TOC entry 205 (class 1259 OID 16707)
-- Name: owners_tel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners_tel (
    fk_telephone_zk integer,
    telephone_id integer NOT NULL,
    telephone_num character varying(30) NOT NULL,
    internum boolean DEFAULT false NOT NULL,
    oldnum boolean DEFAULT false
);


ALTER TABLE public.owners_tel OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16722)
-- Name: owners_tel_telephone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owners_tel_telephone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_tel_telephone_id_seq OWNER TO postgres;

--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 208
-- Name: owners_tel_telephone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_tel_telephone_id_seq OWNED BY public.owners_tel.telephone_id;


--
-- TOC entry 211 (class 1259 OID 41091)
-- Name: zk_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zk_links (
    row_id1 uuid,
    row_id2 uuid
);


ALTER TABLE public.zk_links OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16713)
-- Name: zk_zk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zk_zk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zk_zk_id_seq OWNER TO postgres;

--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 207
-- Name: zk_zk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zk_zk_id_seq OWNED BY public.zk.zk_id;


--
-- TOC entry 2115 (class 2604 OID 16737)
-- Name: contact_list_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN contact_list_id SET DEFAULT nextval('public.contacts_contact_list_id_seq'::regclass);


--
-- TOC entry 2109 (class 2604 OID 16534)
-- Name: of_t_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.official_tel ALTER COLUMN of_t_id SET DEFAULT nextval('public.official_tel_of_t_id_seq'::regclass);


--
-- TOC entry 2112 (class 2604 OID 16724)
-- Name: telephone_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners_tel ALTER COLUMN telephone_id SET DEFAULT nextval('public.owners_tel_telephone_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 16715)
-- Name: zk_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zk ALTER COLUMN zk_id SET DEFAULT nextval('public.zk_zk_id_seq'::regclass);


--
-- TOC entry 2251 (class 0 OID 16710)
-- Dependencies: 206
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('2344', 'asdqwe', 21, 141, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('222', 'qq@', 213, 142, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('9236259', 'Вася', 244, 143, false, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('51', 'Евгенийqwe', 21, 19, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('9825583', 'ASDWEE12', 245, 144, false, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('89558835444', 'asdasd', 206, 150, false, true);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('89225475587', 'МАМА', 129, 20, false, true);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('71244166122', 'фвйкфф', 129, 21, false, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('89877022574', 'Контакт1', 129, 22, false, true);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('89023568974', 'Контакт3', 129, 23, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('77987897727', '134412', 130, 24, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('77895555555', 'Петр', 131, 25, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('79995555555', 'qweas', 132, 26, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('75255551555', 'ASDSS', 209, 167, false, true);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('71234444444', '', 210, 112, false, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('79888888188', 'фывйййй', 209, 139, false, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('5515', 'fsdfss', 21, 110, true, false);
INSERT INTO public.contacts (cl_telephone, cl_info, fk_cl_telephone, contact_list_id, oldnum, internum) VALUES ('75255551555', NULL, 214, 114, false, false);


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 209
-- Name: contacts_contact_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_contact_list_id_seq', 281, true);


--
-- TOC entry 2247 (class 0 OID 16516)
-- Dependencies: 202
-- Data for Name: official_tel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.official_tel (tel_num, service_name, of_t_id) VALUES ('8(499)-720-56-22', 'Главное отделение ФСБ', 1);
INSERT INTO public.official_tel (tel_num, service_name, of_t_id) VALUES ('131312', 'qaxx', 6);
INSERT INTO public.official_tel (tel_num, service_name, of_t_id) VALUES ('41223334', 'ASDQEQWE', 7);


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 203
-- Name: official_tel_of_t_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.official_tel_of_t_id_seq', 12, true);


--
-- TOC entry 2250 (class 0 OID 16707)
-- Dependencies: 205
-- Data for Name: owners_tel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (64, 129, '71212555555', false, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (64, 130, '79148855887', false, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (64, 131, '76178888888', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (64, 132, '71255123333', true, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (203, 424, '4769078', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (203, 425, '4944545', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (203, 426, '4940001', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (203, 427, '4940102', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (8, 245, '89526809612', true, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (203, 428, '4940103', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (8, 252, '89160654671', false, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (204, 429, '100', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (204, 430, '200', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (26, 209, '79885547777', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (204, 431, '500', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (205, 432, '1001111', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (205, 433, '1001212', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (205, 434, '1001515', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (10, 210, '71222222222', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (206, 435, '4944893', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (206, 436, '4944893', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (207, 437, '100', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (207, 438, '101', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (208, 439, '4944893', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (208, 440, '4944895', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (210, 441, '2636020', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (11, 214, '71313333333', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (210, 442, '2675434', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (211, 443, '4944893', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (211, 444, '6020', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (211, 445, '4940005', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (212, 446, '2366021', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (213, 447, '2636202', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (214, 448, '1234567', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (215, 449, '1234567', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (216, 450, '9012345', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (217, 451, '1238990', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (218, 452, '2367989', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (219, 453, '3456789', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (220, 454, '2636202', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (221, 455, '2636020', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (221, 456, '2675434', false, true);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (26, 47, '72222222222', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (26, 48, '73333333333', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (26, 50, '79999999999', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (7, 206, '78520000102', false, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (7, 21, '79160654671', false, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (7, 242, '19165205522', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (7, 243, '29160654671', true, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (45, 182, '79888888188', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (7, 213, '76666666212', false, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (10, 244, '89152583024', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (11, 253, '89160654671', false, NULL);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (11, 254, '71257777777', false, false);
INSERT INTO public.owners_tel (fk_telephone_zk, telephone_id, telephone_num, internum, oldnum) VALUES (11, 255, '71255123333', true, NULL);


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 208
-- Name: owners_tel_telephone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_tel_telephone_id_seq', 457, true);


--
-- TOC entry 2249 (class 0 OID 16704)
-- Dependencies: 204
-- Data for Name: zk; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Семибратченко', 'Всеволод', 'Максимович', NULL, '', '', '', '', '', '', '', '', '', '', '', '', 10, '2019-11-24 22:05:05', NULL, NULL, NULL, 'ed5ec604-d717-11e9-9deb-9bb3d31e1f21');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Кузьмин', 'Леонтий', 'Игнатович', NULL, '', '', '', '', '', '', '', '', '', '', '', '', 8, '2019-11-25 22:38:11', NULL, NULL, NULL, 'e865532a-d717-11e9-9de9-e790330d43c1');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Ivanov', 'Иван', 'Иванович', NULL, 'Москва', 'Улица улица', '1', '2', '3', NULL, NULL, NULL, NULL, NULL, 'OLD доп инфо
доп инфо 2; Кат.:Категория; Дат: 1.2.2017; Мест:Место хранения; Кем: Кем изъята; Прич:Причина;, Кличка:Кличка', NULL, 203, NULL, NULL, NULL, NULL, '8053769a-11eb-11ea-8e0c-377b3fdfa04b');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Друг 1', 'Имя 1', 'О1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: Вован', NULL, 204, NULL, NULL, NULL, NULL, '805412f8-11eb-11ea-8e0d-2fb6ea80eccd');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Друг два', 'Имя2', 'О2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 205, NULL, NULL, NULL, NULL, '80543a12-11eb-11ea-8e0e-bbd46ad1f367');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('abonent1', 'ima 1', 'o1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: klich-1', NULL, 207, NULL, NULL, NULL, NULL, '879e33fe-11eb-11ea-8e14-c74a9df3678a');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Котова', 'Анна', NULL, NULL, 'Москва', NULL, NULL, '1', '3', NULL, NULL, NULL, NULL, NULL, 'OLD ; Кат.:; Дат: 2019-09-08 время; Мест:; Кем: Кем изъята; Прич:;, Кличка:', NULL, 208, NULL, NULL, NULL, NULL, '94f4bc30-11eb-11ea-8e15-fbb6baeae5e7');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 209, NULL, NULL, NULL, NULL, '94f50a82-11eb-11ea-8e16-73f5f43d6beb');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Постников', 'Виталий', 'Михайлович', NULL, 'Москва', 'Ул', '1', '2', 'Кв 3', NULL, NULL, NULL, NULL, NULL, 'OLD доцент ктн по доп.инф.; Кат.:; Дат: 5.10.2019; Мест:Архив; Кем: ; Прич:;, Кличка:', NULL, 210, NULL, NULL, NULL, NULL, '9966982e-11eb-11ea-8e17-bf6bbdc9cc76');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Виноградова', 'Мария', 'Валерьевна', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: Маша', NULL, 211, NULL, NULL, NULL, NULL, '9966e66c-11eb-11ea-8e18-a7f0a6642d9e');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Булатова', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 212, NULL, NULL, NULL, NULL, '99673496-11eb-11ea-8e19-2f370bd630ba');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Житенев', 'Владислав', 'Германович', '1997-10-23', '', '', '', '', '', '', '', '', '', '', '', '', 26, '2019-11-27 00:05:33', '2019-08-27', '18:47:08', NULL, 'fd93dfbe-d717-11e9-9df1-1f9a79a5c2ac');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Спиридонов', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 213, NULL, NULL, NULL, NULL, '99675c0a-11eb-11ea-8e1a-978376d24b4c');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Афанасьев', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 214, NULL, NULL, NULL, NULL, '99678324-11eb-11ea-8e1b-1fb46aeb3977');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Житенев', 'Владислав', 'Германович', '1997-10-23', '', '', '', '', '', '', '', '', '', '', '', '', 64, '2019-11-25 02:52:54', '2015-10-15', '12:55:14', NULL, '5897804a-e6e6-11e9-bf86-ff9df17305f6');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Ковалева', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 215, NULL, NULL, NULL, NULL, '9967d158-11eb-11ea-8e1c-d74c108236a6');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Житенев', 'Владислав', 'Германович', '1997-10-23', '', '', '', '', '', '', '', '', '', '', '', '', 45, '2019-11-25 02:53:32', NULL, NULL, ',30', '0cb1e770-d718-11e9-9df5-43e111a9c351');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Силантьева', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 216, NULL, NULL, NULL, NULL, '9967f804-11eb-11ea-8e1d-eb92f296e5ce');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Масленников', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 217, NULL, NULL, NULL, NULL, '99681f3c-11eb-11ea-8e1e-ab5985ec18d3');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Терехов', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 218, NULL, NULL, NULL, NULL, '99684638-11eb-11ea-8e1f-9f7cd7dbc43a');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Антонов', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 219, NULL, NULL, NULL, NULL, '99686d7a-11eb-11ea-8e20-9fbc2caded06');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Шкатов', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: ', NULL, 220, NULL, NULL, NULL, NULL, '9968bb9a-11eb-11ea-8e21-772786bc50e3');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Семкин', 'Петр', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Кличка: Кличка', NULL, 221, NULL, NULL, NULL, NULL, '9968e336-11eb-11ea-8e22-370d9b7f24d1');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Ivanov', 'Ivan', 'Ivanovich', NULL, 'Mos', 'vlatisa', '11', '4', '239', '', '', '', '', '', 'OLD dop info
line 2; Кат.:kategory; Дат: 1.2.2003; Мест:mesto; Кем: kem; Прич:povod;, Кличка:koko', '', 206, '2019-11-28 17:31:34', NULL, NULL, NULL, '879e0c8a-11eb-11ea-8e13-eb11ead645bf');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Александрова', 'Ирина', 'Владимировна', NULL, 'DASD', '12', '5', '21', '42', 'DASD', '12', '5', '21', '42', '', '', 7, '2019-11-25 02:21:51', NULL, NULL, NULL, 'e5dfab8c-d717-11e9-9de8-0fa3c57c9326');
INSERT INTO public.zk (lastname, name, mid_name, birth_date, reg_city, reg_street, reg_home, reg_corp, reg_flat, liv_city, liv_street, liv_home, liv_corp, liv_flat, dop_info, check_for, zk_id, date_upd, date_add, time_add, linked_id, row_id) VALUES ('Васнецов', 'Олег', 'Иванович', NULL, '12', '', '', '', '', '', '', '', '', '', '', 'ФСКН', 11, '2019-11-28 04:28:59', NULL, NULL, NULL, 'f01ce452-d717-11e9-9dec-978f682c2e27');


--
-- TOC entry 2255 (class 0 OID 41091)
-- Dependencies: 211
-- Data for Name: zk_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('e865532a-d717-11e9-9de9-e790330d43c1', 'f01ce452-d717-11e9-9dec-978f682c2e27');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('f01ce452-d717-11e9-9dec-978f682c2e27', '5897804a-e6e6-11e9-bf86-ff9df17305f6');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('8053769a-11eb-11ea-8e0c-377b3fdfa04b', '805412f8-11eb-11ea-8e0d-2fb6ea80eccd');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('8053769a-11eb-11ea-8e0c-377b3fdfa04b', '80543a12-11eb-11ea-8e0e-bbd46ad1f367');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('879e0c8a-11eb-11ea-8e13-eb11ead645bf', '879e33fe-11eb-11ea-8e14-c74a9df3678a');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('879e33fe-11eb-11ea-8e14-c74a9df3678a', '805412f8-11eb-11ea-8e0d-2fb6ea80eccd');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('94f4bc30-11eb-11ea-8e15-fbb6baeae5e7', '94f50a82-11eb-11ea-8e16-73f5f43d6beb');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('5897804a-e6e6-11e9-bf86-ff9df17305f6', '0cb1e770-d718-11e9-9df5-43e111a9c351');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '9966e66c-11eb-11ea-8e18-a7f0a6642d9e');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '99673496-11eb-11ea-8e19-2f370bd630ba');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '99675c0a-11eb-11ea-8e1a-978376d24b4c');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '99678324-11eb-11ea-8e1b-1fb46aeb3977');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '9967d158-11eb-11ea-8e1c-d74c108236a6');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '9967f804-11eb-11ea-8e1d-eb92f296e5ce');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '99681f3c-11eb-11ea-8e1e-ab5985ec18d3');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '99684638-11eb-11ea-8e1f-9f7cd7dbc43a');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '99686d7a-11eb-11ea-8e20-9fbc2caded06');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '9968bb9a-11eb-11ea-8e21-772786bc50e3');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966982e-11eb-11ea-8e17-bf6bbdc9cc76', '9968e336-11eb-11ea-8e22-370d9b7f24d1');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('9966e66c-11eb-11ea-8e18-a7f0a6642d9e', '879e0c8a-11eb-11ea-8e13-eb11ead645bf');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('fd93dfbe-d717-11e9-9df1-1f9a79a5c2ac', '0cb1e770-d718-11e9-9df5-43e111a9c351');
INSERT INTO public.zk_links (row_id1, row_id2) VALUES ('fd93dfbe-d717-11e9-9df1-1f9a79a5c2ac', '5897804a-e6e6-11e9-bf86-ff9df17305f6');


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 207
-- Name: zk_zk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zk_zk_id_seq', 222, true);


--
-- TOC entry 2127 (class 2606 OID 16742)
-- Name: PK_contact_list_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT "PK_contact_list_id" PRIMARY KEY (contact_list_id);


--
-- TOC entry 2119 (class 2606 OID 16568)
-- Name: PK_of_t_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.official_tel
    ADD CONSTRAINT "PK_of_t_id" PRIMARY KEY (of_t_id);


--
-- TOC entry 2125 (class 2606 OID 16729)
-- Name: PK_telephone_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners_tel
    ADD CONSTRAINT "PK_telephone_id" PRIMARY KEY (telephone_id);


--
-- TOC entry 2121 (class 2606 OID 16721)
-- Name: PK_zk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zk
    ADD CONSTRAINT "PK_zk_id" PRIMARY KEY (zk_id);


--
-- TOC entry 2123 (class 2606 OID 41095)
-- Name: zk_row_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zk
    ADD CONSTRAINT zk_row_id_key UNIQUE (row_id);


--
-- TOC entry 2128 (class 2606 OID 41117)
-- Name: FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners_tel
    ADD CONSTRAINT "FK" FOREIGN KEY (fk_telephone_zk) REFERENCES public.zk(zk_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2129 (class 2606 OID 24584)
-- Name: fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT fk FOREIGN KEY (fk_cl_telephone) REFERENCES public.owners_tel(telephone_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2131 (class 2606 OID 41102)
-- Name: row_id_1_zk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zk_links
    ADD CONSTRAINT row_id_1_zk FOREIGN KEY (row_id1) REFERENCES public.zk(row_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2130 (class 2606 OID 41097)
-- Name: row_id_2_zk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zk_links
    ADD CONSTRAINT row_id_2_zk FOREIGN KEY (row_id2) REFERENCES public.zk(row_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 11
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-12-02 11:32:46

--
-- PostgreSQL database dump complete
--

