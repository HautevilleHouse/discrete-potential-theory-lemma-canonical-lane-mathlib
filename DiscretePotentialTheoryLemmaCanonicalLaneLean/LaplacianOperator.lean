import HautevilleHouse.DiscretePotentialTheoryLemmaCanonicalLaneLean.DiscreteGraphStructure

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure LaplacianOperatorPackage {G : DiscreteGraphPackage} (V : G.vertices → ℝ) where
  laplacian : G.vertices → ℝ
  degree : G.vertices → ℝ
  adjacencyAction : (G.vertices → ℝ) → (G.vertices → ℝ)
  actionFormula : Prop
  actionFormulaClosed : actionFormula

structure LaplacianEvidence {G : DiscreteGraphPackage} {V : G.vertices → ℝ} (L : LaplacianOperatorPackage V) where
  laplacianComputed : L.laplacian = λ v => L.degree v * V v - L.adjacencyAction V v

def LaplacianClosed {G : DiscreteGraphPackage} {V : G.vertices → ℝ} (L : LaplacianOperatorPackage V) : Prop :=
  L.laplacian = λ v => L.degree v * V v - L.adjacencyAction V v

theorem laplacian_closed_from_evidence {G : DiscreteGraphPackage} {V : G.vertices → ℝ} (L : LaplacianOperatorPackage V) (E : LaplacianEvidence L) : LaplacianClosed L := by
  exact E.laplacianComputed

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse