//SPDX-License-Identifier:MIT
pragma solidity ^0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

error FundMe__NotOwner();

contract FundMe {
    uint256 public constant minUSD = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amntFunded) public addressToAmountFunded;

    address public immutable i_owner;

    AggregatorV3Interface private s_priceFeed;

    constructor(address priceFeed) {
        i_owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(priceFeed);
    }

    function getPrice(
        AggregatorV3Interface priceFeed
    ) public view returns (uint256) {
        //Ethereum sepolia chainlink address return 8 decimals
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10); // Convert to wei
    }

    function getConversionRate(
        uint256 ethAmnt,
        AggregatorV3Interface priceFeed
    ) public view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint ethAmntInUSD = (ethPrice * ethAmnt) / 1e18; // Convert to USD
        return ethAmntInUSD;
    }

    function getVersion() public view returns (uint256) {
        return s_priceFeed.version();
    }

    function fund() public payable {
        require(
            getConversionRate(msg.value, s_priceFeed) >= minUSD,
            "Didn't sent enough ETH"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    modifier onlyOwner() {
        if (msg.sender != i_owner) {
            revert FundMe__NotOwner();
        }
        _; // This is where the function body will be executed
    }

    function withdraw() public onlyOwner {
        //iterate to all adress
        for (uint funderIdx = 0; funderIdx < funders.length; funderIdx++) {
            address funder = funders[funderIdx];
            addressToAmountFunded[funder] = 0; // Reset the amount funded for
        }

        funders = new address[](0); // Reset the funders array

        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call failed");
    }

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }
}
