require 'rails_helper'

describe Movie do
    describe "similar_movies" do
        it "find movies by the same director" do
            movie1 = Movie.create! director: 'Cathy'
            movie2 = Movie.create! director: 'Cathy'
            expect(movie1.movies_of_director).to include(movie2)
        end
        it "not find movies by different directors" do
            movie1 = Movie.create! director: 'Cathy'
            movie2 = Movie.create! director: 'Dan'
            expect(movie1.movies_of_director).not_to include(movie2)
        end
    end
end