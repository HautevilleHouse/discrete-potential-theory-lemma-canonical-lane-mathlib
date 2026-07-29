import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DirichletProblem (V : Type) where
  graph : V → Set V
  boundary : Set V
  boundaryFunction : V → ℝ
  interior : Set V
  existenceUnique : Prop

structure DirichletProblemEvidence (D : DirichletProblem V) where
  interiorDefined : D.interior = {v | v ∉ D.boundary}
  boundaryFunctionDefined : ∀ v ∈ D.boundary, D.boundaryFunction v ∈ ℝ
  existenceUniqueClosed : D.existenceUnique

def DirichletProblemClosed (D : DirichletProblem V) : Prop :=
  D.interior = {v | v ∉ D.boundary} ∧ (∀ v ∈ D.boundary, D.boundaryFunction v ∈ ℝ) ∧ D.existenceUnique

theorem dirichlet_problem_closed_from_evidence (D : DirichletProblem V) (E : DirichletProblemEvidence D) : DirichletProblemClosed D := by
  exact And.intro E.interiorDefined (And.intro E.boundaryFunctionDefined E.existenceUniqueClosed)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse