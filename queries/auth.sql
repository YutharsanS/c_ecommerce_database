-- /signup
SELECT email FROM customer WHERE email ='john.doe@example.com' ;

INSERT INTO customer (password_hash, name, email, phone_number) VALUES ("?, ?, ?, ?");

SELECT * FROM users WHERE email = ?


-- signin
SELECT * FROM customer WHERE email = ?;