#!/bin/bash

# Only one single output remains unspent from block 123,321. What address was it sent to?

block_height=123321
block_data=$(bitcoin-cli getblock $(bitcoin-cli getblockhash $block_height) 2)

# Extract txid and vout.n pairs
pairs=$(echo "$block_data" | jq -r '.tx[] | .txid as $txid | .vout[] | "\($txid) \(.n)"')
IFS=$'\n' # make newlines the only separator

for pair in $pairs;do
  utxo=$(eval "bitcoin-cli gettxout $pair" | jq -r .scriptPubKey.address)
  if [[ -n "$utxo" && "$utxo" != "null" ]]; then
    echo "$utxo"
    return 0
  fi
done
