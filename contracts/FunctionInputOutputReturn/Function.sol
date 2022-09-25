// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Function {
    function returnMany() public pure returns (uint, string memory, uint){
        return (1118, "love", 1114);
    }

    function named() public pure returns (uint fyy, string memory love, uint xdp){
        return (1118, "love", 1114);
    }

    function assigned() public pure returns (uint fyy, string memory love, uint xdp){
        fyy = 1118;
        love = "love";
        xdp = 1114;
    }

    function destructuringAssignments() public pure returns (
        uint,
        string memory,
        uint,
        uint,
        uint
    ){
        (uint i,string memory b,uint j) = returnMany();
        (uint x, , uint y) = (4, 5, 6);
        return (i, b, j, x, y);
    }

    function arrayInput(uint[] memory _arr) public {

    }

    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory){
        return arr;
    }
}