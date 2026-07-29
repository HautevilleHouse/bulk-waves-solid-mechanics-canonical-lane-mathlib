import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

def ConstrainedBulkWavesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bulk_waves_endgame (A : AdmissibleClass) :
    ConstrainedBulkWavesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse