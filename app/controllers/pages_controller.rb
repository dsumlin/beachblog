class PagesController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_subject
  
   def index 
     list
     render('list')
   end

   def list
     @pages = Page.sorted.where(:subject_id => @subject.id)
     
   end
   

    def show 
      @page = Page.find(params[:id])
    end

    def new
      @page = Page.new(:subject_id => @subject.id)
      @page_count = @subject.pages.size + 1
      @subject_count = Subject.count  
    end

    def create
      new_position = params[:page].delete(:position)
      @page = Page.new(params[:page])
      if @page.save
        @page.move_to_position(new_position)
        flash[:notice] = "Page Created."
        redirect_to(:action => 'list', :subject_id => @page.subject_id)
      else
        @page_count = @subject.pages.size + 1
        @subject_count = Subject.order('position ASC')  
        render('new')
      end
    end
    
    

   def edit
     @page = Page.find(params[:id])
     @page_count = @subject.pages.size 
     @subject_count = Subject.order('position ASC')  
   end

   def update
     #find object form parameters
     @page = Page.find(params[:id])
      #update the object
      new_position = params[:page].delete(:position)    
      if @page.update_attributes(params[:page])
        #if update is a success...
        @page.move_to_position(new_position)
        flash[:notice] = "Page Updated!"
        redirect_to(:action => 'show', :id => @page.id, :subject_id => @page.subject_id)
      #if save fails...   
      else
        @page_count = @subject.pages.size
        @subject_count = Subject.order('position ASC')  
        render('edit')
     end
   end

   def delete
    @page = Page.find(params[:id]) 
   end 

   def destroy
    page = Page.find(params[:id])
    page.move_to_position(nil)
    page.destroy
    flash[:notice] = "Page Bye Bye!"
     redirect_to(:action => 'list', :subject_id => @subject.id)
   end
  
  private
  
 def find_subject
    if params[:subject_id]
      @subject = Subject.find_by_id(params[:subject_id])
    end
  end
  
  
end
