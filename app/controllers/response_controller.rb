class ResponseController < ApplicationController
  before_action :set_entity, only: %i[ show edit update destroy ]
  before_action :set_search, only: %i[index]

  def index
    @collection = @q.result.order(:name).page(params[:page]).per_page(5)
  end

  def new
    @subject = entity.new
  end

  def create
    @subject = entity.new(provider_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to provider_url(@subject), notice: "#{self.controller_name.capitalize} #{I18n.t('was_success_created')}" }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(provider_params)
        format.html { redirect_to provider_url(@subject), notice: "#{self.controller_name.capitalize} #{I18n.t('was_success_updated')}" }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to providers_url, notice: "#{self.controller_name.capitalize} #{I18n.t('was_success_destroyed')}" }
      format.json { head :no_content }
    end
  end

  def subject
    @subject
  end

  private

  def set_search
    @q = entity.ransack(params[:q])
  end

  def entity
    eval("current_user.#{self.controller_name}")
  end

  def set_entity
    @subject = entity.find(params[:id])
  end

  def entity_params
    eval("#{self.controller_name}_params")
  end
end
