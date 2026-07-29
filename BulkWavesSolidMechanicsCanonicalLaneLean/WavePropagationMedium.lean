import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure WaveMediumPackage where
  mediumType : Type u
  density : Prop
  elasticModuli : Prop
  waveSpeed : Prop
  attenuation : Prop
  dispersionRelation : Prop

structure WaveMediumEvidence (W : WaveMediumPackage) where
  densityClosed : W.density
  elasticModuliClosed : W.elasticModuli
  waveSpeedClosed : W.waveSpeed
  attenuationClosed : W.attenuation
  dispersionRelationClosed : W.dispersionRelation

def WaveMediumClosed (W : WaveMediumPackage) : Prop :=
  W.density ∧ W.elasticModuli ∧ W.waveSpeed ∧ W.attenuation ∧ W.dispersionRelation

theorem wave_medium_closed_from_evidence (W : WaveMediumPackage) (E : WaveMediumEvidence W) : WaveMediumClosed W := by
  exact And.intro E.densityClosed
    (And.intro E.elasticModuliClosed
      (And.intro E.waveSpeedClosed
        (And.intro E.attenuationClosed E.dispersionRelationClosed)))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
