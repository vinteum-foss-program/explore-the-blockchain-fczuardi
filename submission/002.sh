#!/bin/bash

# (true / false) Verify the signature by this address over this message:
#   address: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
#   message: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
#   signature: `HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM=`

# The bitcoin address to use for the signature.
address="1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa"

# The signature provided by the signer in base 64 encoding (see signmessage).
signature="1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa"

# The message that was signed.
message="HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM="

set -x
bitcoin-cli verifymessage ${address} $(echo $signature | base64) ${message}


