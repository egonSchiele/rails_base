class Views::Layouts::Base < Erector::Widget
  
  include Erector::FormHelpers

  def content
    rawtext '<!DOCTYPE html>'
    html do
      head do
        title "My App"
        rawtext stylesheet_link_tag    "application", :media => "all"
        rawtext javascript_include_tag("application")
        rawtext csrf_meta_tags
      end
      body do
        render_header
        div :class => "container-fluid" do
          render_flash
          div :class => "row-fluid" do
            render_body
          end
        end
      end
    end
  end

  def render_flash
    flash.each do |type, msg|
      div :class => "alert alert-#{type}" do
        text msg
      end
    end
  end

  def render_header
    div :class => "navbar" do
      div :class => "navbar-inner" do
        div :class => "container-fluid" do
          brand = current_user ? current_user.name : "MyApp"
          a brand, :class => "brand", :href => "/"
          if current_user
            user_menu
          end
          ul :class => "nav pull-left" do
            li :class => "divider-vertical"
            child_menu
          end
          nav_session
        end
      end
    end
  end

  def child_menu
  end

  def render_body
    raise "Must Override"
  end

  def user_menu
    ul :class => "nav pull-left" do
      li do
        a "A Link", :href => "#"
      end
    end
  end

  private

  def nav_session
    ul :class => "nav pull-right" do
      if current_user
        li :class => "pull-right" do
          a "Log out", :href => logout_path
        end
      else
        li :class => "pull-right" do
          a "Log in", :href => login_path
        end
        li :class => "divider-vertical"
        li :class => "pull-right" do
          a "Sign up", :href => signup_path
        end
      end
    end
  end
end
