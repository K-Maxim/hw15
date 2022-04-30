import sqlite3


def one_animal(itemid):
    with sqlite3.connect('animal.db') as connection:
        cursor = connection.cursor()
    query = """
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
            WHERE new_animals_table.name_id = ?
    """
    cursor.execute(query, (itemid,))
    executed_query = cursor.fetchall()
    result = executed_query

    animal = {'name': result[0][1],
              'animal_type': result[0][2],
              'breed': result[0][3],
              'color': result[0][4],
              'outcome_type': result[0][5],
              'outcome_mounth': result[0][6],
              'outcome_year': result[0][7]
              }

    return animal



