<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * @package		Nova
 * @category	Library
 * @author		Anodyne Productions
 * @copyright	2015 Anodyne Productions
 */

require_once MODFOLDER.'/swiftmailer/swift_required.php';

abstract class Nova_mail {

	protected $config;
	protected $mailer;
	protected $message;
	protected $originalMailer;
	protected $originalMessage;

	public $useragent;
	public $mailpath;
	public $protocol;
	public $smtp_host;
	public $smtp_user;
	public $smtp_pass;
	public $smtp_port;
	public $smtp_timeout;
	public $smtp_crypto;
	public $wordwrap;
	public $wrapchars;
	public $mailtype;
	public $charset;
	public $multipart;
	public $alt_message;
	public $validate;
	public $priority;
	public $newline;
	public $crlf;
	public $send_multipart;
	public $bcc_batch_mode;
	public $bcc_batch_size;

	public function __construct()
	{
		// Get an instance of CI
		$ci =& get_instance();

		// Load the email config file
		$ci->load->config('email');

		// Get the config object
		$this->config = $ci->config;

		// Create the transport
		$transport = $this->createTransport();

		// Create the mailer
		$this->originalMailer = $this->mailer = Swift_Mailer::newInstance($transport);

		// Create the message
		$this->originalMessage = $this->message = Swift_Message::newInstance();

		// Set the config items from the email config file
		$this->useragent = $this->config->item('useragent');
		$this->protocol = $this->config->item('protocol');
		$this->mailpath = $this->config->item('mailpath');
		$this->smtp_host = $this->config->item('smtp_host');
		$this->smtp_user = $this->config->item('smtp_user');
		$this->smtp_pass = $this->config->item('smtp_pass');
		$this->smtp_port = $this->config->item('smtp_port');
		$this->smtp_timeout = $this->config->item('smtp_timeout');
		$this->wordwrap = $this->config->item('wordwrap');
		$this->wrapchars = $this->config->item('wrapchars');
		$this->mailtype = $this->config->item('mailtype');
		$this->charset = $this->config->item('charset');
		$this->validate = $this->config->item('validate');
		$this->priority = $this->config->item('priority');
		$this->clrf = $this->config->item('clrf');
		$this->newline = $this->config->item('newline');
		$this->bcc_batch_mode = $this->config->item('bcc_batch_mode');
		$this->bcc_batch_size = $this->config->item('bcc_batch_size');
	}

	public function bcc($address, $name = null)
	{
		$this->message->setBcc($address, $name);

		return $this;
	}

	public function getConfig($item)
	{
		return $this->config->item($item);
	}

	public function cc($address, $name = null)
	{
		$this->message->setCc($address, $name);

		return $this;
	}

	public function from($address, $name = null)
	{
		$this->message->setFrom($address, $name);

		return $this;
	}

	public function message($message, $text = false)
	{
		// Set the HTML body
		$this->message->setBody($message, "text/html");

		// Add the text version of the body
		$this->message->addPart($text, "text/plain");

		return $this;
	}

	public function reply_to($address, $name = null)
	{
		$this->message->setReplyTo($address, $name);

		return $this;
	}

	public function reset()
	{
		// Put the mailer back to its original state
		$this->mailer = $this->originalMailer;

		// Put the message back to its original state
		$this->message = $this->originalMessage;

		return $this;
	}

	public function send()
	{
		// Send the message
		$this->mailer->send($this->message);

		return $this->reset();
	}

	public function setConfig($item, $value)
	{
		return $this->config->set_item($item, $value);
	}

	public function subject($subject)
	{
		$this->message->setSubject($subject);

		return $this;
	}

	public function to($address, $name = null)
	{
		$this->message->setTo($address, $name);

		return $this;
	}

	protected function createTransport()
	{
		switch ($this->config->item('protocol'))
		{
			case 'mail':
			default:
				$transport = Swift_MailTransport::newInstance();
			break;

			case 'sendmail':
				$transport = Swift_SendmailTransport::newInstance($this->config->item('mailpath'));
			break;

			case 'smtp':
				$transport = Swift_SmtpTransport::newInstance($this->config->item('smtp_host'), $this->config->item('smtp_port'))
					->setUsername($this->config->item('smtp_user'))
					->setPassword($this->config->item('smtp_pass'));
			break;
		}

		return $transport;
	}

}
