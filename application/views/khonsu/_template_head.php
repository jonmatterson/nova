<meta charset="utf-8">
<title><?php echo $title;?></title>

<meta name="og:title" content="<?php echo $title;?>" />
<meta name="description" content="<?php echo $this->config->item('meta_desc');?>" />
<meta name="og:description" content="<?php echo $this->config->item('meta_desc');?>" />
<meta name="keywords" content="<?php echo $this->config->item('meta_keywords');?>" />
<meta name="author" content="<?php echo $this->config->item('meta_author');?>" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

<?php echo $_redirect;?>

<?php echo link_tag($link);?>

<!--[if lt IE 9]>
<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<?php include_once($this->config->item('include_head_main'));?>

<script type="text/javascript" src="<?php echo base_url() . APPFOLDER;?>/views/<?php echo $current_skin;?>/jquery.blockUI.js"></script>

<?php echo $javascript;?>

<script type="text/javascript">
    $(document).ready(function(){
        $('body').click(function(event){
            if (! $(event.target).closest('div').hasClass('signin-panel'))
            {
                $.unblockUI();
            }
        });

        $('a#userpanel').unbind('click').click(function(){
            $.blockUI({
                message: $('#panel'),
                css: {
                    border: '0',
                    cursor: 'cursor',
                    background: 'transparent',
                    width: '800px',
                    top: '10%',
                    left: '50%',
                    margin: '0 0 0 -400px'
                }
            });

            return false;
        });

        // make sure the control panel item is always shown as active
        $('a:contains("Control Panel")').addClass('active');
    });

    // if the escape key is pressed, close the menu
    $(document).keyup(function(event){
        if (event.keyCode == 27) {
            $.unblockUI();
        }
    });
</script>
