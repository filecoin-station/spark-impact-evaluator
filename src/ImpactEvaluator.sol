// SPDX-License-Identifier: (MIT or Apache-2.0)

import "../lib/impact-evaluator/src/ImpactEvaluator.sol" as Meridian;
pragma solidity ^0.8.19;

contract ImpactEvaluator is Meridian.ImpactEvaluator {
    bytes32 public constant MEASURE_ROLE = keccak256("MEASURE_ROLE");

    constructor(address admin) Meridian.ImpactEvaluator(admin) {
        _grantRole(MEASURE_ROLE, admin);
        _grantRole(MEASURE_ROLE, 0x53bDfdEa92f7A60aeF82228926d02878018acB4e);
        _grantRole(EVALUATE_ROLE, 0x4EcdC893Beb09121E4F5cBba469D33F5fF618442);
        setNextRoundLength(120); // 60 minutes
        setRoundReward(0.2739726027 ether);
        setMaxTransfersPerTx(10);
    }

    function addMeasurements(
        string memory cid
    ) public override returns (uint) {
        require(hasRole(MEASURE_ROLE, msg.sender), "Not a sensor");
        return super.addMeasurements(cid);
    }
}
