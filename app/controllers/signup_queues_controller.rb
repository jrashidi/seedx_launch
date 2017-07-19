class SignupQueuesController < ApplicationController
  # index show new edit create update destroy
  def index
    @signup_queues = SignupQueue.all
  end

  def show
    
  end

  def new
    @signup_queue = SignupQueue.new
  end

  def create
    @signup_queue = SignupQueue.new(signup_queue_params)

    respond_to do |format|
      if @signup_queue.save
        format.html { redirect_to @signup_queue, notice: 'signup_queue was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    def signup_queue_params
      params.require(:signup_queue).permit(:email)
    end

end
