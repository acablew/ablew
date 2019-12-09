class ScholarviewController < ApplicationController
    layout "homelayout"
    def index
        @scholarships = Scholarship.all.order("created_at DESC")
        @posts = Post.all.order("created_at DESC")
    end
    def shown
        @scholarship_id = params[:scholarship]
        @scholarship = Scholarship.find(@scholarship_id)
    end
end
