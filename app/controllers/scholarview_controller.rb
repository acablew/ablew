class ScholarviewController < ApplicationController
    layout "homelayout"
    def index
        @scholarships = Scholarship.all
        @posts = Post.all
    end
    def shown
        @scholarship_id = params[:scholarship]
        @scholarship = Scholarship.find(@scholarship_id)
    end
end
