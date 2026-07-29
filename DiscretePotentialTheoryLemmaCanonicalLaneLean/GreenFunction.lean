import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure GreenFunction (V : Type) where
  kernel : PotentialKernel V
  domain : Set V
  greenMap : V × V → ℝ
  resolventEquation : Prop
  boundaryVanishing : Prop

structure GreenFunctionEvidence (G : GreenFunction V) where
  resolventEquationClosed : G.resolventEquation
  boundaryVanishingClosed : G.boundaryVanishing
  kernelClosed : PotentialKernelClosed G.kernel

def GreenFunctionClosed (G : GreenFunction V) : Prop :=
  G.resolventEquation ∧ G.boundaryVanishing ∧ PotentialKernelClosed G.kernel

theorem green_function_closed_from_evidence (G : GreenFunction V) (E : GreenFunctionEvidence G) : GreenFunctionClosed G := by
  exact And.intro E.resolventEquationClosed (And.intro E.boundaryVanishingClosed E.kernelClosed)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse