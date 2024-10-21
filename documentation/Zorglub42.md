# Zorglub42 Token Contract Documentation

## **Contract Overview**

The `Zorglub42` contract is an ERC-20 token contract that incorporates additional features such as minting, burning, and ownership management. This document details all the functions available within the `Zorglub42` contract, explaining their purpose and usage.

## **Functions Overview**

### Customized functions

#### **1. Constructor: `Zorglub42()`**

```solidity
constructor() ERC20("Zorglub42", "Z42") Ownable(msg.sender) {}
```

The constructor is called once when the contract is deployed.
It sets up the basic token properties and defines ownership.
It initializes the token with a name ("Zorglub42") and a symbol ("Z42").
The Ownable contract sets the deployer as the initial owner of the contract.

#### **2.  `mint(uint256 amount)`**

This function mints new tokens and assigns them to the contract owner.
The onlyOwner modifier restricts this function so only the contract owner can call it.
Allows the contract owner to increase the token supply as needed.

#### **3. `myBalance()`**

Returns the balance of the caller's account in the smallest unit of the token.
This function provides the raw amount of tokens held by the caller, including all decimal places.
This function is useful for retrieving the exact token balance stored in the contract, which includes fractional units.

#### **4. `myBalanceInTokens()`**

Returns the balance of the caller's account in human-readable token units.
This function converts the balance from the smallest unit to the standard token units by dividing by 10 ** decimals(), making it easier to understand the actual amount of tokens held.

#### **5. `transferTokens()`**

Transfers a specified amount of tokens from the caller's account to another address. The amount is provided in human-readable token units and is internally converted to the smallest unit before the transfer. This function simplifies the process of transferring tokens by allowing amounts to be specified in easily understandable units.

### Inherited functions

#### **6.  `allowance(address owner, address spender)`**

Returns the remaining number of tokens that a spender is allowed to transfer on behalf of the token holder.
Provides information about the remaining allowance for a delegated spender.

#### **7.  `approve(address spender, uint256 amount)`**

Approves a spender to transfer up to a certain number of tokens on the token holder's behalf.
Enables delegated spending by third parties, necessary for functions like transferFrom.

#### **8.  `balanceOf(address account)`**

Returns the number of tokens held by a specific account.

#### **9.  `burn(uint256 amount)`**

This function allows any token holder to destroy (burn) their own tokens, reducing the total supply (inherited from `ERC20Burnable` contract).
Allows token holders to voluntarily reduce the supply of tokens, which could influence token scarcity and value.

#### **10.  `burnFrom(address account, uint256 amount)`**

Burns tokens from a specified address, using the allowance mechanism (inherited from `ERC20Burnable` contract).


#### **11.  `decimals()`**

Returns the number of decimals used to get its user representation, typically 18 for ERC-20 tokens.


#### **12.  `name()`**

Returns the name of the token ("Zorglub42").

#### **13.  `owner()`**

Returns the address of the current owner of the contract (inherited from `Ownable` contract), which corresponds to the wallet address of the account that deployed the contract.

#### **14.  `renounceOwnership()`**

Renounces the ownership of the contract, leaving it without an owner.

#### **15.  `symbol()`**

Returns the symbol of the token ("Z42").

#### **16.  `totalSupply()`**

Returns the total number of tokens in circulation.

#### **17.  `transfer(address recipient, uint256 amount) `**

Transfers a specified number of tokens to a recipient address.
This function overrides the default transfer function from the ERC20 contract.
Facilitates token transfers between accounts.


#### **18.  `transferFrom(address sender, address recipient, uint256 amount) `**

Transfers tokens from one address to another, using an allowance mechanism.
The sender must have an allowance set by the token holder for this function to work.
Allows third-party transfers based on prior approval.

#### **19.  `transferOwnership()`**

Transfers ownership of the contract to a new address (inherited from `Ownable` contract)
