class GistsChallenge < ActiveRecord::Base
  acts_as_votable
  belongs_to :challenge, foreign_key: :challenge_gist_id, :class_name => 'Gist'

  def vote_by(args = {})
    if args[:voter] && args[:voter].id != challenge.owner_id
      super
    end
  end
end