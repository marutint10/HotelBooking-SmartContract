//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
  enum Statuses {
    Vacant,
    Occupied
  }

  Statuses public currentStatus;
  event Ocuppy(address _occupant, uint256 _value);
  address payable owner;

  constructor() {
    owner = payable(msg.sender);
    currentStatus = Statuses.Vacant;
  }

  modifier onlyWhileVacant() {
    require(currentStatus == Statuses.Vacant, "currently occupied");
    _;
  }

  modifier costs(uint256 _amount) {
    require(msg.value >= _amount, "Not enoungh ether provided");
    _;
  }

  function book() public payable onlyWhileVacant costs(2 ether) {
    currentStatus = Statuses.Vacant;
    (bool sent, ) = owner.call{ value: msg.value }("");
    require(sent);
    emit Ocuppy(msg.sender, msg.value);
  }
}
