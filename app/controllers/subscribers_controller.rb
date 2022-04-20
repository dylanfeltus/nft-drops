class SubscribersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_subscriber, only: [:update]

  def create
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.expires_at = DateTime.now + params[:months].month

    if @subscriber.save
      # render 'api/v1/people/show'
      puts "Saved!"
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end
  
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.json { render json: @subscriber, status: :ok }
      else
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_subscriber
    @subscriber = Subscriber.find_by_wallet(params[:wallet])
  end

  def subscriber_params
    params.require(:subscriber).permit(
      :wallet,
      :transaction_hash,
      :webhook_url,
      :months
    )
  end

end