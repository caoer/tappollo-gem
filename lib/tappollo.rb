require "tappollo/version"
require 'erb'
require 'tilt'

module Tappollo
  def self.render_table_row(class_name, project_name, project_prefix, author_name)
    generate_files(class_name, project_name, project_prefix, author_name, "RowItem.h", "/templates/tableview_builder/TMRowItemTemplateH.erb")
    generate_files(class_name, project_name, project_prefix, author_name, "RowItem.m", "/templates/tableview_builder/TMRowItemTemplateM.erb")
    generate_files(class_name, project_name, project_prefix, author_name, "TableViewCell.h", "/templates/tableview_builder/TMTableViewCellH.erb")
    generate_files(class_name, project_name, project_prefix, author_name, "TableViewCell.m", "/templates/tableview_builder/TMTableViewCellM.erb")
    generate_files(class_name, project_name, project_prefix, author_name, "TableViewCell.xib", "/templates/tableview_builder/TMTableViewCellXib.erb")

    # nib_file = "#{project_prefix}#{class_name}TableViewCell.xib"
    # `xattr -d com.apple.TextEncoding #{nib_file}`
  end

  def self.generate_files(class_name, project_name, project_prefix, author_name, file_postfix, template_path)
    template = Tilt.new(path_to_resources(template_path))
    output = template.render(self, :class_name => class_name, :project_name => project_name, :project_prefix => project_prefix, :author_name => author_name)
    File.open("#{project_prefix}#{class_name}#{file_postfix}", "w") do |file|
      file.write(output)
    end
  end

  def self.path_to_resources(path)
    File.join(File.dirname(File.expand_path(__FILE__)), path)
  end
end
