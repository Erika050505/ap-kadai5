class SearchController < ApplicationController
  def search
    if params[:search_model] == "User"
      if params[:search_method] == "forward_match"
              @users = User.where("text LIKE?","#{:search_content}%")
      elsif params[:search_method] == "backward_match"
              @users = User.where("text LIKE?","%#{:search_content}")
      elsif params[:search_method] == "perfect_match"
              @users = User.where("#{:search_content}")
      elsif params[:search_method] == "partial_match"
              @users = User.where("text LIKE?","%#{:search_content}%")
      else
              @users = User.all
      end
    elsif params[:search_model] == "Book"
       if params[:search_method] == "forward_match"
              @books = Book.where("text LIKE?","#{:search_content}%")
       elsif params[:search_method] == "backward_match"
              @books = Book.where("text LIKE?","%#{:search_content}")
       elsif params[:search_method] == "perfect_match"
              @books = Book.where("#{:search_content}")
       elsif params[:search_method] == "partial_match"
              @books = Book.where("text LIKE?","%#{:search_content}%")
       else
              @books = Book.all
       end
    end
  end
end