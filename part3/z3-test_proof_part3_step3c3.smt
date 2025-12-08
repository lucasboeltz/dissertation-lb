; start Z3 with flag -smt2
(set-option :produce-unsat-cores true)
; (set-option :sat.core.minimize true)
; (set-option :smt.core.minimize true)

(declare-sort point)
(declare-const u1 point)
(declare-const v1 point)
(declare-const y2 point)
(declare-const z3 point)
(declare-const y4 point)
(declare-const z5 point)
(declare-const w5 point)
(declare-const y5 point)
(declare-fun left (point point point) Bool)
(declare-fun intersection (point point point point) Bool)
(declare-fun inside (point point point point) Bool)
(declare-fun V (point) Bool)
(declare-fun E (point point) Bool)
(declare-fun F (point point) Bool)
(declare-fun deleting (point point point point) Bool)




;used formula A1-6, I1-6, I11-16, T1-4, E1-3, F1-5, R1, C1, D1-5, D11-14

(assert (! (forall ((u point) (v point) (w point)) (=> (and (left u v w) (left v u w)) (not (left w u v)))) :named A1))   
;if  w is left of uv and w is left of vu, then v is not left of wu     
(assert (! (forall ((u point) (v point) (w point)) (=> (and (not (= u w)) (not (= v w)) (not (left w u v)) (not (left w v u))) (left u v w))) :named A2))  
;if v is not left of wu and u is not left of wv, then w is left of uv (and also left of vu and therefore w is between uv)
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v w) (left v u w) (left u x w)) (left u x v))) :named A3))
;if w is between u and v and w is left of ux, then v is also left of ux 
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v w) (left v u w) (left u x v)) (left u x w))) :named A4))
;if w is between u and v and v is left of ux, then w is also left of ux 
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v w) (left v w u) (left w u v)) (or (left u v x) ( left v w x) ( left w u x)))) :named A5))
;If w is left of uv, u is left uf vw and v is left of wu, then x is left of uv, vw or wu.
(assert (! (forall ((u point) (v point) (w point) (x point) (y point) (z point)) (=> (and (left u v z) (left v w z) (left w u z) (left x y u) (left x y v) (left x y w)) (left x y z))) :named A6))
;If all 3 vertices u,v,w of a triangle are located left of a line yz, then also the point inside the triangle is left of this line. 




;condition for a possible inersection
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (intersection u v w x) (or (not (= u w)) (not (= v x))))) :named I1))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (intersection u v w x) (or (not (= u x)) (not (= v w))))) :named I2))

(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (intersection u v w x) (or (left u v w) (left u v x)))) :named I3))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (intersection u v w x) (or (left v u x) (left v u w)))) :named I4))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (intersection u v w x) (or (left w x u) (left w x v)))) :named I5))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (intersection u v w x) (or (left x w v) (left x w u)))) :named I6))

(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v w) (left v u x) (left w x u) (left x w v)) (or (= u x) (intersection u v w x)))) :named I11))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v w) (left v u x) (left w x u) (left x w v)) (or (= v w) (intersection u v w x)))) :named I12))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v w) (left v u x) (left w x v) (left x w u)) (intersection u v w x))) :named I13))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v x) (left v u w) (left w x u) (left x w v)) (intersection u v w x))) :named I14))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v x) (left v u w) (left w x v) (left x w u)) (or (= u w) (intersection u v w x)))) :named I15))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (left u v x) (left v u w) (left w x v) (left x w u)) (or (= v x) (intersection u v w x)))) :named I16))



;condition for vertices inside a triangle
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (inside u v w x) (left u v x))) :named T1))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (inside u v w x) (left v w x))) :named T2))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (inside u v w x) (left w u x))) :named T3))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and ( left u v x) (left v w x) (left w u x )) (inside u v w x))) :named T4))
;a vertex x is inside the traingle uvw iff it is left of uv, vw and wu.
;(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and ( left u v x) (left v w x) (left w u x )) (inside v w u x))) :named T5))
;(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and ( left u v x) (left v w x) (left w u x )) (inside w u v x))) :named T6))
;The triangles uvw, vwu and wuv are equivalent


;condition on edges
(assert (! (forall ((u point)) (not (E u u ))) :named E1))
(assert (! (forall ((u point) (v point)) (=> (E u v) (E v u))) :named E2))
(assert (! (forall ((u point) (v point)) (=> (E u v) (V u))) :named E3))

;redundancy property
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (E u v) (E w x) (intersection u v w x )) (or (E u w) (E v x)))) :named R1))

