jQuery(function($) {
    //Custom select box with images
    try {
        $("#project_template_id").msDropDown({showIcon: true});
    } catch(e) {
        alert(e.message);
    }
});