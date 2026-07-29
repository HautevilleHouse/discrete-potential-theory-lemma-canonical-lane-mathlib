import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure DirichletEnergyPackage (G : DiscretePotentialSpace) where
  energyFunctional : (HarmonicFunction G) → ℝ
  energyDefinition : ∀ u : HarmonicFunction G,
    energyFunctional u = (1/2) * ∑ x y, G.weight x y * (u.values y - u.values x)^2
  nonnegativeEnergy : ∀ u, energyFunctional u ≥ 0
  zeroEnergyImpliesConstant : ∀ u, energyFunctional u = 0 → ∀ x y, u.values x = u.values y
  energyDecomposition : Prop
  energyMinimizerCharacterization : ∀ u, energyFunctional u = 0 → HarmonicFunction G

structure EnergyPackageEvidence {G : DiscretePotentialSpace}
  (pkg : DirichletEnergyPackage G) where
  energyDefinitionClosed : pkg.energyDefinition
  nonnegativeEnergyClosed : pkg.nonnegativeEnergy
  zeroEnergyConstantClosed : pkg.zeroEnergyImpliesConstant
  energyMinimizerClosed : pkg.energyMinimizerCharacterization

def DirichletEnergyClosed {G : DiscretePotentialSpace}
  (pkg : DirichletEnergyPackage G) : Prop :=
  pkg.energyDefinition ∧ pkg.nonnegativeEnergy ∧
  pkg.zeroEnergyImpliesConstant ∧ pkg.energyMinimizerCharacterization

theorem dirichlet_energy_closed_from_evidence
  {G : DiscretePotentialSpace} (pkg : DirichletEnergyPackage G)
  (E : EnergyPackageEvidence pkg) : DirichletEnergyClosed pkg := by
  exact And.intro E.energyDefinitionClosed
    (And.intro E.nonnegativeEnergyClosed
      (And.intro E.zeroEnergyConstantClosed E.energyMinimizerClosed))

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse