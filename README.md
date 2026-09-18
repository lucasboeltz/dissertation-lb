# dissertation-lb

# Formal Verification of Connected Planarization Graph Algorithms

This repository contains the core codebase and implementation developed as part of my PhD dissertation. The primary objective of this project is the **formal verification of an algorithm designed for the connected planarization of graphs**.

## Methodological Approach & Core Architecture

To achieve mathematical certainty, a comprehensive, manually developed correctness proof was decomposed into distinct, localized proof steps (lemmas/sub-goals). These individual steps were formalized into logical constraints, enabling automated solvers to rigorously verify satisfiability and correctness.

* **Frameworks & Tools:** Wolfram Mathematica, Z3 SMT-Solver, and H-PiLoT (Hierarchical Reasoning).
* **Core Paradigm:** Neuro-symbolic foundations, Automated Reasoning, and Constraint-based Verification of Discrete Structures.

This approach of decomposing complex reasoning chains into verifiable sub-steps directly mirrors the modern architectures used in **LLM Chain-of-Thought (CoT) verification** and **automated logic alignment** for next-generation AI models.

## Performance Benchmarks & Runtime Evaluation

The performance and scalability of the automated reasoning tools were analyzed across various proof steps, tracking clauses, graph complexity, and solver execution times. 
