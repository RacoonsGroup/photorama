jQuery(function($) {

    $('ul.nav').sortable({
        axis: 'x',
        items: "> li.sortable_item"
    })

    $('.add_item_to_menu').on('click', function() {
        //var template = $.get('/add_item_to_menu')
        //console.log(template)
        $('#dialog_box').load('/add_item_to_menu').dialog({title: 'Добавить страницу'}).dialog('open')
    })

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

    $('.page-content, .cancel-redactor').on("click", function(){
      $('.tgl-block').toggle();
      return false;
    });
});