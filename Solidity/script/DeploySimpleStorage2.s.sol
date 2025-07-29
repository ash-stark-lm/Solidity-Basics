//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; // stating our version works with this or greater version

import {Script} from "forge-std/Script.sol";
import {SimpleStorage2} from "../src/Basics/8-Mappings.sol";

contract DeploySimpleStorage2 is Script {
    function run() external returns (SimpleStorage2) {
        vm.startBroadcast();
        SimpleStorage2 simpleStorage2 = new SimpleStorage2();
        vm.stopBroadcast();
        return simpleStorage2;
    }
}
