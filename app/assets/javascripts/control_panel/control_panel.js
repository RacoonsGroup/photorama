jQuery(function($) {

    // TODO: Holy shit !!! Refactor it !!!

    $('#templates_list').parent().jCarouselLite({visible:2,btnNext: ".next_tpl",btnPrev: ".prev_tpl"})
    $('#color_list').parent().jCarouselLite({visible:2,btnNext: ".next_color",btnPrev: ".prev_color"})
    $('#background_list').parent().jCarouselLite({visible:2,btnNext: ".next_bg",btnPrev: ".prev_bg"})

    $('.select_to_list li').on('click', function() {
        var $selectedItem = $(this)
        var target = $(this).parent().data('target')

        $(this).parent().find('li').removeClass('active')
        $(this).addClass('active')
        $(target).find('option').each(function(index, item) {
            if ($(item).val() == $selectedItem.data('value')) {
                $(item).attr('selected', 'selected')
            } else {
                $(item).removeAttr('selected')
            }
        })
    })




//    $('#templates_list li, #color_list li').on('click', function() {
//        console.log(HandlebarsTemplates['control_panel/color_lines']())
//        $(this).parent().find('li').removeClass('active')
//        $(this).addClass('active')
//        var selectedTemplate = $(this).attr('data-value')
//        $colorOptions.each(function(index, item) {
//            if (item.value == selectedTemplate) {
//                $(item).attr('selected', 'selected')
//            } else {
//                $(item).removeAttr('selected')
//            }
//        })
//    })

    $('.page-content, .cancel-redactor').on("click", function(){
      $('.tgl-block').toggle();
      return false;
    });
});