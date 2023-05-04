--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-04 18:11:44

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
-- TOC entry 214 (class 1259 OID 17136)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(10) NOT NULL,
    dept_name character varying(255) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17172)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(10) NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17187)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(10) NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17150)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title_id character varying(10) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    sex character(1) NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17162)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17143)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character varying(10) NOT NULL,
    title character varying(255) NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 3193 (class 2606 OID 17142)
-- Name: departments departments_dept_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_dept_name_key UNIQUE (dept_name);


--
-- TOC entry 3195 (class 2606 OID 17140)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 3205 (class 2606 OID 17176)
-- Name: dept_emp dept_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 3207 (class 2606 OID 17191)
-- Name: dept_manager dept_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no);


--
-- TOC entry 3201 (class 2606 OID 17156)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 3203 (class 2606 OID 17166)
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 3197 (class 2606 OID 17147)
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);


--
-- TOC entry 3199 (class 2606 OID 17149)
-- Name: titles titles_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_title_key UNIQUE (title);


--
-- TOC entry 3210 (class 2606 OID 17182)
-- Name: dept_emp dept_emp_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3211 (class 2606 OID 17177)
-- Name: dept_emp dept_emp_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3212 (class 2606 OID 17192)
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3213 (class 2606 OID 17197)
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3208 (class 2606 OID 17157)
-- Name: employees employees_emp_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES public.titles(title_id);


--
-- TOC entry 3209 (class 2606 OID 17167)
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


-- Completed on 2023-05-04 18:11:44

--
-- PostgreSQL database dump complete
--

