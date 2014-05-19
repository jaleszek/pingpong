class ChallengesControllerController < ApplicationController
  def create

    if parent_gist_id = params[:parent_gist_id].present?
      parent = Gist.find parent_gist_id
      gist = Gist.create_with_defaults(user: current_user)

      gist.update_content params

      parent.add_challenge(gist)
    end


    respond_to do |format|
      format.json{ render :show, status: :created, location: gist }
    end
  end
end
