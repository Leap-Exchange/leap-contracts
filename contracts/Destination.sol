// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// [TODO]
// import openzeppelin ERC20 Interface so we can use ERC20 token functions

contract Destination {
  address public owner = msg.sender;
  // transferOwners: (transferData, transferID) => address owner
  // might change state map implementation in the future
  // mapping(struct => mapping(uint => address)) public transferOwners;
	mapping(bytes => mapping(uint => address)) public transferOwners;



  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  constructor() public {
  }

  function getLPFee(transferData, currentTime){
		if (currentTime < startTime){
			return currentTime
		}
    else if (currentTime >= transferData.startTime + transferData.feeRampup){
			return transferData.fee;
		}
    else{
			// Note: this clause is unreachable if feeRampup == 0
			// [TODO] Implement int divide '//' operator in solidity for return statement below
			return transferData.fee * (currentTime - startTime) / transferData.feeRampUp; 
		}
    
  }

  function changeOwner(transferData, transferID, newOwner){ }

  function buy(transferData, transferID){}



}
