// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Loop {
    uint public iFor;
    uint public jWhile;
    uint public jDoWhile;

    function loop() public {
        for (uint i = 0; i < 1120; i++) {
            if (i == 1114) {
                continue;
            }
            if (i == 1118) {
                iFor = i;
                break;
            }
            iFor = i;
        }

        uint j;
        while (j < 10) {
            j++;
        }
        jWhile = j;

        j = 0;
        do {
            j++;
        } while (j < 10);
        jDoWhile = j;
    }
}
