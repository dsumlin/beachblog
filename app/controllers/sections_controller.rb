class SectionsController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_page
  
  
   def index 
     list
     render('list')
   end

   def list
     @sections = Section.order("sections.position ASC").where(:page_id => @page.id)
    end

    def show 
      @section = Section.find(params[:id])
    end

    def new
      @section = Section.new(:page_id => @page.id)
      @page_count = Page.count + 1
      
    end

    def create
      #instantiate a new object form parameters
      @section = Section.new(params[:section])
      #Save the object
      if @section.save
        flash[:notice] = "Section Created!"
        redirect_to(:action => 'list', :page_id => @section.page_id)
      #if save fails   
      else
        @page_count = Page.count + 1 
        render('new')
     end   
  end

   def edit
     @section = Section.find(params[:id])
     @page_count = Page.count
     
   end

   def update
     #find object form parameters
     @section = Section.find(params[:id])
      #update the object
      if @section.update_attributes(params[:section])
        #if update is a success...
        flash[:notice] = "Section Updated!"
        redirect_to(:action => 'show', :id => @section.id, :page_id => @section.page_id)
      #if save fails...   
      else
        @page_count = Page.count + 1
        render('edit')
     end
   end

   def delete
    @section = Section.find(params[:id]) 
   end 

   def destroy
    Section.find(params[:id]).destroy
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
