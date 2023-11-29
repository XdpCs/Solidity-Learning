// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Variables {
    string public text = "hello,fyy";
    uint public num = 1118;
    uint public gasLeft;
    address public origin;
    uint public timestamp;

    function doSomething() public {
        uint i = 1114;
        text = "hello,xdp";
        gasLeft = gasleft();
        origin = tx.origin;
        timestamp = block.timestamp;
    }

    function blockHash() view public returns (bytes32) {
        return blockhash(block.number - 1);
    }

    function getBaseFee() view public returns (uint) {
        return block.basefee;
    }

    function getChainID() view public returns (uint) {
        return block.chainid;
    }

    function getCoinBase() view public returns (address) {
        return block.coinbase;
    }

    function getDifficulty() view public returns (uint) {
        return block.difficulty;
    }

    function getPrevRandao() view public returns (uint) {
        return block.prevrandao;
    }

    function getGasLimit() view public returns (uint) {
        return block.gaslimit;
    }
}
