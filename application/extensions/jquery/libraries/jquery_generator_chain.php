<?php

class jquery_generator_chain
{
  public $selector;
  
  public $chain = [];
  
  public $supported_tags = [
    'first',
    'last',
    'before',
    'after',
    'append',
    'prepend',
    'html',
    'text',
    'closest',
    'remove'
  ];
  
  public function __construct($selector)
  {
    $this->selector = $selector;
  }
  
  public function __call($method, $args = [])
  {
    if(in_array($method, $this->supported_tags)){
      $this->chain[] = [
        'type' => 'method',
        'name' => $method, 
        'args' => $args
      ];
    }else{
      show_error('Unsupported jquery_generator_chain method: '.$method);
    }
    return $this;
  }
  
  public function __toString()
  {
    return '<script type="text/javascript">'.implode('.', array_merge([
      '$('.json_encode($this->selector).')'
    ], array_map(function($entry){
      switch($entry['type']){
        case 'method':
          return $entry['name'].'('.implode(',', array_map(function($arg){
            return json_encode($arg);
          }, $entry['args'])).')';
      }
    }, $this->chain))).'</script>';
  }
}
