class IcoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid_format) unless valid_ico?(value.to_s)
  end

  private

  def valid_ico?(value)
    value.length == 8 && value.match(/^\d+$/) && last_number_valid?(value)
  end

  def last_number_valid?(value)
    value[7].to_i == calculate_valid_last_number(value)
  end

  def calculate_valid_last_number(value)
    sum = (0..6).inject(0) { |sum, i| sum += value[i].to_i * (8 - i) }
    mod = sum % 11

    case mod
    when 0, 10 then 1
    when 1     then 0
    else 11 - mod
    end
  end
end
