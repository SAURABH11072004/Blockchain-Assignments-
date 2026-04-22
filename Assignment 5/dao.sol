// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleDAO {

    struct Proposal {
        string description;
        uint voteCount;
    }

    Proposal[] public proposals;
    mapping(address => bool) public voters;

    function createProposal(string memory _desc) public {
        proposals.push(Proposal(_desc, 0));
    }

    function vote(uint index) public {
        require(!voters[msg.sender], "Already voted");

        voters[msg.sender] = true;
        proposals[index].voteCount++;
    }
}
