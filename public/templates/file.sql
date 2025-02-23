CREATE TABLE `Developer` (
  `id` int NOT NULL,
  `github_user` text NOT NULL,
  `description` text NOT NULL,
  `city` text NOT NULL,
  `emoji` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `Developer`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Developer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

INSERT INTO `Developer` (`id`, `github_user`, `description`, `city`, `emoji`) VALUES (1, 'mgrl39', 'Portfolio using Twig, Bootstrap and MySQL🌳🍂🐿️', 'barcelona', '👾');

CREATE TABLE `Education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `developer_id` int NOT NULL,
  `course_name` VARCHAR(255) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `description` TEXT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`developer_id`) REFERENCES `Developer`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Education` (`developer_id`, `course_name`, `start_date`, `end_date`)
VALUES (1, 'ASIX', '2022-09-12', '2024-06-5'),
       (1, '42', '2024-06-05', '2026-06-05'),
       (1, 'DAW', '2024-09-09', '2025-06-5');

ALTER TABLE Education
ADD link VARCHAR(255);


UPDATE Education
SET `link` = 'https://github.com/DonComProject'
WHERE `id` = 1;

UPDATE Education
SET `LINK` = 'https://42.fr'
WHERE `id` = 2;

UPDATE Education
SET `link` = 'https://github.com/mgrl39/DAW_M08'
WHERE `id` = 3;

UPDATE Education SET `description` = 'Technical studies focused on systems administration, networking, database management, and security, offering a solid understanding of essential IT concepts.' WHERE `id` = 1; 

UPDATE Education
SET `description` = ' A world-class computer programming school accessible to all, offering a peer-to-peer learning experience in coding.'
WHERE `id` = 2;

UPDATE Education
SET  `description` = 'Technical studies focused on web application development, covering both front-end and back-end technologies to create dynamic, user-friendly web solutions.'
WHERE `id` = 3;