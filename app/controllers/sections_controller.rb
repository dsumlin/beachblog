class SectionsController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  
   def index 
     list
     render('list')
   end

   def list
     @sections = Section.order("sections.position ASC")
    end

    def show 
      @section = Section.find(params[:id])
    end

    def new
      @section = Section.new
      @page_count = Page.count + 1
      
    end

    def create
      #instantiate a new object form parameters
      @section = Section.new(params[:section])
      #Save the object
      if @section.save
        flash[:notice] = "Section Created!"
        redirect_to(:action => 'list')
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

        redirect_to(:action => 'show', :id => @section.id)
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
     redirect_to(:action => 'list')
   end
   
  
end
