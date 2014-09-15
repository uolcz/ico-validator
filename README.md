ico-validator
=============

Rails validator for format of [Czech company identification number - ICO](http://cs.wikipedia.org/wiki/Identifika%C4%8Dn%C3%AD_%C4%8D%C3%ADslo_osoby)

## Usage
ICO validator is implemented as ActiveModel::EachValidator so for validation just add `ico: true` parameter to your attribute validation. If validation doesn't pass it adds `:invalid_format` error on validated attribute.

### Full Example
```ruby
attr_accessor :ico
validates :ico,
  ico: true

```

### What is validated

* ICO length - must be exactly 8 characters
* ICO must contain only numbers
* ICO number must satisfy [last digit control formula ](http://www.cssz.cz/cz/e-podani/pro-vyvojare/definice-druhu-e-podani/p-o/logicke-testy-datove-vety.htm)

## TODO

* Add JS validation for ICO fields
