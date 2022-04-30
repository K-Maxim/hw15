CREATE TABLE animal_type (
    animal_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    animal_type TEXT
);

INSERT INTO animal_type (animal_type)
SELECT DISTINCT animal_type
FROM animals;



CREATE TABLE breed (
    breed_id INTEGER PRIMARY KEY AUTOINCREMENT,
    breed TEXT
);

INSERT INTO breed (breed)
SELECT DISTINCT breed
FROM animals;



CREATE TABLE color1 (
    color1_id INTEGER PRIMARY KEY AUTOINCREMENT,
    color1 TEXT
);

INSERT INTO color1 (color1)
SELECT DISTINCT color1
FROM animals;



CREATE TABLE color2 (
    color2_id INTEGER PRIMARY KEY AUTOINCREMENT,
    color2 TEXT
);

INSERT INTO color2 (color2)
SELECT DISTINCT color2
FROM animals;



CREATE TABLE outcome_subtype(
    outcome_subtype_id INTEGER PRIMARY KEY AUTOINCREMENT,
    outcome_subtype TEXT
);

INSERT INTO outcome_subtype (outcome_subtype)
SELECT DISTINCT outcome_subtype
FROM animals;



CREATE TABLE outcome_type (
    outcome_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    outcome_type TEXT
);

INSERT INTO outcome_type (outcome_type)
SELECT DISTINCT outcome_type
FROM animals;

CREATE TABLE outcome_month (
    outcome_month_id INTEGER PRIMARY KEY AUTOINCREMENT,
    outcome_month TEXT
);

INSERT INTO outcome_month (outcome_month)
SELECT DISTINCT outcome_month
FROM animals;

CREATE TABLE outcome_year (
    outcome_year_id INTEGER PRIMARY KEY AUTOINCREMENT,
    outcome_year TEXT
);

INSERT INTO outcome_year (outcome_year)
SELECT DISTINCT outcome_year
FROM animals;


CREATE TABLE new_animals_table (
    name_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT(50),
    animal_type_id INTEGER ,
    breed_id  INTEGER,
    color1_id INTEGER,
    color2_id INTEGER,
    date_of_birth TEXT,
    outcome_subtype_id INTEGER,
    outcome_type_id	INTEGER,
    outcome_month_id INTEGER,
    outcome_year_id INTEGER,
    FOREIGN KEY (animal_type_id) REFERENCES animal_type(animal_type_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (breed_id) REFERENCES breed(breed_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (color1_id) REFERENCES color1(color1_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (color2_id) REFERENCES color2(color2_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (outcome_subtype_id) REFERENCES outcome_subtype(outcome_subtype_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (outcome_type_id) REFERENCES outcome_type(outcome_type_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (outcome_month_id) REFERENCES outcome_month(outcome_month_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (outcome_year_id) REFERENCES outcome_year(outcome_year_id) ON DELETE SET NULL ON UPDATE CASCADE
);


INSERT INTO new_animals_table (name, date_of_birth, animal_type_id, breed_id, color1_id, color2_id, outcome_subtype_id,
                               outcome_type_id, outcome_month_id, outcome_year_id)
SELECT (name), (date_of_birth), (animal_type.animal_type_id), (breed.breed_id), (color1.color1_id), (color2.color2_id),
       (outcome_subtype.outcome_subtype_id), (outcome_type.outcome_type_id), (outcome_month.outcome_month_id),
       (outcome_year.outcome_year_id)
FROM animals
LEFT JOIN animal_type ON animals.animal_type = animal_type.animal_type
LEFT JOIN breed ON animals.breed = breed.breed
LEFT JOIN color1 ON animals.color1 = color1.color1
LEFT JOIN color2 ON animals.color2 = color2.color2
LEFT JOIN outcome_subtype ON animals.outcome_subtype = outcome_subtype.outcome_subtype
LEFT JOIN outcome_type ON animals.outcome_type = outcome_type.outcome_type
LEFT JOIN outcome_month ON animals.outcome_month = outcome_month.outcome_month
LEFT JOIN outcome_year ON animals.outcome_year = outcome_year.outcome_year;



SELECT new_animals_table.name_id, new_animals_table.name, animal_type.animal_type, breed.breed, color1.color1,
       outcome_type.outcome_type, outcome_month.outcome_month,
       outcome_year.outcome_year
FROM new_animals_table
INNER JOIN animal_type ON new_animals_table.animal_type_id = animal_type.animal_type_id
INNER JOIN breed ON new_animals_table.breed_id = breed.breed_id
INNER JOIN color1 ON new_animals_table.color1_id = color1.color1_id
INNER JOIN outcome_type ON new_animals_table.outcome_type_id = outcome_type.outcome_type_id
INNER JOIN outcome_month ON new_animals_table.outcome_month_id = outcome_month.outcome_month_id
INNER JOIN outcome_year ON new_animals_table.outcome_year_id = outcome_year.outcome_year_id
