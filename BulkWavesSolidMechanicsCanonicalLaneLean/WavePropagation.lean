import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure SolidMechanicsAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  elasticModulus : ℝ
  density : ℝ
  waveSpeed : ℝ
  conclusion : waveSpeed = sqrt (elasticModulus / density)

def WavePropagationClosed (O : SolidMechanicsAdmittedObject) : Prop :=
  O.waveSpeed = sqrt (O.elasticModulus / O.density)

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse