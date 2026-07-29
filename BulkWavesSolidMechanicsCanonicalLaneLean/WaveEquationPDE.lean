import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.BulkWavesElasticityPackage

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure WaveEquationPDEPackage (E : ElasticityPackage) where
  timeParameter : Type u
  waveVelocity : Prop
  acousticWaveEquation : Prop
  shearWaveEquation : Prop
  pWaveSpeed : Prop
  sWaveSpeed : Prop
  waveVelocityClosed : waveVelocity
  acousticWaveEquationClosed : acousticWaveEquation
  shearWaveEquationClosed : shearWaveEquation
  pWaveSpeedClosed : pWaveSpeed
  sWaveSpeedClosed : sWaveSpeed

structure WaveEquationPDEEvidence {E : ElasticityPackage} (W : WaveEquationPDEPackage E) where
  waveVelocityClosed : W.waveVelocity
  acousticWaveEquationClosed : W.acousticWaveEquation
  shearWaveEquationClosed : W.shearWaveEquation
  pWaveSpeedClosed : W.pWaveSpeed
  sWaveSpeedClosed : W.sWaveSpeed

def WaveEquationPDEClosed {E : ElasticityPackage} (W : WaveEquationPDEPackage E) : Prop :=
  W.waveVelocity ∧ W.acousticWaveEquation ∧ W.shearWaveEquation ∧ W.pWaveSpeed ∧ W.sWaveSpeed

theorem wave_equation_pde_closed_from_evidence {E : ElasticityPackage} (W : WaveEquationPDEPackage E) (Ev : WaveEquationPDEEvidence W) :
  WaveEquationPDEClosed W := by
  exact And.intro Ev.waveVelocityClosed (And.intro Ev.acousticWaveEquationClosed (And.intro Ev.shearWaveEquationClosed (And.intro Ev.pWaveSpeedClosed Ev.sWaveSpeedClosed)))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse