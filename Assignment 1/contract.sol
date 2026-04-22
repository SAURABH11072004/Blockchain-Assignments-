// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductStore {

    struct Product {
        uint id;
        string name;
        uint price;
        address owner;
    }

    mapping(uint => Product) public products;
    uint public productCount = 0;

    function addProduct(string memory _name, uint _price) public {
        productCount++;
        products[productCount] = Product(productCount, _name, _price, msg.sender);
    }

    function buyProduct(uint _id) public payable {
        Product memory product = products[_id];
        require(msg.value >= product.price, "Not enough Ether");

        payable(product.owner).transfer(msg.value);
        products[_id].owner = msg.sender;
    }
}
