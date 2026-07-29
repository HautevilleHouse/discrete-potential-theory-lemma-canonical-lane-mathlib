import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure EnergyMinimization (V : Type) where
  graph : V → Set V
  edgeWeight : V × V → ℝ
  energyFunctional : (V → ℝ) → ℝ
  minimizerExists : Prop
  minimizerUnique : Prop

structure EnergyMinimizationEvidence (E : EnergyMinimization V) where
  energyFunctionalDefined : ∀ f : V → ℝ, E.energyFunctional f = ∑ v in Finset.univ, ∑ u in Finset.univ, E.edgeWeight (v, u) * (f v - f u)^2
  minimizerExistsClosed : E.minimizerExists
  minimizerUniqueClosed : E.minimizerUnique

def EnergyMinimizationClosed (E : EnergyMinimization V) : Prop :=
  (∀ f : V → ℝ, E.energyFunctional f = ∑ v in Finset.univ, ∑ u in Finset.univ, E.edgeWeight (v, u) * (f v - f u)^2) ∧
  E.minimizerExists ∧ E.minimizerUnique

theorem energy_minimization_closed_from_evidence (E : EnergyMinimization V) (Ev : EnergyMinimizationEvidence E) : EnergyMinimizationClosed E := by
  exact And.intro Ev.energyFunctionalDefined (And.intro Ev.minimizerExistsClosed Ev.minimizerUniqueClosed)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse