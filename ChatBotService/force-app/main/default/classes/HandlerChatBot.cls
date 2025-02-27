
public with sharing class HandlerChatBot {
    @AuraEnabled
    public static string postChatText(string chatText){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://chatbotmiddleware.azurewebsites.net/chat/');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"chatText":"' + chatText + '"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                    response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response.getBody();
    }
}