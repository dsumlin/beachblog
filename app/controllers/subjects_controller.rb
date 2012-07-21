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
     new_position = params[:subject].delete(:position)
     #instantiate a new object form parameters
     @subject = Subject.new(params[:subject])
     #Save the object
     if @subject.save
       @subject.move_to_position(new_position)
       flash[:notice] = "Subject Created!"
       redirect_to(:action => 'list')  
     else
        #if save fails 
        @subject_count = Subject.count + 1
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
     new_position = params[:subject].delete(:position)
     if @subject.update_attributes(params[:subject])
       #if update is a success...
       @subject.move_to_position(new_position)
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
   subject = Subject.find(params[:id])
   subject.move_to_position(nil)
   subject.destroy
   flash[:notice] = "Subject Bye Bye!"
    redirect_to(:action => 'list')
  end  
end