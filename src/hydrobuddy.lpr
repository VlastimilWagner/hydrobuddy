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

procedure AssignValues ;
begin
   if DBwatterquality.SearchByField('NAME', 'DEFAULT', True) then begin
     WatterQualityForm.Edit25.text := DBwatterquality.NAME;
     WatterQualityForm.Edit1.text := FloatToStrF(DBwatterquality.N_NO3,ffFixed,7,3);
     WatterQualityForm.Edit2.text := FloatToStrF(DBwatterquality.N_NH4,ffFixed,7,3);
     WatterQualityForm.Edit3.text := FloatToStrF(DBwatterquality.P,ffFixed,7,3);
     WatterQualityForm.Edit4.text := FloatToStrF(DBwatterquality.K,ffFixed,7,3);
     WatterQualityForm.Edit5.text := FloatToStrF(DBwatterquality.Mg,ffFixed,7,3);
     WatterQualityForm.Edit6.text := FloatToStrF(DBwatterquality.Ca,ffFixed,7,3);
     WatterQualityForm.Edit7.text := FloatToStrF(DBwatterquality.S,ffFixed,7,3);
     WatterQualityForm.Edit8.text := FloatToStrF(DBwatterquality.Fe,ffFixed,7,3);
     WatterQualityForm.Edit9.text := FloatToStrF(DBwatterquality.Mn,ffFixed,7,3);
     WatterQualityForm.Edit10.text := FloatToStrF(DBwatterquality.Zn,ffFixed,7,3);
     WatterQualityForm.Edit11.text := FloatToStrF(DBwatterquality.B,ffFixed,7,3);
     WatterQualityForm.Edit12.text := FloatToStrF(DBwatterquality.Cu,ffFixed,7,3);
     WatterQualityForm.Edit13.text := FloatToStrF(DBwatterquality.Si,ffFixed,7,3);
     WatterQualityForm.Edit14.text := FloatToStrF(DBwatterquality.Mo,ffFixed,7,3);
     WatterQualityForm.Edit15.text := FloatToStrF(DBwatterquality.Na,ffFixed,7,3);
     WatterQualityForm.Edit16.text := FloatToStrF(DBwatterquality.Cl,ffFixed,7,3);
   end;
end ;

procedure UpdateComboBoxes ;

begin

   MainForm.UpdateComboBox ;
WatterQualityForm.UpdateComboBox ;

end ;

procedure SetActiveTab;
begin

    // set active tab and ensure all forms are visible
    MainForm.PageControl.ActivePage := MainForm.TabSheet4 ;
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

{
procedure CheckDatabaseFiles;
begin

     if (FileExists(MainForm.formulations_db) = false) or (FileExists(MainForm.water_quality_db) = false) or (FileExists(MainForm.substances_db) = false) or (FileExists(MainForm.substances_used_db) = false) or (FileExists(MainForm.tissue_analysis_db) = false) then
     begin
          ShowMessage('Database files not found, please select HydroBuddy''s installation folder.' );
          if MainForm.SelectDirectoryDialog1.Execute then
          begin
               MainForm.water_quality_db := MainForm.SelectDirectoryDialog1.FileName + '/' + MainForm.water_quality_db ;
               MainForm.formulations_db := MainForm.SelectDirectoryDialog1.FileName + '/' + MainForm.formulations_db;
               MainForm.substances_db := MainForm.SelectDirectoryDialog1.FileName + '/' +  MainForm.substances_db ;
               MainForm.substances_used_db := MainForm.SelectDirectoryDialog1.FileName + '/' + MainForm.substances_used_db;
               MainForm.tissue_analysis_db := MainForm.MainForm.SelectDirectoryDialog1.FileName + '/' + MainForm.tissue_analysis_db;
          end;
     end;

     if (FileExists(MainForm.formulations_db) = false) or (FileExists(MainForm.water_quality_db) = false) or (FileExists(MainForm.substances_db) = false) or (FileExists(MainForm.substances_used_db) = false) or (FileExists(MainForm.tissue_analysis_db) = false) then
     begin
     ShowMessage('Selected folder does not contain database files, please reinstall HydroBuddy');
     Application.Terminate;
     end;


end;
}

{$R *.res}

begin
  Application.Title:='HydroBuddy - an Open source nutrient calculator';
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);

{
  {$IFDEF UNIX}
  MainForm.water_quality_db := 'waterquality_unix.dbf';
  MainForm.formulations_db := 'formulations_unix.dbf' ;
  MainForm.substances_db := 'substances_unix.dbf';
  MainForm.substances_used_db := 'substances_used_unix.dbf';
  MainForm.tissue_analysis_db := 'tissue_analysis_unix.dbf' ;
  {$ENDIF}

  {$IFDEF WINDOWS}
  MainForm.water_quality_db := 'waterquality_win.dbf' ;
  MainForm.formulations_db := 'formulations_win.dbf' ;
  MainForm.substances_db := 'substances_win.dbf'    ;
  MainForm.substances_used_db := 'substances_used_win.dbf' ;
  MainForm.tissue_analysis_db := 'tissue_analysis_win.dbf' ;
  {$ENDIF}
}
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

  SetActiveTab  ;
//  CheckDatabaseFiles;
  AssignValues ;
  UpdateComboBoxes ;
  MainForm.LoadValues;
  Application.CreateForm(TTissueAnalysisForm, TissueAnalysisForm);
  Application.Run;
end.

