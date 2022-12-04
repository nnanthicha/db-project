-- Insert Example
INSERT INTO user_account (email, hashed_password, salt) VALUES ("test@test.com", "$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO", "$2b$12$IiTWRJVxx.3f6oJp4eeu3e");
INSERT INTO user (type, email, name, phone_number) VALUES ("Customer", "test@test.com", "test", "0801234567");

SELECT * FROM user_account;
SELECT * FROM user;
-- Delete Example
DELETE FROM user_account WHERE email="test@test.com";

SELECT * FROM user_account;
SELECT * FROM user;
-- Insert Example
INSERT INTO user_account (email, hashed_password, salt) VALUES ("test@test.com", "$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO", "$2b$12$IiTWRJVxx.3f6oJp4eeu3e");
INSERT INTO user (type, email, name, phone_number) VALUES ("Customer", "test@test.com", "test", "0801234567");

SELECT * FROM user_account;
SELECT * FROM user;
-- Update Example
UPDATE user_account SET email="test2@test.com" WHERE email="test@test.com";

SELECT * FROM user_account;
SELECT * FROM user;