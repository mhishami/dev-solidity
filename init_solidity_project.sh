#!/bin/sh
#
# prepare our ignore files
cat > .gitignore <<EOF
node_modules
build
.openzeppelin
.secret
EOF

# fixed jshint
cat > .jshintrc <<EOF 
{
  "esversion": 8 
}
EOF

npm init -y
npm install --save-dev @openzeppelin/cli
npm install --save-dev @openzeppelin/contracts
npm install --save-dev @truffle/hdwallet-provider
npm install web3 @openzeppelin/contract-loader

# init our dev env.
npx oz init
truffle init

# prepare mnemonics for HD Wallet
npx mnemonics > .secret 

rm -f networks.js

# save our initial project
git init
git add .
git commit -am 'Newly created'
