class BankifyController < ApplicationController
  attr_accessor :entity_params
  before_action :set_entity, only: %i[ show edit update destroy ]
  before_action :set_search, only: %i[index]

  def index
    byebug
    @collection = @q.result.order(:name).page(params[:page]).per_page(get_per_page)
  end

  def new
    @subject = entity.build
  end

  def create
    @subject = entity.new(entity_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to controller_url(@subject), notice: "#{self.controller_name.capitalize} #{I18n.t('was_success_created')}" }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(entity_params)
        format.html { redirect_to controller_url(@subject), notice: "#{controller_name.capitalize} #{I18n.t('was_success_updated')}" }
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
      format.html { redirect_to controller_url, notice: "#{controller_name.capitalize} #{I18n.t('was_success_destroyed')}" }
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

  def controller_url
    "#{controller_name}_url"
  end

  def entity
    eval("current_user.#{self.controller_name}")
  end

  def set_entity
    byebug
    @subject = entity.find(params[:id])
  end

  def get_per_page
    per_page = params[:per_page]
    per_page ||= 10
    per_page.to_i
  end
end
