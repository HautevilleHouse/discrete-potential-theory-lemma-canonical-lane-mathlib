import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscreteMaximumPrinciplePackage where
  vertexSet : Type
  edgeSet : Type
  harmonicFunction : (vertexSet → ℝ) → Prop
  maximumPrincipleStatement : (f : vertexSet → ℝ) → harmonicFunction f → (∀ x, f x ≤ (max' (Finset.image f (Finset.univ : Finset vertexSet))).val)

structure DiscreteMaximumPrincipleEvidence (M : DiscreteMaximumPrinciplePackage) where
  maximumPrincipleClosed : ∀ (f : M.vertexSet → ℝ), M.harmonicFunction f → (∀ x, f x ≤ (max' (Finset.image f (Finset.univ : Finset M.vertexSet))).val)

def DiscreteMaximumPrincipleClosed (M : DiscreteMaximumPrinciplePackage) : Prop :=
  ∀ (f : M.vertexSet → ℝ), M.harmonicFunction f → (∀ x, f x ≤ (max' (Finset.image f (Finset.univ : Finset M.vertexSet))).val)

theorem discrete_maximum_principle_closed_from_evidence (M : DiscreteMaximumPrinciplePackage) (E : DiscreteMaximumPrincipleEvidence M) :
    DiscreteMaximumPrincipleClosed M := by
  exact E.maximumPrincipleClosed

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse
