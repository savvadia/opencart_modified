CREATE TABLE if not exists notify_when_arrives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    user  VARCHAR(100),
    phone VARCHAR(100),
    custom VARCHAR(100),
    product_id INT (7),
    option_id INT (7),
    option_value_id INT (7),
    store_id INT(2) DEFAULT 0,
    language_id INT(2) DEFAULT 1,
    notified INT(1)
)