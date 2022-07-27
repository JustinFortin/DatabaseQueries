-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2-beta1_snapshot20190718
-- PostgreSQL version: 11.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public."Products" | type: TABLE --
-- DROP TABLE IF EXISTS public."Products" CASCADE;
CREATE TABLE public."Products" (
	"ID" bigserial NOT NULL,
	"Name" varchar(20) NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Products" OWNER TO postgres;
-- ddl-end --

-- object: public."Versions" | type: TABLE --
-- DROP TABLE IF EXISTS public."Versions" CASCADE;
CREATE TABLE public."Versions" (
	"ID" bigserial NOT NULL,
	"Name" varchar(20) NOT NULL,
	CONSTRAINT "Versions_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Versions" OWNER TO postgres;
-- ddl-end --

-- object: public."Employees" | type: TABLE --
-- DROP TABLE IF EXISTS public."Employees" CASCADE;
CREATE TABLE public."Employees" (
	"ID" bigserial NOT NULL,
	"Name" varchar(20) NOT NULL,
	CONSTRAINT "Employees_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Employees" OWNER TO postgres;
-- ddl-end --

-- object: public."Product_Version" | type: TABLE --
-- DROP TABLE IF EXISTS public."Product_Version" CASCADE;
CREATE TABLE public."Product_Version" (
	"ID" bigserial NOT NULL,
	"Active" boolean NOT NULL,
	"Product_ID" bigint NOT NULL,
	"Version_ID" bigint NOT NULL,
	CONSTRAINT "Product_Version_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Product_Version" OWNER TO postgres;
-- ddl-end --

-- object: "Products_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Product_Version" DROP CONSTRAINT IF EXISTS "Products_fk" CASCADE;
ALTER TABLE public."Product_Version" ADD CONSTRAINT "Products_fk" FOREIGN KEY ("Product_ID")
REFERENCES public."Products" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Versions_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Product_Version" DROP CONSTRAINT IF EXISTS "Versions_fk" CASCADE;
ALTER TABLE public."Product_Version" ADD CONSTRAINT "Versions_fk" FOREIGN KEY ("Version_ID")
REFERENCES public."Versions" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Sellable_Products" | type: TABLE --
-- DROP TABLE IF EXISTS public."Sellable_Products" CASCADE;
CREATE TABLE public."Sellable_Products" (
	"ID" bigserial NOT NULL,
	"Name" varchar(20) NOT NULL,
	"Active" boolean,
	"Description" varchar(20),
	"MSRP" numeric(7,2),
	"Max_Discount" numeric(5,2),
	"Minimum_sellqty" integer,
	product_version_id bigint NOT NULL,
	CONSTRAINT "Sellable_Products_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Sellable_Products" OWNER TO postgres;
-- ddl-end --

-- object: "Product_Version_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Sellable_Products" DROP CONSTRAINT IF EXISTS "Product_Version_fk" CASCADE;
ALTER TABLE public."Sellable_Products" ADD CONSTRAINT "Product_Version_fk" FOREIGN KEY (product_version_id)
REFERENCES public."Product_Version" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Order" | type: TABLE --
-- DROP TABLE IF EXISTS public."Order" CASCADE;
CREATE TABLE public."Order" (
	"ID" bigserial NOT NULL,
	"Order_Date" timestamp DEFAULT now(),
	"Shipped_Date" timestamp,
	"Employee_ID" bigint NOT NULL,
	CONSTRAINT "Order_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Order" OWNER TO postgres;
-- ddl-end --

-- object: "Employees_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Order" DROP CONSTRAINT IF EXISTS "Employees_fk" CASCADE;
ALTER TABLE public."Order" ADD CONSTRAINT "Employees_fk" FOREIGN KEY ("Employee_ID")
REFERENCES public."Employees" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Order_Lines" | type: TABLE --
-- DROP TABLE IF EXISTS public."Order_Lines" CASCADE;
CREATE TABLE public."Order_Lines" (
	"ID" bigserial NOT NULL,
	"Quantity" integer,
	"Sell_Price" numeric(7,2),
	"Extended_Price" numeric(8,2),
	"Order_ID" bigint NOT NULL,
	"Sellable_Products_ID" bigint NOT NULL,
	CONSTRAINT "Order_Lines_pk" PRIMARY KEY ("ID")

);
-- ddl-end --
ALTER TABLE public."Order_Lines" OWNER TO postgres;
-- ddl-end --

-- object: "Order_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Order_Lines" DROP CONSTRAINT IF EXISTS "Order_fk" CASCADE;
ALTER TABLE public."Order_Lines" ADD CONSTRAINT "Order_fk" FOREIGN KEY ("Order_ID")
REFERENCES public."Order" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Sellable_Products_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Order_Lines" DROP CONSTRAINT IF EXISTS "Sellable_Products_fk" CASCADE;
ALTER TABLE public."Order_Lines" ADD CONSTRAINT "Sellable_Products_fk" FOREIGN KEY ("Sellable_Products_ID")
REFERENCES public."Sellable_Products" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


