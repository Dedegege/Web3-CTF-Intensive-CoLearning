// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

// import "../helpers/Ownable-05.sol";
import "./lib/openzeppelin-contracts-08/access/Ownable.sol";

// NOTE our goal is to become owner of our level instance
contract AlienCodex is Ownable {
    bool public contact;
    bytes32[] public codex;

    modifier contacted() {
        assert(contact);
        _;
    }

    function makeContact() public {
        contact = true;
    }

    function record(bytes32 _content) public contacted {
        codex.push(_content);
    }

    function retract() public contacted {
        codex.length--;
    }

    function revise(uint i, bytes32 _content) public contacted {
        codex[i] = _content;
    }
}
