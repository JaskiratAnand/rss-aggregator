package main

import (
	"log"
	"time"

	"github.com/JaskiratAnand/rss-aggregator/internal/database"
)

func startScraping(
	db *database.Queries,
	concurrency int,
	timeBetweenRequest time.Duration,
) {
	log.Printf("Scrapiing on %v goroutines every %s duration", concurrency, timeBetweenRequest)

	ticker := time.NewTicker(timeBetweenRequest)

	for ; ; <-ticker.C {

	}
}
