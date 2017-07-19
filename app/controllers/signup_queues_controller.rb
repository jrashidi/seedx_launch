class SignupQueuesController < ApplicationController
  # index show new edit create update destroy
  def index
    @signup_queues = SignupQueue.all
  end

  def show
    @signup_queue = SignupQueue.find(params[:id])
  end

  def new
    @signup_queue = SignupQueue.new
  end

  def create
    @signup_queue = SignupQueue.new(signup_queue_params)

    if params[:user_hash].present?
      @user = SignupQueue.find_by_user_hash(params[:user_hash])
      @user.increment!(:invited_users_count)

      @signup_queue.invited_by_user_id = @user.id
    end

    respond_to do |format|
      if @signup_queue.save
        format.html { redirect_to @signup_queue, notice: 'signup_queue was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
  end

  private
    def signup_queue_params
      params.require(:signup_queue).permit(:email)
    end

end
