class BicyclesController < ApplicationController
    before_action :set_bike, only: [:show, :edit, :update, :destroy]

    # GET /photos
    # GET /photos.json
    def index
      @bicycles = Bicycle.search(params[:search])
    end

    # GET /photos/1
    # GET /photos/1.json
    def show
    end

    # GET /photos/new
    def new
      @bicycle = Bicycle.new
      @bicycle.pictures.build
    end

    # GET /photos/1/edit
    def edit
    end

    # POST /photos
    # POST /photos.json
    def create
      @bicycle = current_user.bicycles.new(bike_params)
      respond_to do |format|
        if @bicycle.save
          format.html { redirect_to [@bicycle], notice: 'Bicycle was successfully created.' }
          format.json { render action: 'show', status: :created, location: @bicycle }
        else
          format.html { render action: 'new' }
          format.json { render json: @bicycle.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /photos/1
    # PATCH/PUT /photos/1.json
    def update
      respond_to do |format|
        if @bicycle.update(bike_params)
          format.html { redirect_to [@bicycle], notice: 'Photo was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @bicycle.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /photos/1
    # DELETE /photos/1.json
    def destroy
      @bicycle.destroy
      respond_to do |format|
        format.html { redirect_to bicycles_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_bike
        @bicycle = Bicycle.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def bike_params
        params.require(:bicycle).permit(:name, :description, :category_id, pictures_attributes: [:id, :image_url])
      end
end
