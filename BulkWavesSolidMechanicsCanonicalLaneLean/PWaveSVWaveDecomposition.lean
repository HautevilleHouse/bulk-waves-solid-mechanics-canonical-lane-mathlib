import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure PWaveSVWaveDecompositionPackage where
  helmholtzDecomposition : Prop
  scalarPotential : Prop
  vectorPotential : Prop
  pWaveComponent : Prop
  sWaveComponent : Prop
  superpositionPrinciple : Prop

structure PWaveSVWaveDecompositionEvidence (E : PWaveSVWaveDecompositionPackage) where
  helmholtzDecompositionClosed : E.helmholtzDecomposition
  scalarPotentialClosed : E.scalarPotential
  vectorPotentialClosed : E.vectorPotential
  pWaveComponentClosed : E.pWaveComponent
  sWaveComponentClosed : E.sWaveComponent
  superpositionPrincipleClosed : E.superpositionPrinciple

def PWaveSVWaveDecompositionClosed (E : PWaveSVWaveDecompositionPackage) : Prop :=
  E.helmholtzDecomposition ∧ E.scalarPotential ∧ E.vectorPotential ∧
  E.pWaveComponent ∧ E.sWaveComponent ∧ E.superpositionPrinciple

theorem p_wave_sv_wave_decomposition_closed_from_evidence (E : PWaveSVWaveDecompositionPackage) (ev : PWaveSVWaveDecompositionEvidence E) : PWaveSVWaveDecompositionClosed E := by
  exact And.intro ev.helmholtzDecompositionClosed (And.intro ev.scalarPotentialClosed (And.intro ev.vectorPotentialClosed (And.intro ev.pWaveComponentClosed (And.intro ev.sWaveComponentClosed ev.superpositionPrincipleClosed))))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse