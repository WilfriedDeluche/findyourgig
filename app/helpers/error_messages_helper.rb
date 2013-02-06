# encoding: utf-8
module ErrorMessagesHelper
  # Render error messages for the given objects. The :message and :header_message options are allowed.
  def error_messages_for(*objects)
    options = objects.extract_options!
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    count = pluralize(messages.count, t('error'))
    options[:header_message] ||= count.to_s
    unless messages.empty?
      content_tag(:div, :id => "error_explanation", :class => 'alert alert-error') do
        list_items = messages.map { |msg| content_tag(:li, msg) }
        content_tag(:a, '×', :class=> 'close', :"data-dismiss" => 'alert') + content_tag(:h3, options[:header_message]) + content_tag(:ul, list_items.join.html_safe) 
      end
    end
  end
  
  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)

# Override Rails default behaviour when errors form
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  "<span class='field-error control-group error'>#{html_tag}</span>".html_safe
end
