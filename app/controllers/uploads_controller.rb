class UploadsController < ApplicationController
  before_action :authorize

  def edit
    @upload = Upload.find params[:id]
  end

  def create
    @upload = current_user.uploads.build(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to uploads_path, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    upload = Upload.where(id: params[:id], user: current_user).first
    upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def share
    upload = Upload.find(params[:upload_id])
    if params[:visible]
      upload.visible!
    else
      upload.shared!
      params[:user_ids].each { |id| upload.shared_uploads.create(user_id: id) }
    end
    redirect_to user_path(current_user)
  end

  def index
    @uploads = params[:shared] ? Upload.visible + Upload.where(id: SharedUpload.where(user: current_user).pluck(:upload_id)) : current_user.uploads
  end

  private

  def upload_params
    params.require(:upload).permit(:title, :desc, :file)
  end
end
