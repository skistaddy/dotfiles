#!/bin/bash

# Fast check to Cloudflare DNS with a 1-second timeout
if timeout 1 bash -c 'cat < /dev/null > /dev/tcp/1.1.1.1/53' >/dev/null 2>&1; then
    echo "󰖩" # Symbol when internet is UP
else
    echo "󰤭" # Symbol when internet is DOWN
fi

