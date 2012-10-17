class Views::Users::Home < Views::Layouts::Base
  include Erector::FormHelpers
  def render_body
    div :class => "span6" do
      h1 "Home"
    end
  end
end
