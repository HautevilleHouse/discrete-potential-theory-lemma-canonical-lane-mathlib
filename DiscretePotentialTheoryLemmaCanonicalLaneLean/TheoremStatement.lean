import HautevilleHouse.DiscretePotentialTheoryLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscretePotentialSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DiscretePotentialAdmittedObject where
  space : DiscretePotentialSpace
  graph : Type
  edgeWeights : Type
  laplacianDefined : Prop
  maximumPrinciple : Prop
  conclusion : maximumPrinciple

def DiscretePotentialWitnessClosed (O : DiscretePotentialAdmittedObject) : Prop :=
  O.maximumPrinciple

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse