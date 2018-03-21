require 'rails_helper'

describe MoviesController do

    describe "director" do
        context "When specified movie has a director" do
            
            it "find movies with the same director" do
            
            @movie_id="-1"
            @movie=double('new_movie', :director => 'Alex')
            
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            expect(@movie).to receive(:movies_of_director)
            
            get :director, :id => @movie_id
            
            expect(response).to render_template(:director)
        end
    end
        context "When specified movie has no director" do
            it "redirect to the movies page" do
            @movie_id="-1"
            @movie=double('new_movie').as_null_object
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            get :director, :id => @movie_id
            expect(response).to redirect_to(movies_path)
            
            end
        end
    end

  describe "create" do
    it "create movie with provided parameters" do
        @movie_id = "-1"
        @movie = double('new_movie').as_null_object
        @defaults = { :title => "New Movie", :rating => "R", :director => "Bill" }
        expect(Movie).to receive(:create!).and_return(@movie)
        post :create, :movie => @defaults
        expect(response).to redirect_to(movies_path)
    end
  end
  describe "show" do
    it "display details about an existing movie" do
        @movie_id = "-1"
        @movie = double('new_movie').as_null_object
        expect(Movie).to receive(:find).and_return(@movie)
        get :show, :id => @movie_id
        expect(response).to render_template(:show)
    end
  end
  describe "destroy" do
    it "delete the specific movie" do
        @movie_id = "-1"
        @movie = double('new_movie').as_null_object
        expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
        expect(@movie).to receive(:destroy)
        delete :destroy, :id => @movie_id
        expect(response).to redirect_to(movies_path)
    end
  end
  describe "edit" do
    it "edit an existing movie" do
        @movie_id = "-1"
        @movie = double('new_movie').as_null_object
        expect(Movie).to receive(:find).and_return(@movie)
        get :edit, :id => @movie_id
        expect(response).to render_template(:edit)
    end
  end
  describe "new" do
    it "should render the new template" do
        get :new 
        expect(response).to render_template(:new)
    end
  end
  
  describe "sorting movies" do
    it "sort with selected_ratings" do 
        get 'index', {:sort => "title"} 
        expect(response.body).to include "ratings"
    end
    it "sort with release_date" do 
        get 'index', {:sort => "release_date"} 
        expect(response.body).to include "release_date"
    end 
  end
    
  
end
