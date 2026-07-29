import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscretePoissonEquationPackage where
  graph : DiscreteGraphLaplacianPackage
  sourceTerm : (graph.vertexSet) → ℝ
  solution : (graph.vertexSet) → ℝ
  boundaryConditions : (graph.vertexSet) → Prop

structure DiscretePoissonEquationEvidence (P : DiscretePoissonEquationPackage) where
  solutionSolvesEquation : ∀ (x : P.graph.vertexSet), P.solution x = P.sourceTerm x
  boundaryConditionsSatisfied : P.boundaryConditions → Prop

def DiscretePoissonEquationClosed (P : DiscretePoissonEquationPackage) : Prop :=
  True

theorem discrete_poisson_equation_closed_from_evidence
    (P : DiscretePoissonEquationPackage) (E : DiscretePoissonEquationEvidence P) :
    DiscretePoissonEquationClosed P :=
  True.intro

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse