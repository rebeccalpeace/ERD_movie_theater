CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	cust_age INTEGER,
	rewards_member BOOLEAN
);

CREATE TABLE rating(
	rating_id SERIAL PRIMARY KEY,
	rating_name VARCHAR(10),
	min_age INTEGER
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(100),
	rating_id INTEGER NOT NULL,
	FOREIGN KEY(rating_id) REFERENCES rating(rating_id)
);

CREATE TABLE showtime(
	showtime SERIAL PRIMARY KEY,
	show_time VARCHAR(5)
);

CREATE TABLE movie_showtime(
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	showtime INTEGER NOT NULL,
	FOREIGN KEY(showtime) REFERENCES showtime(showtime)
);

CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	price NUMERIC(4,2),
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE concession(
	product_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(30),
	description VARCHAR(50),
	price NUMERIC(4,2)
);

CREATE TABLE order_purchase(
	order_id INTEGER NOT NULL,
	FOREIGN KEY(order_id) REFERENCES order_(order_id),
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
	product_id INTEGER NOT NULL,
	FOREIGN KEY(product_id) REFERENCES concession(product_id)
);

