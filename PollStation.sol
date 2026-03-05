// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PollStation {

    address public owner;

    string[] public candidateNames;

    mapping(string => uint256) public voteCount;

    mapping(address => bool) public hasVoted;

    event Voted(address voter, string candidate);

    constructor() {
        owner = msg.sender;
    }

    function addCandidateNames(string memory _candidateNames) public {

        require(msg.sender == owner, "Only owner can add candidates");

        candidateNames.push(_candidateNames);

        voteCount[_candidateNames] = 0;
    }

    function getcandidateNames() public view returns (string[] memory) {

        return candidateNames;
    }

    function vote(string memory _candidateNames) public {

        require(!hasVoted[msg.sender], "You have already voted");

        voteCount[_candidateNames] += 1;

        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, _candidateNames);
    }

    function getVote(string memory _candidateNames) public view returns (uint256){

        return voteCount[_candidateNames];
    }
}
