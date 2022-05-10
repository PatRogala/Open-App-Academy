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
  Movie.select(:id, :title).joins(:director).where(actors: { name: them })
end

def movie_names_before_1940
  Movie.where('yr < 1940').pluck(:title)
end
