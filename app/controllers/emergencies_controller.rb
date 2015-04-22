class EmergenciesController < ApplicationController
  before_filter :find_emergency!, except: [:index, :create]

  # GET /emergencies
  def index
  end

  # POST /emergencies
  def create
    @emergency = Emergency.new(create_params)

    if @emergency.save
      render :show, status: 201
    else
      render json: { message: @emergency.errors }, status: 422
    end
  end

  # GET /emergencies/:code
  def show
  end

  # PUT|PATCH /emegencies/:code
  def update
    if @emergency.update(update_params)
      render :show
    else
      render json: { errors: @emergency.errors }, status: 422
    end
  end

  # DELETE /emergencies/:code
  def destroy
  end

  private
  def create_params
    params.require(:emergency).permit(:code, :message, :fire_severity,
      :medical_severity, :police_severity)
  end

  def update_params
    params.require(:emergency).permit(:fire_severity, :medical_severity,
      :police_severity, :resolved_at)
  end

  def find_emergency!
    @emergency = Emergency.find_by!(code: params[:id])
  end
end
