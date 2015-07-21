require 'spec_helper'

describe IcoValidation do
  subject { IcoValidation }

  ['61499609', '25275500', '29233011'].each do |valid_ico|
    it "ICO #{valid_ico} is valid" do
      expect(subject.valid_ico?(valid_ico)).to eq true
    end
  end

  it 'ICO is valid with integer value in right format' do
    expect(subject.valid_ico?(61499609)).to eq true
  end

  [nil, '', '1', 123, '1111111X', '00000000', '614996097', '123456789'].each do |invalid_ico|
    it "ICO is invalid with value #{invalid_ico.inspect}" do
      expect(subject.valid_ico?(invalid_ico)).to be_falsey
    end
  end
end
