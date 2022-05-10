def eighties_b_movies
  Movie.select(:id, :title, :yr, :score).where(yr: 1980..1989, score: 3..5)
end

def bad_years
  Movie.group(:yr).having('MAX(score) < 8').pluck(:yr)
end

def cast_list(title)
  Actor.joins(:movies).where(movies: { title: title }).order('castings.ord').select(:id, :name)
end

def vanity_projects
  Movie.select('movies.id, movies.title, actors.name').joins(:actors).where('director_id = actors.id').where(castings: { ord: 1 })
end

def most_supportive
  Actor.select(:id, :name, 'COUNT(castings.actor_id) as roles')
       .joins(:castings)
       .where.not(castings: { ord: 1 })
       .group('actors.id')
       .order('roles DESC')
       .limit(2)
end
