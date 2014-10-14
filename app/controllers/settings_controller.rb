class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
    @setting.email_ids = @setting.email_ids.join(',')
    @api = @setting.api
  end

  # POST /settings
  # POST /settings.json
  def create
    @setting = Setting.new(setting_params)
    @setting.email_ids = @setting.email_ids.split(',')
    respond_to do |format|
      if @setting.save
        format.html { redirect_to settings_path, notice: 'Setting was successfully created.' }
        format.json { render :show, status: :created, location: @setting }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|

      if @setting.update(setting_params)
        @api = @setting.api
        a = @api.execute_call
        Log.create(:api_id => @api.id , :response => a.to_s , :status => @api.check_status)
        format.html { redirect_to settings_path, notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to settings_url, notice: 'Setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_email_notification
    Setting.find_by_id(params[:setting_id]).update(:email_notification => params[:email_notification])
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:api_id, :email_notification, :sms_notification, :email_ids, :phone_numbers ,:id , :setting_id)
    end
end
