package main

import (
	"fmt"
	"log"
	"net/http"
)

func sayhelloName(w http.ResponseWriter, r *http.Request) {
	fmt.Println(r.Method)
	fmt.Println(r.URL)
	fmt.Println(r.Proto)
	// fmt.Println(r.Header)
	for k, v := range r.Header {
		fmt.Println("k:", k, "v:", v)
	}
	fmt.Println(r.Body)
	fmt.Println(r.Host)

}

func main() {
	http.HandleFunc("/", sayhelloName)
	if err := http.ListenAndServe(":9090", nil); err != nil {
		log.Fatal("ListenAndServe: ", err)
	}

}
