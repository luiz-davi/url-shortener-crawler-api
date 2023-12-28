db_up:
	docker-compose -f ./postgres-compose.yml up -d

db_create:
	rails db:create

migrate:
	rails db:migrate

up:
	rails server

console:
	rails console