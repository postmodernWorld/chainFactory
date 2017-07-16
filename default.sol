pragma solidity ^0.4.18

contract ContractBase {

  struct Member {
    int uid;
    address a;
    int reputation;
    int amount;
  }
  Struct Deal {
    int uid;
    int reputationToDistribute;
    int amountToDistribute;
    mapping (int => int) contributorsValidatorPersAmounts;
    mapping (int => int) contributorsDoingPersAmounts;
    mapping (int => int) sponsorsPersAmounts;
    mapping (int => int) fromPersAmounts;
    mapping (int => int) toPersAmounts;
    mapping (int => int) contributorsValidatorPersReputations;
    mapping (int => int) contributorsDoingPersReputations;
    mapping (int => int) sponsorsPersReputations;
    mapping (int => int) fromPersReputations;
    mapping (int => int) toPersReputations;
    mapping (int => int) contributorsValidatorAmounts;
    mapping (int => int) contributorsDoingAmounts;
    mapping (int => int) sponsorsAmounts;
    mapping (int => int) fromAmounts;
    mapping (int => int) toAmounts;
    mapping (int => int) contributorsValidatorReputations;
    mapping (int => int) contributorsDoingReputations;
    mapping (int => int) sponsorsReputations;
    mapping (int => int) fromReputations;
    mapping (int => int) toReputations;
  }
  mapping(int => Member) members;
  int membersCount;

  mapping(int => Deal) deals;
  int dealsCount;

  int[] owners;
  int ownersCount;

  int amountDistributedTotal;

  mofifier onlyOwner(){
    require(msg.sender == inOwners);
  }
  mofifier onlyMembers(){
    require(msg.sender == inMembers);
  }
  event deal(){

  }
  function memberAdd(address _a) onlyMembers returns(Member _m) {

      membersCount++;
      _m.a = _a;
      _m.reputation = 0;
      _m.amount = 0;
      _m.uid = membersCount;
      members[membersCount] =  _m;
  }
  function dealAdd(Deal _d) onlyMembers returns(Deal _d) {
      dealsCount++;
      _d.uid = dealsCount;
      deals[dealsCount] =  _d;
  }
  function ownerAdd(Member _m) onlyOwners returns (Member _m){
      _m = memberAdd( _m);
      ownersCount++;
      owners[ownersCount] =  _m.uid;
  }
  function memberGetPerAmount(Member _m) returns (int per){
      per = _m.amount / amountDistributedTotal;
  }
  function dealPerSetContributorsValidator(Deal _d, Member _m) returns(int per){
      per = memberGetPerAmount(_m);
      deals[_d.uid].contributorsValidatorPersAmounts[_m.uid] = per;
  }
  function dealPerSetContributorsDoing(Deal _d, Member _m) returns(int per){
      per = memberGetPerAmount(_m);
      deals[_d.uid].contributorsDoingPersAmounts[_m.uid] = per;
  }
  function dealPerSetContributorsSponsors(Deal _d, Member _m) returns(int per){
      per = memberGetPerAmount(_m);
      deals[_d.uid].contributorsSponsorsPersAmounts[_m.uid] = per;
  }
  function dealPerSetFrom(Deal _d, Member _m) returns(int per){
      per = memberGetPerAmount(_m);
    deals[_d.uid].fromPersAmounts[_m.uid] = per;
  }
  function dealPerSetTo(Deal _d, Member _m) returns(int per){
      per = memberGetPerAmount(_m);
      deals[_d.uid].toPersAmounts[_m.uid] = per;
  }
  function memberGetAmountToDistribute(int amountToDistribute, int per) returns (int amount){
      amount = amountToDistribute * per;
  }
  function dealAmountSetContributorsValidator(Deal _d, Member _m) returns(int amount){
      amount = memberGetAmountToDistribute(_d.amountToDistribute, _d.contributorsValidatorPersAmounts[_m.uid]);
      deals[_d.uid].contributorsValidatorAmounts[_m.uid] = amount;
  }
  function dealAmountSetContributorsDoing(Deal _d, Member _m) returns(int amount){
      amount = memberGetAmountToDistribute(_d.amountToDistribute, _d.contributorsDoingPersAmounts[_m.uid]);
      deals[_d.uid].contributorsDoingAmounts[_m.uid] = amount;
  }
  function dealAmountSetSponsors(Deal _d, Member _m) returns(int amount){
      amount = memberGetAmountToDistribute(_d.amountToDistribute, _d.sponsorsPersAmounts[_m.uid]);
      deals[_d.uid].sponsorsAmounts[_m.uid] = amount;
  }
  function dealAmountSetFrom(Deal _d, Member _m) returns(int amount){
      amount = memberGetAmountToDistribute(_d.amountToDistribute, _d.fromPersAmounts[_m.uid]);
      deals[_d.uid].fromAmounts[_m.uid] = amount;
  }
  function dealAmountSetTo(Deal _d, Member _m) returns(int amount){
      amount = memberGetAmountToDistribute(_d.amountToDistribute, _d.toPersAmounts[_m.uid]);
      deals[_d.uid].toAmounts[_m.uid] = amount;
  }
  function memberGetPerRepuation(Member _m) returns (int per){
      per = _m.reputation / reputationDistributedTotal;
  }
  function dealPerReputationSetContributorsValidator(Deal _d, Member _m) returns(int per){
      per = memberGetPerReputation(_m);
      deals[_d.uid].contributorsValidatorPersReputation[_m.uid] = per;
  }
  function dealPerReputationSetContributorsDoing(Deal _d, Member _m) returns(int per){
      per = memberGetPerReputation(_m);
      deals[_d.uid].contributorsDoingPersReputation[_m.uid] = per;
  }
  function dealPerReputationSetSponsor(Deal _d, Member _m) returns(int per){
      per = memberGetPerReputation(_m);
      deals[_d.uid].sponsorPersReputation[_m.uid] = per;
  }
  function dealPerReputationSetFrom(Deal _d, Member _m) returns(int per){
      per = memberGetPerReputation(_m);
      deals[_d.uid].fromPersReputation[_m.uid] = per;
  }
  function dealPerReputationSetTo(Deal _d, Member _m) returns(int per){
      per = memberGetPerReputation(_m);
      deals[_d.uid].toPersReputation[_m.uid] = per;
  }
  function memberGetReputationToDistribute(int reputationToDistribute, int per) returns (int reputation){
      reputation = reputationToDistribute * per;
  }
  function dealReputationSetContributorsValidator(Deal _d, Member _m) returns(int reputation){
      reputation = memberGetReputationToDistribute(_d.reputationToDistribute, _d.contributorsValidatorPersReputations[_m.uid]);
      deals[_d.uid].contributorsValidatorReputations[_m.uid] = reputation;
  }
  function dealReputationSetContributorsDoing(Deal _d, Member _m) returns(int reputation){
      reputation = memberGetReputationToDistribute(_d.reputationToDistribute, _d.contributorsDoingPersReputations[_m.uid]);
      deals[_d.uid].contributorsDoingReputations[_m.uid] = reputation;
  }
  function dealReputationSetSponsors(Deal _d, Member _m) returns(int reputation){
      reputation = memberGetReputationToDistribute(_d.reputationToDistribute, _d.sponsorsPersReputations[_m.uid]);
      deals[_d.uid].sponsorsReputations[_m.uid] = reputation;
  }
  function dealReputationSetFrom(Deal _d, Member _m) returns(int reputation){
      reputation = memberGetReputationToDistribute(_d.reputationToDistribute, _d.fromPersReputations[_m.uid]);
      deals[_d.uid].fromReputations[_m.uid] = reputation;
  }
  function dealReputationSetFrom(Deal _d, Member _m) returns(int reputation){
      reputation = memberGetReputationToDistribute(_d.reputationToDistribute, _d.toPersReputations[_m.uid]);
      deals[_d.uid].toReputations[_m.uid] = reputation;
  }
}
contract ContractPayment is ContractBase {

  Struct Payment {
    int amount;
    int feePer;
    mapping (address => Member) owners;
    mapping (address => Member) contribibutors;
    mapping (address => Member) destinators;
  }
  function pay(Payment _p) payable {
  }
}
contract ContractContributor is ContractBase {
  int costPer;
  mapping (address => ContractPaymentContributor) paymentContributors;
}
contract ContractContributorValidator is ContractContributor {
}
contract ContractContributorDoing is ContractContributor {
}
contract ContractSponsor is ContractBase {
  int investPer;
  mapping (address => ContractPayment) payments;
}
contract ContractPenalty is ContractBase {
  int costAmount;
  mapping (address => ContractContributorValidator) contributorValidators;
}
contract ContractGuaranty is ContractBase {
  int costAmount;
}
contract ContractVote is ContractBase {
}
contract ContractDelivrable is ContractBase {
  int costAmount;
  mapping (address => ContractContributorDoing) ContributorDoings;x
  mapping (address => ContractPenalty) penalties;
}
contract ContractProject is ContractBase {
  int investAmount;
  mapping (address => ContractSponsor) sponsors;
  mapping (address => ContractDelivrable) delivrables;
  mapping (address => ContractVote) votes;
  mapping (address => ContractGuaranty) guranties;
}
