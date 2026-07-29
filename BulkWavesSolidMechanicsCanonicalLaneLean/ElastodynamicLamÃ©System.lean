import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure ElastodynamicLaméSystemPackage where
  lameParameters : Type u
  density : Type v
  displacementField : Type w
  waveSpeeds : Prop
  pWaveSpeed : Prop
  sWaveSpeed : Prop
  poissonRatioRelation : Prop

structure ElastodynamicLaméSystemEvidence (E : ElastodynamicLaméSystemPackage) where
  waveSpeedsClosed : E.waveSpeeds
  pWaveSpeedClosed : E.pWaveSpeed
  sWaveSpeedClosed : E.sWaveSpeed
  poissonRatioRelationClosed : E.poissonRatioRelation

def ElastodynamicLaméSystemClosed (E : ElastodynamicLaméSystemPackage) : Prop :=
  E.waveSpeeds ∧ E.pWaveSpeed ∧ E.sWaveSpeed ∧ E.poissonRatioRelation

theorem elastodynamic_lamé_system_closed_from_evidence (E : ElastodynamicLaméSystemPackage) (ev : ElastodynamicLaméSystemEvidence E) : ElastodynamicLaméSystemClosed E := by
  exact And.intro ev.waveSpeedsClosed (And.intro ev.pWaveSpeedClosed (And.intro ev.sWaveSpeedClosed ev.poissonRatioRelationClosed))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse