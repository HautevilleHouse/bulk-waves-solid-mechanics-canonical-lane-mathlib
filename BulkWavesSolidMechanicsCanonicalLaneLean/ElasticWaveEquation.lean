import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure ElasticWaveEquationPackage where
  displacement : Type u → Type v
  stress : Type u → Type v
  strain : Type u → Type v
  waveSpeed : ℝ
  density : ℝ
  lameLambda : ℝ
  lameMu : ℝ
  pWaveSpeed : ℝ := sqrt((lameLambda + 2*lameMu)/density)
  sWaveSpeed : ℝ := sqrt(lameMu/density)

def ElasticWaveEquationClosed (E : ElasticWaveEquationPackage) : Prop :=
  E.pWaveSpeed = sqrt((E.lameLambda + 2*E.lameMu)/E.density) ∧
  E.sWaveSpeed = sqrt(E.lameMu/E.density)

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse