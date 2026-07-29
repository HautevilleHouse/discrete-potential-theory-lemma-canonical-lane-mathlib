import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretePotentialTheoryLemmaCanonicalLaneLean

structure PotentialKernel (V : Type) where
  kernel : V → V → ℝ
  nonnegative : Prop
  sumBounded : Prop
  irreducibility : Prop

structure PotentialKernelEvidence (K : PotentialKernel V) where
  nonnegativeClosed : K.nonnegative
  sumBoundedClosed : K.sumBounded
  irreducibilityClosed : K.irreducibility

def PotentialKernelClosed (K : PotentialKernel V) : Prop :=
  K.nonnegative ∧ K.sumBounded ∧ K.irreducibility

theorem potential_kernel_closed_from_evidence (K : PotentialKernel V) (E : PotentialKernelEvidence K) : PotentialKernelClosed K := by
  exact And.intro E.nonnegativeClosed (And.intro E.sumBoundedClosed E.irreducibilityClosed)

end DiscretePotentialTheoryLemmaCanonicalLaneLean
end HautevilleHouse