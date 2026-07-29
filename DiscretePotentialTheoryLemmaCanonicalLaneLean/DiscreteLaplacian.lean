import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscreteLaplacian (V : Type) where
  vertexSet : Set V
  weightFunction : V → V → ℝ
  laplacian : (V → ℝ) → (V → ℝ)
  sumNegligible : Prop

structure DiscreteLaplacianEvidence (L : DiscreteLaplacian V) where
  laplacianDefined : ∀ (f : V → ℝ), L.laplacian f = λ v => ∑ u in L.vertexSet, L.weightFunction v u * (f v - f u)
  sumNegligibleClosed : L.sumNegligible
  weightSymmetric : ∀ u v, L.weightFunction u v = L.weightFunction v u

def DiscreteLaplacianClosed (L : DiscreteLaplacian V) : Prop :=
  ∀ (f : V → ℝ), L.laplacian f = λ v => ∑ u in L.vertexSet, L.weightFunction v u * (f v - f u) ∧
  L.sumNegligible ∧
  (∀ u v, L.weightFunction u v = L.weightFunction v u)

theorem discrete_laplacian_closed_from_evidence (L : DiscreteLaplacian V) (E : DiscreteLaplacianEvidence L) : DiscreteLaplacianClosed L := by
  exact And.intro E.laplacianDefined (And.intro E.sumNegligibleClosed E.weightSymmetric)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse