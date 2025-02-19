#!/bin/sh
docker exec -i <mariadb-container-name> mysql -u artclave -p123 <<EOF
USE wordpress;
CREATE TABLE IF NOT EXISTS test_data (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50));
INSERT INTO test_data (name) VALUES ('PersistentData');
SELECT * FROM test_data;
EOF
