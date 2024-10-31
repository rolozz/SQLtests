
CREATE TABLE building (
                          id SERIAL PRIMARY KEY,
                          number INTEGER NOT NULL UNIQUE
);


CREATE TABLE apartment (
                           id SERIAL PRIMARY KEY,
                           number INTEGER NOT NULL,
                           building_id INTEGER NOT NULL,
                           FOREIGN KEY (building_id) REFERENCES building(id) ON DELETE CASCADE
);


CREATE TABLE person (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(50) NOT NULL,
                        last_name VARCHAR(50) NOT NULL,
                        age INTEGER NOT NULL,
                        apartment_id INTEGER NOT NULL,
                        FOREIGN KEY (apartment_id) REFERENCES apartment(id) ON DELETE CASCADE
);


INSERT INTO building (number) VALUES (1001), (1002);


INSERT INTO apartment (number, building_id) VALUES
                                                (1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
                                                (1, 2), (2, 2), (3, 2), (4, 2), (5, 2);


INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('John', 'Doe', 30, 1),
                                                            ('Jane', 'Doe', 28, 1),
                                                            ('Alice', 'Smith', 35, 2),
                                                            ('Bob', 'Smith', 37, 2),
                                                            ('Tommy', 'Smith', 10, 2),
                                                            ('Mark', 'Johnson', 40, 3),
                                                            ('Lucy', 'Johnson', 38, 3),
                                                            ('Anna', 'Johnson', 8, 3),
                                                            ('Billy', 'Johnson', 6, 3),
                                                            ('Linda', 'Taylor', 29, 4),
                                                            ('James', 'Taylor', 31, 4),
                                                            ('Robert', 'Brown', 45, 5),
                                                            ('Emma', 'Brown', 42, 5),
                                                            ('William', 'Williams', 34, 6),
                                                            ('Sophia', 'Williams', 36, 6),
                                                            ('Liam', 'Williams', 12, 6),
                                                            ('Mason', 'Jones', 27, 7),
                                                            ('Ava', 'Jones', 25, 7),
                                                            ('Ethan', 'Davis', 50, 8),
                                                            ('Isabella', 'Davis', 48, 8),
                                                            ('Emma', 'Davis', 15, 8),
                                                            ('Noah', 'Davis', 13, 8),
                                                            ('Aiden', 'Garcia', 30, 9),
                                                            ('Zoe', 'Garcia', 29, 9),
                                                            ('Alexander', 'Martinez', 32, 10),
                                                            ('Mia', 'Martinez', 31, 10);