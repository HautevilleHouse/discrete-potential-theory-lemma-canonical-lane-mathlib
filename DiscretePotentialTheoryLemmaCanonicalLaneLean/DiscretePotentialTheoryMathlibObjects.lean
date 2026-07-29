import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscretePotentialSpace where
  vertices : Type u
  edges : vertices → vertices → Prop
  weight : vertices → vertices → ℝ
  symmetric : ∀ x y, weight x y = weight y x
  nonnegative : ∀ x y, weight x y ≥ 0
  locallyFinite : ∀ x, Set.Finite {y | weight x y > 0}

structure HarmonicFunction (G : DiscretePotentialSpace) where
  values : G.vertices → ℝ
  harmonicCondition : ∀ x : G.vertices, ∑ y, G.weight x y * (values y - values x) = 0

structure DiscreteAdmittedObject where
  space : DiscretePotentialSpace
  boundary : Set (DiscretePotentialSpace.vertices space)
  interior : Set (DiscretePotentialSpace.vertices space)
  boundaryNonempty : boundary.Nonempty
  interiorFinite : Set.Finite interior
  uniqueHarmonicExtension : Prop

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse