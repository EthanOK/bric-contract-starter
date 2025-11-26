import hardhatToolboxMochaEthersPlugin from "@nomicfoundation/hardhat-toolbox-mocha-ethers";
import hardhatContractSizer from "@solidstate/hardhat-contract-sizer";
import { defineConfig } from "hardhat/config";
import "dotenv/config";

export default defineConfig({
  plugins: [hardhatToolboxMochaEthersPlugin, hardhatContractSizer],
  solidity: {
    version: "0.8.26",
    settings: {
      evmVersion: "cancun",
      optimizer: {
        enabled: true,
        runs: 200,
      },
      viaIR: true,
    },
  },
  contractSizer: {
    alphaSort: true,
    runOnCompile: false,
    strict: true,
    only: [],
    unit: "KiB",
  },
  test: {
    mocha: {
      timeout: 1000000,
    },
    solidity: {
      forking: {
        // url: `${process.env.HOODI_RPC_URL}` || "https://0xrpc.io/hoodi",
      },
    },
  },
});
