var PROXY_SERVER = "192.168.31.77:3128";

var PROXY_HOSTS = [
    "claude.ai",
    "*.claude.ai", 
    "*.anthropic.com",
    "openai.com",
    "*.openai.com",
    "chatgpt.com",
    "*.chatgpt.com"
];

function FindProxyForURL(requestUrl, requestHost) {
    return "PROXY " + PROXY_SERVER;

    // for (var i = 0; i < PROXY_HOSTS.length; i++) {
    //     var host = PROXY_DOMAINS[i];
        
    //     if (host.indexOf("*") === -1) {
    //         if (dnsDomainIs(requestHost, host)) {
    //             return PROXY_SERVER;
    //         }
    //     } else {
    //         if (shExpMatch(requestHost, host)) {
    //             return "PROXY " + PROXY_SERVER;
    //         }
    //     }
    // } 
    
    // return "DIRECT";
}
