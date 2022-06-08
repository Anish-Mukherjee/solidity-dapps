//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract Vote{

    mapping(uint=>string) public candidates;

    //string[] public candidateIds;

    //mapping(uint=>uint) public votesReceivedBy;

    mapping(address=>bool) public hasVoted;

    mapping(address=>bool) public isAlreadyCandidate;

    uint[] public voteCount;

    uint count = 0;

    function newCandidate(string memory _name) public {
        require(isAlreadyCandidate[msg.sender] == false,"You're already a candidate!");
        candidates[count] = _name;
       // candidateIds[count] = _name;
        //voteCount[count] = 0;
        isAlreadyCandidate[msg.sender] = true;
        count += 1;
    }

    /*function vote(uint _id) public {
        require(hasVoted[msg.sender]==false,"You have already voted!");
        //votesReceivedBy[_id] += 1;
        voteCount[_id] += 1;
        hasVoted[msg.sender] = true;
    }*/

    function calculateWinner() private view returns(uint){
        uint max = 0;
        uint winner = 0;
        for (uint i=0;i<=count;i++){
            if (voteCount[i]>max){
                max = voteCount[i];
                winner = i;
            }
        }
        return winner;
    }

    function getWinner() public view returns(string memory){
        uint winningId = calculateWinner();
        return candidates[winningId];
    }


}