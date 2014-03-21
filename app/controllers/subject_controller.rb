class SubjectController < ApplicationController
     def show_subjects
      @subject = Subject.find(params[:id])
   end

end
