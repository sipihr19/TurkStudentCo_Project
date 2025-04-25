
--CREATE DATABASE OnlineEducationPlatform;

CREATE TABLE members(
	member_id INT PRIMARY KEY,
	user_name VARCHAR(50) UNIQUE,
	email VARCHAR(100) UNIQUE,
	password_ VARCHAR(255),
	enrollment_date TIMESTAMP,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE courses (
	course_id INT PRIMARY KEY,
	course_name VARCHAR(200),
	description TEXT,
	date_of_start DATE,
	date_of_end DATE,
	instructor_info VARCHAR(100)
);

CREATE TABLE categories (
	category_id INT PRIMARY KEY,
	artificial_intelligence VARCHAR(100),
	blockchain VARCHAR(100),
	cyber_security VARCHAR(100),
	course_id INT,
	CONSTRAINT fk_course
		FOREIGN KEY (course_id)
		REFERENCES courses(course_id)
);

CREATE TABLE enrollments (
	enrollment_id INT PRIMARY KEY,
	course_id INT,
	member_id INT,
	CONSTRAINT fk_enroll_course
		FOREIGN KEY (course_id)
		REFERENCES courses(course_id),
	CONSTRAINT fk_enroll_member
		FOREIGN KEY (member_id)
		REFERENCES members(member_id)
);

CREATE TABLE certificates (
	certificate_id INT PRIMARY KEY,
	certificate_code VARCHAR(100) UNIQUE,
	date_issued DATE
);

CREATE TABLE certificate_assignments (
	certificate_assignment_id INT PRIMARY KEY,
	certificate_id INT,
	member_id INT,
	date_of_purchase DATE,
	CONSTRAINT fk_cert
		FOREIGN KEY (certificate_id)
		REFERENCES certificates(certificate_id),
	CONSTRAINT fk_cert_member
		FOREIGN KEY (member_id)
		REFERENCES members(member_id)
);

CREATE TABLE blog_posts (
	blog_post_id INT PRIMARY KEY,
	head VARCHAR(255),
	content_ TEXT,
	broadcast_date TIMESTAMP,
	author_id INT,
	CONSTRAINT fk_author
		FOREIGN KEY (author_id)
		REFERENCES members(member_id)
);









