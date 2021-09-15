# Anime Apps
## Instructions
1. Bundle Install first
2. run migration script
```bash
rails db:migrate
```
3. run seeding script
```bash
rails db:seed
```
4. Don't forget to run Sidekiq server and redis
```bash
sudo systemctl start redis-server
```
```bash
bundle exec sidekiq
```
5. Run the apps
```bash
rails s
```

## Anime Apps API
1. /api/favorites/get-top-favorite?id=2&type=&page=1&limit=5
using parameter
```bash
id (user_id)
type (all/manga/anime)
page
limit
```
2. /api/favorites/get-total-user-favorite?type=&page=1&limit=5
```bash
type (all/anime/manga)
page
limit
```