-- name: CreateFeed :one
INSERT INTO feeds (id, created_at, updated_at, name, url, user_id, last_fetched_at) 
VALUES ($1, $2, $3, $4, $5, $6, $7)
RETURNING id, created_at, updated_at, name, url, user_id, last_fetched_at;

-- name: GetFeeds :many
SELECT id, created_at, updated_at, name, url, user_id, last_fetched_at
from feeds;

-- name: GetNextFeedsToFetch :many
SELECT id, created_at, updated_at, name, url, user_id, last_fetched_at
from feeds 
ORDER BY last_fetched_at ASC NULLS FIRST
LIMIT $1;

-- name: MarkFeedAsFetched :one
UPDATE feeds
SET last_fetched_at = NOW(),
updated_at = NOW()
WHERE id = $1
RETURNING id, created_at, updated_at, name, url, user_id, last_fetched_at;