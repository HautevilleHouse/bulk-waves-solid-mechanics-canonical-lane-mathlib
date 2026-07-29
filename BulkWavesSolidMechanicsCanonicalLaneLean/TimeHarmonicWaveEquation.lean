import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure TimeHarmonicWaveEquationPackage where
  frequency : Type u
  speed : Type v
  waveNumber : Prop
  helmholtzOperator : Prop
  boundaryCondition : Prop
  solutionExistence : Prop

structure TimeHarmonicWaveEquationEvidence (E : TimeHarmonicWaveEquationPackage) where
  waveNumberClosed : E.waveNumber
  helmholtzOperatorClosed : E.helmholtzOperator
  boundaryConditionClosed : E.boundaryCondition
  solutionExistenceClosed : E.solutionExistence

def TimeHarmonicWaveEquationClosed (E : TimeHarmonicWaveEquationPackage) : Prop :=
  E.waveNumber ∧ E.helmholtzOperator ∧ E.boundaryCondition ∧ E.solutionExistence

theorem time_harmonic_wave_equation_closed_from_evidence (E : TimeHarmonicWaveEquationPackage) (ev : TimeHarmonicWaveEquationEvidence E) : TimeHarmonicWaveEquationClosed E := by
  exact And.intro ev.waveNumberClosed (And.intro ev.helmholtzOperatorClosed (And.intro ev.boundaryConditionClosed ev.solutionExistenceClosed))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse