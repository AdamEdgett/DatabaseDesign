-- Enforce foreign keys for sqlite
PRAGMA foreign_keys = ON;
-- Set output style for sqlite

-- Populate enumerations
INSERT INTO RoleType(name) VALUES
    ("Business Analyst"),
    ("Architect"),
    ("Database Admin"),
    ("Back End Developer"),
    ("Front End Developer");

INSERT INTO Browser(name) VALUES
    ("Chrome"), ("Firefox"), ("Safari"), ("IE");

INSERT INTO MobileOS(name) VALUES
    ("Android"), ("iOS"), ("Blackberry");

INSERT INTO DesktopOS(name) VALUES
    ("Windows"), ("OSX"), ("Linux");

INSERT INTO Developer(name) VALUES("Adam");
INSERT INTO Developer(name) VALUES("John");
INSERT INTO Developer(name) VALUES("Bob");
INSERT INTO DEVELOPER(name) VALUES("Tim");

-- Example Applications
INSERT INTO Application(name, created, price) VALUES("Google", "2014-01-31", 12);
INSERT INTO WebApplication(app_id, url, targetbrowser) VALUES(1, "google.com", "Chrome");
INSERT INTO Role(type, devel_id, app_id) VALUES("Database Admin", 1, 1);
INSERT INTO Application(name, created, price) VALUES("Facebook", "2014-01-31", 20);
INSERT INTO MobileApplication(app_id, targetos) VALUES(2, "iOS");
INSERT INTO Role(type, devel_id, app_id) VALUES("Back End Developer", 1, 2);
INSERT INTO Application(name, created, price) VALUES("Sublime Text", "2012-05-13", 70);
INSERT INTO DesktopApplication(app_id, targetos) VALUES(3, "Windows");
INSERT INTO Role(type, devel_id, app_id) VALUES("Front End Developer", 2, 3);
INSERT INTO Application(name, created) VALUES ("Dropbox", "2013-07-17");
INSERT INTO WebApplication(app_id, url, targetbrowser) VALUES(4, "dropbox.com", "Firefox");
INSERT INTO Role(type, devel_id, app_id) VALUES("Architect", 3, 4);
INSERT INTO Application(name, created, price) VALUES("Angry Birds", "2011-04-11", 1);
INSERT INTO MobileApplication(app_id, targetos) VALUES(5, "Blackberry");
INSERT INTO Role(type, devel_id, app_id) VALUES("Business Analyst", 4, 5);

-- Continue extension of first example application
INSERT INTO Controller(app_id) VALUES(1);
INSERT INTO Model(app_id, name) VALUES(1, "Searches");
INSERT INTO View(app_id, name) VALUES(1, "Search Results");
INSERT INTO Script(controller_id, model_id, name, path) VALUES(1, 1, "search", "/www/js/search.js");
INSERT INTO EventHandler(view_id, script_id, name) VALUES(1, 1, "Run Search");
INSERT INTO NameValuePair(model_id, name) VALUES(1, "Query");
INSERT INTO StringNVP(nvp_id, value) VALUES(1, "northeastern");
INSERT INTO Model(app_id, name) VALUES(1, "Results");
INSERT INTO NameValuePair(model_id, name) VALUES(2, "Result Page 1");
INSERT INTO NameValuePair(model_id, name) VALUES(2, "Search Date");
INSERT INTO DateNVP(nvp_id, value) VALUES(3, "2014-02-1");
INSERT INTO NameValuePair(model_id, name) VALUES(2, "northeastern.edu");
INSERT INTO NumberNVP(nvp_id, value) VALUES(4, 1);
INSERT INTO NameValueNVP(parent_nvp_id, value_nvp_id) VALUES(3, 4);

-- Print all data
SELECT * FROM RoleType;
SELECT * FROM Browser;
SELECT * FROM MobileOS;
SELECT * FROM DesktopOS;
SELECT * FROM Developer;
SELECT * FROM Role;
SELECT * FROM Application;
SELECT * FROM MobileApplication;
SELECT * FROM WebApplication;
SELECT * FROM DesktopApplication;
SELECT * FROM Controller;
SELECT * FROM Model;
SELECT * FROM View;
SELECT * FROM Script;
SELECT * FROM EventHandler;
SELECT * FROM NameValuePair;
SELECT * FROM StringNVP;
SELECT * FROM NumberNVP;
SELECT * FROM DateNVP;
SELECT * FROM NameValueNVP;

-- Print joined tables
SELECT name, created, price, url, targetbrowser
    FROM Application NATURAL JOIN WebApplication;
SELECT Developer.name, Role.type, Application.name FROM Role
    INNER JOIN Developer using (devel_id)
    INNER JOIN Application using (app_id);

-- Error testing
-- Exepected error due to FK constraints
INSERT INTO Role(type, devel_id, app_id) VALUES("Database Admin", 8, 7);
-- Returns "Error: near line 91: FOREIGN KEY constraint failed"

-- Expected error due to NOT NULL constraint on name
INSERT INTO Application(created, price) VALUES("2014-1-31", 1);
-- Returns "Error: near line 95: NOT NULL constraint failed: Application.name"

-- Expected error due to PK constraint
INSERT INTO DesktopApplication(deskapp_id, app_id, targetos) VALUES(1, 1, "Linux");
-- Returns "Error: near line 99: UNIQUE constraint failed: DesktopApplication.deskapp_id"

-- Expected error due to FK constraint
INSERT INTO Script(controller_id, model_id, name, path) VALUES(11, 7, "test", "test.py");
-- Returns "Error: near line 103: FOREIGN KEY constraint failed"
