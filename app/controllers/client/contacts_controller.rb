class Client::ContactsController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/contacts")
    @contacts = response.body
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    input_parameters = {
      first_name: params['first_name'],
      middle_name: params['middle_name'],
      last_name: params['last_name'],
      email: params['email'],
      phone_number: params['phone_number'],
      bio: params['bio']
    }
    response = Unirest.post("localhost:3000/api/contacts", parameters: input_parameters)
    @contact = response.body
    render "show.html.erb"
  end

  def show
    response = Unirest.get("localhost:3000/api/contacts/#{params[:id]}")
    @contact = response.body
    render "show.html.erb"
  end

  def edit
    response = Unirest.get("localhost:3000/api/contacts/#{params[:id]}")
    @contact = response.body
    render "edit.html.erb"
  end

  def update
    input_parameters = {
      first_name: params['first_name'],
      middle_name: params['middle_name'],
      last_name: params['last_name'],
      email: params['email'],
      phone_number: params['phone_number'],
      bio: params['bio']
    }
    response = Unirest.patch("localhost:3000/api/contacts/#{params[:id]}", parameters: input_parameters)
    @contact = response.body
    render "show.html.erb"
  end

  def destroy
    response = Unirest.delete("localhost:3000/api/contacts/#{params[:id]}")
    render "destroy.html.erb"
  end
end
