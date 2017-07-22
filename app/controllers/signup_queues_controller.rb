class SignupQueuesController < ApplicationController
  # index show new edit create update destroy
  def index
    @signup_queues = SignupQueue.order(:id)
  end

  def show
    @signup_queue = SignupQueue.find(params[:id])
  end

  def new
    @signup_queue = SignupQueue.new
  end

  def create
    @signed_user = SignupQueue.find_by_email(params[:signup_queue][:email])
    if @signed_user.present?
      redirect_to action: "show", id: @signed_user.id
    else
      @signup_queue = SignupQueue.new(signup_queue_params)

      if params[:ref].present?
        @user = SignupQueue.find_by_user_hash(params[:ref])
        @signup_queue.invited_by_user_id = @user.id
      end

      respond_to do |format|
        if @signup_queue.save
          SignupMailer.send_confirmation_email(@signup_queue).deliver
          format.html { redirect_to @signup_queue, notice: 'signup_queue was successfully created.' }
        else
          format.html { render action: 'new' }
        end
      end
    end
  end

  def destroy
    @signup_queue = SignupQueue.find(params[:id])
    @signup_queue.destroy
    redirect_to signup_queues_path
  end

  def confirm_email
    @user = SignupQueue.find_by_user_hash(params[:ref])
    if @user.is_email_confirmed == false
      @user.is_email_confirmed = true
      @user.save
      if @user.invited_by_user_id.present?
        @invited_by_user = SignupQueue.find(@user.invited_by_user_id)
        @invited_by_user.increment!(:invited_users_count)
      end
    end
    redirect_to action: "show", id: @user.id
  end

  private
    def signup_queue_params
      params.require(:signup_queue).permit(:email)
    end

end
