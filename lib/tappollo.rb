require "tappollo/version"
require "tappollo/exit_now"
require 'erb'
require 'tilt'

module Tappollo
  include Tappollo::ExitNow
  def self.render_table_row(class_name, project_name, project_prefix, author_name, force)
    generate_files(class_name, project_name, project_prefix, author_name, "RowItem.h", "/templates/tableview_builder/TMRowItemTemplateH.erb", force)
    generate_files(class_name, project_name, project_prefix, author_name, "RowItem.m", "/templates/tableview_builder/TMRowItemTemplateM.erb", force)
    generate_files(class_name, project_name, project_prefix, author_name, "TableViewCell.h", "/templates/tableview_builder/TMTableViewCellH.erb", force)
    generate_files(class_name, project_name, project_prefix, author_name, "TableViewCell.m", "/templates/tableview_builder/TMTableViewCellM.erb", force)
    generate_files(class_name, project_name, project_prefix, author_name, "TableViewCell.xib", "/templates/tableview_builder/TMTableViewCellXib.erb", force)

    # nib_file = "#{project_prefix}#{class_name}TableViewCell.xib"
    # `xattr -d com.apple.TextEncoding #{nib_file}`
  end

  def self.generate_files(class_name, project_name, project_prefix, author_name, file_postfix, template_path, force)
    file_dir = "#{project_prefix}#{class_name}#{file_postfix}"
    if File.exists? file_dir
      unless force
        exit_now! 1, "error: #{file_dir} exists, use --force to override"
      end
    end

    template = Tilt.new(path_to_resources(template_path))
    output = template.render(self, :class_name => class_name, :project_name => project_name, :project_prefix => project_prefix, :author_name => author_name)

    File.open(file_dir, "w") do |file|
      file.write(output)
    end
  end

  def self.path_to_resources(path)
    File.join(File.dirname(File.expand_path(__FILE__)), path)
  end
end
