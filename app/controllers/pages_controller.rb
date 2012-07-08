class PagesController < ApplicationController
  
  layout 'admin'
   def index 
     list
     render('list')
   end

   def list
     @pages = Page.order("pages.position ASC")
    end

    def show 
      @page = Page.find(params[:id])
    end

    def new
      @page = Page.new
      @page_count = Page.count + 1
      @subject_count = Subject.count
    end

    def create
      #instantiate a new object form parameters
      @page = Page.new(params[:page])
      #Save the object
      if @page.save
        flash[:notice] = "Page Created!"
        redirect_to(:action => 'list')
      #if save fails   
      else
        @page_count = Page.count + 1
        @subject_count = Subject.count  
        render('new')
     end   
  end

   def edit
     @page = Page.find(params[:id])
     @page_count = Page.count
     @subject_count = Subject.count    
   end

   def update
     #find object form parameters
     @page = Page.find(params[:id])
      #update the object
      if @page.update_attributes(params[:page])
        #if update is a success...
        flash[:notice] = "Page Updated!"

        redirect_to(:action => 'show', :id => @page.id)
      #if save fails...   
      else
        @page_count = Page.count
        @subject_count = Subject.count
        render('edit')
     end
   end

   def delete
    @page = Page.find(params[:id]) 
   end 

   def destroy
    Page.find(params[:id]).destroy
    flash[:notice] = "Page Bye Bye!"
     redirect_to(:action => 'list')
   end
  
end
