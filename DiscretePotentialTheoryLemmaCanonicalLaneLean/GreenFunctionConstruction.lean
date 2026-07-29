import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure GreenFunctionConstruction (G : DiscretePotentialSpace) where
  greenFunction : G.vertices → G.vertices → ℝ
  symmetricGF : ∀ x y, greenFunction x y = greenFunction y x
  laplaceGF : ∀ x y, x ≠ y → (G.weight x y) * (greenFunction y y - greenFunction x y) = 0
  boundaryCondition : Prop
  positivityCondition : Prop
  greensIdentityHolds : Prop

structure GreenFunctionEvidence {G : DiscretePotentialSpace}
  (C : GreenFunctionConstruction G) where
  symmetricGFClosed : C.symmetricGF
  laplaceGFClosed : C.laplaceGF
  boundaryConditionClosed : C.boundaryCondition
  positivityConditionClosed : C.positivityCondition
  greensIdentityClosed : C.greensIdentityHolds

def GreenFunctionClosed {G : DiscretePotentialSpace}
  (C : GreenFunctionConstruction G) : Prop :=
  C.symmetricGF ∧ C.laplaceGF ∧ C.boundaryCondition ∧
  C.positivityCondition ∧ C.greensIdentityHolds

theorem green_function_closed_from_evidence
  {G : DiscretePotentialSpace} (C : GreenFunctionConstruction G)
  (E : GreenFunctionEvidence C) : GreenFunctionClosed C := by
  exact And.intro E.symmetricGFClosed
    (And.intro E.laplaceGFClosed
      (And.intro E.boundaryConditionClosed
        (And.intro E.positivityConditionClosed E.greensIdentityClosed)))

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse