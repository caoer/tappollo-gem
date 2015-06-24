require "tappollo/version"
require 'erb'
require 'tilt'

module Tappollo
  def self.render_table_row
    template = Tilt.new(File.join(File.dirname(File.expand_path(__FILE__)), '/templates/tableview_builder/TMRowItemTemplate.erb'))
    output = template.render
    puts output    
  end

  def self.path_to_resources
  File.join(File.dirname(File.expand_path(__FILE__)), '')
end
end
