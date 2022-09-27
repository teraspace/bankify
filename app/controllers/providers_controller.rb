class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[ show edit update destroy ]
  before_action :set_search, only: %i[index]
  # GET /providers or /providers.json
  def index
    @providers = @q.result.order(:name).page(params[:page]).per_page(5)
  end

  # GET /providers/1 or /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = current_user.providers.new
  end

  # GET /providers/1/edit
  def edit 
  end

  # POST /providers or /providers.json
  def create
    @provider = current_user.providers.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to provider_url(@provider), notice: "Provider was successfully created." }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1 or /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to provider_url(@provider), notice: "Provider was successfully updated." }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1 or /providers/1.json
  def destroy
    @provider.destroy

    respond_to do |format|
      format.html { redirect_to providers_url, notice: "Provider was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_provider
    @provider = current_user.providers.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def provider_params
    params.require(:provider).permit(:name, :nit, :contact_name, :cell_phone, :bank_id, :account)
  end
  def set_search
    @q = current_user.banks.ransack(params[:q])
  end
end
