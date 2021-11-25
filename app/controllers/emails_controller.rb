require 'faker'

class EmailsController < ApplicationController

    def index
      @emails = Email.all
    end

    def create
      @email = Email.create(object: Faker::Book.title, body: Faker::Book.author)
  
     
    end

    def show
      @email = Email.find(params[:id])

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    end

    def destroy
      @email = Email.find(params[:id])
      @email.destroy

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { redirect_to root_path }
      end
    end
  
    private
  
  def emails_params
    params.permit(:object, :body)
  end
  
  
end
