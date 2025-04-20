# Buy Me A Coffee - Solidity Project

This project implements a decentralized application (dApp) called "Buy Me A Coffee" using Solidity. The dApp allows users to send tips (in the form of cryptocurrency) to creators as a token of appreciation.

## Project Structure

- **foundry.toml**: Configuration file for the Foundry framework.
- **broadcast/**: Contains deployment scripts and their execution logs.
- **cache/**: Stores cached data for faster builds.
- **lib/**: Includes external libraries and dependencies, such as `forge-std`.
- **script/**: Contains deployment scripts written in Solidity.
- **src/**: Contains the main Solidity contract `buyMeCoffee.sol`.
- **test/**: Contains test files for the project.

## Prerequisites

- [Foundry](https://book.getfoundry.sh/) installed on your system.
- A compatible Ethereum wallet and testnet setup.

## Getting Started

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd buy-me-a-coffee
   ```

2. **Install Dependencies**
   Foundry automatically manages dependencies. Run the following command to install them:
   ```bash
   forge install
   ```

3. **Compile the Contracts**
   Compile the Solidity contracts using Foundry:
   ```bash
   forge build
   ```

4. **Run Tests**
   Execute the test suite to ensure everything is working as expected:
   ```bash
   forge test
   ```

5. **Deploy the Contract**
   Use the deployment script located in `script/DeployBuyMeCoffee.s.sol` to deploy the contract:
   ```bash
   forge script script/DeployBuyMeCoffee.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
   ```

## Features

- Send tips to creators in cryptocurrency.
- View transaction history.
- Fully decentralized and transparent.

## TODO
[] Write tests
