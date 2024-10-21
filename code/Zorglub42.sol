// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

/* 
Importing OpenZeppelin contracts for:
- ERC20 token functionality: Standard token operations.
- ERC20Burnable: Allows tokens to be burned, reducing the total supply.
- Ownable: Manages ownership and permission control.
*/
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

// Define the Zorglub42 contract which extends functionalities from ERC20, ERC20Burnable, and Ownable.
contract Zorglub42 is ERC20, ERC20Burnable, Ownable {

  // This constructor is executed once when the contract is deployed.
  // ERC20("Zorglub42", "Z42"): initializes ERC20 with token name "Zorglub42" and symbol "Z42" by calling its constuctor.
  // Ownable(msg.sender): initializes Ownable to set the contract deployer as the initial owner by calling its constructor
  constructor() ERC20("Zorglub42", "Z42") Ownable(msg.sender) {}

  // Public function to mint new tokens.
  // Only the contract owner can call this function due to the `onlyOwner` modifier.
  function mint(uint256 amount) public onlyOwner {
    // ERC20 tokens often use decimal places to manage fractional values.
    // For instance, if your token has 18 decimals (which is standard for Ethereum-based tokens),
    // a value of 1 token is represented as 10^18 units internally.
    _mint(msg.sender, amount * (10 ** decimals()));
  }

  // Public function that returns the balance of the caller
  function myBalance() public view returns (uint256) {
    return balanceOf(msg.sender);
  }

  // Public function that returns the balance of the caller in token units (human-readable format).
  function myBalanceInTokens() public view returns (uint256) {
    // Divide balance by 10^decimals() to convert to token units.
    return balanceOf(msg.sender) / (10 ** decimals());
  }

  // Public function to transfer tokens from the caller to another address.
  // `amount` is specified in token units (not smallest units).
  function transferTokens(address recipient, uint256 amountInTokens) public returns (bool) {
    // Convert amount from token units to smallest units.
    uint256 amountInSmallestUnits = amountInTokens * (10 ** decimals());
    // Call the transfer function from the ERC20 contract to perform the transfer.
    return transfer(recipient, amountInSmallestUnits);
  }
}