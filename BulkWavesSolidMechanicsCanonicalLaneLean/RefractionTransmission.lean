import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.WavePropagationAnalysis

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure RefractionTransmissionPackage {E : ElasticityPackage} {W : WaveEquationPDEPackage E} {B : BoundaryConditionsPackage W} (P : WavePropagationAnalysisPackage B) where
  snellsLaw : Prop
  criticalAngle : Prop
  transmissionCoefficient : Prop
  reflectionCoefficient : Prop
  modeConversion : Prop
  snellsLawClosed : snellsLaw
  criticalAngleClosed : criticalAngle
  transmissionCoefficientClosed : transmissionCoefficient
  reflectionCoefficientClosed : reflectionCoefficient
  modeConversionClosed : modeConversion

structure RefractionTransmissionEvidence {E : ElasticityPackage} {W : WaveEquationPDEPackage E} {B : BoundaryConditionsPackage W} {P : WavePropagationAnalysisPackage B} (R : RefractionTransmissionPackage P) where
  snellsLawClosed : R.snellsLaw
  criticalAngleClosed : R.criticalAngle
  transmissionCoefficientClosed : R.transmissionCoefficient
  reflectionCoefficientClosed : R.reflectionCoefficient
  modeConversionClosed : R.modeConversion

def RefractionTransmissionClosed {E : ElasticityPackage} {W : WaveEquationPDEPackage E} {B : BoundaryConditionsPackage W} {P : WavePropagationAnalysisPackage B} (R : RefractionTransmissionPackage P) : Prop :=
  R.snellsLaw ∧ R.criticalAngle ∧ R.transmissionCoefficient ∧ R.reflectionCoefficient ∧ R.modeConversion

theorem refraction_transmission_closed_from_evidence {E : ElasticityPackage} {W : WaveEquationPDEPackage E} {B : BoundaryConditionsPackage W} {P : WavePropagationAnalysisPackage B} (R : RefractionTransmissionPackage P) (Ev : RefractionTransmissionEvidence R) :
  RefractionTransmissionClosed R := by
  exact And.intro Ev.snellsLawClosed (And.intro Ev.criticalAngleClosed (And.intro Ev.transmissionCoefficientClosed (And.intro Ev.reflectionCoefficientClosed Ev.modeConversionClosed)))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse