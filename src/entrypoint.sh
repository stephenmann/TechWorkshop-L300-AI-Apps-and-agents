#!/usr/bin/env sh
set -eu

# App Service sets env vars at runtime. Materialize ENV into a .env file if provided.
if [ -n "${ENV:-}" ]; then
  printf "%s" "$ENV" > /app/.env
  chmod 600 /app/.env || true
fi

exec "$@"