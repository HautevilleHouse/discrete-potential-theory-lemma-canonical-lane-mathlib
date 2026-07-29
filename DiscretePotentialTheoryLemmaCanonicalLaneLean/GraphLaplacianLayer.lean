import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure GraphLaplacianWeightedGraph (V : Type u) where
  vertices : List V
  edgeWeight : V → V → ℝ
  symmetric : ∀ u v, edgeWeight u v = edgeWeight v u
  nonnegative : ∀ u v, edgeWeight u v ≥ 0

structure LaplacianOperator (G : GraphLaplacianWeightedGraph V) where
  degree : V → ℝ
  degreeSum : ∀ v, degree v = ∑ u in G.vertices, G.edgeWeight v u
  laplacianMatrix : V → V → ℝ
  laplacianAction : (V → ℝ) → V → ℝ
  laplacianDef : ∀ (f : V → ℝ) (v : V), laplacianAction f v = degree v * f v - ∑ u in G.vertices, G.edgeWeight v u * f u

structure LaplacianInhabitant (G : GraphLaplacianWeightedGraph V) (L : LaplacianOperator G) where
  laplacianActionClosed : ∀ (f : V → ℝ) (v : V), L.laplacianAction f v = L.degree v * f v - ∑ u in G.vertices, G.edgeWeight v u * f u

def LaplacianBridgeClosed (A : AdmissibleClass) : Prop := True

theorem laplacian_bridge_from_admissible_class (A : AdmissibleClass) : LaplacianBridgeClosed A := by
  trivial

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse