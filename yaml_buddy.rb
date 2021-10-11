# frozen_string_literal: true

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  require 'yaml'
  # take_yaml: converts a String with YAML data into @data
  # parameter: yml - a String in YAML format
  def take_yaml(yml)
    @data = YAML.safe_load(yml)
  end

  # to_yml: converts @data into tsv string
  # returns: String in YAML  format
  def to_yaml
    @data.to_yaml
  end
end
