package main

import (
	"context"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	pacContent, err := os.ReadFile("proxy.pac")
	check(err)
	log.Printf("PAC loaded:\n%s", string(pacContent))

	// Create HTTP server
	mux := http.NewServeMux()
	mux.HandleFunc("/proxy.pac", pacHandler(pacContent))

	server := &http.Server{
		Addr:    ":3129",
		Handler: mux,
	}

	// Channel for signals
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)

	// Start server in goroutine
	go func() {
		log.Printf("Listening at: %s", server.Addr)
		if err := server.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("Server failed to start: %v", err)
		}
	}()

	// Wait for interrupt signal
	<-quit
	log.Println("Shutting down server...")

	// Graceful shutdown with timeout
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	if err := server.Shutdown(ctx); err != nil {
		log.Fatalf("Server forced to shutdown: %v", err)
	}

	log.Println("Server exited")
}

func pacHandler(pacContent []byte) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/x-ns-proxy-autoconfig")
		w.Header().Set("Cache-Control", "no-cache")
		w.Write(pacContent)
	}
}

func check(err error) {
	if err != nil {
		log.Fatalf(err.Error())
	}
}
