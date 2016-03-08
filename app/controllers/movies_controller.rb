class MoviesController < ApplicationController
  
  def index
    # MM2
    # 1. Having so much logic in your controller action is not good. You should put logic in your models so you can have unit tests in your models.
    # 2. In here you should only have something like @movies = Movie.search(parms[:search], params[:duration]) and put logic in search method in Movie class
    # 3. There is issue with the logic where you can only filter by search term or by duration, what if you want to filter by both?
    # 4. Search should probably be in a seperate action because it's a different mode and it's easier to display search result like that
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
    # MM3: You could have gotten away by doing Movie.find(params[:id]).destroy which is much shorter. You declared a variable that you will never use in the views.
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(:title, :release_date, :director, :runtime_in_minutes, :description, :avatar)
  end
end
