class PayersController < ApplicationController
  def index
   @payers = Payer.all
   render json: @payers
 end

 def show
   @payer =  Payer.find(params[:id])
   render json: @payer
 end

 def create
   @payer = Payer.new(payer_params)
  if @payer.save
    render json: @payer, status: :accepted
  else
    render json: {errors: @payer.errors.full_messages}, status: :unprocessible_entity
  end
 end

 private

 def payer_params
   params.permit(:name)
 end
end
