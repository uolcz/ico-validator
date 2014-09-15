require 'active_model'
require 'active_support/i18n'
I18n.load_path << File.dirname(__FILE__) + '/locale/en.yml'
I18n.load_path << File.dirname(__FILE__) + '/locale/cs.yml'
require "ico-validator/ico_validator"
