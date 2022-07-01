CREATE TABLE person (
    id int PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE person_friend (
    person_id int NOT NULL,
    friend_id int NOT NULL,
    CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_friend_id FOREIGN KEY (friend_id) REFERENCES person(id)
);
