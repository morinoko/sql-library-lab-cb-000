def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
    SELECT books.title, 
          books.year 
    FROM books
     WHERE series_id = 1
    ORDER BY year;
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name AS character_name,
          characters.motto AS longest_motto
    FROM characters
    ORDER BY LENGTH(characters.motto) DESC
    LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species,
          COUNT(characters.species) AS number_of_appearances
   FROM characters
   GROUP BY characters.species
   ORDER BY number_of_appearances DESC
   LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name AS author_name,
          subgenres.name AS subgenre_name
   FROM authors
   INNER JOIN series ON authors.id = series.author_id
   INNER JOIN subgenres ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title AS series_with_most_humans FROM series
  INNER JOIN characters ON series.id = characters.series_id
  WHERE characters.species = 'human'
  GROUP BY series.title
  ORDER BY COUNT(characters.species) DESC
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name AS character_name,
          COUNT(books.id) AS number_of_books_appeared_in
   FROM characters
   INNER JOIN character_books ON characters.id = character_books.character_id
   INNER JOIN books ON books.id = character_books.book_id
   GROUP BY characters.name
   ORDER BY number_of_books_appeared_in DESC;"
end
