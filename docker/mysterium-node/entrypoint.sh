#!/bin/bash

if [ -z "$MYST_KEY" ]; then
    echo "Error: MYST_KEY (wallet address) must be set."
    exit 1
fi

PORT=${PORT:-4449}

myst daemon --tequilapi.port=$PORT &
sleep 6

IDENTITY=$(myst cli identities 2>/dev/null | grep -oP '0x[a-fA-F0-9]{40}' | head -1)
if [ -n "$IDENTITY" ]; then
    myst cli identities set-payout-address $IDENTITY $MYST_KEY 2>/dev/null || true
    myst cli identities register $MYST_KEY 2>/dev/null || true
fi

wait