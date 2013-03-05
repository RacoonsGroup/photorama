$ ->
  fileUploadErrors =
    maxFileSize: 'File is too big',
    minFileSize: 'File is too small',
    acceptFileTypes: 'Filetype not allowed',
    maxNumberOfFiles: 'Max number of files exceeded',
    uploadedBytes: 'Uploaded bytes exceed file size',
    emptyResult: 'Empty file upload result'

  $("#fileupload").fileupload
    uploadTemplateId: null,
    downloadTemplateId: null,
    uploadTemplate: (o) ->
      JST['photos_upload/templates/uploading']({o: o})
    downloadTemplate: (o) ->
      JST['photos_upload/templates/downloading']({o: o})

  $.getJSON $("#fileupload").prop("action"), (files) ->
    fu = $("#fileupload").data("fileupload")
    template = undefined
    fu._adjustMaxNumberOfFiles -files.length
    console.log files
    template = fu._renderDownload(files).appendTo($("#fileupload .files"))
    console.log template
    # Force reflow:
    fu._reflow = fu._transition and template.length and template[0].offsetWidth
    template.addClass "in"
    $("#loading").remove()

  # Type here!
  (($) ->
    $.fn.highlight = ->
      $(this).css
        color: "red"
        background: "yellow"

      $(this).fadeIn()
  ) jQuery
