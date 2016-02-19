<?php

class CRM_Entitymessages_BAO_EntityMessage extends CRM_Entitymessages_DAO_EntityMessage {

  /**
   * Create a new EntityMessage based on array-data.
   *
   * @param array $params key-value pairs
   *
   * @return CRM_Entitymessages_DAO_EntityMessage|NULL
   */
  public static function create($params) {
    $className = 'CRM_Entitymessages_DAO_EntityMessage';
    $entityName = 'EntityMessage';
    $hook = empty($params['id']) ? 'create' : 'edit';
    if ($hook == 'create') {
      if (empty($params['name'])) {
        $params['name'] = CRM_Utils_String::munge($params['label']);
      }
      $matchesCount = civicrm_api3('EntityMessage', 'getcount', array(
        'entity_type' => $params['entity_type'],
        'entity_id' => $params['entity_id'],
        'name' => $params['name'],
      ));
      if ($matchesCount) {
        $params['name'] .= $matchesCount;
      }
    }
    CRM_Utils_Hook::pre($hook, $entityName, CRM_Utils_Array::value('id', $params), $params);
    $instance = new $className();
    $instance->copyValues($params);
    $instance->save();
    CRM_Utils_Hook::post($hook, $entityName, $instance->id, $instance);

    return $instance;
  }

}
