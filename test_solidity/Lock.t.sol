// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Lock} from "../contracts/Lock.sol";

contract LockTest is Test {
    Lock public lock;

    address public deployer;

    function setUp() public {
        // TODO: Read .env
        uint256 deployerPrivateKey = vm.envUint("SEPOLIA_PRIVATE_KEY");
        deployer = vm.addr(deployerPrivateKey);
        console.log("deployer: ", deployer);

        // TODO: Fork Sepolia
        vm.createSelectFork("sepolia");
        console.log("chainId: ", block.chainid);

        vm.deal(deployer, 1000 ether);

        vm.startBroadcast(deployer);
        lock = new Lock{value: 100 ether}(block.timestamp + 60 days);

        vm.stopBroadcast();
    }

    function test_Lock() public {
        address owner = lock.owner();
        assertEq(owner, deployer);

        // TODO: Set timestamp
        vm.warp(block.timestamp + 61 days);

        vm.startBroadcast(owner);
        lock.withdraw();
        vm.stopBroadcast();
    }
}
