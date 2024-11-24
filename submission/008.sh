#!/bin/bash

# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
txid="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
txdata=$(bitcoin-cli getrawtransaction $txid 2)

# after reading the input 0 type and components, I concluded that
# it was a P2WSH, so the scriptsighash must be signed with a key
# present in the redeem script
# the txinwitness here has 3 elements, 0-signature, 1-control byte and 2-the redeem script

signature=$(echo $txdata | jq -r .vin[0].txinwitness[0])
control_byte=$(echo $txdata | jq -r .vin[0].txinwitness[1])
redeem_script=$(echo $txdata | jq -r .vin[0].txinwitness[2])

decoded_redeem_script=$(bitcoin-cli decodescript ${redeem_script})

# after reading the decoded redeem script
# it can be interpreted as containing 2 pubkeys, one for each branch of an IF operation
# the control byte in the input shows that the branch used was the IF part and not the ELSE
# so the pubkey must be the first one
pubkey=$(echo $decoded_redeem_script | jq -r '.asm | split(" ") | .[1]')

# this answer was only possible to get with manual reading I dont know if the exercise
# was meant to have a more automatic way of finding which of the keys signed,
# something like executing the script, i dont know...

echo $pubkey
