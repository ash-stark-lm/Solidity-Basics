// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

//Deploy mocks when we are on a local chain
// keep track of contact address across different chains
import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    //if we are on a local chain, we deploy mocks
    //otherwise grab the existing address from the live network

    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed;
    }
    //block-> global variable
    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getMainnetEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        //price feed address

        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306 // Sepolia ETH/USD price feed
        });
        return sepoliaConfig;
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
        //price feed address
        NetworkConfig memory ethConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419 // Mainnet ETH/USD price feed
        });
        return ethConfig;
    }

    function getAnvilEthConfig() public returns (NetworkConfig memory) {
        //deploy the mock
        // return the mock address
        vm.startBroadcast();

        vm.stopBroadcast();
    }
}
