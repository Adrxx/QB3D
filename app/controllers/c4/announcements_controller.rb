module C4
  class AnnouncementsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]

    layout 'c4/admin'

    def index
      @announcements = Announcement.all
    end

    def new
      @announcement = Announcement.new
    end

    def edit
    end

    def create
      @announcement = Announcement.new(announcement_params)

      if @announcement.save
        flash[:success] = 'Se han guardado los cambios.'
        redirect_to main_app.announcements_path
      else
        render :new
      end
    end

    def update
      if @announcement.update(announcement_params)
        flash[:success] = 'Se han guardado los cambios.'
        redirect_to main_app.announcements_path
      else
        render :edit
      end
    end

    def destroy
      flash[:warning] = "Se ha destruído: #{@announcement.title}"
      @announcement.destroy
      respond_to do |format|
        format.html { redirect_to main_app.announcements_url }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_announcement
        @announcement = Announcement.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def announcement_params
        params.require(:announcement).permit(:title, :description, :featured)
      end

  end
end
