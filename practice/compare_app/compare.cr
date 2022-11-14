# 2. Напишите скрипт, который сравнивает значения “result” и “height” на этих двух эндпоинтах.
#
# ключ result
# https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=YourApiKeyToken
#
# ключ height
# https://api.blockcypher.com/v1/eth/main

require "http/client"
require "json"

response_from_etherscan = HTTP::Client.get "https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=YourApiKeyToken"
result = JSON.parse(response_from_etherscan.body)["result"]
# p "result #{result}"

response_from_blockcypher = HTTP::Client.get "https://api.blockcypher.com/v1/eth/main"
height = JSON.parse(response_from_blockcypher.body)["height"]
# p "height #{height}"

p (result == height).to_unsafe
