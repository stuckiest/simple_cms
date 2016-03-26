class SectionsController < ApplicationController
  
	layout "admin"

  def index
  	@sections = Section.sorted
  end

  def show
  	@section = Section.find(params[:id])
  end

  def new
  	@section = Section.new({:name => "Enter Name"})
  end

  def create
  	@section = Section.new
  	if @section.save(section_params)
  		flash[:notice] = "#{@section.name} created successfully"
      #if save succeeds redirect to index
  		redirect_to sections_path
  	else
  		render :new
  	end
  end

  def edit
  	@section = Section.find(params[:id])
  end

  def update
  	@section = Section.find(params[:id])
  	if @section.update(section_params)
  		flash[:notice] = "#{@section.name} updated successfully"
  		redirect_to sections_path
  	else
  		render :edit
  	end
	end

  def destroy
  	@section = Section.find(params[:id])
  	@section.destroy
  	flash[:notice] = "#{@section.name} destroyed successfully"
  	redirect_to sections_path
  end

  private
	  def section_params
	  	params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
	  end
end
