#!/bin/bash

# How many new outputs were created by block 123,456?

height=123456

#  "outs" : n,                    (numeric, optional) The number of outputs
#  "utxo_increase" : n,           (numeric, optional) The increase/decrease in the number of unspent outputs (not discounting op_return and similar)
#  "utxo_size_inc" : n,           (numeric, optional) The increase/decrease in size for the utxo index (not discounting op_return and similar)
#  "utxo_increase_actual" : n,    (numeric, optional) The increase/decrease in the number of unspent outputs, not counting unspendables
#  "utxo_size_inc_actual" : n     (numeric, optional) The increase/decrease in size for the utxo index, not counting unspendables

# stats='["outs", "utxo_increase","utxo_size_inc","utxo_increase_actual","utxo_size_inc_actual"]'
#bitcoin-cli getblockstats ${height} ${stats}

bitcoin-cli getblockstats ${height} | jq .outs
