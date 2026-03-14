#!/bin/bash
set -e

echo "=== Animals for Kids Entrypoint ==="
echo "Working directory: $(pwd)"
echo "Ruby version: $(ruby --version)"
echo "Bundle version: $(bundle --version)"
echo "Rails bin check: $(ls bin/rails 2>/dev/null && echo found || echo MISSING)"
echo ""
echo "Rails app check:"
ls config/application.rb 2>/dev/null && echo "config/application.rb found" || echo "WARNING: No config/application.rb"
echo "RAILS_ENV: $RAILS_ENV"
echo "DATABASE_URL prefix: ${DATABASE_URL:0:30}..."
echo ""

# Remove stale server pid
rm -f tmp/pids/server.pid 2>/dev/null || true

echo "=== Running database setup ==="
# Try migration first, then create+migrate if that fails
bin/rails db:migrate 2>&1 || (
  echo "Migration failed, trying create+migrate..."
  bin/rails db:create 2>&1 || echo "db:create returned non-zero"
  bin/rails db:migrate 2>&1 || echo "db:migrate returned non-zero"
)

echo "=== Running seeds ==="
bin/rails db:seed 2>&1 || echo "Seed failed or already seeded, continuing..."

echo "=== Starting server ==="
exec "$@"
