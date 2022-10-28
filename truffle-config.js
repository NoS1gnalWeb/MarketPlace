require('dotenv').config();
var HDWalletProvider = require("truffle-hdwallet-provider");


module.exports = {
  networks: {
    
    matic: {
      provider: () => new HDWalletProvider(process.env.PASS_PHRASE, `https://polygon-mainnet.g.alchemy.com/v2/${process.env.API_KEY}`),
      network_id: 80001,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },


  },
  compilers: {
    solc: {
      settings: {
        optimizer: {
          enabled: true, // Default: false
          runs: 200      // Default: 200
        },
      }
    }
  }
};
