-- Создание таблицы Building
CREATE TABLE building (
                          id SERIAL PRIMARY KEY,
                          number INTEGER NOT NULL UNIQUE
);

-- Создание таблицы Apartment
CREATE TABLE apartment (
                           id SERIAL PRIMARY KEY,
                           number INTEGER NOT NULL,
                           building_id INTEGER NOT NULL,
                           FOREIGN KEY (building_id) REFERENCES building(id) ON DELETE CASCADE
);

-- Создание таблицы Person
CREATE TABLE person (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(50) NOT NULL,
                        last_name VARCHAR(50) NOT NULL,
                        age INTEGER NOT NULL,
                        apartment_id INTEGER NOT NULL,
                        FOREIGN KEY (apartment_id) REFERENCES apartment(id) ON DELETE CASCADE
);

-- Вставка данных в таблицу Building
INSERT INTO building (number) VALUES (1001), (1002);

-- Вставка данных в таблицу Apartment
-- 5 квартир для каждого дома
INSERT INTO apartment (number, building_id) VALUES
                                                (1, 1), (2, 1), (3, 1), (4, 1), (5, 1),  -- Квартиры в доме 1001
                                                (1, 2), (2, 2), (3, 2), (4, 2), (5, 2);  -- Квартиры в доме 1002

-- Вставка данных в таблицу Person
-- Квартиры с семьями
-- Квартира 1, дом 1001: семья без детей
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('John', 'Doe', 30, 1),   -- Муж
                                                            ('Jane', 'Doe', 28, 1);   -- Жена

-- Квартира 2, дом 1001: семья с одним ребенком до 18 лет
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Alice', 'Smith', 35, 2),   -- Мамa
                                                            ('Bob', 'Smith', 37, 2),     -- Папа
                                                            ('Tommy', 'Smith', 10, 2);    -- Ребенок

-- Квартира 3, дом 1001: семья с двумя детьми до 18 лет
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Mark', 'Johnson', 40, 3),  -- Папа
                                                            ('Lucy', 'Johnson', 38, 3),  -- Мамa
                                                            ('Anna', 'Johnson', 8, 3),    -- Первый ребенок
                                                            ('Billy', 'Johnson', 6, 3);    -- Второй ребенок

-- Квартира 4, дом 1001: семья без детей
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Linda', 'Taylor', 29, 4),  -- Мамa
                                                            ('James', 'Taylor', 31, 4);  -- Папа

-- Квартира 5, дом 1001: семья без детей
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Robert', 'Brown', 45, 5),  -- Папа
                                                            ('Emma', 'Brown', 42, 5);    -- Мамa

-- Квартиры дома 1002
-- Квартира 1, дом 1002: семья с одним ребенком до 18 лет
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('William', 'Williams', 34, 6),  -- Мамa
                                                            ('Sophia', 'Williams', 36, 6),    -- Папа
                                                            ('Liam', 'Williams', 12, 6);      -- Ребенок

-- Квартира 2, дом 1002: семья без детей
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Mason', 'Jones', 27, 7),  -- Мамa
                                                            ('Ava', 'Jones', 25, 7);    -- Папа

-- Квартира 3, дом 1002: семья с двумя детьми до 18 лет
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Ethan', 'Davis', 50, 8),  -- Папа
                                                            ('Isabella', 'Davis', 48, 8), -- Мамa
                                                            ('Emma', 'Davis', 15, 8),   -- Первый ребенок
                                                            ('Noah', 'Davis', 13, 8);    -- Второй ребенок

-- Квартира 4, дом 1002: семья без детей
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Aiden', 'Garcia', 30, 9),  -- Мамa
                                                            ('Zoe', 'Garcia', 29, 9);    -- Папа

-- Квартира 5, дом 1002: семья без детей
INSERT INTO person (name, last_name, age, apartment_id) VALUES
                                                            ('Alexander', 'Martinez', 32, 10),  -- Мамa
                                                            ('Mia', 'Martinez', 31, 10);        -- Папа