

-- BUSINESS CATEGORY

CREATE TABLE Business_category (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL ,
	name VARCHAR(255) UNIQUE NOT NULL,
	description VARCHAR(255),
	picture VARCHAR(255),
	PRIMARY KEY (id)
);

--ALTER BUSINESS CATEGORY

ALTER TABLE Business_categories RENAME Business_category;

-- BUSINES CATEGORIES

CREATE TABLE Business_categories (
	id INT AUTO_INCREMENT UNIQUE NOT NULL,
	business_category_id BIGINT,
	business_id BIGINT,
	FOREIGN KEY (business_category_id) REFERENCES Business_category(id),
	FOREIGN KEY (business_id) REFERENCES Business(id)	
);

-- BUSINESS

CREATE TABLE Business (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	name VARCHAR(255),
	description VARCHAR(255),
	banner 	VARCHAR(255),
	avatar VARCHAR(255),
	phone VARCHAR(255) UNIQUE,
	PRIMARY KEY (id)
);


-- SOCIAL ACCOUNTS

CREATE TABLE Social_accounts (
	id BIGINT UNIQUE AUTO_INCREMENT UNIQUE NOT NULL,
	youtube VARCHAR(255),
	instagram VARCHAR(255),
	facebook VARCHAR(255),
	twitter VARCHAR(255),
	tiktok VARCHAR(255),
	snapchat VARCHAR(255),
	business_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (business_id) REFERENCES Business(id)
);

-- PROMOS 
CREATE TABLE Promos (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	name VARCHAR(255),
	description VARCHAR(255),
	init_date DATE NOT NULL,
	end_date DATE NOT NULL,
	business_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (business_id) REFERENCES Business(id)
);


-- LOCATIONS

CREATE TABLE Locations (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	country VARCHAR(255),
	province VARCHAR(255),
	city VARCHAR(255),
	address VARCHAR(255),
	notes VARCHAR(255),
	business_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (business_id) REFERENCES Business(id)
);


-- POSTS 

CREATE TABLE Posts (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	description VARCHAR(255),
	business_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (business_id) REFERENCES Business(id)
);


-- PRODUCTS

CREATE TABLE Products (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	name VARCHAR(255),
	description VARCHAR(255),
	price VARCHAR(255),
	business_id BIGINT NOT NULL,
	product_category_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (business_id) REFERENCES Business(id),
	FOREIGN KEY (product_category_id) REFERENCES Products_category(id)
);

-- PRODUCT CATEGORY

CREATE TABLE Products_category (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	name VARCHAR(255) UNIQUE NOT NULL,
	description VARCHAR(255),
	picture VARCHAR(255),
	PRIMARY KEY (id)
);


-- PRODUCT media

CREATE TABLE Product_media (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	media_url VARCHAR(255),
	media_type VARCHAR(255),
	product_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- PRODUCT SUBCATEGORIES

CREATE TABLE Product_subcategories (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	product_category_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (product_category_id) REFERENCES Products_category(id)
);



--POSTS MEDIA

CREATE TABLE Posts_media (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	media_url VARCHAR(255),
	media_type VARCHAR(255),
	post_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (post_id) REFERENCES Posts(id)
);

--TAGS

CREATE TABLE TAGS (
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL,
	name VARCHAR(255)
);


-- POSTS TAGS

CREATE TABLE Posts_tags( 
	id BIGINT AUTO_INCREMENT UNIQUE NOT NULL, 
	post_id BIGINT NOT NULL,
	tag_id BIGINT NOT NULL,
	FOREIGN KEY (post_id) REFERENCES Posts(id),
	FOREIGN KEY (tag_id) REFERENCES TAGS(id)
);

