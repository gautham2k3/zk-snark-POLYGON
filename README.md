# Custom Zero-Knowledge Circuit 

This provides an overview of a custom zero-knowledge circuit implemented using the Circom language. The circuit, named `customCircuit`, demonstrates the creation of logic gates and their connections to create a custom computation. The resulting circuit can be used to generate zero-knowledge proofs for certain computations while keeping the input values private.

## Circuit Overview

The `customCircuit` demonstrates the use of logic gates to compute an output signal based on input signals. The circuit involves the following components:

![Circuit Diagram](https://authoring.metacrafters.io/assets/cms/Assessment_b05f6ed658.png?updated_at=2023-02-24T00:00:37.278Z)


- **Inputs**: The circuit takes two input signals, `A` and `B`, which serve as operands for the computation.
- **Gates**: The circuit uses three logic gates: `AND`, `NOT`, and `OR`. These gates are defined as separate templates.
- **Intermediate Signals**: The circuit has two intermediate signals, `X` and `Y`, which are the outputs of the `AND` and `NOT` gates, respectively.
- **Output**: The final output signal, `Q`, is computed using the `OR` gate with inputs from the intermediate signals.

## Circuit Templates

### `customCircuit`

The `customCircuit` template represents the main circuit. It defines input signals `A` and `B`, intermediate signals `X` and `Y`, and the final output signal `Q`. The circuit involves the following steps:

1. An `AND` gate (`andG`) computes the logical AND of inputs `A` and `B`, and its output is stored in the intermediate signal `X`.
2. A `NOT` gate (`notG`) computes the logical NOT of input `B`, and its output is stored in the intermediate signal `Y`.
3. An `OR` gate (`orG`) computes the logical OR of the intermediate signals `X` and `Y`, resulting in the final output signal `Q`.

### `AND`, `NOT`, and `OR`

These templates define the logic for the `AND`, `NOT`, and `OR` gates, respectively. Each gate takes input signals and produces an output signal based on the defined logic.

## How to Use

1. Install the required dependencies by running the command:
   ```
   npm install
   ```
   > Add an .env File to store the private key of the Account using to deploy the project

2. Compile the circuit using the command:
   ```
   npx hardhat circom
   ```
   This will generate circuit intermediaries and the necessary Solidity verifier contracts.

3. Generate a proof and deploy a verifier contract using the provided script:
   Deploying on Local Hardhat Network
   ```
   npx hardhat run scripts/deploy.ts
   ```
   Deploying on Mumbai Test Network
   ```
   npx hardhat run scripts/deploy.ts --network mumbai
   ```
   This script performs the following tasks:
   - Deploys the verifier contract.
   - Generates a proof using circuit intermediaries.
   - Generates calldata for verification.
   - Calls `verifyProof()` on the verifier contract with calldata for proof verification.

## Configuration
### Directory Structure
**circuits**
```
├── CustomLogicCircuit
│   ├── circuit.circom
│   ├── input.json
│   └── out
│       ├── circuit.wasm
│       ├── CustomLogicCircuit.r1cs
│       ├── CustomLogicCircuit.vkey
│       └── CustomLogicCircuit.zkey
├── new-circuit
└── powersOfTau28_hez_final_12.ptau
```
**contracts**
```
contracts
└── CustomLogicCircuitVerifier.sol
```


## Conclusion

The `customCircuit` demonstrates the construction of a zero-knowledge circuit using logic gates. By following the provided steps, you can compile the circuit, generate proofs, deploy verifier contracts, and perform zero-knowledge proof verification. 
## Authors

- [B Gautham Naidu](https://www.github.com/gautham2k3)
- bgautham27@gmail.com


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

