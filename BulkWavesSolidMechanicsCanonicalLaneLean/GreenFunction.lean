import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.WaveEquation
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.ElasticConstitutive
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.BoundaryConditions

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure GreenFunctionPackage (W : WaveEquationPackage) (E : ElasticConstitutivePackage W) (B : BoundaryConditionsPackage W) where
  fundamentalSolution : Prop
  superpositionPrinciple : Prop
  integralRepresentation : Prop
  singularityHandling : Prop
  greenClosure : Prop

structure GreenFunctionEvidence {W : WaveEquationPackage} {E : ElasticConstitutivePackage W} {B : BoundaryConditionsPackage W} (G : GreenFunctionPackage W E B) where
  fundamentalSolutionClosed : G.fundamentalSolution
  superpositionPrincipleClosed : G.superpositionPrinciple
  integralRepresentationClosed : G.integralRepresentation
  singularityHandlingClosed : G.singularityHandling
  greenClosureClosed : G.greenClosure

def GreenFunctionClosed {W : WaveEquationPackage} {E : ElasticConstitutivePackage W} {B : BoundaryConditionsPackage W} (G : GreenFunctionPackage W E B) : Prop :=
  G.fundamentalSolution ∧ G.superpositionPrinciple ∧ G.integralRepresentation ∧ G.singularityHandling ∧ G.greenClosure

theorem green_function_closed_from_evidence {W : WaveEquationPackage} {E : ElasticConstitutivePackage W} {B : BoundaryConditionsPackage W}
    (G : GreenFunctionPackage W E B) (Ev : GreenFunctionEvidence G) : GreenFunctionClosed G := by
  exact And.intro Ev.fundamentalSolutionClosed (And.intro Ev.superpositionPrincipleClosed (And.intro Ev.integralRepresentationClosed (And.intro Ev.singularityHandlingClosed Ev.greenClosureClosed)))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse