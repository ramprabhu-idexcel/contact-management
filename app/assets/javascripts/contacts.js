$(function() {
    $(document.body).on('click', '.btn-remove-phone', function() {
        $(this).closest('.phone-input').remove();
    });

    $(document.body).on('click', '.btn-remove-address', function() {
        $(this).closest('.address-lists').remove();
    });

    $('.btn-add-phone').click(function() {
        var index = $('.phone-input').length + 1;
        var input = '<div class="input-group phone-input">' +
            '<select class="phone-type" name="contact[phones_attributes][' + index + '][type_of]" id="contact_phones_attributes_' + index + '_type_of">' +
            '<option value="Mobile">Mobile</option>' +
            '<option value="Fax">Fax</option>' +
            '<option value="LandLine">LandLine</option></select>' +
            '<div class="phone-number">' +
            '<input class="form-control" placeholder="+1 (999) 999 9999" type="text" name="contact[phones_attributes][' + index + '][number]" id="contact_phones_attributes_' + index + '_number">' +
            '</div>' +
            '<span class="input-group-btn btn-remove">' +
            '<button class="btn btn-danger btn-remove-phone" type="button"><span class="glyphicon glyphicon-remove"></span></button>' +
            '</span>' +
            '</div>';
        $('.phone-list').append('' + input);
    });


    $('.btn-add-address').click(function() {
        var index = $('.address-lists').length + 1;
        var input =
            '<div class="address-lists">' +
            '<br/>' +
            '<div class="input-group addr-input">' +
            '<input class="form-control" placeholder="Flat No, Building Name" type="text" name="contact[addresses_attributes][' + index + '][door_no]" id="contact_addresses_attributes_' + index + '_door_no">' +
            '</div>' +
            '<div class="input-group addr-input">' +
            '<input class="form-control" placeholder="Street" type="text" name="contact[addresses_attributes][' + index + '][street]" id="contact_addresses_attributes_' + index + '_street">' +
            '</div>' +
            '<div class="input-group addr-input">' +
            '<input class="form-control" placeholder="Landmark (optional)" type="text" name="contact[addresses_attributes][' + index + '][landmark]" id="contact_addresses_attributes_' + index + '_landmark">' +
            '</div>' +
            '<div class="input-group addr-input">' +
            '<input class="form-control" placeholder="City" type="text" name="contact[addresses_attributes][' + index + '][city]" id="contact_addresses_attributes_' + index + '_city">' +
            '</div>' +
            '<div class="input-group addr-input">' +
            '<input class="form-control" placeholder="State" type="text" name="contact[addresses_attributes][' + index + '][state]" id="contact_addresses_attributes_' + index + '_state">' +
            '</div>' +
            '<div class="input-group addr-input">' +
            '<input class="form-control" placeholder="Pincode" type="text" name="contact[addresses_attributes][' + index + '][pincode]" id="contact_addresses_attributes_' + index + '_pincode">' +
            '</div>' +
            '<button type="button" class="btn btn-danger btn-sm btn-remove-address"><span class="glyphicon glyphicon-minus"></span> Remove Address</button>' +
            '</div>';
        $('.address-input').append('' + input);
    });
})