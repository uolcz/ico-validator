require 'active_model'
require 'active_support/i18n'
I18n.load_path << File.dirname(__FILE__) + '/../locale/en.yml'
I18n.load_path << File.dirname(__FILE__) + '/../locale/cs.yml'
require 'ico-validator/engine'
require 'ico-validator/ico_validation'

class IcoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid_format) unless IcoValidation.valid_ico?(value)
  end
end
