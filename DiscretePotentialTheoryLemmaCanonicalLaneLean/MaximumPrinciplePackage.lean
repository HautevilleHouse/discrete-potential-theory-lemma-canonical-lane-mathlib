import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure MaximumPrinciplePackage (G : DiscretePotentialSpace) where
  discreteMaximumPrinciple : ∀ (u : HarmonicFunction G) (x : G.vertices),
    (∀ y, weight x y > 0 → u.values y ≤ u.values x) → u.values x = max_{y} u.values y
  boundaryMaximum : Prop
  strictMaximumPrinciple : Prop
  uniquenessCorollary : Prop

structure MaximumPrincipleEvidence {G : DiscretePotentialSpace}
  (M : MaximumPrinciplePackage G) where
  discreteMaximumPrincipleClosed : M.discreteMaximumPrinciple
  boundaryMaximumClosed : M.boundaryMaximum
  strictMaximumPrincipleClosed : M.strictMaximumPrinciple
  uniquenessCorollaryClosed : M.uniquenessCorollary

def MaximumPrincipleClosed {G : DiscretePotentialSpace}
  (M : MaximumPrinciplePackage G) : Prop :=
  M.discreteMaximumPrinciple ∧ M.boundaryMaximum ∧
  M.strictMaximumPrinciple ∧ M.uniquenessCorollary

theorem maximum_principle_closed_from_evidence
  {G : DiscretePotentialSpace} (M : MaximumPrinciplePackage G)
  (E : MaximumPrincipleEvidence M) : MaximumPrincipleClosed M := by
  exact And.intro E.discreteMaximumPrincipleClosed
    (And.intro E.boundaryMaximumClosed
      (And.intro E.strictMaximumPrincipleClosed E.uniquenessCorollaryClosed))

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse