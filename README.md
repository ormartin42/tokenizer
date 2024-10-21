# INTRODUCTION

The aim of this project is to build our own token and deploy it on a public test blockchain. To understand this process, we first need to grasp the fundamentals of blockchain technology and tokens.

## WHAT IS BLOCKCHAIN?

Think of a blockchain as a special kind of digital notebook that everyone can see and use, but no one can erase or change what's already written in. Each page in this notebook is called a [block](./documentation/glossary.md#block), and the notebook itself is called a [chain of blocks](./documentation/glossary.md#blockchain). In blockchain terminology, this concept is often referred to as a [ledger](./documentation/glossary.md#ledger), a sophisticated term for a record book where transactions and other data are logged.

When someone wants to record something (like a transaction or a piece of information), it's written on a new page (block) in the notebook. **Each new page references the page before it, creating a continuous chain.** This linkage makes it extremely difficult to alter any information in a block without changing all subsequent blocks, which requires significant computational effort.

**The blockchain is not controlled by a single entity but is distributed across a network of participants. Each participant maintains their own copy of the blockchain ([node](./documentation/glossary.md#node)), ensuring that everyone sees the same information.** Before adding a new page to the blockchain, the network collectively verifies its accuracy ([mining](./documentation/glossary.md#miner)). Once consensus is reached, the new page is added, and the process continues.

**This decentralized approach enhances security and trustworthiness.** Because everyone has the same copy of the blockchain and can observe all changes, it is nearly impossible for any individual to manipulate the data dishonestly. Unlike traditional systems where a central authority (like banks or e-commerce websites) controls transactions, blockchain operates without a central authority, distributing control among all participants. Some examples of use include [Cyptocurrencies](./documentation/glossary.md#crypto) (such as Bitcoin, where transactions are recorded and verified on the blockchain) and [Smart Contracts](./documentation/glossary.md#smart-contract) (agreements that automatically execute when predefined conditions are met, stored and executed on the blockchain).

## WHAT IS A TOKEN?

In the cryptocurrency world, terms "coin" and "token" are often used interchangeably, but they denote different types of digital assets. Here's a breakdown of their differences.

### Coin
A [coin](./documentation/glossary.md#coin) is a cryptocurrency that operates on its own blockchain. Examples include Bitcoin (BTC) on the Bitcoin blockchain, Ether (ETH) on the Ethereum blockchain, and Binance Coin (BNB) on the Binance Smart Chain. Coins are typically used as a medium of exchange, a store of value, or to facilitate the operations of the blockchain network (e.g., paying for transaction fees). Creating a coin involves:
- Deciding how the blockchain will achieve consensus on transactions (e.g., Proof of Work).
- Establishing the structure, rules, and protocol of the blockchain.
- Building the blockchain either from scratch or by modifying an existing project.
- Ensuring the blockchain operates effectively and remains secure.

### Token
A [token](./documentation/glossary.md#token) is a digital asset that is created on an existing blockchain, usually through a smart contract. For example, ERC-20 tokens like Uniswap (UNI) or Chainlink (LINK) are built on the Ethereum blockchain. Tokens can represent various assets or utilities, including access to services, voting rights, or even physical assets. They can be:
- <ins>Fungible Tokens</ins>: Interchangeable like money (e.g., ERC-20 tokens).
- <ins>Non-Fungible Tokens</ins> (NFTs): Unique and not interchangeable (e.g., ERC-721 tokens).

Creating a token is generally simpler than creating a coin since it is built on top of an existing blockchain. The process includes:
- Selecting the blockchain on which to deploy the token.
- Designing and implementing the contract that defines the token's functionality.
- Deploying the smart contract on the chosen blockchain (note that this involves paying gas fees, though testnet deployments do not require real cryptocurrency).
- Distributing the tokens, allocating them to users or integrating them into decentralized applications ([dApps](./documentation/glossary.md#dapp)).

_For more details on smart contracts, dApps, and more blockchain terminology, please refer to the glossary file that you'll find in the documentation folder at the root of this repository._

## ZORGLUB42

The submitted version of my contract was deployed and is reachable at this address: `0x3b9F5F63B30d923a3639966b35b558401AC7875b` and has the ticker `Z42` (keep in mind token tickers are not unique, and there can be multiple contracts with the same ticker. To make sure you are interacting with the right one, refer to the address retrieved upon deployment).
You can check the deployed contract's related transactions by entering the address in [Sepolia Etherscan](https://sepolia.etherscan.io/). 
There are multiple ways and tools available for token creation. Here are my choices an a short explanation of why they were selected.

### BLOCKCHAIN: Sepolia (Ethereum [Testnet](./documentation/glossary.md#testnet))

[Sepolia](./documentation/glossary.md#sepolia) is a public test network for [Ethereum](./documentation/glossary.md#ethereum), providing a realistic environment to test smart contracts without using real [ETH](./documentation/glossary.md#ether). It mirrors the Ethereum [mainnet](./documentation/glossary.md#mainnet) - which is one of the most established blockhain platforms with a large, active developer communtiy - but uses test ETH, which has no real-world value. Using Sepolia allows for comprehensive testing of the token’s functionality in a setting that closely resembles the mainnet, ensuring that any issues can be addressed before deployment on the main Ethereum network. 

### DEVELOPMENT ENVIRONMENT: Remix (IDE for Solidity Smart Contracts)

[Remix](./documentation/glossary.md#remix) is an IDE tailored for Solidity, the language used for writing Ethereum smart contracts. It offers a user-friendly interface, real-time code compilation, and debugging tools. Remix’s accessibility and feature set make it ideal for developing, testing, and deploying smart contracts efficiently amongst other reasons without require any installation process a part from a wallet browser extension.

### WALLET: MetaMask (Browser Extension for Managing Ethereum Accounts and Transactions)

[MetaMask](./documentation/glossary.md#metamask) is a popular and well-supported browser extension [wallet](./documentation/glossary.md#wallet) that facilitates managing Ethereum accounts and transactions. It integrates smoothly with Remix and other development tools, enabling easy interaction with the Ethereum network and ensuring secure management of private keys.

### TOKEN STANDARD: ERC-20 (Standard for Fungible Tokens on Ethereum)
[ERC-20](./documentation/glossary.md#erc-20) is the most widely adopted token standard on the Ethereum blockchain. It ensures compatibility with a vast range of wallets and exchanges, which is crucial for broader acceptance and integration. By adhering to the ERC-20 standard, the token can leverage existing infrastructure and gain visibility within the Ethereum ecosystem.

#### ADDITIONAL FEATURES FOR THE CONTRACT 

##### OWNABLE
The token contract is designed to be "ownable," meaning that certain administrative functions are restricted to a specific address, usually the contract creator or a designated owner. This provides control over critical aspects of the contract, such as upgrading or managing special features, and helps prevent unauthorized changes. Ownership can be transferred if needed, ensuring flexibility in management.

##### BURNABLE
The token is also designed to be "burnable," which means that tokens can be permanently removed from circulation. This feature allows for the reduction of the total supply, potentially increasing scarcity and value over time. It also supports mechanisms for tokenomics such as incentivizing holders or implementing deflationary measures. The burnable functionality contributes to the overall flexibility and adaptability of the token in various scenarios.


