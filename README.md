ico-validator
=============

[![Build Status](https://travis-ci.org/ucetnictvi-on-line/ico-validator.svg?branch=master)](https://travis-ci.org/ucetnictvi-on-line/ico-validator) 
[![Dependency Status](https://gemnasium.com/ucetnictvi-on-line/ico-validator.svg)](https://gemnasium.com/ucetnictvi-on-line/ico-validator)
[![Code Climate](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator/badges/gpa.svg)](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator) 
[![Test Coverage](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator/badges/coverage.svg)](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator)



Ruby validator for format of [Czech company identification number - ICO](http://cs.wikipedia.org/wiki/Identifika%C4%8Dn%C3%AD_%C4%8D%C3%ADslo_osoby)

**Contains:**

1. Standalone ruby validator
2. Rails ActiveModel::EachValidator
3. JS validator

**What is validated:**

1. ICO length - must be exactly 8 characters
2. ICO must contain only numbers
3. ICO number must satisfy [last digit control formula ](http://www.cssz.cz/cz/e-podani/pro-vyvojare/definice-druhu-e-podani/p-o/logicke-testy-datove-vety.htm)

## Usage
### Ruby validator
Ruby validator is one simple module with only one public method `IcoValidation.valid_ico?` which returns true or false.

```ruby
require 'ico_validator'

IcoValidation.valid_ico?('12345678') # invalid ico
=> false

IcoValidation.valid_ico?('27169278')
=> true

```

### Rails validator
Rails validator is implemented as [ActiveModel::EachValidator](http://api.rubyonrails.org/classes/ActiveModel/Validator.html). So it's easy to use within your AR models:

```ruby
class Company < ActiveRecord::Base
  validates :ico, ico: true
end
```
If validation doesn't pass it adds `:invalid_format` error on validated attribute.

### JS validation
ico-validator is Rails engine, so if you want to validate ico with javascript just add following to application.js
```js
//= require ico-validator
```

And then on any field you want to be validated with JS:
```erb
<%= form_for(...) do |f| %>
  <%= f.text_field :ico, class: 'ico-validate' %>
<% end %>
```
jQuery will bind validations there.
