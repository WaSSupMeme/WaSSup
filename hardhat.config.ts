import { HardhatUserConfig } from "hardhat/config";

import "@nomiclabs/hardhat-ethers";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-chai-matchers";

import "solidity-coverage";
import "hardhat-gas-reporter";
import "hardhat-contract-sizer";

import dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.21",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    hardhat: {},
    ethereumMainnet: {
      url: "https://1rpc.io/eth",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
    sepolia: {
      url: "https://sepolia.drpc.org",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
    base: {
      url: "https://1rpc.io/base",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
    baseSepolia: {
      url: "https://base-sepolia-rpc.publicnode.com",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
    zksync: {
      url: "https://1rpc.io/zksync2-era",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
    arbitrum: {
      url: "https://1rpc.io/arb",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
    polygon: {
      url: "https://1rpc.io/matic",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
    bsc: {
      url: "https://1rpc.io/bnb",
      accounts: [process.env.DEPLOYER_PRIVATE_KEY as string],
    },
  },
  etherscan: {
    apiKey: {
      mainnet: process.env.ETHERSCAN_API_KEY as string,
      sepolia: process.env.ETHERSCAN_API_KEY as string,
      base: process.env.BASESCAN_API_KEY as string,
      baseSepolia: process.env.BASESCAN_API_KEY as string,
      zkSync: process.env.ERASCAN_API_KEY as string,
      arbitrumOne: process.env.ARBISCAN_API_KEY as string,
      polygon: process.env.POLYGONSCAN_API_KEY as string,
      bsc: process.env.BSCSCAN_API_KEY as string,
    },
    customChains: [
      {
        network: "baseSepolia",
        chainId: 84532,
        urls: {
          apiURL: "https://api-sepolia.basescan.org/api",
          browserURL: "https://sepolia.basescan.org",
        },
      },
      {
        network: "base",
        chainId: 8453,
        urls: {
          apiURL: "https://api.basescan.org/api",
          browserURL: "https://basescan.org",
        },
      },
    ],
  },
  ignition: {
    strategyConfig: {
      create2: {
        salt: "0xab677faca7730bf27fc0f2deacf0362eeed4b24f2a5e717e7b17f2d150481fbf",
      },
    },
  },
  gasReporter: {
    enabled: true,
    currency: "USD",
    coinmarketcap: process.env.COINMARKETCAP_API_KEY as string,
    token: "ETH", // "MATIC" for Polygon and "BNB" for BSC
    gasPriceApi:
      "https://api.etherscan.io/api?module=proxy&action=eth_gasPrice", // Ethereum, Arbitrum, zkSync Era
    // "https://api.polygonscan.com/api?module=proxy&action=eth_gasPrice", // Polygon
    // "https://api.bscscan.com/api?module=proxy&action=eth_gasPrice", // BSC
  },
  contractSizer: {
    alphaSort: false,
    runOnCompile: true,
    disambiguatePaths: false,
    strict: true,
    only: [],
    except: [],
  },
};

export default config;
