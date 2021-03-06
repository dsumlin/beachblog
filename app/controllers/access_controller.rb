class AccessController < ApplicationController
  
  layout 'public'
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
    menu
    render ('menu')
  end
  
  def show
    @page = Page.where(:permalink => params[:id], :visible => true).first
      redirect_to(:action => 'index') unless @page
      @sections = @page.sections.paginate(:page => params[:page], :per_page => 1)


      
  end
  
  
  def menu
    @subjects = Subject.order("subjects.position ASC")
    
  end

  def login
  end
  
  def attempt_login
    authorized_user = AdminUser.authenticate(params[:username],
    params[:password])
      if authorized_user
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.username
        flash[:notice] = "You are logged in!!!"
        redirect_to(:action => 'menu')
      else
        flash[:notice] = "Wrong username or password"
        redirect_to(:action => 'login')
      end
  
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You have been logged out, Bye Bye"
    redirect_to(:action => "login")  
  end
  
  
  
end
