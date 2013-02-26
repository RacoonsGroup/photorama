jQuery(function($) {
    //Custom select box with images
    try {
        $("#project_template_id, #project_background_id").msDropDown({showIcon: true});
    } catch(e) {
        alert(e.message);
    }

    $('.page-content, .cancel-redactor').on("click", function(){
      $('.tgl-block').toggle();
      return false;
    });
});