// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Lock} from "../contracts/Lock.sol";

contract LockScript is Script {
    Lock public lock;

    function setUp() public {}

    function run() public {
        // vm.startBroadcast();

        uint256 deployerPrivateKey = vm.envUint("SEPOLIA_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        lock = new Lock(block.timestamp + 30 days);

        vm.stopBroadcast();
    }
}

// deploy and verify
// forge script script/Lock.s.sol --rpc-url sepolia --broadcast --verify
