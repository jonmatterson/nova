<?php 

require_once dirname(__FILE__).'/jquery_generator_chain.php';

class jquery_generator
{
  public function select($selector)
  {
    return new jquery_generator_chain($selector);
  }
}
