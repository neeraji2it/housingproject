class PropertiesController < ApplicationController
  include ApplicationHelper
  before_filter :admin_login_required
  before_action :set_property, only: [:show, :edit, :update, :destroy]

 
  def index
    @properties = Property.all
  end

 
  def show
  end

  def new
    @property = Property.new
    1.times{@property.images.build}
  end

 
  def edit

  end

 
  def create
    @property = Property.new(property_params)
    1.times{@property.images.build} if @property.images.blank?
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_url
  end

  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit!
  end
end
