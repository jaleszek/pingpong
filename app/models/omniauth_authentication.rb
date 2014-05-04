class OmniauthAuthentication
  attr_reader :auth, :scope

  def initialize(auth, scope = User)
    @auth = auth
    @scope = scope
  end

  def create
    scope.create! do |instance|
      instance.provider = auth['provider']
      instance.uid      = auth['uid']
      instance.name     = auth['info']['name']
    end
  end
end