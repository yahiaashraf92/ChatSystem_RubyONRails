class ApplicationsController < ApplicationController
  before_action :find_application, only: [ :update, :show ]
  def index
    render json: Application.all
  end

  # POST /applications
  # curl --header "content-type: application/json" --request POST --data '{"name":"ayhaga"}'  http://127.0.0.1:3000/applications
  def create
    @application = Application.new(application_params)

    if @application.save
      render json: { name: @application.name }, status: :created
    else
      render json: { error: @application.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /applications/:token
  def update
    if @application.update(application_params)
      render json: { message: "Application updated successfully" }
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # GET /applications/:token
  def show
    render json: @application
  end

  private

  def find_application
    @application = Application.find_by!(token: params[:token])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Application not found" }, status: :not_found
  end

  # curl --header "content-type: application/json" --request GET --data '{"name":"twitter"}'  http://127.0.0.1:3000/applications/get_token_by_name
  def get_token_by_name
    @application = Application.find_by(name: params[:name])

    if @application
      render json: { token: @application.token }, status: :ok
    else
      render json: { error: "Application not found" }, status: :not_found
    end
  end

  private

  # Strong parameters
  def application_params
    params.require(:application).permit(:name)
  end
end
