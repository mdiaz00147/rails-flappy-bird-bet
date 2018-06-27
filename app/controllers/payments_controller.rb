class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:create]
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    Stripe.api_key = "sk_test_nXf5yVmCdZut6Bdrg8OX2gnQ"
    @plan = Plan.find(1)
    @amount = (@plan.price_units + @plan.price_cents).to_i
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'ACE OFF Contest',
      :currency    => 'usd'
    )
        
    # rescue Stripe::CardError => e
    #     flash[:error] = e.message
    #     redirect_to request.referer


    @subscription = current_user.subscriptions.new(plan_id: @plan, status: 1) if charge.paid
    if @subscription.save
      flash[:error] = 'Ready!'
      redirect_to game_path 
    else
      flash[:error] = @subscription.errors
      redirect_to request.referer
    end


  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:user_id, :value)
    end

    def check_user
      redirect_to root_path if !current_user
    end
end
