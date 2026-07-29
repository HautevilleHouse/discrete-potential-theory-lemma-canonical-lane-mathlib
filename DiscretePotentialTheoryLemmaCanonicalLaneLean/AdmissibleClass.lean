import HautevilleHouse.DiscretePotentialTheoryLemmaCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure AdmissibleClass where
  object : DiscretePotentialAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiscretePotentialWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse