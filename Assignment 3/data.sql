-- 1
INSERT INTO Application(name, category) VALUES
('Keynote', 'PRODUCTIVITY'),
('Pages', 'PRODUCTIVITY'),
('Word', 'PRODUCTIVITY'),
('PowerPoint', 'PRODUCTIVITY'),
('Numbers', 'PRODUCTIVITY');

-- According to instructions all applications are web applications
INSERT INTO WebApplication(Id, url, price, subscribers, browser) VALUES
((SELECT Id FROM Application WHERE name='Keynote'), 'keynote.com', 20.00, 2, 'safari'),
((SELECT Id FROM Application WHERE name='Pages'), 'pages.com', 25.00, 5, 'safari'),
((SELECT Id FROM Application WHERE name='Word'), 'word.com', 12.00, 20, 'ie'),
((SELECT Id FROM Application WHERE name='PowerPoint'), 'powerpoint.com', 10.00, 7, 'ie'),
((SELECT Id FROM Application WHERE name='Numbers'), 'numbers.com', 5.00, 3, 'chome');

-- 2
INSERT INTO  Application(name, category) VALUES
('Minecraft', 'GAMES'),
('Asteroids', 'GAMES'),
('Galaga', 'GAMES'),
('Centipide', 'GAMES');

INSERT INTO WebApplication(Id, url, price, subscribers, browser) VALUES
((SELECT Id FROM Application WHERE name='Minecraft'), 'minecraft.com', 15.00, 25, 'firefox'),
((SELECT Id FROM Application WHERE name='Asteroids'), 'asteroids.com', 2.00, 10, 'netscape'),
((SELECT Id FROM Application WHERE name='Galaga'), 'galaga.com', 3.00, 4, 'ie'),
((SELECT Id FROM Application WHERE name='Centipide'), 'centipide', 1.00, 3, 'safari');

-- 3
INSERT INTO Developer(firstName, lastName) VALUES
('Alice', 'Wonderland'),
('Bob', 'Marley'),
('Charly', 'Garcia'),
('Frank', 'Herbert'),
('Gregory', 'Peck'),
('Edward', 'Norton');

-- not sure how to relate Role and Application Category
-- INSERT INTO Role(application, developer, role) VALUES

-- 4
INSERT INTO Privilege(applicationId, developerId, privilege, assetType) VALUES
((SELECT Id FROM Application where name='Centipide'),
(SELECT Id FROM Developer where firstName='Charly' and lastName='Garcia'),
'ALL', 'VIEW');

-- 5
UPDATE Role r
JOIN Developer d ON (r.developer = d.Id)
SET r.role='PRODUCT MANAGER'
WHERE d.firstName='Frank' and d.lastName='Herbert';

-- 6
UPDATE Role r
JOIN Developer d ON (r.developer = d.Id)
JOIN WebApplication w ON (r.application = w.Id)
SET r.role='DIRECTOR'
WHERE d.firstName='Gregory' and d.lastName='Peck'
and w.Id <> NULL;

-- 7
DELETE FROM Privilege USING Privilege
JOIN Developer d ON (Privilege.developerId = d.Id)
JOIN Application a ON (Privilege.applicationId = a.Id)
WHERE d.firstName='Edward' and d.lastName='Norton'
and a.name='Outlook';

-- 8
DELETE FROM Application WHERE name='PowerPoint';

-- 9

-- 10
SELECT * FROM Privilege p
JOIN Developer d ON (p.developerId = d.Id)
WHERE d.firstName='Alice' and d.lastName='Wonderland'
and p.assetType='CONTROLLER';

-- 11

-- 12
