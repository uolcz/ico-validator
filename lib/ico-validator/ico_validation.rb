module IcoValidation
  def self.valid_ico?(ico)
    ico = ico.to_s
    ico.length == 8 && ico.match(/^\d+$/) && last_number_valid?(ico)
  end

  private

  def self.last_number_valid?(ico)
    ico[7].to_i == calculate_valid_last_number(ico)
  end

  def self.calculate_valid_last_number(ico)
    sum = (0..6).inject(0) { |sum, i| sum + ico[i].to_i * (8 - i) }
    mod = sum % 11

    case mod
    when 0, 10 then 1
    when 1     then 0
    else 11 - mod
    end
  end
end
