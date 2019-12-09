class StatesController < ApplicationController
    before_action :set_state, only: [:show, :edit, :update, :destroy]

    # GET /states
    # GET /states.json
    def index
        @states = State.all.order("created_at DESC")
    end

    # GET /states/1
    # GET /states/1.json
    def show
    end

    # GET /states/new
    def new
        @state = State.new
    end

    # GET /states/1/edit
    def edit
    end

    # POST /states
    # POST /states.json
    def create
        @state = State.new(state_params)

        if @state.save
            redirect_to action: "index"
        else
            format.html { render :new }
            format.json { render json: @state.errors, status: :unprocessable_entity }
        end
    end

    # PATCH/PUT /states/1
    # PATCH/PUT /states/1.json
    def update
        if @state.update(state_params)
            redirect_to action: "index"
        else
            format.html { render :edit }
            format.json { render json: @state.errors, status: :unprocessable_entity }
        end
    end

    # DELETE /states/1
    # DELETE /states/1.json
    def destroy
        @state.destroy
        redirect_to action: "index"
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
        @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
        params.require(:state).permit(:name)
    end
end
