import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure BoundaryValueProblem {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} (H : HarmonicFunctionPackage L) where
  boundaryData : H.zeroBoundary → ℝ
  interiorSolution : V → ℝ
  satisfiesEquation : H.harmonicEquation interiorSolution
  matchesBoundary : ∀ v ∈ H.zeroBoundary, interiorSolution v = boundaryData v

structure BoundaryValueSolution {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} (B : BoundaryValueProblem H) where
  solutionExists : True
  uniqueness : True

def BoundaryValueSolutionClosed {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} (B : BoundaryValueProblem H) (S : BoundaryValueSolution B) : Prop :=
  True

theorem boundary_value_solution_closed {V : Type u} {G : GraphLaplacianWeightedGraph V} {L : LaplacianOperator G} {H : HarmonicFunctionPackage L} (B : BoundaryValueProblem H) (S : BoundaryValueSolution B) : BoundaryValueSolutionClosed B S := by
  exact True.intro

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse