import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.WaveEquation

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure BoundaryConditionsPackage (W : WaveEquationPackage) where
  domainBoundary : Prop
  tractionBoundary : Prop
  displacementBoundary : Prop
  mixedBoundary : Prop
  boundaryClosure : Prop

structure BoundaryConditionsEvidence {W : WaveEquationPackage} (B : BoundaryConditionsPackage W) where
  domainBoundaryClosed : B.domainBoundary
  tractionBoundaryClosed : B.tractionBoundary
  displacementBoundaryClosed : B.displacementBoundary
  mixedBoundaryClosed : B.mixedBoundary
  boundaryClosureClosed : B.boundaryClosure

def BoundaryConditionsClosed {W : WaveEquationPackage} (B : BoundaryConditionsPackage W) : Prop :=
  B.domainBoundary ∧ B.tractionBoundary ∧ B.displacementBoundary ∧ B.mixedBoundary ∧ B.boundaryClosure

theorem boundary_conditions_closed_from_evidence {W : WaveEquationPackage}
    (B : BoundaryConditionsPackage W) (Ev : BoundaryConditionsEvidence B) : BoundaryConditionsClosed B := by
  exact And.intro Ev.domainBoundaryClosed (And.intro Ev.tractionBoundaryClosed (And.intro Ev.displacementBoundaryClosed (And.intro Ev.mixedBoundaryClosed Ev.boundaryClosureClosed)))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse