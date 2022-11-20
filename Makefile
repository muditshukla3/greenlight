DB_URL = postgres://greenlight:pa55word@localhost/greenlight?sslmode=disable

migration:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

migrateup:
	migrate -path migrations -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path migrations -database "$(DB_URL) -verbose down

server:
	go run ./cmd/api
	
.PHONY: migrateup migratedown server