class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)
      if @movie.save
        redirect_to root_path, notice: 'Movie successfully created.'
      else
        render :new
      end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def find_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :image, :description, :user_id)
    end
end
