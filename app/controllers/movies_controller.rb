class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @movies = Movie.all.order("created_at DESC")
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
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'Movie successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path, notice: 'Movie successfully deleted.'
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
