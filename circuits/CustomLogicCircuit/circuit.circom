pragma circom 2.0.0;

template customCircuit () {  

   //signal inputs  
   signal input A;  
   signal input B;  
   //signal from gates
   signal X;
   signal Y;
   //output signal
   signal output Q;

   //Gates Used
   component andG = AND();
   component notG = NOT();
   component orG = OR();

   //logic 
   andG.a <== A;
   andG.b <== B;
   notG.in <==B;

   X <== andG.out;
   Y <== notG.out;

   orG.a <== X;
   orG.b <== Y;

   Q <== orG.out;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = customCircuit();