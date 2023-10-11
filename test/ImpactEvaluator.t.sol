// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/ImpactEvaluator.sol";

contract ImpactEvaluatorTest is Test {
    function test_Constructor() public {
        ImpactEvaluator impactEvaluator = new ImpactEvaluator(address(this));
        assertEq(impactEvaluator.roundReward(), 1 ether);
        assertEq(impactEvaluator.nextRoundLength(), 60);
    }

    function test_AddMeasurements() public {
        ImpactEvaluator impactEvaluator = new ImpactEvaluator(address(this));
        impactEvaluator.addMeasurements("cid");
    }

    function test_AddMeasurementsNotSensor() public {
        ImpactEvaluator impactEvaluator = new ImpactEvaluator(address(this));
        impactEvaluator.revokeRole(impactEvaluator.MEASURE_ROLE(), address(this));
        vm.expectRevert("Not a sensor");
        impactEvaluator.addMeasurements("cid");
    }
}
