<?php

class Theme_Transformer
{
	/*
	 * Accepts the complete <ul>...</ul> element assigned to the template view
	 * as $nav_main and attaches the Twitter bootstrap .nav-bar styling to it.
	 */
	public static function nav_bar($nav_main, $header = false)
	{
		$before = '<div class="navbar" id="main-nav"><div class="navbar-inner"><div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
				</a>';
		if($header)
			$before .= '<a class="brand" href="'.Theme_URL::index().'">'.$header.'</a>';
		$before .= '<div class="nav-collapse">';
		$after = '</div></div></div></div>';
		return $before.str_replace('<ul', '<ul class="nav"', $nav_main).$after;
	}
	
	public static function nav_sub($nav_sub)
	{
		return str_replace('<ul', '<ul class="nav nav-tabs nav-stacked"', $nav_sub);
	}
	
	public static function nav_pills($nav_sub)
	{
		return str_replace('<ul', '<ul class="nav nav-pills"', $nav_sub);
	}
}