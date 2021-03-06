CREATE OR REPLACE VIEW rlsc_master.v_salar_aligned
AS
SELECT mv_v_aligned.*, mv_v_salar_toxicity_groups.label, mv_v_salar_toxicity_groups.preflabel, standardized_organism.standardized_value AS preferred_species
FROM
(
SELECT mv_v_salar_animal_txt_study.animal_txt, mv_v_salar_animal_txt_study.study,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.sex WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.sex WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.sex WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.sex WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.sex END as sex,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.species WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.species WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.species WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.species WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.species END as species,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.compound_prefname WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.compound_prefname WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.compound_prefname WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.compound_prefname WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.compound_prefname END as compound_prefname,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.startdate WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.startdate WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.startdate WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.startdate WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.startdate END as startdate,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.enddate WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.enddate WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.enddate WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.enddate WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.enddate END as enddate,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.title WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.title WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.title WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.title WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.title END as title,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.lab WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.lab WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.lab WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.lab WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.lab END as lab,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.experimenttype WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.experimenttype WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.experimenttype WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.experimenttype WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.experimenttype END as experimenttype,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.program WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.program WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.program WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.program WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.program END as program,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.lnumber WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.lnumber WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.lnumber WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.lnumber WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.lnumber END as lnumber,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.mknumber WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.mknumber WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.mknumber WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.mknumber WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.mknumber END as mknumber,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.commonname WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.commonname WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.commonname WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.commonname WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.commonname END as commonname,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.brandname WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.brandname WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.brandname WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.brandname WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.brandname END as brandname,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.sch WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.sch WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.sch WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.sch WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.sch END as sch,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.toxgroup WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.toxgroup WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.toxgroup WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.toxgroup WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.toxgroup END as toxgroup,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.studyDay WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.studyDay WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.studyDay END as studyDay,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.dose WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.dose WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.dose WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.dose WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.dose END as dose,
CASE WHEN mv_v_salar_clinical_signs.animal_txt IS NOT NULL THEN mv_v_salar_clinical_signs.doseUnit WHEN mv_v_salar_invivo_results.animal_txt IS NOT NULL THEN mv_v_salar_invivo_results.doseUnit WHEN mv_v_salar_food_consumption.animal_txt IS NOT NULL THEN mv_v_salar_food_consumption.doseUnit WHEN mv_v_salar_histopathology.animal_txt IS NOT NULL THEN mv_v_salar_histopathology.doseUnit WHEN mv_v_salar_necropsy.animal_txt IS NOT NULL THEN mv_v_salar_necropsy.doseUnit END as doseUnit,
---mv_v_salar_clinical_signs.dose as dose_clinical_signs,
---mv_v_salar_clinical_signs.doseUnit as doseUnit_clinical_signs,
mv_v_salar_clinical_signs.clinicalSignMeasurement,
---mv_v_salar_clinical_signs.studyDay as studyDay_clinical_signs,
mv_v_salar_clinical_signs.opthamicIndication,
mv_v_salar_clinical_signs.drugDay as drugDay_clinical_signs,
mv_v_salar_clinical_signs.drugWeek as drugWeek_clinical_signs,
mv_v_salar_clinical_signs.eyeCode,
mv_v_salar_clinical_signs.incidenceDate,
mv_v_salar_clinical_signs.normalIndication,
mv_v_salar_clinical_signs.modifier,
mv_v_salar_clinical_signs.category,
mv_v_salar_clinical_signs.subCategory,
mv_v_salar_clinical_signs.location,
mv_v_salar_clinical_signs.locationModifier,
mv_v_salar_clinical_signs.severity,
mv_v_salar_clinical_signs.sizeModifier,
mv_v_salar_clinical_signs.incidenceID,
mv_v_salar_clinical_signs.comment,
mv_v_salar_invivo_results.strain,
---mv_v_salar_invivo_results.dose as dose_invivo_results,
---mv_v_salar_invivo_results.doseUnit as doesUnit_invivo_results,
mv_v_salar_invivo_results.material_txt,
mv_v_salar_invivo_results.measurement as measurement_invivo_results,
mv_v_salar_invivo_results.valueQual as valueQual_invivo_results,
mv_v_salar_invivo_results.val as val_invivo_results,
mv_v_salar_invivo_results.unit as unit_invivo_results,
---mv_v_salar_invivo_results.studyDay as studyDay_invivo_results,
mv_v_salar_invivo_results.ExposureTime,
mv_v_salar_invivo_results.ExposureTimeUnits,
mv_v_salar_invivo_results.ExclusionFlag,
mv_v_salar_invivo_results.ReasonForExclusion,
---mv_v_salar_food_consumption.dose as dose_food_consumption,
---mv_v_salar_food_consumption.doseUnit as doseUnit_food_consumption,
mv_v_salar_food_consumption.AnimalAge,
mv_v_salar_food_consumption.FoodAmount,
mv_v_salar_food_consumption.FoodUnits,
mv_v_salar_food_consumption.FeedingDate,
---mv_v_salar_food_consumption.StudyDay as studyDay_food_consumption,
mv_v_salar_food_consumption.StudyWeek as studyWeek_food_consumption,
mv_v_salar_food_consumption.DrugDay as drugDay_food_consumption,
mv_v_salar_food_consumption.DrugWeek as drugWeek_food_consumption,
mv_v_salar_food_consumption.IntervalDay,
mv_v_salar_food_consumption.IntervalType,
---mv_v_salar_histopathology.material_txt as material_txt_histopathology,
---mv_v_salar_histopathology.dose as dose_histopathology,
---mv_v_salar_histopathology.doseUnit as doesUnit_histopatholoty,
mv_v_salar_histopathology.value as value_histopathology,
mv_v_salar_histopathology.observationType,
mv_v_salar_histopathology.adjective1,
mv_v_salar_histopathology.adjective2,
mv_v_salar_histopathology.Grade,
mv_v_salar_histopathology.GradeDescription,
mv_v_salar_histopathology.process,
mv_v_salar_necropsy.moribundAtNecropsy,
mv_v_salar_necropsy.necropsyDay,
mv_v_salar_necropsy.reasonDiscontinued,
mv_v_salar_necropsy.material_txt as material_txt_necropsy,
---mv_v_salar_necropsy.dose as dose_necropsy,
---mv_v_salar_necropsy.doseUnit as doesUnit_necropsy,
mv_v_salar_necropsy.measurement as measurement_necropsy,
mv_v_salar_necropsy.value as value_necropsy,
mv_v_salar_necropsy.unit as unit_necropsy,
mv_v_salar_necropsy.resultType as resulttype_necropsy,
mv_v_salar_invivo_results.resulttype as resulttype_invivo_results

FROM 
(
SELECT animal_txt, study, studyday
FROM rlsc_master.mv_v_salar_clinical_signs
UNION
SELECT animal_txt, study, studyday
FROM rlsc_master.mv_v_salar_invivo_results
UNION
SELECT animal_txt, study, studyday
FROM rlsc_master.mv_v_salar_food_consumption
UNION
SELECT animal_txt, study, NULL as studyday
FROM rlsc_master.mv_v_salar_necropsy
UNION
SELECT animal_txt, study, NULL as studyday
FROM rlsc_master.mv_v_salar_histopathology
) mv_v_salar_animal_txt_study
LEFT JOIN rlsc_master.mv_v_salar_clinical_signs
ON mv_v_salar_animal_txt_study.animal_txt = mv_v_salar_clinical_signs.animal_txt AND mv_v_salar_animal_txt_study.study = mv_v_salar_clinical_signs.study AND mv_v_salar_animal_txt_study.studyday = mv_v_salar_clinical_signs.studyday
LEFT JOIN rlsc_master.mv_v_salar_food_consumption
ON mv_v_salar_animal_txt_study.animal_txt = mv_v_salar_food_consumption.animal_txt AND mv_v_salar_animal_txt_study.study = mv_v_salar_food_consumption.study AND mv_v_salar_animal_txt_study.studyday = mv_v_salar_food_consumption.studyday
LEFT JOIN rlsc_master.mv_v_salar_histopathology
ON mv_v_salar_animal_txt_study.animal_txt = mv_v_salar_histopathology.animal_txt AND mv_v_salar_animal_txt_study.study = mv_v_salar_histopathology.study
LEFT JOIN rlsc_master.mv_v_salar_invivo_results
ON mv_v_salar_animal_txt_study.animal_txt = mv_v_salar_invivo_results.animal_txt AND mv_v_salar_animal_txt_study.study = mv_v_salar_invivo_results.study AND NVL(mv_v_salar_animal_txt_study.studyday, 1000) = NVL(mv_v_salar_invivo_results.studyday, 1000)
LEFT JOIN rlsc_master.mv_v_salar_necropsy
ON mv_v_salar_animal_txt_study.animal_txt = mv_v_salar_necropsy.animal_txt AND mv_v_salar_animal_txt_study.study = mv_v_salar_necropsy.study
) mv_v_aligned
LEFT JOIN rlsc_master.mv_v_salar_toxicity_groups
ON mv_v_aligned.study = mv_v_salar_toxicity_groups.study AND mv_v_aligned.lnumber = mv_v_salar_toxicity_groups.lnumber
LEFT JOIN rlsc_master.standardized_organism ON 
UPPER(mv_v_aligned.species)= standardized_organism.organism_name
with no schema binding;

