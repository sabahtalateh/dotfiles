package main

import (
	"log"
	"net/http"
	"os"
)

// const pacContent = `function FindProxyForURL(url, host) {
// 	return "PROXY 192.168.31.77:3128";
// }`

// func pacHandler(w http.ResponseWriter, r *http.Request) {
// 	w.Header().Set("Content-Type", "application/x-ns-proxy-autoconfig")
// 	fmt.Fprint(w, pacContent)
// }

func main() {
	pacContent, err := os.ReadFile("proxy.pac")
	check(err)

	log.Printf("PAC loaded:\n%s", string(pacContent))

	http.HandleFunc("/proxy.pac", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/x-ns-proxy-autoconfig")
		w.Header().Set("Cache-Control", "no-cache")
		w.Write(pacContent)
	})

	host := "localhost:3129"

	log.Printf("Listening at: %s", host)

	err = http.ListenAndServe(host, nil)
	check(err)

	// http.HandleFunc("/proxy.pac", pacHandler)
	// fmt.Println("Serving PAC file at http://localhost:8080/proxy.pac")
	// http.ListenAndServe(":8080", nil)
}

func check(err error) {
	if err != nil {
		log.Fatalf(err.Error())
	}
}
