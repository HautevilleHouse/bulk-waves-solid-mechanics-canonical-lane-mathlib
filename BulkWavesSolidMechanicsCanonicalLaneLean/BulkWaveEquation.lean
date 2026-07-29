import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.WavePropagationMedium

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure BulkWaveEquationPackage {W : WaveMediumPackage} where
  displacementField : Type u
  waveEquationOperator : Prop
  boundaryConditions : Prop
  initialConditions : Prop
  solutionExistence : Prop
  uniqueness : Prop

structure BulkWaveEquationEvidence {W : WaveMediumPackage} (E : BulkWaveEquationPackage W) where
  displacementFieldClosed : E.displacementField
  waveEquationOperatorClosed : E.waveEquationOperator
  boundaryConditionsClosed : E.boundaryConditions
  initialConditionsClosed : E.initialConditions
  solutionExistenceClosed : E.solutionExistence
  uniquenessClosed : E.uniqueness

def BulkWaveEquationClosed {W : WaveMediumPackage} (E : BulkWaveEquationPackage W) : Prop :=
  E.displacementField ∧ E.waveEquationOperator ∧ E.boundaryConditions ∧
  E.initialConditions ∧ E.solutionExistence ∧ E.uniqueness

theorem bulk_wave_equation_closed_from_evidence {W : WaveMediumPackage}
    (E : BulkWaveEquationPackage W) (Ev : BulkWaveEquationEvidence E) :
    BulkWaveEquationClosed E := by
  exact And.intro Ev.displacementFieldClosed
    (And.intro Ev.waveEquationOperatorClosed
      (And.intro Ev.boundaryConditionsClosed
        (And.intro Ev.initialConditionsClosed
          (And.intro Ev.solutionExistenceClosed Ev.uniquenessClosed))))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse
