// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/Spark.sol";

contract SparkTest is Test {
    function test_Constructor() public {
        Spark spark = new Spark(address(this));
        assertEq(spark.nextRoundLength(), 40);
        assertEq(spark.roundReward(), 0.456621004566210045 ether);
    }

    function test_AddMeasurements() public {
        Spark spark = new Spark(address(this));
        spark.addMeasurements("cid");
    }

    function test_AddMeasurementsNotSensor() public {
        Spark spark = new Spark(address(this));
        spark.revokeRole(
            spark.MEASURE_ROLE(),
            address(this)
        );
        vm.expectRevert("Not a sensor");
        spark.addMeasurements("cid");
    }
}
