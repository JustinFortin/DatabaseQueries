CREATE TABLE order_logs (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	log_date timestamp default now(),
	log_note text,
	order_id int8 references orders(id)
);

CREATE TABLE order_statuses (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name varchar(50),
	customer_id int8 references customers(id)
);

SELECT * FROM customers;

ALTER TABLE CUSTOMERS add column phone_number varchar(50);

ALTER TABLE CUSTOMERS add column opt_out boolean;

ALTER TABLE ORDERS add column order_status_id int8
references orders(id);
