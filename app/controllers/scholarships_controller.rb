class ScholarshipsController < ApplicationController

    before_action :find_scholarship, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        @scholarships = Scholarship.all
    end

    def show
        set_meta_tags title:  @scholarship.title,
                description: 'All the customer can apply the scholarships all over the world'
    end

    def new
        @scholarship = Scholarship.new
    end
    def create
        @scholarship = Scholarship.new(scholarship_params)
        if @scholarship.amount_scholarship ==nil
            render 'new2'
        else
            # byebug
            if @scholarship.save
                redirect_to action: 'index'
            else
                redirect_to action: 'index'
            end
        end

    end
    def edit
    end

    def update
        if @scholarship.update(scholarship_params)
            redirect_to action: "index"
        else
            render 'edit'
        end
    end

    def destroy
        @scholarship.destroy
        redirect_to action: "index"
    end

    private

    def scholarship_params
        params.require(:scholarship).permit(:title, :content, :education_id, :institute_id, :number_position, :amount_scholarship, :application_link, :deadline, state_ids:[], subject_ids:[], education_ids:[])
    end

    def find_scholarship
        @scholarship = Scholarship.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
