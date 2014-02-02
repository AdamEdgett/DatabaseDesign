-- Enforce foreign keys for sqlite
PRAGMA foreign_keys = ON;
INSERT INTO Developer(name) VALUES("Adam");
INSERT INTO Application(name, created, price) VALUES("Google", "2014-1-31", 12);
INSERT INTO WebApplication(app_id, url, targetbrowser) VALUES(1, "google.com", "chrome");
INSERT INTO Role(type, devel_id, app_id) VALUES("Admin", 1, 1);
-- Should get an error due to FK constraint
INSERT INTO Role(type, devel_id, app_id) VALUES("Developer", 2, 3);
INSERT INTO Application(name, created, price) VALUES("Facebook", "2014-1-31", 20);
INSERT INTO MobileApplication(app_id, targetos) VALUES(2, "iOS");
