// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract String {
    string public s = "1118";
    // 使用0.8.6编译器可能会导致编译不过
    function stringConcat(string memory s1, string memory s2) external pure returns (string memory){
        return string.concat(s1, s2);
    }
}
