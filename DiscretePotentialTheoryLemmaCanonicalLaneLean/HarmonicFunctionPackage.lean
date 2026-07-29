import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure HarmonicFunctionPackage {V : Type u} {G : GraphLaplacianWeightedGraph V} (L : LaplacianOperator G) where
  zeroBoundary : Set V
  interior : Set V
  harmonicEquation : (V → ℝ) → Prop
  solutionSpace : Type v
  uniquenessCondition : Prop

structure HarmonicFunctionEvidence {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} (H : HarmonicFunctionPackage L) where
  harmonicEquationDef : ∀ (f : V → ℝ), H.harmonicEquation f ↔ ∀ v ∈ H.interior, L.laplacianAction f v = 0
  solutionSpaceNonempty : Nonempty H.solutionSpace
  uniquenessConditionClosed : H.uniquenessCondition

def HarmonicFunctionPackageClosed {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} (H : HarmonicFunctionPackage L) : Prop :=
  (∀ (f : V → ℝ), H.harmonicEquation f ↔ ∀ v ∈ H.interior, L.laplacianAction f v = 0) ∧
  Nonempty H.solutionSpace ∧
  H.uniquenessCondition

theorem harmonic_package_closed_from_evidence {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} (H : HarmonicFunctionPackage L) (E : HarmonicFunctionEvidence H) : HarmonicFunctionPackageClosed H := by
  exact And.intro E.harmonicEquationDef (And.intro E.solutionSpaceNonempty E.uniquenessConditionClosed)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse