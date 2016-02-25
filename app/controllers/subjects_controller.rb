class SubjectsController < ApplicationController
  
  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Enter Name"})
  end

  def create
    #instantiate a new object using params from the form
    @subject = Subject.new(subject_params)
    #save the object
    if @subject.save
      #if save succeeds redirect to index
      redirect_to subjects_path
    else
      #if save fails, redisplay form so user can fix problems
      render  :new
    end
  end

  def edit
  end

  def delete
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
