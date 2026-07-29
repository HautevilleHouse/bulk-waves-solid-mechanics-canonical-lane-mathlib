import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure ElasticityPackage where
  displacementField : Type u
  strainTensor : Type v
  stressTensor : Type w
  constitutiveLaw : Prop
  balanceEquations : Prop
  boundaryConditions : Prop
  smoothBody : Prop
  constitutiveLawClosed : constitutiveLaw
  balanceEquationsClosed : balanceEquations
  boundaryConditionsClosed : boundaryConditions
  smoothBodyClosed : smoothBody

structure ElasticityEvidence (E : ElasticityPackage) where
  constitutiveLawClosed : E.constitutiveLaw
  balanceEquationsClosed : E.balanceEquations
  boundaryConditionsClosed : E.boundaryConditions
  smoothBodyClosed : E.smoothBody

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.constitutiveLaw ∧ E.balanceEquations ∧ E.boundaryConditions ∧ E.smoothBody

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
  ElasticityClosed E := by
  exact And.intro Ev.constitutiveLawClosed (And.intro Ev.balanceEquationsClosed (And.intro Ev.boundaryConditionsClosed Ev.smoothBodyClosed))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse