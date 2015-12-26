module C4
  class MaterialsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_material, only: [:show, :edit, :update, :destroy]

    layout 'c4/admin'

    def index
      @materials = Material.all
    end

    def new
      @material = Material.new
    end

    def edit
    end

    def create
      @material = Material.new(material_params)

      if @material.save
        flash[:success] = 'Se han guardado los cambios.'
        redirect_to main_app.materials_path
      else
        render :new
      end
    end

    def update
      if @material.update(material_params)
        flash[:success] = 'Se han guardado los cambios.'
        redirect_to main_app.materials_path
      else
        render :edit
      end
    end

    def destroy
      flash[:warning] = "Se ha destruído: #{@material.name}"
      @material.destroy
      respond_to do |format|
        format.html { redirect_to main_app.materials_url }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_material
        @material = Material.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def material_params
        params.require(:material).permit(:name, :price, :available, colors_attributes: [:id, :hex, :available, :_destroy])
      end
      
  end
end
