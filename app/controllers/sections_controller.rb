class SectionsController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_page
  
  
   def index 
     list
     render('list')
   end

   def list
     @sections = Section.sorted.where(:page_id => @page.id)
    end

    def show 
      @section = Section.find(params[:id]).paginate :page => params[:page], :per_page => 1
    end

    def new
      @section = Section.new(:page_id => @page.id)
      @section_count = @page.sections.size + 1
      @pages = Page.order('position ASC')
      @page_count = Page.count  
     end

    def create
      new_position = params[:section].delete(:position)
      #instantiate a new object form parameters
      @section = Section.new(params[:section])
      #Save the object
      if @section.save
        @section.move_to_position(new_position)
        flash[:notice] = "Section Created!"
        redirect_to(:action => 'list', :page_id => @section.page_id)
      #if save fails   
      else
        @section_count = @page.sections.size + 1
        @pages = Page.order('position ASC')
        @page_count = Page.count
        
        render('new')
     end   
  end

   def edit
     @section = Section.find(params[:id])
     @section_count = @page.sections.size 
     @pages = Page.order('position ASC')
     @page_count = Page.count  
    end

   def update
     #find object form parameters
     @section = Section.find(params[:id])
      #update the object
      new_position = params[:section].delete(:position)
      if @section.update_attributes(params[:section])
        @section.move_to_position(new_position)
        #if update is a success...
        flash[:notice] = "Section Updated!"
        redirect_to(:action => 'show', :id => @section.id, :page_id => @section.page_id)
      #if save fails...   
      else
        @section_count = @page.sections.size 
        @pages = Page.order('position ASC')
        @page_count = Page.count  
        
        render('edit')
     end
   end

   def delete
    @section = Section.find(params[:id]) 
   end 

   def destroy
    section = Section.find(params[:id])
    section.move_to_position(nil)
    section.destroy
    flash[:notice] = "Section Bye Bye!"
     redirect_to(:action => 'list', :page_id => @page.id)
   end
   
   private

  def find_page
     if params[:page_id]
       @page = Page.find_by_id(params[:page_id])
     end
   end
  
end
