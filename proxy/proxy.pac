var PROXY_SERVER = "192.168.31.77:3128";

var PROXY_HOSTS = [
    // Claude
    "claude.ai",
    "*.claude.ai", 
    "*.anthropic.com",

    // ChatGPT
    "openai.com",
    "*.openai.com",
    "chatgpt.com",
    "*.chatgpt.com",

    // Youtube
    "youtube.com",
    "*.youtube.com",
    "*.ytimg.com",
    "*.googlevideo.com"
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
