// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GroceryShop {
    enum GroceryType {
        Bread,
        Egg,
        Jam
    }

    struct Purchase {
        address buyer;
        GroceryType item;
        uint256 count;
    }

    event Added(GroceryType groceryType, uint256 units);
    event Bought(uint256 purchaseId, GroceryType groceryType, uint256 units);

    mapping(uint256 => Purchase) public cashRegister;
    mapping(GroceryType => uint256) itemCount;

    address public owner;
    uint256 public lastPurchaseId;

    constructor(
        uint256 breadCount,
        uint256 eggCount,
        uint256 jamCount
    ) {
        itemCount[GroceryType.Bread] = breadCount;
        itemCount[GroceryType.Egg] = eggCount;
        itemCount[GroceryType.Jam] = jamCount;

        owner = msg.sender;
    }

    function add(GroceryType groceryType, uint256 units) external {
        require(msg.sender == owner, "Not owner!");
        itemCount[groceryType] += units;

        emit Added(groceryType, units);
    }

    function buy(GroceryType groceryType, uint256 units) external payable {
        require(msg.value == units * 0.01 ether, "Invalid amount!");

        itemCount[groceryType] -= units;
        lastPurchaseId++;

        cashRegister[lastPurchaseId] = Purchase({
            buyer: msg.sender,
            item: groceryType,
            count: units
        });

        emit Bought(lastPurchaseId, groceryType, units);
    }
}
