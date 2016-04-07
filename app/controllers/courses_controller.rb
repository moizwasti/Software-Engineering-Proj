class CoursesController < ApplicationController

  def course_params
    params.require(:course).permit(:title, :rating, :description, :instructor)
  end

  def show
    id = params[:id]
    @allcourses = Course.all
    @course = Course.find(id)
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


  def new
    # default: render 'new' template
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
