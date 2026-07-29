import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscretePotentialTheoremStatement where
  space : DiscretePotentialSpace
  boundary : Set space.vertices
  interior : Set space.vertices
  harmonicExtensionExists : ∀ f : boundary → ℝ, ∃ (u : HarmonicFunction space), ∀ b ∈ boundary, u.values b = f b
  convergenceCondition : Prop
  maxPrincipleHolds : Prop
  uniquenessHolds : Prop

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse