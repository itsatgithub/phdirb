<?php

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport('joomla.application.component.controller');

/**
 * Phd Applicant Controller
 *
 * @package		Joomla
 * @subpackage	Phd
 * @since 1.5
 */
class PhdControllerApplicant extends JController
{
	function __construct($config = array())
	{
		parent::__construct($config);
	}

	function display()
	{
		//Set the default view, just in case
		$view = JRequest::getCmd('view');
		if(empty($view)) {
			JRequest::setVar('view', 'applicants');
		};
				
		parent::display();
	}
	
}
?>