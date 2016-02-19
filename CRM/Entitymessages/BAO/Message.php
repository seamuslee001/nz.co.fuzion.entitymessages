<?php

class CRM_Entitymessages_BAO_Message extends CRM_Entitymessages_DAO_Message {

  /**
   * Create a new Message based on array-data
   *
   * @param array $params key-value pairs
   * @return CRM_Entitymessages_DAO_Message|NULL
   *
  public static function create($params) {
    $className = 'CRM_Entitymessages_DAO_Message';
    $entityName = 'Message';
    $hook = empty($params['id']) ? 'create' : 'edit';

    CRM_Utils_Hook::pre($hook, $entityName, CRM_Utils_Array::value('id', $params), $params);
    $instance = new $className();
    $instance->copyValues($params);
    $instance->save();
    CRM_Utils_Hook::post($hook, $entityName, $instance->id, $instance);

    return $instance;
  } */
}
