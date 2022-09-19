// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum {
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns (Status){
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    function reject() public {
        status = Status.Rejected;
    }

    function accept() public {
        status = Status.Accepted;
    }

    function ship() public {
        status = Status.Shipped;
    }

    function pending() public {
        status = Status.Pending;
    }

    function reset() public {
        delete status;
    }
}
