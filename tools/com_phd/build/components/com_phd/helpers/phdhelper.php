<?php
/**
 * PhD Helper file
 *
 * @author GPLavui.com <info@gplavui.com>
 * @version 1.5.0
 * @package PhD Programme
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

/**
 * The class contains the functions used on different parts of the PhD application.
 * 
 * @package PhD Programme
 */
class JHTMLPhdHelper
{
	/**
	 * Check if logged user is an Administrator
	 *
	 * @return boolean True => Administrator
	 */	
	function isAdministrator()
	{
		$db    =& JFactory::getDBO();
		$user =& JFactory::getUser();

		$query = "SELECT t.id AS value, t.name AS text"
		. " FROM `#__phd_permit` AS p"
		. " LEFT JOIN `#__phd_rols` AS r"
		. " ON r.id = p.role_id"
		. " WHERE r.id = '1'"
		. " AND p.username = '".$user->username."'"
		;
		$db->setQuery($query);
		return (bool)$db->loadResult();
	}

	/**
	 * Check if logged user is a Group Leader
	 *
	 * @return boolean True => Group Leader
	 */	
	function isGroupLeader()
	{
		$db    =& JFactory::getDBO();
		$user =& JFactory::getUser();

		$query = "SELECT t.id AS value, t.name AS text"
		. " FROM `#__phd_permit` AS p"
		. " LEFT JOIN `#__phd_rols` AS r"
		. " ON r.id = p.role_id"
		. " WHERE r.id = '2'"
		. " AND p.username = '".$user->username."'"
		;
		$db->setQuery($query);
		return (bool)$db->loadResult();
	}

	/**
	 * Check Total Access variable from configuration
	 *
	 * @return boolean True for total access
	 */	
	function totalAccess()
	{

	}
	
	/**
	* Generate message
	*
	* @return text message
	*/	
	function displayMessage($message,$type)
	{
		swicth($type){
			case 'ok':
				$color = 'green';
				break;
			case 'ko':
				$color = 'red';
				break;
			default:
				$color = 'blue';
				break;
		}
		
		return	"<table width='100%' border='0' align='center' bordercolor='".$color."'>
			<tr align='center'>
				<td bgcolor='".$color."'><font color=white><b>".$message."</b></font></td>
			</tr>
		</table>";
	}
}