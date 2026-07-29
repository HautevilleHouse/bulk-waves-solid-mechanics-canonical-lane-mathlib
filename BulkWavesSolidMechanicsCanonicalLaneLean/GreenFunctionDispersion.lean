import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure GreenFunctionDispersionPackage where
  greenTensor : Prop
  dispersionRelation : Prop
  groupVelocity : Prop
  phaseVelocity : Prop
  farFieldAsymptotics : Prop
  causticClassification : Prop

structure GreenFunctionDispersionEvidence (E : GreenFunctionDispersionPackage) where
  greenTensorClosed : E.greenTensor
  dispersionRelationClosed : E.dispersionRelation
  groupVelocityClosed : E.groupVelocity
  phaseVelocityClosed : E.phaseVelocity
  farFieldAsymptoticsClosed : E.farFieldAsymptotics
  causticClassificationClosed : E.causticClassification

def GreenFunctionDispersionClosed (E : GreenFunctionDispersionPackage) : Prop :=
  E.greenTensor ∧ E.dispersionRelation ∧ E.groupVelocity ∧
  E.phaseVelocity ∧ E.farFieldAsymptotics ∧ E.causticClassification

theorem green_function_dispersion_closed_from_evidence (E : GreenFunctionDispersionPackage) (ev : GreenFunctionDispersionEvidence E) : GreenFunctionDispersionClosed E := by
  exact And.intro ev.greenTensorClosed (And.intro ev.dispersionRelationClosed (And.intro ev.groupVelocityClosed (And.intro ev.phaseVelocityClosed (And.intro ev.farFieldAsymptoticsClosed ev.causticClassificationClosed))))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse