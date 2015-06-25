ico-validator
=============

[![Build Status](https://travis-ci.org/ucetnictvi-on-line/ico-validator.svg?branch=master)](https://travis-ci.org/ucetnictvi-on-line/ico-validator) 
[![Dependency Status](https://gemnasium.com/ucetnictvi-on-line/ico-validator.svg)](https://gemnasium.com/ucetnictvi-on-line/ico-validator)
[![Code Climate](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator/badges/gpa.svg)](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator) 
[![Test Coverage](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator/badges/coverage.svg)](https://codeclimate.com/github/ucetnictvi-on-line/ico-validator)



Rails validator for format of [Czech company identification number - ICO](http://cs.wikipedia.org/wiki/Identifika%C4%8Dn%C3%AD_%C4%8D%C3%ADslo_osoby)

## Usage
ICO validator is implemented as ActiveModel::EachValidator so for validation just add `ico: true` parameter to your attribute validation. If validation doesn't pass it adds `:invalid_format` error on validated attribute.

### Full Example
```ruby
attr_accessor :ico
validates :ico,
  ico: true

```

### JS validation
```js
application.js
//= require ico-validator
```
```ruby
<%= form_for(...) do |f| %>
  <%= f.text_field :ico, class: 'ico-validate' %>
<% end %>
```

### What is validated

* ICO length - must be exactly 8 characters
* ICO must contain only numbers
* ICO number must satisfy [last digit control formula ](http://www.cssz.cz/cz/e-podani/pro-vyvojare/definice-druhu-e-podani/p-o/logicke-testy-datove-vety.htm)

