-- Drop tables
DROP TABLE IF EXISTS Developer;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS RoleType;
DROP TABLE IF EXISTS Application;
DROP TABLE IF EXISTS WebApplication;
DROP TABLE IF EXISTS Browser;
DROP TABLE IF EXISTS MobileApplication;
DROP TABLE IF EXISTS MobileOS;
DROP TABLE IF EXISTS DesktopApplication;
DROP TABLE IF EXISTS DesktopOS;
DROP TABLE IF EXISTS ApplicationAll;
DROP TABLE IF EXISTS Controller;
DROP TABLE IF EXISTS Script;
DROP TABLE IF EXISTS View;
DROP TABLE IF EXISTS EventHandler;
DROP TABLE IF EXISTS Model;
DROP TABLE IF EXISTS NameValuePair;
DROP TABLE IF EXISTS StringNVP;
DROP TABLE IF EXISTS NumberNVP;
DROP TABLE IF EXISTS DateNVP;
DROP TABLE IF EXISTS NameValueNVP;
DROP TABLE IF EXISTS NameValuePairAll;

-- Create tables
CREATE TABLE Developer(
    devel_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(devel_id)
);
CREATE TABLE Role(
    role_id INTEGER NOT NULL,
    type VARCHAR(50) NOT NULL,
    devel_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    PRIMARY KEY(role_id),
    FOREIGN KEY(type) REFERENCES RoleType(name),
    FOREIGN KEY(devel_id) REFERENCES Developer(devel_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(app_id) REFERENCES Application(app_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(devel_id, app_id)
);
CREATE TABLE RoleType(
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(name)
);

CREATE TABLE Application(
    app_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    created DATE,
    price DOUBLE DEFAULT 0,
    PRIMARY KEY(app_id)
);
CREATE TABLE WebApplication(
    webapp_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    url VARCHAR(200) NOT NULL,
    targetbrowser VARCHAR(50),
    PRIMARY KEY(webapp_id),
    FOREIGN KEY(app_id) REFERENCES Application(app_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(targetbrowser) REFERENCES Browser(name)
);
CREATE TABLE Browser(
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(name)
);
CREATE TABLE MobileApplication(
    mobileapp_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    targetos VARCHAR(50),
    installs INTEGER DEFAULT 0,
    PRIMARY KEY(mobileapp_id),
    FOREIGN KEY(app_id) REFERENCES Application(app_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(targetos) REFERENCES MobileOS(name)
);
CREATE TABLE MobileOS(
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(name)
);
CREATE TABLE DesktopApplication(
    deskapp_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    targetos VARCHAR(50),
    PRIMARY KEY(deskapp_id),
    FOREIGN KEY(app_id) REFERENCES Application(app_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(targetos) REFERENCES DesktopOS(name)
);
CREATE TABLE DesktopOS(
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(name)
);
-- Single table of applications (unused)
CREATE TABLE ApplicationAll(
    app_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    created DATE,
    price DOUBLE DEFAULT 0,
    installs INTEGER,
    targetbrowser VARCHAR(50),
    targetmobileos VARCHAR(50),
    targetdesktopos VARCHAR(50),
    PRIMARY KEY(app_id),
    FOREIGN KEY(targetbrowser) REFERENCES Browser(name),
    FOREIGN KEY(targetmobileos) REFERENCES MobileOS(name),
    FOREIGN KEY(targetdesktopos) REFERENCES DesktopOS(name)
);

CREATE TABLE Controller(
    controller_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    PRIMARY KEY(controller_id),
    FOREIGN KEY(app_id) REFERENCES Application(app_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Script(
    script_id INTEGER NOT NULL,
    controller_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    path VARCHAR(255) NOT NULL,
    PRIMARY KEY(script_id),
    FOREIGN KEY(controller_id) REFERENCES Controller(controller_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(model_id) REFERENCES Model(model_id)
);

CREATE TABLE View(
    view_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    superview_id INTEGER,
    PRIMARY KEY(view_id),
    FOREIGN KEY(app_id) REFERENCES Application(app_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(superview_id) REFERENCES View(view_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE EventHandler(
    eventhandler_id INTEGER NOT NULL,
    view_id INTEGER NOT NULL,
    script_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(eventhandler_id),
    FOREIGN KEY(view_id) REFERENCES View(view_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(script_id) REFERENCES Script(script_id)
);

CREATE TABLE Model(
    model_id INTEGER NOT NULL,
    app_id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(model_id),
    FOREIGN KEY(app_id) REFERENCES Application(app_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE NameValuePair(
    nvp_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY(nvp_id),
    FOREIGN KEY(model_id) REFERENCES Model(model_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE StringNVP(
    stringnvp_id INTEGER NOT NULL,
    nvp_id INTEGER NOT NULL,
    value VARCHAR(255) NOT NULL,
    PRIMARY KEY(stringnvp_id),
    FOREIGN KEY(nvp_id) REFERENCES NameValuePair(nvp_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE NumberNVP(
    numnvp_id INTEGER NOT NULL,
    nvp_id INTEGER NOT NULL,
    value INTEGER NOT NULL,
    PRIMARY KEY(numnvp_id),
    FOREIGN KEY(nvp_id) REFERENCES NameValuePair(nvp_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE DateNVP(
    datenvp_id INTEGER NOT NULL,
    nvp_id INTEGER NOT NULL,
    value DATE NOT NULL,
    PRIMARY KEY(datenvp_id),
    FOREIGN KEY(nvp_id) REFERENCES NameValuePair(nvp_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE NameValueNVP(
    nvpnvp_id INTEGER NOT NULL,
    parent_nvp_id INTEGER NOT NULL,
    value_nvp_id INTEGER NOT NULL,
    PRIMARY KEY(nvpnvp_id),
    FOREIGN KEY(parent_nvp_id) REFERENCES NameValuePair(nvp_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(value_nvp_id) REFERENCES NameValuePair(nvp_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
-- Single table of name value pairs (unused)
CREATE TABLE NameValuePairAll(
    nvp_id INTEGER NOT NULL,
    model_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    stringvalue VARCHAR(255),
    numbervalue INTEGER,
    datevalue DATE,
    nvpvalue INTEGER,
    PRIMARY KEY(nvp_id),
    FOREIGN KEY(model_id) REFERENCES Model(model_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nvpvalue) REFERENCES NameValuePairAll(nvp_id)
);

