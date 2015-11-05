<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');  ?>

<script type="text/javascript">
    
<?php include dirname(dirname(__FILE__)).'/etherpad/jquery.pad.js'; ?>;

$(document).ready(function(){
    
    var baseOptions = {
            'host': '<?php echo $etherpad_url; ?>',
            'showChat': true,
            'showControls': true,
            'showLineNumbers': false,
            'userColor': true,
            'height': '400px'
        },
        $contentPad = $('<div id="content-pad"></div>'),
        $contentPadId = $('<input type="hidden" name="pad_id">'),
        $contentTextarea = $('#content-textarea');
        
    $contentTextarea.after($contentPad).after($contentPadId);
    
    $contentTextarea.hide();
    
    $contentPad.pad($.extend({}, baseOptions, {
        'padId':'<?php echo $pad_id; ?>',
        'userName': '<?php echo $user_main_character_name; ?>'
    }));
    
    $contentPadId.val('<?php echo $pad_id; ?>');
    
    $('#writepost [type="submit"]').click(function(e, options){
        
        options = options || {};
        
        if ( !options.extracted_from_pad ) {
        
            e.preventDefault();

            var frameUrl = $contentPad.children('iframe').first().attr('src').split('?')[0],
                contentsUrl = frameUrl + "/export/html";

            // perform an ajax call on contentsUrl and write it to the parent
            $.get(contentsUrl, function(data) {
                $contentTextarea.val(data.replace(/^[\S\s]*<body[^>]*?>/i, "").replace(/<\/body[\S\s]*$/i, ""));
                $(e.currentTarget).trigger('click', { 'extracted_from_pad': true });
            });
        
        }
        
    });
});
</script>
