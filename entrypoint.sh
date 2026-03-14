#!/bin/bash
set -e

echo "=== Animals for Kids Entrypoint ==="
echo "Working directory: $(pwd)"
echo "Ruby version: $(ruby --version)"
echo "Bundle version: $(bundle --version)"
echo "Rails version check:"
bundle exec rails --version 2>&1 || echo "rails --version failed"
echo ""
echo "Rails app check:"
ls config/application.rb 2>/dev/null && echo "Rails app found" || echo "WARNING: No Rails app found"
echo "Gemfile exists: $(ls Gemfile 2>/dev/null && echo yes || echo no)"
echo "RAILS_ENV: $RAILS_ENV"
echo "DATABASE_URL: ${DATABASE_URL:0:30}..."
echo ""

# Remove stale server pid
rm -f /app/tmp/pids/server.pid

echo "=== Running database setup ==="
# Try migration first, then create+migrate if that fails
bundle exec rails db:migrate 2>&1 || (
  echo "Migration failed, trying create+migrate..."
  bundle exec rails db:create 2>&1 || echo "db:create returned non-zero"
  bundle exec rails db:migrate 2>&1 || echo "db:migrate returned non-zero"
)

echo "=== Running seeds ==="
bundle exec rails db:seed 2>&1 || echo "Seed failed or already seeded, continuing..."

echo "=== Starting server ==="
exec "$@"
