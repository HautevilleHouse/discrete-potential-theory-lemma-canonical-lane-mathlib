import HautevilleHouse.DiscretePotentialTheoryLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DiscreteGraphPackage where
  vertices : Type
  edges : Type
  incidence : edges → vertices × vertices
  edgeWeight : edges → ℝ
  vertexSpace : Set vertices

structure DiscreteGraphEvidence (G : DiscreteGraphPackage) where
  verticesFinite : Fintype G.vertices
  edgesFinite : Fintype G.edges
  edgeWeightsPositive : ∀ e : G.edges, G.edgeWeight e > 0

def DiscreteGraphClosed (G : DiscreteGraphPackage) : Prop :=
  Nonempty (Fintype G.vertices) ∧ Nonempty (Fintype G.edges) ∧ ∀ e : G.edges, G.edgeWeight e > 0

theorem discrete_graph_closed_from_evidence (G : DiscreteGraphPackage) (E : DiscreteGraphEvidence G) : DiscreteGraphClosed G := by
  refine ⟨E.verticesFinite, E.edgesFinite, E.edgeWeightsPositive⟩

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse