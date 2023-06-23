# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  yr          :integer          not null
#  score       :float            not null
#  votes       :integer          not null
#  director_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Table name: castings
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint           not null
#  actor_id   :bigint           not null
#  ord        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null


def find_angelina
  Actor.find_by(name: 'Angelina Jolie')
end

def top_titles
  Movie
    .select(:title)
    .where('score >= 9')
end

def star_wars
  Movie
    .select(:id, :title, :yr)
    .where('title LIKE \'Star Wars%\'')
end


def below_average_years
  Movie
    .select('yr', 'COUNT(*) as bad_movies')
    .where('score < 5')
    .group('yr')
    .order('bad_movies DESC')
end

def alphabetized_actors
  Actor
    .select(:id, :name)
    .order(:name)
    .limit(10)
    .offset(10)
end

def pulp_fiction_actors
  Actor
    .select(:id, :name)
    .joins(:movies)
    .where('title = \'Pulp Fiction\'')
end

def uma_movies
  # practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'
  Movie
    .select(:id, :title, :yr)
    .joins(:actors)
    .where(actors: { name: 'Uma Thurman'})
    .order(:yr)
end