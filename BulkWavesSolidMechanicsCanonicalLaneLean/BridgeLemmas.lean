import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  WavePropagationClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse