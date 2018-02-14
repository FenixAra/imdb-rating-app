package main

import (
	"net/http"

	"github.com/FenixAra/imdb-rating-app/config"
	"github.com/FenixAra/imdb-rating-app/handlers"
	"github.com/FenixAra/imdb-rating-app/utils/log"
)

func main() {
	l := log.NewLogger("")

	l.Info("Port: ", config.PORT)
	http.ListenAndServe(":"+config.PORT, handlers.GetRouter())
}
