// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Array {
    uint[] public arr;
    uint[] public arr2 = [1114, 1118, 824];
    uint[10] public myFixedSizeArr;
    bytes public bytesArr = "hello";
    string public stringVar = "world";

    function get(uint i) public view returns (uint){
        return arr[i];
    }

    function getArr() public view returns (uint[] memory){
        return arr;
    }

    function push(uint i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint){
        return arr.length;
    }

    function getBytesLength() public view returns (uint) {
        return bytesArr.length;
    }

    function remove(uint index) public {
        require(index < arr.length, "index out of range");
        delete arr[index];
    }

    function removeReplace(uint index) public {
        require(index < arr.length, "index out of range");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function removeShifting(uint index) public {
        require(index < arr.length, "index out of range");
        for (uint i = index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function testRemove() public {
        arr = [1, 2, 3, 4];
        remove(0);
        assert(arr.length == 4);
        assert(arr[0] == 0);
        remove(1);
        assert(arr.length == 4);
        assert(arr[1] == 0);
    }

    function testRemoveReplace() public {
        arr = [1, 2, 3, 4];
        removeReplace(1);
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);
        removeReplace(2);
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }

    function testRemoveShifting() public {
        arr = [1, 2, 3, 4];
        removeShifting(1);
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 3);
        assert(arr[2] == 4);
        removeShifting(2);
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 3);
    }

    function examples() external pure {
        uint[] memory a = new uint[](5);
    }
    
    string s = "Storage";
    function f(bytes calldata bc, string memory sm, bytes16 b) public view {
        string memory concatString = string.concat(s, string(bc), "Literal", sm);
        assert((bytes(s).length + bc.length + 7 + bytes(sm).length) == bytes(concatString).length);

        bytes memory concatBytes = bytes.concat(bytes(s), bc, bc[:2], "Literal", bytes(sm), b);
        assert((bytes(s).length + bc.length + 2 + 7 + bytes(sm).length + b.length) == concatBytes.length);
    }

    function f(uint len) public pure {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        assert(a.length == 7);
        assert(b.length == len);
        a[6] = 8;
    }
}
