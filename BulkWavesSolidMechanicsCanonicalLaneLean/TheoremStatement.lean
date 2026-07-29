import canonicalLaneMathlib.TheoremStatement

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure BulkWaveAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  waveEquation : Prop
  propagationSpeed : Prop
  conclusion : waveEquation ∧ propagationSpeed

def BulkWaveWitnessClosed (O : BulkWaveAdmittedObject) : Prop :=
  O.conclusion

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
