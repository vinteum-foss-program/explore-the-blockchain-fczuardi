#!/bin/bash

# How many new outputs were created by block 123,456?


#  "outs" : n,                    (numeric, optional) The number of outputs
stats='["outs"]'

height=123456

bitcoin-cli getblockstats ${height} ${stats} | jq .outs
