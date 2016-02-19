(function(angular, $, _) {

  angular.module('entitymessages').config(function($routeProvider) {
      $routeProvider.when('/entitymessages', {
        controller: 'EntityMessageCtrl',
        templateUrl: '~/entitymessages/EntityMessage.html',

        // If you need to look up data when opening the page, list it out
        // under "resolve".
        resolve: {
          EntityMessages: function(crmApi) {
            return crmApi('EntityMessage', 'get', {
              'api.Message.getsingle' : 1
            });
          }
        }
      });
    }
  );

  // The controller uses *injection*. This default injects a few things:
  //   $scope -- This is the set of variables shared between JS and HTML.
  //   crmApi, crmStatus, crmUiHelp -- These are services provided by civicrm-core.
  //   myMessage -- The current contact, defined above in config().
  angular.module('entitymessages').controller('EntityMessageCtrl', function($scope, crmApi, crmStatus, crmUiHelp, EntityMessages) {
    var self = this;
    // The ts() and hs() functions help load strings for this module.
    var ts = $scope.ts = CRM.ts('entitymessages');
    var hs = $scope.hs = crmUiHelp({file: 'CRM/entitymessages/EntityMessage'}); // See: templates/CRM/entitymessages/EntityMessage.hlp

    // We have myMessage available in JS. We also want to reference it in HTML.
    $scope.entityMessages = EntityMessages.values;
    $scope.entityMessageID = 0;
    $scope.messageTitle = ts('New Message');
    $scope.currentMessage = [];

    $scope.load = function load(entityMessage) {
      $scope.entityMessageID = entityMessage.id;
      $scope.messageTitle = entityMessage.label;
      $scope.currentMessage = entityMessage['api.Message.getsingle'];
      $scope.is_smarty_render = entityMessage.is_smarty_render;
    }

    $scope.clear = function clear() {
      $scope.entityMessageID = 0;
      $scope.messageTitle = ts('New Message');
      $scope.currentMessage = [];
      $scope.is_smarty_render = 0;
    }

    $scope.delete = function del(currentMessage, currentEntityMessageID) {
        var success = crmStatus(
            // Status messages. For defaults, just use "{}"
            {start: ts('Saving...'), success: ts('Deleted')},
            crmApi('EntityMessage', 'delete', {
              id: currentEntityMessageID,
              debug: true
            }).then(function(apiResult) {
            currentMessage = {};

        delete($scope.entityMessages[currentEntityMessageID]);
        $scope.messageTitle = currentMessage.title + ts(' (Deleted)');
        $scope.currentMessage = currentMessage;
        $scope.entityMessageID = 0;
      })
      );
      return success;
    }

    $scope.save = function save(currentMessage, currentEntityMessageID, is_smarty_render) {
      var success = crmStatus(
        // Status messages. For defaults, just use "{}"
        {start: ts('Saving...'), success: ts('Saved')},
        // The save action. Note that crmApi() returns a promise.
        crmApi('Message', 'create', {
          title: currentMessage.title,
          //subject: currentMessage.subject,
          //body_text: currentMessage.body_text,
          body_html: currentMessage.body_html,
          id: currentMessage.id,
          api_EntityMessage_create: {
            'entity_type' : 'Domain',
            'id' : currentEntityMessageID,
            // Entity id coded to domain 1 for now.
            'entity_id' : 1,
            'label' : currentMessage.title,
            'is_smarty_render' : currentMessage.is_smarty_render
          },
          debug: true
        }).then(function(apiResult) {
          console.log(apiResult);
          currentMessage = apiResult['values'][apiResult['id']];
          console.log(currentMessage['api_EntityMessage_create']['id']);
          var entityMessageID = currentMessage['api_EntityMessage_create']['id'];
          $scope.messageTitle = currentMessage.title + ts(' (Saved)');
          $scope.entityMessages[entityMessageID] = {'label' : currentMessage.title};
          $scope.entityMessages[entityMessageID]['api.Message.getsingle'] = currentMessage;
          //$scope.addItem($scope.entityMessages, currentMessage);
          $scope.currentMessage = currentMessage;
          $scope.entityMessageID = entityMessageID;
        })
      );
      return success;
    };
  });

})(angular, CRM.$, CRM._);
