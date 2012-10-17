class Views::Sessions::New < Views::Layouts::Base
  include Erector::FormHelpers
  def render_body
    div :class => "span6" do
      h1 "Log In"
      br
      form :action => url_for(:controller => "sessions", :action => "create"), :method => "POST", :class => "well" do
        field :email
        br
        password :password
        br
        submit
        a "Sign Up", :href => signup_path, :class => "btn space-left-half"
      end
    end
  end
end
