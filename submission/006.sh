#!/bin/bash

# Which tx in block 257,343 spends the coinbase output of block 256,128?

# get block data given a block height
get_block_from_block_height(){
  block_height=$1
  block_hash=$(bitcoin-cli getblockhash $block_height)
  bitcoin-cli getblock $block_hash
}

# get first transaction in a block (coinbase tx)
get_coinbase_tx_from_block(){
  block=$1
  echo $block | jq -r .tx[0]
}

# iterate over the txs in a given block height to search for the one containing the a given input 
find_tx_with_input(){
  input=$1
  block_height=$2
  block=$(get_block_from_block_height $block_height)
  transactions=$(echo $block | jq -r .tx[])
  for txid in $transactions;do
    tx_inputs=$(bitcoin-cli getrawtransaction $txid true | jq -r .vin[].txid)
    if echo "$tx_inputs" | grep -q "$input"; then  # Check if input matches any txid in the inputs
      echo $txid
      return 0
    fi
  done
}

coinbase_tx=$(get_coinbase_tx_from_block "$(get_block_from_block_height 256128)")
find_tx_with_input $coinbase_tx 257343
