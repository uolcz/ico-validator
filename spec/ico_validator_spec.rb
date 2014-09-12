require 'spec_helper'

class Validatable
  include ActiveModel::Validations
  attr_accessor  :ico
  validates :ico, ico: true
end

describe IcoValidator do
  subject { Validatable.new }

  it 'ICO is valid with string value in right format' do
    subject.ico = '61499609'

    expect(subject).to be_valid
  end

  it "ICO is valid with integer value in right format" do
    subject.ico = 61499609

    expect(subject).to be_valid
  end

  [nil, '', '1', 123, '1111111X', '00000000', '614996097', '123456789'].each do |invalid_ico|
    it "ICO is invalid with value #{invalid_ico.inspect}" do
      subject.ico = invalid_ico
      expect(subject).not_to be_valid
      expect(subject.errors.messages).to eq({ico: ["Invalid ICO format."]})
    end
  end
end
