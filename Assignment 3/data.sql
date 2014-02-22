-- 1
INSERT INTO Application(name, category) VALUES
('Keynote', 'PRODUCTIVITY'),
('Pages', 'PRODUCTIVITY'),
('Word', 'PRODUCTIVITY'),
('PowerPoint', 'PRODUCTIVITY'),
('Numbers', 'PRODUCTIVITY');

-- 2
INSERT INTO  Application(name, category) VALUES
('Minecraft', 'GAMES'),
('Asteroids', 'GAMES'),
('Galaga', 'GAMES'),
('Centipide', 'GAMES');

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
-- INSERT INTO Privilege(applicationId, developerId, privilege, assetType) VALUES
-- ()

-- 5
UPDATE Role r JOIN Developer d ON (r.developer = d.Id)
SET 'role'='PRODUCT MANAGER' WHERE d.firstName='Frank' and d.lastName='Herbert';

-- 6
UPDATE Role r JOIN Developer d ON (r.developer = d.Id) JOIN WebApplication w ON (r.application = w.Id)
SET 'role' = 'DIRECTOR' WHERE d.firstName='Gregory' and d.lastName='Peck'
and w.Id <> NULL;

-- 7
Delete FROM Privilege p JOIN Developer d ON (p.developerId = d.Id) JOIN Application a ON (p.applicationId = a.Id)
WHERE d.firstName='Edward' and d.lastName='Norton' and a.name='Outlook';

-- 8
DELETE FROM Application WHERE name='PowerPoint';

-- 9

-- 10
SELECT * FROM Privilege p JOIN Developer d ON (p.developerId = d.Id)
WHERE d.firstName='Alice' and d.lastName='Wonderland' and p.assetType='CONTROLLER';

-- 11

-- 12
