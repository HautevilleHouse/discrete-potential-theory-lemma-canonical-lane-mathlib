import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscretePotentialEquationPackage where
  vertexSet : Type
  boundarySet : Set vertexSet
  potentialFunction : vertexSet → ℝ
  equationSatisfied : Prop
  existence : Prop
  uniqueness : Prop

structure DiscretePotentialEquationEvidence (P : DiscretePotentialEquationPackage) where
  equationSatisfiedClosed : P.equationSatisfied
  existenceClosed : P.existence
  uniquenessClosed : P.uniqueness

def DiscretePotentialEquationClosed (P : DiscretePotentialEquationPackage) : Prop :=
  P.equationSatisfied ∧ P.existence ∧ P.uniqueness

theorem discrete_potential_equation_closed_from_evidence (P : DiscretePotentialEquationPackage) (E : DiscretePotentialEquationEvidence P) :
    DiscretePotentialEquationClosed P := by
  exact And.intro E.equationSatisfiedClosed (And.intro E.existenceClosed E.uniquenessClosed)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse
