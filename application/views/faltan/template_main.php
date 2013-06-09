<?php

include_once(dirname(__FILE__).'/global.php');

// load the panel helper
$this->load->helper('panel');

$button_login = array(
	'class' => 'button-signin',
	'value' => 'submit',
	'type' => 'submit',
	'name' => 'submit',
	'content' => ucwords(lang('actions_login'))
);

?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><?php echo $title;?></title>
		
		<meta name="description" content="<?php echo $this->config->item('meta_desc');?>" />
		<meta name="keywords" content="<?php echo $this->config->item('meta_keywords');?>" />
		<meta name="author" content="<?php echo $this->config->item('meta_author');?>" />
		
		<?php echo $_redirect;?>
		
		<link rel="stylesheet" href="<?php echo Theme_URL::css('bootstrap.css'); ?>">
		<link rel="stylesheet" href="<?php echo Theme_URL::css('bootstrap-responsive.css'); ?>">
		<link rel="stylesheet" href="<?php echo Theme_URL::css('template.css'); ?>">
		
		<!--[if lt IE 9]>
		<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<?php include_once($this->config->item('include_head_main'));?>
		
		<script type="text/javascript" src="<?php echo Theme_URL::js('jquery.blockUI.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-dropdown.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-collapse.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-transition.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-tab.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-modal.js'); ?>"></script>
		
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
			});
			
			// if the escape key is pressed, close the menu
			$(document).keyup(function(event){
				if (event.keyCode == 27) {
					$.unblockUI();
				}
			});
		</script>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
	</head>
	
	<body>
		
		<noscript>
			<div class="system_warning"><?php echo lang_output('text_javascript_off', '');?></div>
		</noscript>
        
        <div id="background">
            
        </div>
        
        <div id="stripe-offsetter">
            
            <div id="stripe">
                
                <div id="stripe-inner">
                
                    <div id="stripe-gradient">

                    </div>
                    
                </div>

            </div>
        
        </div>
            
        <div id="foreground">
            
            <div id="foreground-wrapper">
                
                <div id="signin-panel">
            
                    <?php Theme_Includer::view('signin-panel'); ?>
                    
                </div>

                <div id="taskforce-image">
                    <?php echo anchor('main/index', '<img src="'.Theme_URL::img('tf93-logo.png').'">'); ?>
                   
                    </a>
                </div>

                <div id="content-container">

                    <div id="content-wrapper">
                        
                        <div id="site-head">
                            
                            <div id="site-head-wrapper">
                                
                                <?php echo anchor('main/index', '<h1>Faltan Station</h1><h2 class="sub">Task Force 93 Base of Operations</h2><h2 class="sub-alt">TF93 Base of Operations</h2>'); ?>
                        
                            
                            </div>
                        
                        </div>

                        <?php if (Auth::is_logged_in()): ?>
                            <div class="modal hide fade" id="dashboardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h3>Dashboard</h3>
                                </div>
                                <div class="modal-body">
                                    <div class="row-fluid">
                                        <div class="span4"><?php echo $panel_1;?></div>
                                        <div class="span4"><?php echo $panel_2;?></div>
                                        <div class="span4"><?php echo $panel_3;?></div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a href="#" class="btn" data-dismiss="modal" aria-hidden="true">Close</a>
                                </div>
                            </div>
                        <?php endif;?>

                        <header>

                            <nav class="nav-bar" id="site-nav-primary">
                                <?php echo $nav_main;?>
                            </nav>

                        </header>

                        <div class="container-fluid">

                            <?php if($nav_sub){ ?>
                            <div class="row-fluid">

                                <nav class="span3">
                                    <?php echo Theme_Transformer::nav_sub($nav_sub);?>
                                </nav>

                                <div class="span9">
                                <?php } ?>
                                    <?php echo $flash_message;?>
                                    <section class="page-content">
                                    <?php 
                                    if(isset($nav_pills) && $nav_pills)
                                        echo Theme_Transformer::nav_pills($nav_pills);
                                    echo $content;?>
                                    </section>
                                    <?php echo $ajax;?>

                                    <div style="clear:both;"></div>
                                <?php if($nav_sub || ! Auth::is_logged_in()){ ?>
                                </div>

                            </div>
                            <?php } ?>

                            <footer>
                                Powered by <strong><?php echo APP_NAME;?></strong> from <a href="http://www.anodyne-productions.com" target="_blank">Anodyne Productions</a><br><?php echo anchor('main/rules', 'Rules');?> | <?php echo anchor('main/contact', 'Contact');?> | <?php echo anchor('main/credits', 'Credits');?>
                            </footer>

                        </div>

                    </div>
                    
                </div>

            </div>

        </div>
              
	</body>
</html>