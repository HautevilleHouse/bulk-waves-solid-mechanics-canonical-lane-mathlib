import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure AdmissibleClass where
  object : SolidMechanicsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WavePropagationClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse