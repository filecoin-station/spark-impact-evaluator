// SPDX-License-Identifier: (MIT or Apache-2.0)

import "../lib/impact-evaluator/src/ImpactEvaluator.sol" as Meridian;
pragma solidity ^0.8.19;

contract ImpactEvaluator is Meridian.ImpactEvaluator {
    bytes32 public constant MEASURE_ROLE = keccak256("MEASURE_ROLE");

    constructor(address admin) Meridian.ImpactEvaluator(admin) {
        _grantRole(MEASURE_ROLE, admin);
        _grantRole(MEASURE_ROLE, 0x53bDfdEa92f7A60aeF82228926d02878018acB4e);
        _grantRole(EVALUATE_ROLE, 0x4EcdC893Beb09121E4F5cBba469D33F5fF618442);
        _grantRole(DEFAULT_ADMIN_ROLE, 0x646ac6F1941CAb0ce3fE1368e9AD30364a9F51dA); // @bajtos
        _grantRole(DEFAULT_ADMIN_ROLE, 0xa0e36151B7074A4F2ec31b741C27E46FcbBE5379); // @patrickwoodhead
        _grantRole(DEFAULT_ADMIN_ROLE, 0x3ee4A552b1a6519A266AEFb0514633F289FF2A9F); // @juliangruber
        // 30 minutes
        setNextRoundLength(30 * 2);
        // 200 FIL / month
        setRoundReward(200 ether / (43800 / nextRoundLength * 2));
        setMaxTransfersPerTx(10);
    }

    function addMeasurements(
        string memory cid
    ) public override returns (uint) {
        require(hasRole(MEASURE_ROLE, msg.sender), "Not a sensor");
        return super.addMeasurements(cid);
    }
}
