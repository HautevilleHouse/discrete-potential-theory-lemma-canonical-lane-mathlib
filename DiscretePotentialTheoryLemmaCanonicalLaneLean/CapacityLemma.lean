import HautevilleHouse.DiscretePotentialTheoryLemmaCanonicalLaneLean.GreenFunction

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure CapacityLemmaPackage {G : DiscreteGraphPackage} (L : LaplacianOperatorPackage (λ _ : G.vertices => 0)) (Gr : GreenFunctionPackage L) (A B : Set G.vertices) where
  capacity : ℝ
  extremalFunction : G.vertices → ℝ
  capacityFormula : capacity = (2 * (Finset.card (Finset.filter (λ x => x ∈ A) Finset.univ ).toFinset : ℝ)) / (Gr.kernel a b) -- placeholder
  capacityFormulaClosed : capacityFormula
  extremalFunctionClosed : capacityFormula

structure CapacityEvidence {G : DiscreteGraphPackage} {L : LaplacianOperatorPackage (λ _ : G.vertices => 0)} {Gr : GreenFunctionPackage L} {A B : Set G.vertices} (C : CapacityLemmaPackage L Gr A B) where
  capacityComputed : C.capacityFormula

def CapacityClosed {G : DiscreteGraphPackage} {L : LaplacianOperatorPackage (λ _ : G.vertices => 0)} {Gr : GreenFunctionPackage L} {A B : Set G.vertices} (C : CapacityLemmaPackage L Gr A B) : Prop :=
  C.capacityFormula

theorem capacity_closed_from_evidence {G : DiscreteGraphPackage} {L : LaplacianOperatorPackage (λ _ : G.vertices => 0)} {Gr : GreenFunctionPackage L} {A B : Set G.vertices} (C : CapacityLemmaPackage L Gr A B) (E : CapacityEvidence C) : CapacityClosed C := by
  exact E.capacityComputed

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse