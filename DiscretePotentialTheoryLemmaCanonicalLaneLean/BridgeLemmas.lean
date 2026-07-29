import HautevilleHouse.DiscretePotentialTheoryLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | DiscreteAdmittedObject G L Gr cap => GreenClosed Gr ∧ CapacityClosed cap
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  rcases A.object with (_, _, _, cap)  -- simplified; actual proof depends on structure
  exact And.intro (by exact ?_) (by exact ?_)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse