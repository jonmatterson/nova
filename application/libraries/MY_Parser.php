<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once BASEPATH.'libraries/Parser.php';

/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		EllisLab Dev Team
 * @copyright		Copyright (c) 2008 - 2014, EllisLab, Inc.
 * @copyright		Copyright (c) 2014 - 2015, British Columbia Institute of Technology (http://bcit.ca/)
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * Parser Class
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Parser
 * @author		EllisLab Dev Team
 * @link		http://codeigniter.com/user_guide/libraries/parser.html
 */
class MY_Parser extends CI_Parser {

	/**
	 *  Parse a String
	 *
	 * Parses pseudo-variables contained in the specified string,
	 * replacing them with the data in the second param
	 *
	 * @access	public
	 * @param	string
	 * @param	array
	 * @param	bool
	 * @return	string
	 */
	function parse_string($template, $data, $return = FALSE)
	{
		$ci =& get_instance();
		
		$ci->event->fire(array_merge(['parser', 'parse_string', 'data'], $ci->uri->segment_array()), [
			'data' => &$data
		]);
	
		$output = $this->_parse($template, $data, $return);
		
		$ci->event->fire(array_merge(['parser', 'parse_string', 'output'], $ci->uri->segment_array()), [
			'data' => &$data,
			'output' => &$output
		]);
		
		return $output;
	}

}
