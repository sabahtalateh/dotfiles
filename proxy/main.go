package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	pacContent, err := os.ReadFile("proxy.pac")
	check(err)

	log.Printf("PAC loaded:\n%s", string(pacContent))

	http.HandleFunc("/proxy.pac", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/x-ns-proxy-autoconfig")
		w.Header().Set("Cache-Control", "no-cache")
		w.Write(pacContent)
	})

	host := ":3129"

	log.Printf("Listening at: %s", host)

	err = http.ListenAndServe(host, nil)
	check(err)
}

func check(err error) {
	if err != nil {
		log.Fatalf(err.Error())
	}
}
