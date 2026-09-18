# dissertation-lb

# Automated Reasoning for the Construction of Connected and Plane Graphs

This repository contains the core codebase and implementation developed as part of my PhD dissertation. The primary objective of this project is the **formal verification of an algorithm designed for the connected planarization of graphs**. Moreover graph constructions for connected plane graphs, such as Gabriel graphs and Relative Neighboorhood graphs **(Section3)** and axiomatically defined geometric graphs, such as generalizations of Unit-Disk-Graphs are regarded **(Section4)**. 

## Methodological Approach & Core Architecture

To achieve mathematical certainty, a comprehensive, manually developed correctness proof was decomposed into distinct, localized proof steps (lemmas/sub-goals). These individual steps were formalized into logical constraints, enabling automated solvers to rigorously verify satisfiability and correctness.

* **Frameworks & Tools:** Z3 SMT-Solver, H-PiLoT (Hierarchical Reasoning, Section3) and Wolfram Mathematica (Section4).
* **Core Paradigm:** Neuro-symbolic foundations, Automated Reasoning, and Constraint-based Verification of Graphs, Geometry and Algorithms.

This approach of decomposing complex reasoning chains into verifiable sub-steps directly mirrors the modern architectures used in **LLM Chain-of-Thought (CoT) verification** and **automated logic alignment** for next-generation AI models.

## Performance Benchmarks & Runtime Evaluation

The performance and scalability of the automated reasoning tools were analyzed across various proof steps, tracking clauses, graph complexity, and solver execution times. 
