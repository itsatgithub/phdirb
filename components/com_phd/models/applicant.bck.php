<?php
/**
 * Applicant Model file
 *
 * @author GPLavui.com <info@gplavui.com>
 * @version 1.5.0
 * @package PhD Programme
 */
 
// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport('joomla.application.component.model');

/**
 * The class contains the functions used to make all operations related to applicants.
 * 
 * @package PhD Programme
 */
class PhdModelApplicant extends JModel
{
	/**
	 * Abstract id
	 *
	 * @var int
	 */
	var $_id = null;

	/**
	 * Abstract data
	 *
	 * @var array
	 */
	var $_data = null;

	/**
	 * Constructor
	 *
	 * @since 1.5
	 */
	function __construct()
	{
		parent::__construct();

		$id = JRequest::getVar('id', 0, '', 'int');
		$this->setId((int)$id);
	}

	/**
	 * Method to set the  identifier
	 *
	 * @access	public
	 * @param	int  identifier
	 */
	function setId($id)
	{
		$this->_id = $id;
		$this->_data = null;
	}

	/**
	 * Method to get an applicant
	 *
	 * @since 1.5
	 */
	function &getPersonalData()
	{
		// Load the applicant data
		if ($this->_loadData())
		{
			// Nothing to be done in our case
		}
		else  $this->_initData();

		return $this->_data;
	}

	/**
	 * Method to store an applicant
	 *
	 * @access	public
	 * @return	boolean	True on success
	 * @since	1.5
	 */
	function _store($data,$tablename)
	{
		$row =& $this->getTable($tablename);

		// Bind the form fields to the web link table
		if (!$row->bind($data)) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}

		// Make sure the table is valid
		if (!$row->check()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}

