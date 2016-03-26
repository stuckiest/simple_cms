class PagesController < ApplicationController
  
layout "admin"

  def index
  	@pages = Page.sorted
  end

  def show
  	@page = Page.find(params[:id])
  end

  def new
  	@page = Page.new
  end

  def create
  	@page = Page.new(page_params)
  	if @page.save
  		flash[:notice] = "#{@page.name} created successfully"
  		redirect_to pages_path
  	else
  		render :new
  	end
  end

  def edit
  	@page = Page.find(params[:id])
  end

  def update
  	@page = Page.find(params[:id])
  	if @page.update(page_params)
  		flash[:notice] = "#{@page.name} updated successfully"
  		redirect_to pages_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@page.find(params[:id])
  	@page.destroy
  	flash[:notice] = "#{@page.name} destroyed successfully"
  	redirect_to pages_path
  end

private
	def page_params
		params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
	end

end
