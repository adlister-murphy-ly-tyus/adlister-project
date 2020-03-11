USE adlister_db;


INSERT INTO users (id, username, password, email, phone_number)
VALUES (1, 'Bob', '123', 'bob@gmail.com', '999-999-9999'),
       (2, 'Eric', '123', 'eric@gmail.com', '111-111-1111'),
       (3, 'Sarah', '123', 'sarah@gmail.com', '222-222-2222'),
       (4, 'Jared', '123', 'jared@gmail.com', '333-333-3333'),
       (5, 'Michael', '123', 'michael@gmail.com', '444-444-4444');


INSERT INTO categories (name)
VALUES ('Services'),
       ('Beauty'),
       ('Cell/mobile'),
       ('Electronic'),
       ('Creative'),
       ('Cycle'),
       ('Event'),
       ('Farm/garden'),
       ('Finance'),
       ('Household'),
       ('Labor'),
       ('Appliances'),
       ('Vehicles'),
       ('Books'),
       ('Music'),
       ('Jewelry'),
       ('Tools'),
       ('Games'),
       ('General'),
       ('Pet');

INSERT INTO ads (id, user_id, title, price, description)
VALUES (1, 1, 'Old PS4', 150, 'Slightly used'),
       (2, 1, 'Toyota Corolla', 15800.00, 'Small dent on side, but runs perfectly!'),
       (3, 2, 'Macbook', 1000, 'selling for best offer'),
       (4, 2, 'Aston Martin', 1200000, '2018 version, sale is final'),
       (5, 2, 'God of War', 30.50, 'PS4 game'),
       (6, 3, 'Gears of War', 40, 'Xbox One game, unopened'),
       (7, 3, 'Childrens clothes', 45, 'Assorted childrens shirts and pants. 9 items total.'),
       (8, 4, 'Child', 40000, 'I''m selling my kid'),
       (9, 5, 'Guitar Lessons', 40, 'Willing to teach for $40 an hour. Pro musician.'),
       (10, 5, 'Car Repair', 1, 'Selling car repairs. Prices vary.');

INSERT INTO ads_has_category (ads_id, category_id)
VALUES (1, 4),
       (1, 18),
       (2, 13),
       (3, 4),
       (4, 13),
       (5, 18),
       (6, 18),
       (7, 19),
       (8, 19),
       (9, 19),
       (9, 1),
       (10, 13),
       (10, 1);