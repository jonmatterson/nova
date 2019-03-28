<nav id="menu">
    <div class="nav-pullout">
        <?php 
        preg_match_all('/<li>(.*?)<\/li>/', $nav_main, $matches);
        $lis = $matches[1];
        
        $iconMatches = [
            'main/index' => 'fas fa-home',
            'personnel/index' => 'fas fa-users',
            'sim/index' => 'fas fa-book-open',
            'wiki/index' => 'fas fa-database',
            'search/index' => 'fas fa-search',
            'admin/index' => 'fas fa-tools',
            'login/logout' => 'fas fa-sign-out-alt',
            'login/index' => 'fas fa-sign-in-alt'
        ];
        
        $iconDefaultClasses = 'fas fa-external-link-alt';
        
        $nav_main = '<ul>';
        
        $nav_main .= '<li>'
            .'<a href="#" class="nav-pullout-toggle">'
            .'<span class="icon"><i class="fas fa-bars"></i></span>'
            .'<span class="label">Navigation</span>'
            .'</a>'
            .'</li>';
            
        for($i = 0; $i < count($lis); $i++){
            preg_match('/<a href="(.*?)"(?:.*?)><span>(.*?)<\/span><\/a>/', $lis[$i], $liMatches);
            list($_, $url, $text) = $liMatches;
            
            $icon = null;
            foreach($iconMatches as $substring => $classes)
                if(strpos($url, $substring) !== false){
                    $icon = '<i class="'.$classes.'"></i>';
                    break;
                }
                
            if(!$icon)
                $icon = '<i class="'.$iconDefaultClasses.'"></i>';
            
            $nav_main .= '<li>'
                .'<a href="'.$url.'">'
                .'<span class="icon">'.$icon.'</span>'
                .'<span class="label">'.$text.'</span>'
                .'</a>'
                .'</li>';
        }
        $nav_main .= '</ul>';
        
        echo $nav_main;
        ?>
    </div>
    <div class="nav-overlay nav-pullout-toggle"></div>
    <script type="text/javascript">
    $('.nav-pullout-toggle').click(function(e){
        e.preventDefault();
        if($('.nav-pullout').hasClass('open')){
            $('.nav-pullout').removeClass('open')
        }else{
            $('.nav-pullout').addClass('open')
        }
    })
    </script>
</nav>

<header>
    <h1 id="header-name"><?php echo !empty($this->msgs->get_message('khonsu__header_title')) ? $this->msgs->get_message('khonsu__header_title') : $this->options['sim_name'] ?></h1>
    <div class="signin-container">
        <?php if ( ! Auth::is_logged_in()): ?>
        <?php else: ?>
            <a href="<?php echo site_url('login/logout');?>" class="signin corner-upper-left corner-upper-right corner-lower-left corner-lower-right"><?php echo ucfirst(lang('actions_logout'));?></a>
            <div class="logged-in-controls">
                <?php if (Auth::is_logged_in()): ?>
                    <?php echo panel_inbox(true, true, false, '(x)', img($panel['inbox']));?> &nbsp;
                    <?php echo panel_writing(true, true, false, '(x)', img($panel['writing']));?> &nbsp;
                    <?php echo panel_dashboard(false, img($panel['dashboard']));?>
                <?php endif;?>
            </div>
        <?php endif;?>
    </div>
</header>