		// Store the web link table to the database
		if (!$row->store()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		} else {
			// returns the id
			return $row->id;
		}
		
	}

	/**
	 * Method to delete an applicant
	 *
	 * @param int $id applicant id
	 * @return	boolean	True on success
	 */	
	function delete($id)
	{
		// ejemplo de borrado de degrees, sin añadir dos funciones 
		// complementarias getAcademicData y deleteAcademicData que no son necesarias
		
		// delete degrees
		$query = "DELETE FROM #__phd_degrees"
		. " WHERE applicant_id = " . $id
		;
		$this->_db->setQuery( $query );
		if(!$this->_db->query()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
		
		/*
		//Delete degrees
		$degrees = getAcademicData($this->_id);
		foreach ($degrees as $degree){
			deleteAcademicData($degree->id);
		}
		*/			
		
	
		// ejemplo de borrado de docs, sin añadir dos funciones 
		// complementarias getFiles y deleteFile que no son necesarias
		$query = "DELETE FROM #__phd_docs"
		. " WHERE applicant_id = " . $id
		;
		$this->_db->setQuery( $query );
		if(!$this->_db->query()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
				
		// TODO: delete the files from the repository
		
		/*
		//Delete docs
		$docs = getFiles($applicant_id);
		foreach ($docs as $doc){
			deleteFile($doc->id);
		}
		*/
	
		// ejemplo de borrado de referees, sin añadir dos funciones 
		// complementarias getAcademicData y deleteAcademicData que no son necesarias
		$query = "DELETE FROM #__phd_referees"
		. " WHERE applicant_id = " . $id
		;
		$this->_db->setQuery( $query );
		if(!$this->_db->query()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
				/*
		//Delete referees
		$referees = getReferees($applicant_id);
		foreach ($referees as $referee){
			deleteReferee($referee->id);
		}
		*/
	
		$query = "DELETE FROM #__phd_work_experiences"
		. " WHERE applicant_id = " . $id
		;
		$this->_db->setQuery( $query );
		if(!$this->_db->query()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
				/*
		//Delete work experiences
		$experiences = getWorkExperiences($applicant_id);
		foreach ($experiences as $experience){
			deleteWorkExperience($experience->id);
		}
		*/
	
		//Delete programmes applied
		$query = "DELETE FROM #__phd_applicant_programme"
		. " WHERE applicant_id = " . $id
		;
		$this->_db->setQuery( $query );
		if(!$this->_db->query()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
			
		//Delete personal data
		$query = "DELETE FROM #__phd_applicants"
		. " WHERE id =  " . $id
		;
		$this->_db->setQuery( $query );
		if(!$this->_db->query()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
				
		echo JHTML::_('phdhelper.displayMessage',JText::_( 'DATA_CORRECTLY_DELETED' ),'ko');
		return true;
	}

	/**
	 * Method to load applicant data
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */
	function _loadData()
	{
		// Lets load the content if it doesn't already exist
		if (empty($this->_data))
		{
			// personal data
			$query = 'SELECT a.*, s.description AS status, co.printable_name AS country, ge.short_description AS gender, cob.printable_name AS birth_country, w.description AS wheredidu'
			. ' FROM `#__phd_applicants` AS a'
			. ' LEFT JOIN `#__phd_status` AS s ON s.id = a.status_id'
			. ' LEFT JOIN `#__phd_countries` AS co ON co.id = a.country_id'
			. ' LEFT JOIN `#__phd_countries` AS cob ON cob.id = a.birth_country_id'
			. ' LEFT JOIN `#__phd_genders` AS ge ON ge.id = a.gender_id'
			. ' LEFT JOIN `#__phd_wheredidu` AS w ON w.id = a.wheredidu_id'
			. ' WHERE a.id = ' . $this->_id
			;
			$this->_db->setQuery($query);
			$this->_data = $this->_db->loadObject();

			// academic data
			$query = 'SELECT d.*, co.printable_name AS country'
			. ' FROM `#__phd_degrees` AS d'
			. ' LEFT JOIN `#__phd_countries` AS co ON co.id = d.country_id'
			. ' WHERE d.applicant_id = ' . $this->_id
			;
			$this->_db->setQuery($query);
			$this->_data->academic_data = $this->_db->loadObjectList();

			//work experiences
			$query = 'SELECT we.*'
			. ' FROM `#__phd_work_experiences` AS we'
			. ' WHERE we.applicant_id = ' . $this->_id
			;
			$this->_db->setQuery($query);
			$this->_data->work_experience = $this->_db->loadObjectList();
			
			// referees
			$query = 'SELECT r.*'
			. ' FROM `#__phd_referees` AS r'
			. ' WHERE r.applicant_id = ' . $this->_id
			;
			$this->_db->setQuery($query);
			$this->_data->referees = $this->_db->loadObjectList();
			
			// files
			$query = 'SELECT d.*'
			. ' FROM `#__phd_docs` AS d'
			. ' LEFT JOIN `#__phd_doc_types` AS dt'
			. ' ON d.doc_type_id = dt.id'
			. ' WHERE d.applicant_id = ' . $this->_id
			;
			$this->_db->setQuery($query);
			$this->_data->files = $this->_db->loadObjectList();
	
			//get selections
			$query = 'SELECT d.*'
			. ' FROM `#__phd_applicant_programme` AS ap'
			. ' LEFT JOIN `#__phd_programmes` AS p ON p.id = ap.programme_id'
			. ' WHERE ap.applicant_id = ' . $this->_id
			;
			$this->_db->setQuery($query);
			$this->_data->selections = $this->_db->loadObjectList();
			
			return (boolean) $this->_data;
		}
		return true;
	}

	/**
	 * Method to initialise the applicant data
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */
	function _initData()
	{
		// Lets load the content if it doesn't already exist
		if (empty($this->_data))
		{
			$applicant = new stdClass();
			$applicant->id = 0;
			$applicant->firstname = null;
			$applicant->lastname = null;
			$applicant->gender_id = null;
			$applicant->passport = null;
			$applicant->birth_date = null;
			$applicant->birth_country_id = null;
			$applicant->street = null;
			$applicant->city = null;
			$applicant->postalcode = null;
			$applicant->country_id = null;
			$applicant->telephone = null;
			$applicant->email = null;
			$applicant->wheredidu_id = null;
			$applicant->other_fellowships = null;
			$applicant->career_breaks = null;
			$applicant->career_breaks_filename = null;
			$applicant->additional_info = null;
			$applicant->user_username = null;
			$applicant->status_id = 0;
			// modified on the table directly and work_experiences is array ??			
			$applicant->academic_data = array();
			$applicant->work_experiences = array();
			$applicant->referees = array();
			$applicant->files = array();
			$applicant->selections = array();

			$this->_data = $applicant;

			return (boolean) $this->_data;
		}
		return true;
	}

	/**
	 * Method to get the academic data
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	 /*function getAcademicData(){
		$query = 'SELECT d.*'
		. ' FROM `#__phd_degrees` AS d'
		. ' WHERE d.applicant_id = \'' . $this->_id . '\'';
		;
		$this->_db->setQuery($query);
		$this->_data->academic_data = $this->_db->loadObjectList();
		return (boolean) $this->_data;
	}*/
	
	/**
	 * Method to get the files
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	 /*function getFiles(){
		$query = 'SELECT d.*'
		. ' FROM `#__phd_docs` AS d'
		. ' LEFT JOIN `#__phd_doc_types` AS dt'
		. ' ON d.doc_type_id = dt.id'
		. ' WHERE d.applicant_id = \'' . $this->_id . '\'';
		;
		$this->_db->setQuery($query);
		$this->_data->files = $this->_db->loadObjectList();
		return (boolean) $this->_data;
	}*/

	/**
	 * Method to get the Work Experiences
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	 /*function getWorkExperiences(){
		$query = 'SELECT d.*'
		. ' FROM `#__phd_work_experiences` AS r'
		. ' WHERE r.applicant_id = \'' . $this->_id . '\'';
		;
		$this->_db->setQuery($query);
		$this->_data->work_experience = $this->_db->loadObjectList();
		return (boolean) $this->_data;
	}*/

	/**
	 * Method to get the Selections of the applicant
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	/*function getSelections(){
		$query = 'SELECT d.*'
		. ' FROM `#__phd_applicant_programme` AS ap'
		. ' LEFT JOIN `#__phd_programmes` AS p'
		. ' ON p.id = ap.programme_id'
		. ' WHERE ap.applicant_id = \'' . $this->_id . '\'';
		;
		$this->_db->setQuery($query);
		$this->_data->selections = $this->_db->loadObjectList();
		return (boolean) $this->_data;
	}*/

	/**
	 * Method to get the Additional info of an applicant
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	

	function getAdditionalInfo(){
		//Cal ?
	}

	/**
	 * Method to get the Status of an applicant
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function getStatus(){
			$query = 'SELECT status_id'
		. ' FROM `#__phd_applicants` AS a'
		. ' WHERE ap.applicant_id = \'' . $this->_id . '\'';
		;
		$this->_db->setQuery($query);
		return $db->loadResult();
	}

	function getFollowUp(){}
	function getEvaluation(){}

	/**
	 * Method to save Personal Data
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function savePersonalData($data){
		$applicant_id = $this->_store($data,'personaldata');
		if ($applicant_id){
			return $applicant_id;
		}
		return false;
	}

	/**
	 * Method to save Academic data
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function saveAcademicData($data){
		$store_id = $this->_store($data,'degree');
		if ($store_id){
			return $store_id;
		}
		return false;
	}
	
	/**
	 * Method to save Work Experience
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function saveWorkExperience($data){
		$store_id = $this->_store($data,'workexperience');
		if ($store_id){
			return $store_id;
		}
		return false;
	}

	/**
	* Method to save a File
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/	
	function saveFile($applicant_id,$uploaded_file,$description,$doc_type_id){
		global $database,$mosConfig_absolute_path;

		if (!file_exists("./docs_phd/$applicant_id")) {
			mkdir("./docs_phd/$applicant_id", 0766); 
			echo JHTML::_('phdhelper.displayMessage',JText::_( 'DIR_CORRECTLY_CREATED' ),'ok');
		}

		if ($uploaded_file['size'] && ($uploaded_file['error'] == 0)) {
			$file_name = clean_filename($uploaded_file['name']);
			$destfile = $mosConfig_absolute_path.'/docs_phd/'.$applicant_id.'/'.$file_name;
			if (file_exists($mosConfig_absolute_path."/docs_phd/" . $applicant_id.'/'.$file_name)) { 
				echo JHTML::_('phdhelper.displayMessage',$file_name.' - '.JText::_( 'FILE_ALREADY EXISTS' ),'ko');
				return false;
			}
	
			$ret = move_uploaded_file($uploaded_file['tmp_name'],$destfile);
			if ($ret === FALSE) { 
				echo JHTML::_('phdhelper.displayMessage',JText::_( 'PROBLEM_UPLOADING' ),'ko');
				return false;
			}
	
			$query = "INSERT INTO #__phd_docs (applicant_id,filename,description,doc_type_id)"
			. " VALUES ('$applicant_id','".$file_name."','$description','$doc_type_id')";
			$database->setQuery( $query );
			$database->query();			
			echo JHTML::_('phdhelper.displayMessage',JText::_( 'FILE_CORRECTLY_UPLOADED' ),'ok');

			return true;
		} else {
			switch($uploaded_file['error']){
				case 0:
					//echo "UPLOAD_ERR_OK -> Value: 0; There is no error, the file uploaded with success";
					break;
				case 1:
					//echo "UPLOAD_ERR_INI_SIZE -> Value: 1; The uploaded file exceeds the upload_max_filesize directive in php.ini";
					break;
				case 2:
					//echo "UPLOAD_ERR_FORM_SIZE -> Value: 2; The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form";
					break;
				case 3:
					//echo "UPLOAD_ERR_PARTIAL -> Value: 3; The uploaded file was only partially uploaded";
					break;
				case 4:
					//echo "Value: 4; No file was uploaded";
					break;
				case 6:
					//echo "UPLOAD_ERR_NO_TMP_DIR -> Value: 6; Missing a temporary folder. Introduced in PHP 4.3.10 and PHP 5.0.3";
					break;
				default:
					break;
			}
			return false;
		}	
	}
	
	/**
	* Method to save a Referee
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/	
	function saveReferee($data){}
	
	/**
	* Method to save the selection
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/	
	function saveSelection($data){}
	
	/**
	* Method to save additional info
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/	
	function saveInfo($applicant_id,$additional_info){
			$db    =& JFactory::getDBO();

		$query = "INSERT INTO #__phd_applicants"
		. "	SET additional_info = '$additional_info'"
		. " WHERE id = '".$applicant_id."'"
		;
		$db->setQuery($query);
		if(!$db->query()) {
			die($db->stderr(true));
		}
		
		echo JHTML::_('phdhelper.displayMessage',JText::_( 'DATA_CORRECTLY_SAVED' ),'ok');

		return true;
	}
	
	/**
	* Method to save status info
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/	
	function saveStatus($data){}
	
	/**
	* Method to save Follow up info
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/	
	function saveFollowUp($data){}
	
	/**
	* Method to save Evaluation info
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/	
	function saveEvaluation($filename){}

	/**
	* Method to update referee info
	*
	* @access	private
	* @return	boolean	True on success
	* @since	1.5
	*/		
	function updateReferee(){}

	/**
	 * Method to delete academic data
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function deleteAcademicData($id_academic_data){
		$db    =& JFactory::getDBO();
		$query = "DELETE FROM #__phd_degrees WHERE id='$id_academic_data'";
		echo $query;
		$db->setQuery( $query );
		if(!$db->query()) {
			die($db->stderr(true));
		}
		return true;
	}
	
	/**
	 * Method to delete a File
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function deleteFile($id_file){
		$db    =& JFactory::getDBO();

		global $database,$mosConfig_absolute_path;

		$file_details = functions_phd::getDocDetails($id_file);
		$delete = unlink($mosConfig_absolute_path . '/docs_phd/' . $file_details->applicant_id . '/' . $file_details->filename);
	
		if ($delete) {
			$query = "DELETE FROM #__phd_docs "
			." WHERE id='$id_file'";
			$db->setQuery( $query );
			$db->query();

			echo JHTML::_('phdhelper.displayMessage',JText::_( 'DATA_CORRECTLY_DELETED' ),'ko');
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Method to delete a referee
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function deleteReferee($id_referee){
		$db    =& JFactory::getDBO();

		$query = "SELECT * FROM #__phd_referees"
		. "	WHERE id = '$id_referee'";
		$db->setQuery( $query );
		$row = null;
		$db->loadObject($row);
		if ($row->doc_id){
			deleteFile($row->doc_id);
		}
	
		$query = "DELETE FROM #__phd_referees"
		." WHERE id='$id_referee'";
		$db->setQuery( $query );
		$db->query();
		
		echo JHTML::_('phdhelper.displayMessage',JText::_( 'DATA_CORRECTLY_DELETED' ),'ko');
		return true;
	}
	
	/**
	 * Method to delete work experience
	 *
	 * @access	private
	 * @return	boolean	True on success
	 * @since	1.5
	 */	
	function deleteWorkExperience($id_experience){
		$db    =& JFactory::getDBO();
		$query = "DELETE FROM #__phd_work_experiences"
		. " WHERE id='$id_experience'";
		$db->setQuery( $query );
		if(!$db->query()) {
			die($db->stderr(true));
		}
		
		return true;	
	}
	
	/*getAcademicData(){
		$user =& JFactory::getUser();

		// empty condition
		$where = array();
		
		if (JHTML::_('phdhelper.isGroupLeader')){
			if (JHTML::_('phdhelper.totalAccess')) {
				$where[] = 'a.id = \'' . $this->_id . '\'';
			} else {
				$where[] = 'p.group_leader_id = \'' . $user->id . '\'';
			}
		} else if (JHTML::_('phdhelper.isAdministrator')){
			$where[] = 'a.id = \'' . $this->_id . '\'';
		} else {
			$where[] = 'a.username = \'' . $user->username . '\'';
		}
			
		// format the where clause
		$where = (count($where)) ? ' WHERE '.implode(' AND ', $where) : '';

		$query = 'SELECT d.*'
		. ' FROM `#__phd_degrees` AS d'
		. ' LEFT JOIN `#__phd_applicants` AS a'
		. ' ON a.id = d.applicant_id'
		. ' LEFT JOIN `#__phd_applicant_programme` AS ap'
		. ' ON a.id = ap.applicant_id'
		. ' LEFT JOIN `#__phd_programmes` AS p'
		. ' ON p.id = ap.programme_id'
		. $where
		;
		$this->_db->setQuery($query);
		$this->_data->academic_data = $this->_db->loadObjectList();
		return (boolean) $this->_data;
	}*/
}
