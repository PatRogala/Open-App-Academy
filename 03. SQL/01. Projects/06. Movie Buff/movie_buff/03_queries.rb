def what_was_that_one_with(those_actors)
  Movie
    .select(:title, :id)
    .joins(:actors)
    .where(actors: { name: those_actors })
    .group(:id)
    .having('COUNT(actors.id) >= ?', those_actors.length)
end

def golden_age
  Movie
    .select('AVG(score), (yr / 10) * 10 AS decade')
    .group('decade')
    .order('avg(score) DESC')
    .first
    .decade
end

def costars(name)
  subquery = Movie.select(:id).joins(:actors).where(actors: { name: name })

  Movie
    .joins(:actors)
    .where.not(actors: { name: name })
    .where(movies: { id: subquery })
    .distinct
    .pluck(:name)
end

def actor_out_of_work
  Actor
    .select(:name)
    .joins('LEFT OUTER JOIN castings on castings.actor_id = actors.id')
    .where(castings: { movie_id: nil })
    .count
end

def starring(whazzername)
  matcher = "%#{whazzername.split('').join('%')}%"
  Movie.joins(:actors).where('UPPER(actors.name) LIKE UPPER(?)', matcher)
end

def longest_career
  Actor
    .select(:name, :id, 'MAX(movies.yr) - MIN(movies.yr) AS career')
    .joins(:movies)
    .order('career DESC, name')
    .group(:id)
    .limit(3)
end
