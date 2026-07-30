#!/bin/bash

echo "=== Mysterium Node Docker Container ==="

if [ -z "$MYST_KEY" ]; then
    echo "Error: MYST_KEY (wallet address) must be set."
    echo "Edit .env file with your Mysterium wallet address."
    exit 1
fi

echo "Starting Mysterium Node..."
myst daemon --agreed-terms-of-use --log-level info --address 0.0.0.0 --restapi 0.0.0.0:4449 &

echo "Mysterium Node is running."
echo "Wallet: $MYST_KEY"
echo "REST API available at http://localhost:4449"

tail -f /dev/null