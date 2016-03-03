class CoursesController < ApplicationController

  def course_params
    params.require(:course).permit(:title, :rating, :description, :instructor)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Course.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def np
  end
  
  def tabs
  end

  def index
    @course = Course.all
  end
  
  def delete
  end

  def deleter
    # title = params[:movie1]
    # rating = params[:movie2]
    # if title[:title] == ""
    #   @movie = Movie.all
    #   @movie.each do |m|
    #     if m[:rating] == rating[:rating]
    #       m.destroy
    #     end
    #   end
    #   flash[:notice] = "#{rating[:rating]} was deleted."
    # else
    #   @movie = Movie.find_by_title(title[:title])
    #   @movie.destroy
    #   flash[:notice] = "#{@movie.title} was deleted."
    # end
    # redirect_to movies_path      
  end

  def new
    # default: render 'new' template
  end

  def updater
    # default: render 'updater' template
  end

  def movieupdater
    # @movie = Movie.find_by_title(params[:movie][:title])
    # if @movie == nil
    #   flash[:notice] = "Movie not found."
    #   redirect_to movies_path
    # elsif params[:movie][:rating] == "" or params[:movie][:release_date] == ""
    #   flash[:notice] = "#{@movie.title} was not updated."
    #   redirect_to movies_path      
    # else
    #   @movie.update_attributes!(movie_params)
    #   flash[:notice] = "#{@movie.title} was successfully updated."
    #   redirect_to movie_path(@movie)
    # end
  end

  def create
    @course = Course.create!(course_params)
    flash[:notice] = "#{@course.title} was successfully created."
    redirect_to courses_path
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    @course.update_attributes!(course_params)
    flash[:notice] = "#{@coursee.title} was successfully updated."
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course '#{@course.title}' deleted."
    redirect_to courses_path
  end

end
