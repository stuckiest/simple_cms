class SubjectsController < ApplicationController
  
  layout "admin"

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
      flash[:notice] = "#{@subject.name} created successfully"
      #if save succeeds redirect to index
      redirect_to subjects_path
    else
      #if save fails, redisplay form so user can fix problems
      render  :new
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #find an existing object using id
    @subject = Subject.find(params[:id])
    #update subject
    if @subject.update(subject_params)
      #if update succeeds redirect to index
      flash[:notice] = "#{@subject.name} updated successfully"
      redirect_to subjects_path
    else
      #if update fails, redisplay edit form so user can fix problems
      render  :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "#{@subject.name} deleted successfully"
    redirect_to subjects_path
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
