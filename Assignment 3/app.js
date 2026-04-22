let web3;
let contract;

const contractAddress = "YOUR_CONTRACT_ADDRESS";
const abi = [/* paste ABI here */];

window.onload = async () => {
    if (window.ethereum) {
        web3 = new Web3(window.ethereum);
        await ethereum.request({ method: 'eth_requestAccounts' });
        contract = new web3.eth.Contract(abi, contractAddress);
    }
};

async function addProduct() {
    const accounts = await web3.eth.getAccounts();
    const name = document.getElementById("name").value;
    const price = document.getElementById("price").value;

    await contract.methods.addProduct(name, price)
        .send({ from: accounts[0] });
}
