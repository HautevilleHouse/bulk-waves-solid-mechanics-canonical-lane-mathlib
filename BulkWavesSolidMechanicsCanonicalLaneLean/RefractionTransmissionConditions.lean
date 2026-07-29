import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure RefractionTransmissionConditionsPackage where
  interfaceContinuity : Prop
  stressTractionContinuity : Prop
  snellLawGeneralized : Prop
  reflectionCoefficient : Prop
  transmissionCoefficient : Prop
  energyFluxBalance : Prop

structure RefractionTransmissionConditionsEvidence (E : RefractionTransmissionConditionsPackage) where
  interfaceContinuityClosed : E.interfaceContinuity
  stressTractionContinuityClosed : E.stressTractionContinuity
  snellLawGeneralizedClosed : E.snellLawGeneralized
  reflectionCoefficientClosed : E.reflectionCoefficient
  transmissionCoefficientClosed : E.transmissionCoefficient
  energyFluxBalanceClosed : E.energyFluxBalance

def RefractionTransmissionConditionsClosed (E : RefractionTransmissionConditionsPackage) : Prop :=
  E.interfaceContinuity ∧ E.stressTractionContinuity ∧ E.snellLawGeneralized ∧
  E.reflectionCoefficient ∧ E.transmissionCoefficient ∧ E.energyFluxBalance

theorem refraction_transmission_conditions_closed_from_evidence (E : RefractionTransmissionConditionsPackage) (ev : RefractionTransmissionConditionsEvidence E) : RefractionTransmissionConditionsClosed E := by
  exact And.intro ev.interfaceContinuityClosed (And.intro ev.stressTractionContinuityClosed (And.intro ev.snellLawGeneralizedClosed (And.intro ev.reflectionCoefficientClosed (And.intro ev.transmissionCoefficientClosed ev.energyFluxBalanceClosed))))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse