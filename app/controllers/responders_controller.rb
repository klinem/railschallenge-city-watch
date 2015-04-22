class RespondersController < ApplicationController
	# GET /responders
	def index
		@responders = Responder.all
	end

  # GET /responders/:name
	def show
		@responder = Responder.find_by!(name: params[:id])
	end

	# POST /responders/:name
  def create
		@responder = Responder.new(create_params)

		if @responder.save
			render :show, status: 201
		else
			render json: { message: @responder.errors }, status: 422
		end
	end

	# PUT|PATCH /responders/:name
	def update
		@responder = Responder.find_by(name: params[:id])

		if @responder.update(update_params)
			render :show
		else
			render json: { message: @responder.errors }, status: 422
		end
	end

	# DELETE /responders/:name
	def destroy
		@responder = Responder.find_by!(name: params[:id])
	end

	private

	def create_params
		params.require(:responder).permit(:type, :name, :capacity)
	end

	def update_params
		params.require(:responder).permit(:on_duty)
	end
end
