import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure GreenLagrangeStrainPackage where
  displacementField : Type
  deformationGradient : Type
  strainTensor : Type
  strainDefinition : Prop
  objectivity : Prop
  body : Prop
  bodyClosed : body

structure GreenLagrangeStrainEvidence (G : GreenLagrangeStrainPackage) where
  strainDefinitionClosed : G.strainDefinition
  objectivityClosed : G.objectivity

def GreenLagrangeStrainClosed (G : GreenLagrangeStrainPackage) : Prop :=
  G.strainDefinition ∧ G.objectivity

theorem green_lagrange_strain_closed_from_evidence (G : GreenLagrangeStrainPackage)
    (Ev : GreenLagrangeStrainEvidence G) : GreenLagrangeStrainClosed G := by
  exact And.intro Ev.strainDefinitionClosed Ev.objectivityClosed

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse