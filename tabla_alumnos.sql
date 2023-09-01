SELECT * FROM users_data;

CREATE TABLE students (
	id INT AUTO_INCREMENT,
    userId INT,
    PRIMARY KEY(id),
    FOREIGN KEY(userId) REFERENCES users(user_id)
);