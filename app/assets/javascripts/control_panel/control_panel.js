jQuery(function($) {

    // TODO: Holy shit !!! Refactor it !!!
    var $templateOptions = $('#project_template_id option')
    var $selectedTemplateOption = $('#project_template_id option:selected')

    $templateOptions.parent().hide().parents('#design').append('<button class="prev">Влево</button><button class="next">Вправо</button><div><ul id="templates_list"></ul></div>')
    $templateOptions.each(function(index, item) {
        var listItem = '<li data-value="'+$(item).val()+'">'+'<img width="160px" height="100px" src="'+$(item).data('image')+'">'+$(item).text()+'</li>'//'+$(item).text()+'
        if ($(item).val() == $selectedTemplateOption.val()) {
            $('#templates_list').append(listItem).find('li:last').addClass('active')
        } else {
            $('#templates_list').append(listItem)
        }
    })

    $('#templates_list').parent().jCarouselLite({visible:2,btnNext: ".next",btnPrev: ".prev"})

    $('#templates_list li').on('click', function() {
        $('#templates_list li').removeClass('active')
        $(this).addClass('active')
        var selectedTemplate = $(this).attr('data-value')
        $templateOptions.each(function(index, item) {
            if (item.value == selectedTemplate) {
                $(item).attr('selected', 'selected')
            } else {
                $(item).removeAttr('selected')
            }
        })
    })

    var $colorOptions = $('#project_color_scheme_id option')
    var $selectedColorOption = $('#project_color_scheme_id option:selected')

    $colorOptions.parent().hide().parents('#design').append('<button class="prev">Влево</button><button class="next">Вправо</button><div><ul id="color_list"></ul></div>')
    $colorOptions.each(function(index, item) {
        var listItem = '<li data-value="'+$(item).val()+'"><div style="background-color:'+$(item).data('color1')+';"></div><div style="background-color:'+$(item).data('color2')+';"></div><div style="background-color:'+$(item).data('color3')+';"></div><div style="background-color:'+$(item).data('color4')+';"></div><div style="background-color:'+$(item).data('color5')+';"></div></li>'
        if ($(item).val() == $selectedTemplateOption.val()) {
            $('#color_list').append(listItem).find('li:last').addClass('active')
        } else {
            $('#color_list').append(listItem)
        }
    })

    $('#color_list').parent().jCarouselLite({visible:1,btnNext: ".next",btnPrev: ".prev"})

//    $('#templates_list li').on('click', function() {
//        $('#templates_list li').removeClass('active')
//        $(this).addClass('active')
//        var selectedTemplate = $(this).attr('data-value')
//        $templateOptions.each(function(index, item) {
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