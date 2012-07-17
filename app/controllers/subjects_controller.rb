class SubjectsController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in
  
  def index 
    list
    render('list')
  end
  
  def list
    @subjects = Subject.order("subjects.position ASC")
   end
   
   def show 
     @subject = Subject.find(params[:id])
   end
   
   def new
     @subject = Subject.new
     @subject_count = Subject.count + 1
   end
   
   def create
     #instantiate a new object form parameters
     @subject = Subject.new(params[:subject])
     #Save the object
     if @subject.save
       flash[:notice] = "Subject Created!"
       redirect_to(:action => 'list')  
     else
        #if save fails 
        @subject_count = Subject.count  
       render('new')
    end   
 end
 
  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
    
  end
  
  def update
    #find object form parameters
    @subject = Subject.find(params[:id])
     #update the object
     if @subject.update_attributes(params[:subject])
       #if update is a success...
       flash[:notice] = "Subject Updated!"
       
       redirect_to(:action => 'show', :id => @subject.id)
     else
       #if save fails... 
       @subject_count = Subject.count  
       render('edit')
    end
  end
  
  def delete
   @subject = Subject.find(params[:id]) 
  end 
   
  def destroy
   Subject.find(params[:id]).destroy
   flash[:notice] = "Subject Bye Bye!"
    redirect_to(:action => 'list')
  end  
end