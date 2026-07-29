import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.BoundaryConditions

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure WavePropagationAnalysisPackage {E : ElasticityPackage} {W : WaveEquationPDEPackage E} (B : BoundaryConditionsPackage W) where
  planeWaveSolution : Prop
  dispersionRelation : Prop
  phaseVelocity : Prop
  groupVelocity : Prop
  attenuation : Prop
  planeWaveSolutionClosed : planeWaveSolution
  dispersionRelationClosed : dispersionRelation
  phaseVelocityClosed : phaseVelocity
  groupVelocityClosed : groupVelocity
  attenuationClosed : attenuation

structure WavePropagationAnalysisEvidence {E : ElasticityPackage} {W : WaveEquationPDEPackage E} {B : BoundaryConditionsPackage W} (P : WavePropagationAnalysisPackage B) where
  planeWaveSolutionClosed : P.planeWaveSolution
  dispersionRelationClosed : P.dispersionRelation
  phaseVelocityClosed : P.phaseVelocity
  groupVelocityClosed : P.groupVelocity
  attenuationClosed : P.attenuation

def WavePropagationAnalysisClosed {E : ElasticityPackage} {W : WaveEquationPDEPackage E} {B : BoundaryConditionsPackage W} (P : WavePropagationAnalysisPackage B) : Prop :=
  P.planeWaveSolution ∧ P.dispersionRelation ∧ P.phaseVelocity ∧ P.groupVelocity ∧ P.attenuation

theorem wave_propagation_analysis_closed_from_evidence {E : ElasticityPackage} {W : WaveEquationPDEPackage E} {B : BoundaryConditionsPackage W} (P : WavePropagationAnalysisPackage B) (Ev : WavePropagationAnalysisEvidence P) :
  WavePropagationAnalysisClosed P := by
  exact And.intro Ev.planeWaveSolutionClosed (And.intro Ev.dispersionRelationClosed (And.intro Ev.phaseVelocityClosed (And.intro Ev.groupVelocityClosed Ev.attenuationClosed)))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse