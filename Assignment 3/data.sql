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
((SELECT Id FROM Application WHERE name='Numbers'), 'numbers.com', 5.00, 3, 'chrome');

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

INSERT INTO Role(application, developer, role)
SELECT a.Id, d.Id, 'ARCHITECT'
FROM Application a, Developer d
WHERE d.firstName='Alice' and d.lastName='Wonderland'
and a.category='GAMES';

INSERT INTO Role(application, developer, role)
SELECT a.Id, d.Id, 'USER EXPERIENCE'
FROM Application a, Developer d
WHERE d.firstName='Bob' and d.lastName='Marley'
and a.category='GAMES';

INSERT INTO Role(application, developer, role)
SELECT a.Id, d.Id, 'DEVELOPER'
FROM Application a, Developer d
WHERE d.firstName='Charly' and d.lastName='Garcia'
and a.category='GAMES';

INSERT INTO Role(application, developer, role)
SELECT a.Id, d.Id, 'PROJECT MANAGER'
FROM Application a, Developer d
WHERE d.firstName='Frank' and d.lastName='Herbert'
and a.category='PRODUCTIVITY';

INSERT INTO Role(application, developer, role)
SELECT a.Id, d.Id, 'PRODUCT MANAGER'
FROM Application a, Developer d
WHERE d.firstName='Gregory' and d.lastName='Peck'
and a.category='GAMES';

INSERT INTO Role(application, developer, role)
SELECT a.Id, d.Id, 'USER EXPERIENCE'
FROM Application a, Developer d
WHERE d.firstName='Edward' and d.lastName='Norton'
and a.category='PRODUCTIVITY';

-- 4
INSERT INTO Privilege(applicationId, developerId, privilege, assetType) VALUES
((SELECT Id FROM Application where name='Centipide'),
(SELECT Id FROM Developer where firstName='Charly' and lastName='Garcia'),
'ALL', 'VIEW');

INSERT INTO Privilege(applicationId, developerId, privilege, assetType) VALUES
((SELECT Id FROM Application where name='Outlook'),
(SELECT Id FROM Developer where firstName='Edward' and lastName='Norton'),
'UPDATE', 'SCRIPT');

-- 5
UPDATE Role r
JOIN Developer d ON (r.developer = d.Id)
SET r.role='PRODUCT MANAGER'
WHERE d.firstName='Frank' and d.lastName='Herbert'
and r.role='PROJECT MANAGER';

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
and a.name='Outlook' and Privilege.privilege='UPDATE';

-- 8
DELETE a, ast, p, r, wa
FROM Application a
JOIN Asset ast ON (ast.applicationId = a.Id)
JOIN Privilege p ON (p.applicationId = a.Id)
JOIN Role r ON (r.application = a.Id)
JOIN WebApplication wa ON (wa.Id = a.Id)
WHERE a.name='PowerPoint';

-- 9
-- Test data
INSERT INTO Asset(name, type, applicationId) VALUES('Test', 'VIEW', 6);
INSERT INTO Sales(applicationId, developerId, sold, quantity) VALUES
(6, 5, '2014-02-01', 20),
(6, 5, '2014-03-01', 10);

SELECT a.name AS assetName, app.name AS appName, d.firstName, d.lastName FROM Asset a
JOIN WebApplication w ON (a.applicationID = w.Id)
JOIN Application app ON (a.applicationId = app.Id)
JOIN Sales s ON (s.applicationId = w.Id)
JOIN Role r ON (s.developerId = r.developer)
JOIN Developer d ON (s.developerId = d.Id)
WHERE(
    (
        (SELECT quantity FROM Sales oldsale
            WHERE extract(month FROM oldsale.sold) = extract(month FROM s.sold) - 1
            and extract(year FROM oldsale.sold) = extract(year FROM s.sold)
            and oldsale.developerId = s.developerId
            and oldsale.applicationId = s.applicationId
        )
        - s.quantity
    )
    /s.quantity) > .1
    and r.role = 'PRODUCT MANAGER'
    and a.type = 'VIEW'
    and w.Id = a.applicationId
    GROUP BY a.name;

-- 10
-- Test data
INSERT INTO Privilege(applicationId, developerId, privilege, assetType) VALUES
(6, 1, 'ALL', 'CONTROLLER');

SELECT * FROM Privilege p
JOIN Developer d ON (p.developerId = d.Id)
JOIN Role r ON (p.developerId = r.developer)
WHERE d.firstName='Alice' and d.lastName='Wonderland'
and r.role='DEVELOPER'
and p.assetType='CONTROLLER';

-- 11
DROP VIEW IF EXISTS ApplicationProfit;
CREATE VIEW ApplicationProfit AS
    SELECT a.category,
    -- Only 1 of the application prices will be not null
    SUM(IFNULL(da.pricePerDownload, IFNULL(wa.price, ma.price))
    * s.quantity) AS profit
    FROM Application a
    LEFT JOIN DesktopApplication da ON (da.Id = a.Id)
    LEFT JOIN WebApplication wa ON (wa.Id = a.Id)
    LEFT JOIN MobileApplication ma ON (ma.Id = a.Id)
    JOIN Sales s ON (s.applicationId = a.Id)
    GROUP BY a.category;
-- Descending order with a limit of 1 will return the maximum
SELECT category, profit FROM ApplicationProfit ORDER BY profit DESC LIMIT 1;

-- 12
-- Test data
INSERT INTO Application(name, category) VALUES('Threes', 'GAMES');
INSERT INTO MobileApplication(Id, os, installCount, price) VALUES
(10, 'Android', 10, 5);
INSERT INTO Sales(applicationId, developerId, sold, quantity) VALUES
(10, 3, '2014-02-01', 80),
(10, 3, '2014-02-11', 10);

INSERT INTO Application(name, category) VALUES('Angry Birds', 'GAMES');
INSERT INTO MobileApplication(Id, os, installCount, price) VALUES
(11, 'Android', 20, 1);
INSERT INTO Sales(applicationid, developerId, sold, quantity) VALUES
(11, 4, '2014-02-17', 200);

DROP VIEW IF EXISTS MonthMobileAppSales;
CREATE VIEW MonthMobileAppSales AS
    SELECT d.firstName, d.lastName, SUM(s.quantity) AS quantity
    FROM Developer d
    JOIN Sales s ON (s.developerId = d.Id)
    JOIN MobileApplication ma ON (ma.Id = s.applicationId)
    WHERE extract(month FROM s.sold) = extract(month FROM CURRENT_TIMESTAMP)
    and extract(year FROM s.sold) = extract(year FROM CURRENT_TIMESTAMP)
    GROUP BY s.applicationId;

SELECT * FROM MonthMobileAppSales ORDER BY quantity DESC LIMIT 1;
