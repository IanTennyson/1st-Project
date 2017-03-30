DROP TABLE cocktails;
DROP TABLE ingredients_lists;
DROP TABLE ingredients;
DROP TABLE measures;

CREATE TABLE measures (
  id SERIAL8 PRIMARY KEY,
  ml INT4
);

CREATE TABLE ingredients (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  measure_id INT4 REFERENCES measures(id) ON DELETE CASCADE,
  price DECIMAL,
  is_alcoholic BOOLEAN
);

CREATE TABLE ingredients_lists (
  id SERIAL8 PRIMARY KEY,
  ing1_id INT4 REFERENCES ingredients(id) ON DELETE CASCADE,
  ing2_id INT4 REFERENCES ingredients(id) ON DELETE CASCADE,
  ing3_id INT4 REFERENCES ingredients(id) ON DELETE CASCADE,
  ing4_id INT4 REFERENCES ingredients(id) ON DELETE CASCADE
);

CREATE TABLE cocktails (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  ing_list_id INT4 REFERENCES ingredients_lists(id) ON DELETE CASCADE,
  prep_description VARCHAR(255)
);