class MoviesController < ApplicationController
  
  def index
    if (params[:search]) && (params[:duration] == "Select a duration") 
      @movies = Movie.where("title like ? OR director like ?", "%#{params[:search]}%", "%#{params[:search]}%").order("created_at DESC")
    elsif params[:duration] == "Under 90 minutes"
      @movies = Movie.where("runtime_in_minutes <= ?", 90)
    elsif params[:duration] == "Between 90 and 120 minutes"
      @movies = Movie.where(runtime_in_minutes: 90..120)
    elsif params[:duration] ==  "Over 120 minutes"
      @movies = Movie.where("runtime_in_minutes > ?", 120)
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(:title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :avatar, :avatar_url)
  end
end
