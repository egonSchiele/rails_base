module Erector::FormHelpers
  def radio label, options = {}
    options = { :type => "radio", :id => label, :name => label }.merge(options)
    input options
    _label label
  end

  def checkbox label, options = {}
    options = { :type =>"checkbox", :id => label, :name => label, :value => true, :style => "float: left" }.merge(options)
    input options
    _label(label, :class => "space-left-half") unless options[:nolabel]
  end

  def field label, options = {}
    _label label unless options[:nolabel]
    options = { :type => "text", :id => label, :name => label }.merge(options)
    input options
  end

  def password label, options = {}
    _label label unless options[:nolabel]
    options = { :type => "password", :id => label, :name => label }.merge(options)
    input options
  end

  def file label, options = {}
    _label label unless options[:nolabel]
    options = { :type => "file", :id => label, :name => label }.merge(options)
    input options
  end

  # requires jqueryui
  def date label, options = {}
    options = { :class => "datepicker" }.merge(options)
    options[:name] = label
    field label, options
  end

  # requires jqueryui
  def slider start, finish, label, options = {}
    value = options[:value] || start
    _label label unless options[:nolabel]
    options = { :class => "slider space-right-half", :start => start, :finish => finish, :default_value => value, :style => "width: 150px; float: left;" }.merge(options)
    div options
    input :type => "text", :name => label, :id => label, :class => "slider_value", :value => value, :style => "width: 50px"
  end

  def _textarea label, options = {}
    _label label unless options [:nolabel]
    options = { :name => label, :id => label, :rows => 5, :cols => 20 }.merge(options)
    textarea options do
      yield
    end
  end

  def _select label, values, options = {}
    _label label unless options[:nolabel]
    options = { :name => label, :id => label }.merge(options)
    select options do
      values.each do |txt, value|
        _options = { :value => value }
        _options[:selected] = true if options[:value] == value
        option txt, _options
      end
    end
  end

  def submit
    input :type => "submit", :class => "btn btn-primary"
  end

  def _button label, options = {}
    if options[:color]
      options[:color] = "btn-#{options[:color]}"
    else
      options[:color] = ""
    end
    options[:class] ||= ""
    options[:class] += " btn #{options[:color].to_s}"
    options[:style] ||= ""
    options[:style] += "margin-top: -10px;"
    options[:id] ||= label
    a labelize(label), options
  end

  private

  def _label sym, options = {}
    label labelize(sym), options
  end

  def labelize sym
    sym.to_s.gsub("_", " ").capitalize
  end

  def modal header, options = {}
    options[:class] ||= ""
    options[:class] += " modal hide fade"
    div options do
      div :class => 'modal-header' do
        button raw("&times;"), :type => 'button', :class => 'close', 'data-dismiss' => 'modal', 'aria-hidden' => 'true'
        h3 header
      end
      div :class => 'modal-body' do
        yield
      end
      div :class => 'modal-footer' do
        a "Submit", :href => 'javascript:;', :class => 'btn modal_submit'
        a "Cancel", :href => 'javascript:;', :class => 'btn btn-primary modal_cancel', "data-dismiss" => "modal", "aria-hidden" => true
      end
    end
  end

  def note txt, options = {}
    options[:class] ||= ""
    color = options[:color] ? "label-#{options[:color]}" : ""
    options[:class] += " label #{color} note"
    span txt, options
  end
end
