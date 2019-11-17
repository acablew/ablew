class DeadlineController < ApplicationController
    layout "homelayout"
    def index
        @posts = Post.all
        @scholarships = Scholarship.all
        @type = params[:type]
        @application_data_scholarships = Array.new
        if @type.to_i==1
            left_day_week = 7 - Date.today.wday
            j=0
            for scholarship in @scholarships
                if scholarship.deadline.to_i < left_day_week
                    @application_data_scholarships[j] = scholarship
                    j=j+1
                end
            end
        end

        # @level = Education.find(@level_id);
        # @scholarship_level = Array.new
        # i=0
        # for scholarship in @scholarships
        #     for education in scholarship.educations
        #         if education.level == @level.level
        #             @scholarship_level[i] = scholarship
        #             i=i+1
        #         end
        #     end
        # end
        # byebug
    end
end
