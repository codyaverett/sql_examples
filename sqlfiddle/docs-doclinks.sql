-- Data

CREATE TABLE IF NOT EXISTS `docs` (
  `id` int(6) unsigned NOT NULL,
  `rev` int(3) unsigned NOT NULL,
  `content` varchar(200) NOT NULL,
  PRIMARY KEY (`id`,`rev`)
) DEFAULT CHARSET=utf8;
INSERT INTO `docs` (`id`, `rev`, `content`) VALUES
  ('1', '1', 'The earth is flat'),
  ('2', '1', 'One hundred angels can dance on the head of a pin'),
  ('1', '2', 'The earth is flat and rests on a bull\'s horn'),
  ('1', '3', 'The earth is like a ball.');

CREATE TABLE IF NOT EXISTS `doclink` (
  `id` int(6) unsigned NOT NULL,
  `docId` int(6) unsigned NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
INSERT INTO `doclink` (`id`, `docId`, `name`) VALUES
  ('1','2','angels');


-- Queries

SELECT a.id, a.rev, a.content
FROM `docs` a
INNER JOIN (
    SELECT id, MAX(rev) rev
    FROM `docs`
    GROUP BY id
) b ON a.id = b.id AND a.rev = b.rev;


SELECT a.*
FROM `docs` a
LEFT OUTER JOIN `docs` b
    ON a.id = b.id AND a.rev < b.rev
WHERE b.id IS NULL;

SELECT *
FROM `doclink` link
LEFT JOIN `docs` docs ON link.docId = docs.id