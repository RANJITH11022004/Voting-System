// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.0;
 contract voting{
    struct candidate  {
        uint id;
        string name;
        uint voteCount;
    }
    mapping (uint => candidate)public candidates;
  mapping (address=> bool) public hasvoted;
  uint public candidatecount;
  constructor(string[] memory _candidatename){
    candidatecount=0;
    for(uint i=0;i<_candidatename.length;i++){
       addcandidate(_candidatename[i]);

    }
  }
   function addcandidate(string memory name) private {
  candidatecount++;  
  candidates[candidatecount]=candidate(candidatecount,name,0);
 }
 function vote(uint _candidateId)public{
  require(_candidateId>0 && _candidateId <candidatecount,"Invalid Candidate Id");
  require(!hasvoted[msg.sender],"Altready voted");
  candidates [_candidateId].voteCount++;
  hasvoted[msg.sender]= true;
 } 
function getVoteCount(uint _candidatedId) public view returns(uint){
  return candidates[_candidatedId].voteCount;
} 
 }
