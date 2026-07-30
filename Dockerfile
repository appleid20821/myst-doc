#!/bin/bash

echo "=== Mysterium Node Docker Container ==="

if [ -z "$MYST_KEY" ]; then
    echo "Error: MYST_KEY (wallet address) must be set."
    echo "Set MYST_KEY in Railway environment variables."
    exit 1
fi

echo "Starting Mysterium Node..."
echo "Wallet: $MYST_KEY"

exec myst daemon --agreed-terms-of-use --log-level info --address 0.0.0.0 --restapi 0.0.0.0:4449
