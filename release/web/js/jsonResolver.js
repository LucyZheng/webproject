var methodSet = ['GET', 'POST', 'PUT', 'DELETE'];
var remoteHandler = "localhost:8080/blog/jsonProvider.jsp"
//function-type request
function getJSON(context, method, resourceName, data=null, filter=null){

}
//class-type request
class JSONRequest{
    constructor(){}
    getJSON(context, method, resourceName, filter){    
        if (context == null){
            context = this;
        }
        if (methodSet.indexOf(method) === -1){
            throw "Illegal Method";
        }
        let XMLRequest = new XMLHttpRequest();
        let request = remoteHandler + '?resourceName=' + resourceName + '?filter=' + filter;
        XMLRequest.open(method, request);
        if (method !== 'GET' && data != null){
            XMLRequest.send(data);
        }
        else{
            XMLRequest.send();
        }
        XMLRequest.onreadystatechange(new function(){
            if (XMLRequest.readyState === 4 && XMLRequest.status === 200)
                return JSON.parse(XMLRequest.responseText);
        });
    }
}