import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure HarmonicFunction (V : Type) where
  graph : V → Set V
  laplacian : DiscreteLaplacian V
  functionValue : V → ℝ
  harmonicProperty : Prop

structure HarmonicFunctionEvidence (H : HarmonicFunction V) where
  laplacianClosed : DiscreteLaplacianClosed H.laplacian
  harmonicPropertyClosed : H.harmonicProperty
  meanValueProperty : ∀ v, (∑ u in H.graph v, H.functionValue u) = (Finset.card (H.graph v) : ℝ) * H.functionValue v

def HarmonicFunctionClosed (H : HarmonicFunction V) : Prop :=
  DiscreteLaplacianClosed H.laplacian ∧ H.harmonicProperty ∧
  (∀ v, (∑ u in H.graph v, H.functionValue u) = (Finset.card (H.graph v) : ℝ) * H.functionValue v)

theorem harmonic_function_closed_from_evidence (H : HarmonicFunction V) (E : HarmonicFunctionEvidence H) : HarmonicFunctionClosed H := by
  exact And.intro E.laplacianClosed (And.intro E.harmonicPropertyClosed E.meanValueProperty)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse