curl -X POST -H "Content-Type: application/json" \
-d '{
    "program": "program hello.aleo;\n\nfunction hello:\n    input r0 as u32.public;\n    input r1 as u32.private;\n    add r0 r1 into r2;\n    output r2 as u32.private;\n",
    "fee": 100000,
    "private_key": "APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH"
}' \
http://0.0.0.0:4040/testnet3/deploy

curl -X POST -H "Content-Type: application/json" \
-d '{
    "program_id": "hello.aleo",
    "program_function": "hello",
    "inputs": ["5u32", "5u32"],
    "private_key": "APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH",
    "fee": 0
}' \
http://0.0.0.0:4040/testnet3/execute

curl -X POST -H "Content-Type: application/json" \
-d '{
    "program_id": "land_battle_chess.aleo",
    "program_function": "player_initialize_board",
    "inputs": [ "243944968059068u64", "243944970543153u64" ,"243944969889843u64", 
  "243944969494674u64", "243944969840532u64", "1u64", "1u32", "0u64", "1u32", "aleo1rhgdu77hgyqd3xjj8ucu3jj9r2krwz6mnzyd80gncr5fxcwlh5rsvzp9px" ],
    "private_key": "APrivateKey1zkp2ckdgYhNWAkQaCUsEHK8GvfYvTUnULdry3FXV7jbCsZn",
    "fee": 100
}' \
http://0.0.0.0:4040/testnet3/execute


curl -X POST -H "Content-Type: application/json" \
-d '{
    "program_id": "hello.aleo",
    "program_function": "hello",
    "inputs": ["5u32", "5u32"],
    "password": "password",
    "fee": 0
}' \
http://0.0.0.0:4040/testnet3/execute

curl -X POST -H "Content-Type: application/json" \
-d '{
    "amount": 1000,
    "fee": 0,
    "recipient": "aleo1trtljxr7rw6cn368v2pslnxgl2vzk9pgfunev59k53x645hvrygs5v4f2e",
    "private_key": "APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH"
}' \
http://0.0.0.0:4040/testnet3/transfer
