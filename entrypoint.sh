#!/bin/bash
set -e

echo "=== Animals for Kids Entrypoint ==="
echo "Working directory: $(pwd)"
echo "Rails app check:"
ls config/application.rb 2>/dev/null && echo "Rails app found" || echo "WARNING: No Rails app found"

# Remove stale server pid
rm -f /app/tmp/pids/server.pid

echo "=== Running database setup ==="
# Wait for DB to be ready
for i in $(seq 1 30); do
  bundle exec rails db:migrate 2>&1 && break || {
    echo "DB not ready yet (attempt $i), trying db:create..."
    bundle exec rails db:create db:migrate 2>&1 && break || true
  }
  sleep 2
done

echo "=== Running seeds ==="
bundle exec rails db:seed 2>&1 || echo "Seed failed or already seeded, continuing..."

echo "=== Starting server ==="
exec "$@"
