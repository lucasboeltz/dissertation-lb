The tests in this directory show that all axioms are idependent of each other.

The axiom system is therefore minimal, i.e no subset of axiom system satisies all properties of the axiom system.

The test z3-test_XY, where XY is the name of the considered axiom outputs a model where the axiom XY is not satisfied, but all the other axioms are.
z3-test_XY.smt is the input file and z3-test_XY.out the output file.

The test z3-test_A5_5points showes that axiom A5 is implied by the other axioms if at least 5 different points exist. 

The test z3-test_consistent showes that the axiom system is defined consistently, i.e. no contradication is obtained by the axioms themeselves.
The test z3-test_consistent_5points showes that the axiom system is defined consistently, when 5 pairwise distinct points are considered.
