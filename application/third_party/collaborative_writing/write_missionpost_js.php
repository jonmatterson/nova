<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Create application/views/_base_override/admin/js/write_missionpost_js.php 
 * with the following code:
 * 
 * if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 * require APPPATH.'third_party/collaborative_writing/write_missionpost_js.php';
 */

?>

<?php $string = random_string('alnum', 8);?>

<link rel="stylesheet" href="<?php echo base_url().MODFOLDER;?>/assets/js/css/bootstrap.css" />

<script type="text/javascript">
	$(document).ready(function(){
		
		// using the CI user agent library instead of jquery's $.browser since the latter is deprecated
		var browser = "<?php echo $this->agent->browser();?>";
		var version = parseFloat("<?php echo $this->agent->version();?>");
		
		// check to see if we should be using the Chosen plugin
		if (browser == 'Internet Explorer' && version < 8)
			$('#chosen-incompat').show();
		else
			$('.chosen').chosen();
		
		$('#toggle_notes').click(function(){
			$('.notes_content').slideToggle('fast');
			return false;
		});

		$('[rel=tooltip]').twipsy({
			animate: false,
			offset: 5,
			placement: 'right'
		});
		
		$('#submitDelete').click(function(){
			return confirm('<?php echo lang('confirm_delete_missionpost');?>');
		});
		
		$('#submitPost').click(function(){
			return confirm('<?php echo lang('confirm_post_missionpost');?>');
		});
		
		<?php if ($missionCount == 0 and $authorized): ?>
			$.facebox(function(){
				$.get('<?php echo site_url('ajax/add_mission');?>/<?php echo $string;?>', function(data) {
					$.facebox(data);
				});
			});
			
			$(document).on('click', '#addMission', function(){
				var title = $('#addMissionTitle').val();
				var desc = $('#addMissionDesc').val();
				var option = $('#addMissionOption').val();
				
				$.ajax({
					type: "POST",
					url: "<?php echo site_url('ajax/add_mission_action');?>",
					data: { title: title, desc: desc, option: option, 'nova_csrf_token': $('input[name=nova_csrf_token]').val() }
				});
			});
		<?php endif;?>
		
		<?php if ($this->uri->segment(4) == 'view'): ?>
			$('#editable').hide();
			$('#readonly').show();
		<?php endif;?>

		<?php if ($missionNotesUpdate === true): ?>
			$('.notes_content').show();
		<?php endif;?>
	});
</script>

<script type="text/javascript">
(function( $ ){

  $.fn.pad = function( options ) {
    var settings = {
      'host'              : 'http://beta.etherpad.org',
      'baseUrl'           : '/p/',
      'showControls'      : false,
      'showChat'          : false,
      'showLineNumbers'   : false,
      'userName'          : 'unnamed',
      'lang'              : '',
      'useMonospaceFont'  : false,
      'noColors'          : false,
      'userColor'         : false,
      'hideQRCode'        : false,
      'alwaysShowChat'    : false,
      'width'             : 100,
      'height'            : 100,
      'border'            : 0,
      'borderStyle'       : 'solid',
      'toggleTextOn'      : 'Disable Rich-text',
      'toggleTextOff'     : 'Enable Rich-text',
      'plugins'           : {},
      'rtl'               : false
    };
    
    var $self = this;
    if (!$self.length) return;
    if (!$self.attr('id')) throw new Error('No "id" attribute');
    
    var useValue = $self[0].tagName.toLowerCase() == 'textarea';
    var selfId = $self.attr('id');
    var epframeId = 'epframe'+ selfId;
    // This writes a new frame if required
    if ( !options.getContents ) {
      if ( options ) {
        $.extend( settings, options );
      }
      
      var pluginParams = '';
      for(var option in settings.plugins) {
        pluginParams += '&' + option + '=' + settings.plugins[option]
      }

      var iFrameLink = '<iframe id="'+epframeId;
          iFrameLink = iFrameLink +'" name="' + epframeId;
          iFrameLink = iFrameLink +'" src="' + settings.host+settings.baseUrl+settings.padId;
          iFrameLink = iFrameLink + '?showControls=' + settings.showControls;
          iFrameLink = iFrameLink + '&showChat=' + settings.showChat;
          iFrameLink = iFrameLink + '&showLineNumbers=' + settings.showLineNumbers;
          iFrameLink = iFrameLink + '&useMonospaceFont=' + settings.useMonospaceFont;
          iFrameLink = iFrameLink + '&userName=' + settings.userName;
          if (settings.lang) {
            iFrameLink = iFrameLink + '&lang=' + settings.lang;
          }
          iFrameLink = iFrameLink + '&noColors=' + settings.noColors;
          iFrameLink = iFrameLink + '&userColor=' + settings.userColor;
          iFrameLink = iFrameLink + '&hideQRCode=' + settings.hideQRCode;
          iFrameLink = iFrameLink + '&alwaysShowChat=' + settings.alwaysShowChat;
          iFrameLink = iFrameLink + '&rtl=' + settings.rtl;
          iFrameLink = iFrameLink + pluginParams;
          iFrameLink = iFrameLink +'" style="border:' + settings.border;
          iFrameLink = iFrameLink +'; border-style:' + settings.borderStyle;
          iFrameLink = iFrameLink +';" width="' + '100%';//settings.width;
          iFrameLink = iFrameLink +'" height="' + settings.height; 
          iFrameLink = iFrameLink +'"></iframe>';
      
      
      var $iFrameLink = $(iFrameLink);
      
      if (useValue) {
        var $toggleLink = $('<a href="#'+ selfId +'">'+ settings.toggleTextOn +'</a>').click(function(){
          var $this = $(this);
          $this.toggleClass('active');
          if ($this.hasClass('active')) $this.text(settings.toggleTextOff);
          $self.pad({getContents: true});
          return false;
        });
        $self
          .hide()
          .after($toggleLink)
          .after($iFrameLink)
        ;
      }
      else {      
        $self.html(iFrameLink);
      }
    }

    // This reads the etherpad contents if required
    else {
      var frameUrl = $('#'+ epframeId).attr('src').split('?')[0];
      var contentsUrl = frameUrl + "/export/html";
      var target = $('#'+ options.getContents);

      // perform an ajax call on contentsUrl and write it to the parent
      $.get(contentsUrl, function(data) {
        
        if (target.is(':input')) {
          target.val(data).show();
        }
        else {
          target.html(data);
        }
        
        $('#'+ epframeId).remove();
      });
    }
    
    
    return $self;
  };
})( jQuery );
</script>

<?php

if($this->uri->segment(3))
{
    $pad_id = $this->posts->get_post_pad_id($this->uri->segment(3));
}

if(!isset($pad_id))
{
    $pad_id = str_replace('.', '', uniqid('', true));
}

$user_main_character_name = str_replace('\'', '\\\'', $this->char->get_character_name($this->user->get_user($this->session->userdata('userid'))->main_char));

?>

<script type="text/javascript">
$(document).ready(function(){
    
    var baseOptions = {
            'host': '<?php echo $this->config->item('collaborative_writing_etherpad_host') ?: 'http://0.0.0.0:9001'  ?>',
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
