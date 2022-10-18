# Grocery Shop

## Goal

The goal of this exercise is to develop a `Grocery Shop` smart contract. This `Grocery Shop` has 3 kinds of groceries

-   Bread (GroceryType: 1)
-   Egg (GroceryType: 2)
-   Jam (GroceryType: 3)

This shop maintains a cash register which keeps records of all groceries.

Complete this contract with following specifications for each function

-   constructor(uint256 breadCount, uint256 eggCount, uint256 jamCount)

    -   Takes initial number of items of each grocery in order - Bread, Egg and Jam, and stores them.
    -   Should save the sender of this transaction as **owner**.

-   add

    -   This function is only callable by owner.
    -   It takes in the `Grocery Type` as first parameter and number of units to add as the second parameter.
    -   It should emit an event named `Added` with parameters `Grocery Type` and `Number of units added`.

-   buy

    -   This function takes in `Grocery Type` and `Number of units to buy` as parameters.
    -   For simplicity, the price of each unit in shop irrespective of its type is **0.01 ether**.
    -   It should emit an event named `Bought` with parameters `Purchase Id`, `Grocery Type` and `Number of units bought`. The `Purchase Id` in this case should start from **1** and increment sequentially on every purchase.

-   withdraw

    -   This function is only callable by owner.
    -   It should transfer the entire amount in contract to the owner.

## Submission

-   Deploy this contract on Goerli testnet and submit the contract address.


## Note

-   Add proper checks for invalid inputs and error cases.
-   Use modifier where appropriate.
-   User enums and structs where appropriate.
