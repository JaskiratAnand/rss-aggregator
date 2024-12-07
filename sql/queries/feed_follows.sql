-- name: CreateFeedFollow :one
INSERT 
INTO feed_follows (id, created_at, updated_at, user_id, feed_id) 
VALUES ($1, $2, $3, $4, $5)
RETURNING id, created_at, updated_at, user_id, feed_id;

-- name: GetFeedFollows :many
SELECT id, created_at, updated_at, user_id, feed_id from feed_follows WHERE user_id = $1;

-- name: DeleteFeedFollow :exec
DELETE FROM feed_follows WHERE user_id = $1 AND feed_id = $2;