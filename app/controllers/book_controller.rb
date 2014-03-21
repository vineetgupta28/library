class BookController < ApplicationController
   def post_params 
   params.require(:book).permit(:title,:price,:subject_id,:description)  
       end
       
   def list
      @books = Book.find(:all)
   end
   def show
      @book = Book.find(params[:id])
   end
   def new
      @book = Book.new
      @subjects = Subject.find(:all)
   end
   
   def create
      @book = Book.new(post_params)
      if @book.save
            redirect_to :action => 'list'
            session[:remember_token]='aa'
      else
            @subjects = Subject.find(:all)
            render :action => 'new'
      end
   end
   
   def edit
      @book = Book.find(params[:id])
      @subjects = Subject.find(:all)
   end
   def update
      @book = Book.find(params[:id])
      if @book.update_attributes(post_params)
         redirect_to :action => 'show', :id => @book
      else
         @subjects = Subject.find(:all)
         render :action => 'edit'
      end
   end
   def delete
      Book.find(params[:id]).destroy
      redirect_to :action => 'list'
   end
   def show_subjects
      @subject = Subject.find(params[:id])
   end
   def check_string(string)
     
   end
   
end
