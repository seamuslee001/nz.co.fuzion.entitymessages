<?php

/**
 * EntityMessage.create API specification (optional).
 *
 * This is used for documentation and validation.
 *
 * @param array $spec description of fields supported by this API call
 *
 * @see http://wiki.civicrm.org/confluence/display/CRM/API+Architecture+Standards
 */
function _civicrm_api3_entity_message_create_spec(&$spec) {
  // So far we are only supporting domain.
  $spec['entity_type']['api.default'] = 'Domain';
  $spec['entity_type']['options'] = array(
    'Domain' => 'Domain',
  );
  $spec['entity_id']['api.default'] = CRM_Core_Config::domainID();
}

/**
 * EntityMessage.create API.
 *
 * @param array $params
 *
 * @return array API result descriptor
 * @throws API_Exception
 */
function civicrm_api3_entity_message_create($params) {
  return _civicrm_api3_basic_create(_civicrm_api3_get_BAO(__FUNCTION__), $params);
}

/**
 * EntityMessage.delete API.
 *
 * @param array $params
 *
 * @return array
 *   API result descriptor
 * @throws API_Exception
 */
function civicrm_api3_entity_message_delete($params) {
  return _civicrm_api3_basic_delete(_civicrm_api3_get_BAO(__FUNCTION__), $params);
}

/**
 * EntityMessage.get API.
 *
 * @param array $params
 *
 * @return array
 *   API result descriptor
 * @throws API_Exception
 */
function civicrm_api3_entity_message_get($params) {
  return _civicrm_api3_basic_get(_civicrm_api3_get_BAO(__FUNCTION__), $params);
}

/**
 * EntityMessage.get API specification (optional).
 *
 * This is used for documentation and validation.
 *
 * @param array $spec description of fields supported by this API call
 *
 * @see http://wiki.civicrm.org/confluence/display/CRM/API+Architecture+Standards
 */
function _civicrm_api3_entity_message_get_spec(&$spec) {
}
