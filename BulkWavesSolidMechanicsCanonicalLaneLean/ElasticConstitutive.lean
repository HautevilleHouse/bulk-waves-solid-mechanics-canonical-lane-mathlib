import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BulkWavesSolidMechanicsCanonicalLaneLean.WaveEquation

namespace HautevilleHouse
namespace BulkWavesSolidMechanicsCanonicalLaneLean

structure ElasticConstitutivePackage (W : WaveEquationPackage) where
  stressStrainRelation : Prop
  laméParameters : Prop
  elasticityTensor : Prop
  isotropicLinearElastic : Prop
  constitutiveClosure : Prop

structure ElasticConstitutiveEvidence {W : WaveEquationPackage} (E : ElasticConstitutivePackage W) where
  stressStrainRelationClosed : E.stressStrainRelation
  laméParametersClosed : E.laméParameters
  elasticityTensorClosed : E.elasticityTensor
  isotropicLinearElasticClosed : E.isotropicLinearElastic
  constitutiveClosureClosed : E.constitutiveClosure

def ElasticConstitutiveClosed {W : WaveEquationPackage} (E : ElasticConstitutivePackage W) : Prop :=
  E.stressStrainRelation ∧ E.laméParameters ∧ E.elasticityTensor ∧ E.isotropicLinearElastic ∧ E.constitutiveClosure

theorem elastic_constitutive_closed_from_evidence {W : WaveEquationPackage}
    (E : ElasticConstitutivePackage W) (Ev : ElasticConstitutiveEvidence E) : ElasticConstitutiveClosed E := by
  exact And.intro Ev.stressStrainRelationClosed (And.intro Ev.laméParametersClosed (And.intro Ev.elasticityTensorClosed (And.intro Ev.isotropicLinearElasticClosed Ev.constitutiveClosureClosed)))

end BulkWavesSolidMechanicsCanonicalLaneLean
end HautevilleHouse