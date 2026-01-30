program hydrobuddy;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, Menus, ExtCtrls, tachartlazaruspkg, HB_Main, hb_load_salts,
  hb_newcustomsalt, densesolver, hb_addweight, hb_commercialnutrient,
  hb_waterquality, hb_insprecision, hb_stockanalysis, Dbf, db, hb_persubstance,
  hb_datasetname, hb_analysis, hb_freedom, dbf_fields, hb_ph, hb_ratios,
  hb_comparison, hb_tissue_analysis, customhelpfunctions, db_formulations,
  db_substances, db_tissue_analysis, db_watterquality, db_substances_used,
  hb_constants;


procedure UpdateComboBoxes ;
begin
  MainForm.UpdateComboBox ;
  WatterQualityForm.UpdateComboBox ;
end;

procedure SetActiveTab;
begin
  // set active tab and ensure all forms are visible
  MainForm.PageControl.ActivePage := MainForm.TabSheet1 ;
  SubstanceSelectionForm.Position := poMainFormCenter;
  CustomSaltForm.Position := poMainFormCenter;
  AddWeightForm.Position := poMainFormCenter;
  CommercialNutrientForm.Position := poMainFormCenter;
  WatterQualityForm.Position := poMainFormCenter;
  InsPrecisionForm.Position := poMainFormCenter;
  StockAnalysisForm.Position := poMainFormCenter;
  PerSubstanceForm.Position := poMainFormCenter;
  DatasetNameForm.Position := poMainFormCenter;
  AnalysisForm.Position := poMainFormCenter;
  FreedomForm.Position := poMainFormCenter;
end ;

{$R *.res}

begin
  Application.Title:='HydroBuddy - an Open source nutrient calculator';
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);

  Application.CreateForm(TSubstanceSelectionForm, SubstanceSelectionForm);
  Application.CreateForm(TCustomSaltForm, CustomSaltForm);
  Application.CreateForm(TAddWeightForm, AddWeightForm);
  Application.CreateForm(TCommercialNutrientForm, CommercialNutrientForm);
  Application.CreateForm(TWatterQualityForm, WatterQualityForm);
  Application.CreateForm(TInsPrecisionForm, InsPrecisionForm);
  Application.CreateForm(TStockAnalysisForm, StockAnalysisForm);
  Application.CreateForm(TPerSubstanceForm, PerSubstanceForm);
  Application.CreateForm(TDatasetNameForm, DatasetNameForm);
  Application.CreateForm(TAnalysisForm, AnalysisForm);
  Application.CreateForm(TFreedomForm, FreedomForm);
  Application.CreateForm(TAlkalinityForm, AlkalinityForm);
  Application.CreateForm(TRatioForm, RatioForm);
  Application.CreateForm(TComparisonForm, ComparisonForm);

  SetActiveTab;
  WatterQualityForm.SelectDefault;
  UpdateComboBoxes ;
  MainForm.LoadValues;
  Application.CreateForm(TTissueAnalysisForm, TissueAnalysisForm);
  Application.Run;
end.

