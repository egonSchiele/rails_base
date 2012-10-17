class Views::Users::New < Views::Layouts::Base
  include Erector::FormHelpers
  def render_body
    div :class => "span6" do
      h1 "Sign Up"
      br
      form :action => url_for(:controller => "users", :action => "create"), :method => "POST", :class => "well" do
        field :name
        br
        field :email
        br
        password :password
        br
        password :password_confirmation
        br
        submit
        a "Log In", :href => login_path, :class => "btn space-left-half"
      end
    end
  end
end
