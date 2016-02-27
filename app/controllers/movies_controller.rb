class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    
    @sort_by = nil
    redirecter = false
    
    if params.has_key?(:sort_by)
      @sort_by = params[:sort_by]
    elsif session.has_key?(:sort_by)
      @sort_by = session[:sort_by]
      redirecter = true
    end
    
    @movies = Movie.order(@sort_by)
    session[:sort_by] = @sort_by
      
    @all_ratings = Movie.ratings
    @checked = {"ratings_G" => "1", "ratings_PG" => "1", "ratings_PG-13" => "1", "ratings_R" => "1", "ratings_NC-17" => "1"}

    # if params[:commit]=="Refresh"
      if params.has_key?(:ratings)
        @checked = params[:ratings]
      elsif session.has_key?(:ratings)
        @checked = session[:ratings]
        redirecter = true
      else
        @checked = {}
        @movies = []
      end
    # end

    session[:ratings] = @checked

    @movies = @movies.select do |m| 
      @rattemp = "ratings_" + m[:rating]
      @checked[@rattemp]=="1" end

    if redirecter
      flash.keep
      redirect_to movies_path({:ratings => @checked, :sort_by => @sort_by})
    end
  end
  
  def delete
  end

  def deleter
    title = params[:movie1]
    rating = params[:movie2]
    if title[:title] == ""
      @movie = Movie.all
      @movie.each do |m|
        if m[:rating] == rating[:rating]
          m.destroy
        end
      end
      flash[:notice] = "#{rating[:rating]} was deleted."
    else
      @movie = Movie.find_by_title(title[:title])
      @movie.destroy
      flash[:notice] = "#{@movie.title} was deleted."
    end
    redirect_to movies_path      
  end

  def new
    # default: render 'new' template
  end

  def updater
    # default: render 'updater' template
  end

  def movieupdater
    @movie = Movie.find_by_title(params[:movie][:title])
    if @movie == nil
      flash[:notice] = "Movie not found."
      redirect_to movies_path
    elsif params[:movie][:rating] == "" or params[:movie][:release_date] == ""
      flash[:notice] = "#{@movie.title} was not updated."
      redirect_to movies_path      
    else
      @movie.update_attributes!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    end
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
