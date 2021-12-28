// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

// [TODO]
// import openzeppelin ERC20 Interface so we can use ERC20 token functions

contract Source {
  address public owner = msg.sender;
  uint public nextTransferID;
  // [TODO]: what's this?
  constant uint public CONTRACT_FEE_BASIS_POINTS;

  struct TransferData { 
    address tokenAddress
    address destination
    uint256 amount
    uint256 fee
    uint256 startTime
    uint256 feeRampup
  }

  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  constructor() public {
    nextTransferID = 0;
    CONTRACT_FEE_BASIS_POINTS = 5;
  }

  event TransferInitiated(transfer, transferID);

  function withdraw(transferData){
    amountPlusFee = uint(transferData.amount * (10000 + CONTRACT_FEE_BASIS_POINTS)) / 10000;
    if (transferData.tokenAddress != 0)
    {
      IERC20(transferData.tokenAddress).transferFrom(msg.sender, this.address, amountPlusFee);
    } 
   else{
      // Transfer ether here
      require(msg.value == amountPlusFee, 'insufficient ether provided');
    }
    emit TransferInitiated(transferData, self.nextTransferID); // not sure what to pass here
 }
}
