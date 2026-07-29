import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscreteGreenFunction {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} (H : HarmonicFunctionPackage L) where
  basePoint : V
  greenFunction : V → V → ℝ
  laplacianGreen : ∀ (v w : V), L.laplacianAction (λ x => greenFunction x w) v = if v = w then 1 else 0
  symmetry : ∀ v w, greenFunction v w = greenFunction w v
  positivityOnInterior : ∀ v ∈ H.interior, greenFunction v v ≥ 0

structure GreenFunctionEvidence {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} (Gr : DiscreteGreenFunction H) where
  laplacianGreenClosed : ∀ (v w : V), L.laplacianAction (λ x => Gr.greenFunction x w) v = if v = w then 1 else 0
  symmetryClosed : ∀ v w, Gr.greenFunction v w = Gr.greenFunction w v
  positivityClosed : ∀ v ∈ H.interior, Gr.greenFunction v v ≥ 0

def DiscreteGreenFunctionClosed {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} (Gr : DiscreteGreenFunction H) : Prop :=
  (∀ (v w : V), L.laplacianAction (λ x => Gr.greenFunction x w) v = if v = w then 1 else 0) ∧
  (∀ v w, Gr.greenFunction v w = Gr.greenFunction w v) ∧
  (∀ v ∈ H.interior, Gr.greenFunction v v ≥ 0)

theorem green_function_closed_from_evidence {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} (Gr : DiscreteGreenFunction H) (E : GreenFunctionEvidence Gr) : DiscreteGreenFunctionClosed Gr := by
  exact And.intro E.laplacianGreenClosed (And.intro E.symmetryClosed E.positivityClosed)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse