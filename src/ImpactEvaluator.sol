// SPDX-License-Identifier: (MIT or Apache-2.0)

import "../lib/impact-evaluator/src/ImpactEvaluator.sol" as Meridian;
pragma solidity ^0.8.19;

contract ImpactEvaluator is Meridian.ImpactEvaluator {
    bytes32 public constant MEASURE_ROLE = keccak256("MEASURE_ROLE");

    constructor(address admin) Meridian.ImpactEvaluator(admin) {
        _grantRole(MEASURE_ROLE, admin);
        _grantRole(MEASURE_ROLE, 0xAf992Fbc0c22BC941A232c63dc1b0c0cD572D145);
        _grantRole(EVALUATE_ROLE, 0xB0a808b5C49f5Ed7Af9EcAAaF033B2d937692877);
        setRoundReward(1 ether);
        setNextRoundLength(60);
    }

    function addMeasurements(
        string memory cid
    ) public override returns (uint) {
        require(hasRole(MEASURE_ROLE, msg.sender), "Not a sensor");
        return super.addMeasurements(cid);
    }
}
