def it_was_ok
  Movie.select(:id, :title, :score).where(score: 2..3)
end

def harrison_ford
  Movie.select(:id, :title).joins(:actors).where(actors: { name: 'Harrison Ford' }).where.not(castings: { ord: 1 })
end

def biggest_cast
  Movie.select(:id, :title).joins(:actors).group('movies.id').order('COUNT(actors.id) DESC').limit(3)
end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.
end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.
end
