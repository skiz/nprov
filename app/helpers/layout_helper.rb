# This module is for cleaning up the visual impression of the website
module LayoutHelper
  
  def toolbar(options={}, &block)
    content_for :toolbar do
      returning '' do |output|
        output << "<div id=\"Toolbar\"><div id=\"ToolbarOuterContainer\"><div id=\"ToolbarInnerContainer\"><div id=\"ToolbarActions\">\n"
        output << capture(&block)
        output << "</div></div></div></div>\n"
      end
    end
  end
  
  def layout(options={}, &block)
    output = "<div id=\"PageLayout\"><div id=\"PageContainer\"><div class=\"BodyContainer\">\n"
    output << capture(&block)
    output << "</div></div></div>\n"
    concat(output, block.binding)
    concat(render(:partial => 'shared/footer'), block.binding) unless options[:skip_footer]
  end
  
  def banner(options={}, &block)
    output = "<div id=\"BannerContainerSmall\"><div id=\"BannerTextSmall\" style=\"font-size:1em;line-height:1.2em\">"
    output << capture(&block)
    output << "</div></div>"
    concat(output, block.binding)
  end
  
  def body(options={}, &block)
    output = "<div class=\"BodyContainer\">"
    output << capture(&block)
    output << "</div><div class=\"clear\"></div>"
    concat(output, block.binding)
  end
  
  def left_panel(options={}, &block)
    output = "<div id=\"LeftPanel\">"
    output << capture(&block)
    output << "</div>"
    concat(output, block.binding)
  end
  
  def right_panel(options={}, &block)
    output = "<div id=\"RightPanel\">"
    output << capture(&block)
    output << "</div>"
    concat(output, block.binding)
  end
  
  def panel(options={}, &block)
    o = {
      :title => '',
      :size  => 'S'
    }.merge!(options)
    
    output =  "<div class=\"#{o[:size]}\"><div class=\"#{o[:size]}Container\">"
    output << "<div class=\"#{o[:size]}Title\">#{o[:title]}</div><div class=\"#{o[:size]}Body\">"
    output << capture(&block)
    output << "</div></div></div>"
    concat(output, block.binding)        
  end
  
end