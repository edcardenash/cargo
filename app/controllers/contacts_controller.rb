class ContactsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :create]
require "mail_form"

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
      @contact = Contact.new(params[:contact])
      @contact.request = request
        authorize @contact
      if @contact.deliver
         flash[:notice] = 'Gracias por tu mensaje. Te contactaremos pronto!'
         redirect_to root_path
      else
        flash.now[:error] = 'Could not send message'
        render :new, status: :unprocessable_entity
      end
  end

  def sent

  end
end
