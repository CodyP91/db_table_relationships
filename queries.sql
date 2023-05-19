CREATE TABLE blogger (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(255) UNIQUE, password VARCHAR(255), name VARCHAR(255), created_at TIMESTAMP, email VARCHAR(255) UNIQUE);

CREATE TABLE blog_post (id INT AUTO_INCREMENT PRIMARY KEY, content TEXT, title VARCHAR(255), created_at TIMESTAMP, blogger_id INT,FOREIGN KEY (blogger_id) REFERENCES blogger(id));

CREATE TABLE blog_post_comment (id INT AUTO_INCREMENT PRIMARY KEY, content TEXT, created_at TIMESTAMP, blogger_id INT, blog_post_id INT,FOREIGN KEY (blogger_id) REFERENCES blogger(id),FOREIGN KEY (blog_post_id) REFERENCES blog_post(id));

SELECT * FROM blogger WHERE created_at > '2020-01-01'; 

UPDATE blogger SET password = 'bad_password' WHERE password = 'pass';

SELECT bp.content, bp.title, b.username FROM blog_post AS bp JOIN blogger AS b ON bp.blogger_id = b.id;

SELECT bpc.content, bp.title, b.username FROM blog_post_comment AS bpc JOIN blog_post AS bp ON bpc.blog_post_id = bp.id JOIN blogger AS b ON bpc.blogger_id = b.id;

DELETE FROM blog_post_comment WHERE content LIKE '%delete me%';

SELECT bp.content, bp.title, b.username FROM blog_post AS bp JOIN blogger AS b ON bp.blogger_id = b.id WHERE (SELECT COUNT(*) FROM blog_post_comment WHERE blog_post_id = bp.id) >= 3;