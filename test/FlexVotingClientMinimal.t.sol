// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";

import {FlexVotingClient} from "src/FlexVotingClient.sol";

contract MockFlexVotingClient is FlexVotingClient {
  constructor(address _governor) FlexVotingClient(_governor) {}

  function _rawBalanceOf(address _user) internal view override returns (uint208) {
    return 42;
  }
}

contract FlexVotingClientTest is Test {
  MockFlexVotingClient flexClient;

  function setUp() public {
    flexClient = new MockFlexVotingClient(address(0xBEEF));
    vm.label(address(flexClient), "flexClient");
  }

  function test_FlexVotingClientDeployment() public view {
    assertEq(address(flexClient.GOVERNOR()), address(0xBEEF));
  }
}
