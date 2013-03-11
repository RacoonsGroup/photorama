jQuery(function($) {
    Blocks = {
        init: function() {
            this.bindEvents()
            this.addBlockControl()
        },

        bindEvents: function() {
            $('.add_block_to_main_content').on('click', this.addBlock)
            $('.block-sortable').on('click', this.sortBlocks)
            $('.block-page-save').on('click', this.savePage)
            $(document).on('click', '.remove-block', this.removeBlock)
            $(document).on('click', '.block-editable-area', this.bindRedactor)
            $(document).on('click', '.merge-block', this.prepareToMerge)
        },

        addBlock: function() {
            numberOfColumns = $(this).data('number-of-columns')
            $.get('/render_block_tpl', {columns: numberOfColumns}, Blocks.renderTemplate)
        },

        addBlockControl: function() {
            $.get('/render_block_control', Blocks.renderControl)
        },

        renderTemplate: function(data) {
            $('.main_content').find('.container').append(data)
        },

        renderControl: function(data) {
            $('.block-wrap > .span12').prepend(data)
        },

        removeBlock: function() {
            $(this).parents('.block-wrap').remove()
        },

        bindRedactor: function() {
            if ($('.block-sortable').hasClass('now-sorted')) {
                alert('Невозможно редактировать текст во время изменения порядка блоков!')
            } else if ($(this).parents('.block-wrap').find('.merge-block').hasClass('merging-blocks')) {
                Blocks.mergingColumns(this)
            } else {
                var target = $(this)
                $(this).redactor({
                    focus: true,
                    buttons: ['formatting', '|', 'bold', 'italic', '|', 'saveButton'],
                    buttonsCustom: {
                        saveButton: {
                            title: 'Сохранить',
                            callback: function() {
                                $(target).destroyEditor()
                            }
                        }
                    }
                })
            }
        },

        killAllRedactors: function() {
            $('.block-editable-area').destroyEditor()
        },

        sortBlocks: function() {
            if ($(this).hasClass('now-sorted')) {
                $(this).removeClass('now-sorted').removeClass('btn-primary')
                $('.main_content').find('.container').sortable('destroy')
            } else {
                Blocks.killAllRedactors()
                $(this).addClass('now-sorted').addClass('btn-primary')
                $('.main_content').find('.container').sortable({
                    axis: 'y',
                    items: "> .row:not(.add-block-panel, .page-head)"
                })
            }

            return false
        },

        prepareToMerge: function() {
            Blocks.killAllRedactors()

            if ($(this).hasClass('merging-blocks')) {
                $(this).removeClass('merging-blocks').removeClass('btn-primary')
            } else {
                $(this).addClass('merging-blocks').addClass('btn-primary')
                alert('Выберите два блока, которые хотите объединить!')
            }

            return false
        },

        mergingColumns: function(target) {
            var $thisSpan = $(target).parent()
            var $prevSpan = $(target).parent().prev()
            var $nextSpan = $(target).parent().next()

            if ($prevSpan.hasClass('merge-marker')) { //Prev col marked

                var newSpanIndex = Blocks.newSpanIndex($prevSpan, $thisSpan)

                $prevSpan
                    .removeClass( Blocks.spanCheck($prevSpan))
                    .addClass('span' + newSpanIndex)
                    .removeClass('merge-marker')
                    .find('.block-editable-area')
                    .append($(target).html())
                    .parents('.block-wrap')
                    .find('.merge-block')
                    .removeClass('merging-blocks')
                    .removeClass('btn-primary')

                $thisSpan.remove()

            } else if ($nextSpan.hasClass('merge-marker')) { //Next col marked

                var newSpanIndex = Blocks.newSpanIndex($nextSpan, $thisSpan)
                var innerHTML = $nextSpan.find('.block-editable-area').html()

                $nextSpan.remove()

                $thisSpan
                    .removeClass( Blocks.spanCheck($thisSpan))
                    .addClass('span' + newSpanIndex)
                    .find('.block-editable-area')
                    .append(innerHTML)
                    .parents('.block-wrap')
                    .find('.merge-block')
                    .removeClass('merging-blocks')
                    .removeClass('btn-primary')

            } else if ($thisSpan.prevAll().hasClass('merge-marker') || $thisSpan.nextAll().hasClass('merge-marker')) { //Row has marked cols, but not neighbour

                alert('Вы можете объединить только соседние блоки.')

            } else {

                $(target).parent().addClass('merge-marker')

            }
        },

        spanCheck: function(target) {
            var returnedValue
            var classArray = target.attr('class').split(' ')
            $.each(classArray, function(index, value) {
                if (/span/.test(value)) {
                    returnedValue = value
                }
            })
            return returnedValue
        },

        spanIndex: function(spanString) {
            return parseInt(spanString.replace(/span/, ''))
        },

        newSpanIndex: function(first_index, second_index) {
            return Blocks.spanIndex( Blocks.spanCheck(first_index) ) + Blocks.spanIndex( Blocks.spanCheck(second_index) )
        },

        savePage: function() {
            var pageID = $(this).data('page-id')
            var content = ''

            $.each($('.block-content'), function(index, item) {
                content += '<div class="row block-wrap"><div class="span12"><div class="row block-content">' + $(item).html() + '</div></div></div>'
            })

            $.ajax({
                type: 'PUT',
                url: '/static_pages/'+pageID,
                data: {
                    'static_page_attr[content]': content,
                    'static_page_attr[static_page_id]': pageID
                },
                success: function() {
                    // TODO: Сделать норм оповещения
                    alert('Все ок!')
                }
            });

            return false
        }

    }

    Blocks.init()
})