jQuery(function($) {

    $('.add_item_to_menu').on('click', function() {
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

    $('#menu').sortable({
        axis: 'x',
        items: "> li.sortable_item"
    });
    $("#menu").bind( "sortupdate", function(event, ui) {
        var result = $('#menu').sortable('toArray');
        var dataParams = {};
        var id;
        for(var i=0;i<result.length;i++){
            id = result[i].split('_')[1];
            dataParams[id] = {order: i};
        }
        $.ajax({
           type: "POST",
           url: "/page_modules/menu_update",
           data: {
                menu_order: dataParams
           },
           beforeSend: function(){
            $('#menu').addClass('menu_update');
            $('#menu').sortable('disable');
           }
         });
    });

    $('#deleted_pages, #visible_pages').sortable({
        connectWith: ".connectedSortable",
        items: "> li.sortable_item"
    });
    $("#deleted_pages, #visible_pages").bind( "sortreceive", function(event, ui) {
        sender = ui.sender;
    });
    function disableLists() {
        $('#deleted_pages, #visible_pages').addClass('menu_update');
        $('#deleted_pages, #visible_pages').sortable('disable');
    }
    $("#deleted_pages, #visible_pages").bind( "sortstop", function(event, ui) {
        if(!sender) return false;
        var k = ui.item.attr('id').split('_')[1];
        if(sender.data('type') == 'visible') {
            // Удаляем
            $.ajax({
               type: "POST",
               url: "/page_modules/delete_page",
               data: {
                    page_modules: { id: k }
               },
               beforeSend: function(){
                    disableLists();
               }
             });
        } else {
            //Возвращаем
            $.ajax({
               type: "POST",
               url: "/page_modules/retrieve_page",
               data: {
                    page_modules: { id: k }
               },
               beforeSend: function(){
                    disableLists();
               }
             });
        }
        sender = null;
        // var result = $('#menu').sortable('toArray');
        // var dataParams = {};
        // var id;
        // for(var i=0;i<result.length;i++){
        //     id = result[i].split('_')[1];
        //     dataParams[id] = {order: i};
        // }
        // $.ajax({
        //    type: "POST",
        //    url: "/page_modules/menu_update",
        //    data: {
        //         menu_order: dataParams
        //    },
        //    beforeSend: function(){
        //     $('#menu').addClass('menu_update');
        //     $('#menu').sortable('disable');
        //    }
        //  });
    });

    $('.page-content, .cancel-redactor').on("click", function(){
      $('.tgl-block').toggle();
      return false;
    });
});