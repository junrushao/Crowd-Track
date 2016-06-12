CREATE TABLE POI(
  pid INT AUTO_INCREMENT,
  name VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci UNIQUE,
  category VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  address VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  price FLOAT,
  url VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  phone VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  establish_year INT,
  operation_hours VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (pid)
);

CREATE TABLE Users(
  login VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  name VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  psw VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  address VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  phone VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  is_admin BOOLEAN NOT NULL DEFAULT '0',
  PRIMARY KEY (login)
);

CREATE TABLE VisitEvent(
  vid INT AUTO_INCREMENT,
  cost FLOAT,
  number_of_heads INT,
  visit_date DATE,
  PRIMARY KEY (vid)
);

CREATE TABLE Visit(
  login VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  pid INT,
  vid INT,
  PRIMARY KEY (login, pid, vid),
  FOREIGN KEY (login) REFERENCES Users(login),
  FOREIGN KEY (pid) REFERENCES POI(pid),
  FOREIGN KEY (vid) REFERENCES VisitEvent(vid)
);

CREATE TABLE Trust(
  login1 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  login2 VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  is_trusted BOOLEAN,
  PRIMARY KEY (login1, login2),
  FOREIGN KEY (login1) REFERENCES Users(login),
  FOREIGN KEY (login2) REFERENCES Users(login)
);

CREATE TABLE Feedback(
  pid INT NOT NULL,
  login VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ,
  text VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  fbdate DATE,
  score INT NOT NULL,
  PRIMARY KEY (pid, login),
  FOREIGN KEY (pid) REFERENCES POI (pid),
  FOREIGN KEY (login) REFERENCES Users (login),
  CHECK (score >= 0 AND score <= 10)
);

CREATE TABLE Rates(
  login VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  rated_login VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  rated_pid INT,
  rating INT,
  PRIMARY KEY (login, rated_login, rated_pid),
  FOREIGN KEY (login) REFERENCES Users(login),
  FOREIGN KEY (rated_login, rated_pid) REFERENCES Feedback(login, pid),
  CHECK(rating >= 0 AND rating <= 2)
);

CREATE TABLE Favorites(
  login VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  pid INT NOT NULL,
  PRIMARY KEY (login, pid),
  FOREIGN KEY (login) REFERENCES Users (login),
  FOREIGN KEY (pid) REFERENCES POI (pid)
);

CREATE TABLE hasKeywords(
  pid INT,
  word VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (pid, word),
  FOREIGN KEY (pid) REFERENCES POI (pid)
);
