import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure WaveEquationPackage where
  medium : Type u
  timeDomain : Type v
  waveSpeed : Type w
  initialDisplacement : medium → Prop
  initialVelocity : medium → Prop
  solution : medium → medium → Prop
  waveEquationHolds : Prop
  closureConditions : Prop

structure WaveEquationEvidence (W : WaveEquationPackage) where
  initialDisplacementClosed : W.initialDisplacement = λ _ => True
  initialVelocityClosed : W.initialVelocity = λ _ => True
  waveEquationHoldsClosed : W.waveEquationHolds
  closureConditionsClosed : W.closureConditions

def WaveEquationClosed (W : WaveEquationPackage) : Prop :=
  W.waveEquationHolds ∧ W.closureConditions

theorem wave_equation_closed_from_evidence (W : WaveEquationPackage)
    (E : WaveEquationEvidence W) : WaveEquationClosed W := by
  exact And.intro E.waveEquationHoldsClosed E.closureConditionsClosed

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse