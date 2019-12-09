class ScholarlevelsController < ApplicationController
    layout "homelayout"
    def index
        @posts = Post.all.order("created_at DESC")
        @scholarships = Scholarship.all.order("created_at DESC")

        if params[:level_id].to_s.split('-').count > 1
            params[:level_id] = params[:level_id].gsub("-", " ")
        end


        # @level_id = params[:level_id]
        @level_id = Education.where(level:params[:level_id]).first.id
        @level = Education.find(@level_id)
        @scholarship_level = Array.new
        i=0
        for scholarship in @scholarships
            for education in scholarship.educations
                if education.level == @level.level
                    @scholarship_level[i] = scholarship
                    i=i+1
                end
            end
        end
    end
end