;coexistence property
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (E u v) (E v w) (E w u) (V x) (inside u v w x )) (E u x))) :named C1))

;conditions for the connected and intersection-free subgraph F
(assert (! (forall ((u point) (v point)) (=> (F u v) (F v u))) :named F1))
;F is symmetric
(assert (! (forall ((u point) (v point)) (=> (F u v) (E u v))) :named F2))
;F is a subset of E
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (F u v) (F w x)) (not (intersection u v w x)))) :named F3))
;edges in F do not intersect
(assert (! (forall ((u point) (v point) (w point)) (=> (and (left u v w) (left v u w) (V w)) (not (F u v)))) :named F4))
;no vertex can be located on an edge of F
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (F u v) (E w x) (intersection u v w x)) (or (E u w) (E v w)))) :named F5))
;(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (F u v) (E w x) (intersection u v w x)) (or (E u x) (E v x)))) :named F6))
;CP-Condition (only one of F5 and F6 is needed due to symmetry)

;conditions for the predicate deleting
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (deleting u v w x) (E u v))) :named D1))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (deleting u v w x) (E w x))) :named D2))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (deleting u v w x) (intersection u v w x))) :named D3))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (deleting u v w x) (E u w))) :named D4))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (deleting u v w x) (E v w))) :named D5))
;If wx delets uv, then the edges uw and vw exist.

(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (E u x) (deleting u v w x)) (F w x))) :named D11))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (E v x) (deleting u v w x)) (F w x))) :named D12))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (E u v) (E w x) (intersection u v w x)) (or (deleting u v w x) (E u x) (E v x)))) :named D13))
(assert (! (forall ((u point) (v point) (w point) (x point)) (=> (and (intersection u v w x) (E u v) (F w x) (E u w) (E v w)) (deleting u v w x))) :named D14))


;no edge yz intersecting with u1v1 is in F
(assert (! (forall ((y point) (z point)) (=> (intersection u1 v1 y z) (not (F y z)))) :named P1))
(assert (! (forall ((y point)) (or (not (left u1 v1 y)) (not (left v1 u1 y)))) :named P2))


;all edges deleting y2z3 are type Y edges
(assert (! (forall ((w point) (x point)) (=> (deleting y2 z3 w x) (or (intersection u1 v1 w z3) (deleting y2 z3 x w)))) :named U3))
(assert (! (forall ((w point) (x point)) (=> (deleting y2 z3 w x) (or (intersection u1 v1 w z3) (intersection u1 v1 x z3)))) :named U4))

;all edges deleting y4z3 are type Z edges
(assert (! (forall ((w point) (x point)) (=> (deleting y4 z3 w x) (or (intersection u1 v1 y4 w) (deleting y4 z3 x w)))) :named U5))
(assert (! (forall ((w point) (x point)) (=> (deleting y4 z3 w x) (or (intersection u1 v1 y4 w) (intersection u1 v1 y4 x)))) :named U6))

;all edges deleting y4z5 are type Y edges
(assert (! (forall ((w point) (x point)) (=> (deleting y4 z5 w x) (or (intersection u1 v1 w z5) (deleting y4 z5 x w)))) :named U7))
(assert (! (forall ((w point) (x point)) (=> (deleting y4 z5 w x) (or (intersection u1 v1 w z5) (intersection u1 v1 x z5)))) :named U8))




;The negation of the conclusion (but then the "conjectures" part should be left empty).


(assert (! (E u1 v1) :named Q1))
(assert (! (E y2 z3) :named Q2))
(assert (! (intersection u1 v1 y2 z3) :named Q3))

(assert (! (E y2 y4) :named Q11))
(assert (! (E y4 z3) :named Q12))
(assert (! (intersection u1 v1 y4 z3) :named Q13))

(assert (! (E y4 z5) :named Q21))
(assert (! (intersection u1 v1 y4 z5) :named Q22))
(assert (! (inside y4 y2 z3 z5) :named Q23))

(assert (! (E w5 z5) :named Q31))
(assert (! (intersection u1 v1 w5 z5) :named Q32))

(assert (! (inside y4 w5 z5 y5) :named Q41))

(assert (! (intersection y2 z3 y5 z5) :named Q51))


(assert (! (not (intersection y2 z3 w5 z5)) :named Q101))

(assert (! (not (intersection y4 z3 w5 z5)) :named Q111))

(assert (! (not (inside z5 z3 y4 w5)) :named Q201))

(check-sat)
(get-unsat-core)
;(get-model)