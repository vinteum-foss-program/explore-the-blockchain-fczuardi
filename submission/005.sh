#!/bin/bash

# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

txid="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"
tx_info=$(bitcoin-cli getrawtransaction ${txid} true)
tx_inputs_public_keys=$(echo "$tx_info" | jq -r [.vin[].txinwitness[1]])

bitcoin-cli createmultisig 1 "$tx_inputs_public_keys" | jq -r .address
