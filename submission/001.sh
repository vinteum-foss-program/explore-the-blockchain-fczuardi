#!/bin/bash

# What is the hash of block 654,321?

# block height index we want, as a number 
height=654321

# command to return the hash of block given a block height
# see bitcoin-cli help getblockhash
bitcoin-cli getblockhash ${height}

