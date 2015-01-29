module ApplicationHelper
  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    output = render(:file => "layouts/#{layout}")
    self.output_buffer = ActionView::OutputBuffer.new(output)
  end

  def glyphicon_for(type)
    case type
      when 'Post'
        'envelope'
      when 'Project'
        'picture'
      else
        'paperclip'
    end
  end
end
