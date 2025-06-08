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

function FindProxyForURL(url, host) {
    // return "PROXY " + PROXY_SERVER;

    for (var i = 0; i < PROXY_HOSTS.length; i++) {
        var proxyHost = PROXY_HOSTS[i];
        
        if (proxyHost.indexOf("*") === -1) {
            if (dnsDomainIs(host, proxyHost)) {
                return "PROXY " + PROXY_SERVER;
            }
        } else {
            if (shExpMatch(host, proxyHost)) {
                return "PROXY " + PROXY_SERVER;
            }
        }
    } 
    
    return "DIRECT";
}
