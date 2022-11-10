DELETE FROM book;
ALTER TABLE book AUTO_INCREMENT = 1001;

DELETE FROM category;
ALTER TABLE category AUTO_INCREMENT = 1001;

INSERT INTO `category` (`name`) VALUES ('Best Sellers'),('Art'),('Comics'),('Health'),('Literature'),('Mystery'),('Science'),('Travel');

#Best Sellers
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Bfg', 'Roald Dahl', '', 99, 0, TRUE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Verity', 'Colleen Hoover', '', 1740, 0, FALSE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Fairy-Tale', 'Stephen Kings', '', 2058, 0, TRUE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Wonder', 'R.J. Palacio', '', 967, 0, FALSE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Dreamland', 'Nicholas Sparks', '', 1915, 0, TRUE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Ugly Love', 'Colleen Hoover', '', 1040, 0, FALSE, FALSE, 1001);

#Art
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Arts', 'DK', '', 1500, 0, TRUE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Blue Dog', 'George Rodrigue', '', 3081, 0, FALSE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Maus I', 'Art Spiegelman', '', 1449, 0, TRUE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('God Of War', 'Sony Studios', '', 1209, 0, FALSE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Bluets', 'Maggie Nelson', '', 999, 0, TRUE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Van Gogh', 'Ingo F Walther', '', 1799, 0, FALSE, FALSE, 1002);

#Comics
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Tomie', 'Junji Ito', '', 520, 0, TRUE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Ducks', 'Kate Beaton', '', 919, 0, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('El Deafo', 'Cece Bell', '', 1103, 0, TRUE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Narwhal', 'Ben Clanton', '', 375, 0, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Dracula', 'Bram Stoker', '', 126, 0, TRUE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Gyo', 'Junji Ito', '', 1398, 0, FALSE, FALSE, 1003);

#Health
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Lighter', 'Yung Pueblo', '', 1569, 0, TRUE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Breath', 'James Nestor', '', 1225, 0, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Immune', 'Philipp Dettmer', '', 1743, 0, TRUE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Try Softer', 'Aundi Kolber', '', 845, 0, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Nurture', 'Erica Chidi', '', 992, 0, TRUE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Cribsheet', 'Emily Oster', '', 941, 0, FALSE, FALSE, 1004);

#Literature
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Confess', 'Colleen Hoover', '', 1800, 0, TRUE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Archer', 'Paulo Coelho', '', 1378, 0, FALSE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Maybe Now', 'Colleen Hoover', '', 1299, 0, TRUE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Belonging', 'Nora Krug', '', 3020, 0, FALSE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Severance', 'Ling Ma', '', 1797, 0, TRUE, FALSE, 1005);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('1984', 'George Orwell', '', 1499, 0, FALSE, FALSE, 1005);

#Mystery
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Maid', 'Nita Prose', '', 592, 0, TRUE, FALSE, 1006);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Suspect', 'Scott Turow', '', 1250, 0, FALSE, FALSE, 1006);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Body', 'Stephen King', '', 824, 0, TRUE, FALSE, 1006);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Gone Girl', 'Gillian Flynn', '', 999, 0, FALSE, FALSE, 1006);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Blue Moon', 'Lee Child', '', 1500, 0, TRUE, FALSE, 1006);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Cellar', 'Natasha Preston', '', 498, 0, FALSE, FALSE, 1006);

#Science
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Fair Play', 'Eve Rodsky', '', 1099, 0, TRUE, FALSE, 1007);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Stay True', 'Hua Hsu', '', 1702, 0, FALSE, FALSE, 1007);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Chatter', 'Ethan Kross', '', 1060, 0, TRUE, FALSE, 1007);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Savor', 'Fatima Ali', '', 1835, 0, FALSE, FALSE, 1007);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Mythology', 'Edith Hamilton', '', 1390, 0, TRUE, FALSE, 1007);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Zero to One', 'Peter Thiel', '', 1285, 0, FALSE, FALSE, 1007);

#Travel
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('New York', 'Megan Hess', '', 569, 0, TRUE, FALSE, 1008);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Wild', 'Cheryl Strayed', '', 2000, 0, FALSE, FALSE, 1008);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Escape', 'Gray Malin', '', 2166, 0, TRUE, FALSE, 1008);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Roadfood', 'Jane Stern', '', 959, 0, FALSE, FALSE, 1008);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Return', 'Hisham Matar', '', 1023, 0, TRUE, FALSE, 1008);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Dishoom', 'Shamil Thakrar', '', 1771, 0, FALSE, FALSE, 1008);