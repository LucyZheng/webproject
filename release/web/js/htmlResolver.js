export function getHTML(uri, params) {
    let XMLRequest = new XMLHttpRequest();
    let request = document.domain + uri;
    for (let key in params){
        if (params.hasOwnProperty(key))
            request = request + "?" + key + "=" + params[key];
    }
    XMLRequest.open('GET', request);
    XMLRequest.send();
    XMLRequest.onreadystatechange(new function(){
        if (XMLRequest.readyState === 4 && XMLRequest.status === 200)
            return XMLRequest.responseText;
    });
}