jQuery ->
  ico_fields = $('.ico-validate')

  validate = (el) ->
    value = $(el).val()
    if valid_ico?(value)
      $(el).parent().removeClass 'field_with_errors'
    else
      $(el).parent().addClass 'field_with_errors'

  ico_fields.on 'change', ->
    validate this

  ico_fields.on 'keyup', ->
    validate this

  ico_fields.closest('form').on 'submit', ->
    wrong = $(this).find('.field_with_errors .ico-validate')
    return if wrong.length <= 0
    wrong.focus()
    false

  valid_ico = (value) ->
    value.length == 8 && value.match(/^\d+$/) && last_number_valid?(value)

  last_number_valid = (value) ->
    parseInt(value[7], 10) == calculate_valid_last_number?(value)

  calculate_valid_last_number = (value) ->
    sum = 0
    sum += value[i] * (8 - i) for i in [0..7]
    mod = sum % 11

    switch mod
      when 0, 10 then 1
      when 1     then 0
      else 11 - mod
