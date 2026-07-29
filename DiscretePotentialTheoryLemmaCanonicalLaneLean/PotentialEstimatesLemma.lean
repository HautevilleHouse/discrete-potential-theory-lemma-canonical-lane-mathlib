import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscretePotentialEstimatesLemma {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} (H : HarmonicFunctionPackage L) (Gr : DiscreteGreenFunction H) where
  harnackInequality : Prop
  poissonFormula : Prop
  decayEstimate : Prop
  stabilityUnderPerturbation : Prop

structure PotentialEstimatesEvidence {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} {Gr : DiscreteGreenFunction H} (P : DiscretePotentialEstimatesLemma H Gr) where
  harnackInequalityClosed : P.harnackInequality
  poissonFormulaClosed : P.poissonFormula
  decayEstimateClosed : P.decayEstimate
  stabilityUnderPerturbationClosed : P.stabilityUnderPerturbation

def DiscretePotentialEstimatesClosed {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} {Gr : DiscreteGreenFunction H} (P : DiscretePotentialEstimatesLemma H Gr) : Prop :=
  P.harnackInequality ∧ P.poissonFormula ∧ P.decayEstimate ∧ P.stabilityUnderPerturbation

theorem potential_estimates_closed_from_evidence {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} {Gr : DiscreteGreenFunction H} (P : DiscretePotentialEstimatesLemma H Gr) (E : PotentialEstimatesEvidence P) : DiscretePotentialEstimatesClosed P := by
  exact And.intro E.harnackInequalityClosed (And.intro E.poissonFormulaClosed (And.intro E.decayEstimateClosed E.stabilityUnderPerturbationClosed))

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse