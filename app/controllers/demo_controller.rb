class DemoController < ApplicationController
  
  layout 'admin'
  def index
    #render('begin')
    #redirect_to(:action => 'other_begin')
  end
  
  def begin
    @array = [1,2,3,4,5]
    @id = params[:id].to_i
    @page = params[:page].to_i
  end 
  
  def other_begin
    render(:text => 'Lets Start')
  end   
  def javascripts
  
  end
  
  def text_helpers
    
    end
  
  def escape_output
      
  end    
end
