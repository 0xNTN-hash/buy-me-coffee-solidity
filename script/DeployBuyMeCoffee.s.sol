// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {BuyMeCoffee} from 'src/BuyMeCoffee.sol';

contract DeployBuyMeCoffee is Script {
    function run() external returns(BuyMeCoffee) {
        return deployContract();
    }

    function deployContract() public returns(BuyMeCoffee) {

        vm.startBroadcast();
        BuyMeCoffee buyMeCoffee = new BuyMeCoffee();
        vm.stopBroadcast();

        return buyMeCoffee;
    }
}
