CREATE TABLE link (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 url text NOT NULL,
 path text NOT NULL
);

INSERT INTO link(url, path) VALUES ('img/cri.jpg', 'img/cri.jpg'),
('img/imagik.jpg', 'img/imagik.jpg'),
('img/pepe.jpg', 'img/pepe.jpg');