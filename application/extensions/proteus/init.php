<?php 

foreach(['tour','specs','decks','departments'] as $simSub){
  $this->event->listen(['template', 'render', 'data', 'sim', $simSub], function($event){
    $event['data']['nav_sub'] = Menu::build('sub', 'personnel');
    $event['data']['content'] .= '<script type="text/javascript">$("a[href*=\'/sim\']").removeClass("active"); $("a[href*=\'/personnel\']").addClass("active");</script>';
  });
}
