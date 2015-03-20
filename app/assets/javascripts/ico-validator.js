var ico_validator = {
  valid_ico: function(value) {
    return value.length == 8 && value.match(/^\d+$/) && ico_validator.last_number_valid(value);
  },
  last_number_valid: function(value) {
    return parseInt(value[7], 10) == ico_validator.calculate_valid_last_number(value)
  },
  calculate_valid_last_number: function(value) {
    var sum = 0;
    for( var i = 0; i <= 6; i++ ) {
      sum += value[i] * (8 - i);
    }
    var mod = sum % 11;

    if( mod == 0 || mod == 10 ) return 1;
    if( mod == 1 ) return 0;
    return 11 - mod;
  }
}

jQuery( function($) {
  var ico_fields = $('.ico-validate');

  function validate(el) {
    value = $(el).val();
    if( ico_validator.valid_ico(value) ) {
      $(el).parent().removeClass('field_with_errors');
    } else {
      $(el).parent().addClass('field_with_errors');
    }
  }

  ico_fields.on('change', function() {
    validate(this);
  });

  ico_fields.on('keyup', function() {
    validate(this);
  });

  ico_fields.closest('form').on('submit', function() {
    wrong = $(this).find('.field_with_errors .ico-validate');
    if( wrong.length <= 0 ) return;
    wrong.focus();
    return false;
  });
});
