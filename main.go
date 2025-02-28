package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.Get("https://google.com")
	fmt.Println("Hello")
}
