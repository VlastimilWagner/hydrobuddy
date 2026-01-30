unit HB_Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtCtrls, Buttons, Grids, TAGraph, TASeries,
  hb_load_salts, Math, densesolver, hb_commercialnutrient, hb_comparison,
  hb_waterquality, hb_addweight, hb_insprecision, hb_stockanalysis,
  hb_persubstance, hb_datasetname, hb_analysis, hb_tissue_analysis,
  hb_freedom, hb_ratios,LCLIntf, Types,
  db_formulations, db_substances, db_tissue_analysis, db_watterquality, db_substances_used, db_settings,
  customhelpfunctions, hb_constants;

type

  { TMainForm }

  TMainForm = class(TForm)
    AddFormulationButton: TButton;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    OKAboutButton: TButton;
    StockSolutionAnalysisButton: TBitBtn;
    ExportToCSVButton: TBitBtn;
    DetailedPerSubstAnalysisButton: TBitBtn;
    PlusButton: TButton;
    MinusButton: TButton;
    InputMixAnalysisButton: TBitBtn;
    CopyResultToTargetsButton: TButton;
    ChoseDegreeOfFreedomButton: TButton;
    NutrientRateAnalysisButton: TButton;
    PayPalDonateButton: TBitBtn;
    CalcTypeRadioGroup: TRadioGroup;
    CarryOutCalcButton: TBitBtn;
    DisablePopUpsCheckBox: TCheckBox;
    SmallWindowCheckBox: TCheckBox;
    CopyWeightButton: TButton;
    CurrValuesToDefaultButton: TButton;
    DeleteForulationButton: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RLabel1: TLabel;
    RLabel2: TLabel;
    RLabel3: TLabel;
    RLabel4: TLabel;
    RLabel5: TLabel;
    RLabel6: TLabel;
    RLabel7: TLabel;
    RLabel8: TLabel;
    RLabel9: TLabel;
    RLabel10: TLabel;
    RLabel11: TLabel;
    RLabel12: TLabel;
    RLabel13: TLabel;
    RLabel14: TLabel;
    RLabel15: TLabel;
    RLabel16: TLabel;
    ConcentrationFactorEdit: TEdit;
    VolumeEdit: TEdit;
    VolumeLabel: TLabel;
    TargetLabel: TLabel;
    ResultLabel: TLabel;
    ConcLabel: TLabel;
    UnitsLabel: TLabel;
    TotalCostLabel: TLabel;
    AnyObservationLabel: TLabel;
    PredictedECValueLabel: TLabel;
    AboutBoxUpLabel: TLabel;
    AboutBoxMidLabel: TLabel;
    AboutBoxDownLabel: TLabel;
    ConcentrationFactorLabel: TLabel;
    FormulationComboBox: TComboBox;
    FormulationNameEdit: TEdit;
    AboutBoxImage: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    LabelVersion: TLabel;
    PageControl: TPageControl;
    HelpPageControl: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PredictedECValuePanel: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    MassUnitsRadioGroup: TRadioGroup;
    ECModelRadioGroup: TRadioGroup;
    ConcUnitsRadioGroup: TRadioGroup;
    SaveDialog1: TSaveDialog;
    SetIPValuesButton: TButton;
    SetWQParamsButton: TButton;
    SiSiO2ComboBox: TComboBox;
    SolPrepTypeRadioGroup: TRadioGroup;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    SubstanceAnalysisButton: TButton;
    SubstanceSelectionButton: TButton;
    TabSheet1: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TissueAnalysisButton: TButton;
    VolumeUnitsRadioGroup: TRadioGroup;
    ZeroAllTargetsButton: TButton;
    procedure CalcTypeRadioGroupChangeBounds(Sender: TObject);
    procedure ConcUnitsRadioGroupClick(Sender: TObject);
    procedure CopyWeightButtonClick(Sender: TObject);
    procedure OKAboutButtonClick(Sender: TObject);
    procedure StockSolutionAnalysisButtonClick(Sender: TObject);
    procedure ExportToCSVButtonClick(Sender: TObject);
    procedure DetailedPerSubstAnalysisButtonClick(Sender: TObject);
    procedure MassUnitsRadioGroupClick(Sender: TObject);
    procedure SolPrepTypeRadioGroupClick(Sender: TObject);
    procedure VolumeUnitsRadioGroupDblClick(Sender: TObject);
    procedure ZeroAllTargetsButtonClick(Sender: TObject);
    procedure PlusButtonClick(Sender: TObject);
    procedure MinusButtonClick(Sender: TObject);
    procedure CurrValuesToDefaultButtonClick(Sender: TObject);
    procedure InputMixAnalysisButtonClick(Sender: TObject);
    procedure SubstanceSelectionButtonClick(Sender: TObject);
    procedure CopyResultToTargetsButtonClick(Sender: TObject);
    procedure TissueAnalysisButtonClick(Sender: TObject);
    procedure ChoseDegreeOfFreedomButtonClick(Sender: TObject);
    procedure NutrientRateAnalysisButtonClick(Sender: TObject);
    procedure PayPalDonateButtonClick(Sender: TObject);
    procedure CarryOutCalcButtonClick(Sender: TObject);
    procedure AddFormulationButtonClick(Sender: TObject);
    procedure AddFormulationButtonResize(Sender: TObject);
    procedure DeleteForulationButtonClick(Sender: TObject);
    procedure SubstanceAnalysisButtonClick(Sender: TObject);
    procedure SetWQParamsButtonClick(Sender: TObject);
    procedure SetIPValuesButtonClick(Sender: TObject);
    procedure FormulationComboBoxSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure StringGrid2EditButtonClick(Sender: TObject);
    procedure StringGrid2EditingDone(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private
    { private declarations }
    procedure GridShowHint(Sender: TObject; HintInfo: PHintInfo);
    procedure ConcUnitsRadioGroupSetTexts(ConcLabelCaption, UnitsLabelCaption, SGCells, PerSubstanceFormSGCells, RatioFormSGCells: string);
    procedure weightFineTunning;
    procedure replaceNullWithZeroes();
  public
    { public declarations }
    procedure CleanResults;
    procedure UpdateComboBox;
    procedure LoadValues();

    const
      NAME_IDX     : integer = 0;
      FORMULA_IDX  : integer = 1;
      AMOUNT_IDX   : integer = 2;
      UNIT_IDX     : integer = 3;
      COST_IDX     : integer = 4;
      SOURCE_IDX   : integer = 5;

    var
      IsLiquid: array of array of double ;
  end;

var
  MainForm: TMainForm;
  datasetname : String ;
  prev_conc :string ;
  selected_cell: string ;

implementation

{ TMainForm }

procedure TMainForm.replaceNullWithZeroes();
var
  j: integer;
begin
  for j := 1 to NumOfElements do
    if (FindComponent('Edit' + IntToStr(j)) as TEdit).Text = '' then (FindComponent('Edit' + IntToStr(j)) as TEdit).Text := '0';
end;

procedure TMainForm.UpdateComboBox;
begin
   FormulationComboBox.Items.Clear;
   DBformulations.SearchFirst;
   while not DBformulations.EOF do begin
     FormulationComboBox.Items.Add(DBformulations.Name);
     DBformulations.Next;
   end;
end;


procedure TMainForm.SubstanceSelectionButtonClick(Sender: TObject);
begin
  SubstanceSelectionForm.UpdateLists;
  SubstanceSelectionForm.Visible := True;
end;

procedure TMainForm.CopyResultToTargetsButtonClick(Sender: TObject);
var
  i: integer;
begin
  for i := 1 to NumOfElements do (FindComponent('Edit' + IntToStr(i)) as TEdit).Text := StringGrid1.cells[1,i];
end;

procedure TMainForm.TissueAnalysisButtonClick(Sender: TObject);
begin
  TissueAnalysisForm.UpdateTissueList;
  TissueAnalysisForm.Visible := True;
end;

procedure TMainForm.ChoseDegreeOfFreedomButtonClick(Sender: TObject);
begin
  FreedomForm.Visible := true ;;
end;

procedure TMainForm.NutrientRateAnalysisButtonClick(Sender: TObject);
begin
  RatioForm.Visible := true ;
end;

procedure TMainForm.PayPalDonateButtonClick(Sender: TObject);
begin
  // This is the paypal link for donations to support the software.
  // Please do not remove or modify.
  OpenURL('https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6YR6X5AAEGBGJ');
end;

procedure TMainForm.weightFineTunning;
var
  i:      integer;
  j:      integer;
  Volume: double;
  array_size: integer;
  answer: integer;
  arraysize: integer;
  nameSubstance: string;
  weight : double;
  report: DenseSolverLSReport;
  solutions: array of double;
  Result: array of double;
  test:   double;
  grossError: array[0..NumOfElements-1] of double;
  instrumentalError: array[0..NumOfElements-1] of double;
  elementInSolutionA: array[0..NumOfElements-1] of double;
  elementInSolutionB: array[0..NumOfElements-1] of double;
  volumeunit: string;
  waterquality: array[0..NumOfElements-1] of double;
  all_element_targets : array of double ;
  upper:  double;
  lower:  double;
  weight_error: double;
  volume_error: double;
  weight_factor: double;
  cost:   array of double;
  conc_factor: array of double ;
  predicted_ec: double;
  nameToCompare: string;
  ionic_strength : double;
  all_solids: boolean;
  mixContribution: array[0..NumOfElements-1] of double;
  totalWeight: double;
begin
  replaceNullWithZeroes;

  // clear listbox to get rid of old solutions
  RatioForm.StringGrid.Clean;
  RatioForm.StringGrid.RowCount := 1 ;
  PerSubstanceForm.StringGrid.Clean;
  PerSubstanceForm.StringGrid.RowCount := 1 ;
  StockAnalysisForm.StringGrid.Clean ;

  //initializing variables for mix label calculation
  all_solids := True;
  totalWeight := 0;


  // define water quality parameters
  for i:= 0 to NumOfElements-1 do waterquality[i] := StrtoFloatAnySeparator((FindComponent('WatterQualityForm.Edit' + IntToStr(i+1)) as TEdit).Text);

  // disable input mix analysis button, we will enable it later if all substances are solids
  InputMixAnalysisButton.Enabled := False ;

  // set instrument precision values
  volume_error := StrtoFloatAnySeparator(InsPrecisionForm.VolumePrecEdit.Text) * 0.001;
  weight_error := StrtoFloatAnySeparator(InsPrecisionForm.WeightPrecEdit.Text);

  // set weight factor (g) or (oz)
  if MassUnitsRadioGroup.ItemIndex=0 then weight_factor := 1;
  if MassUnitsRadioGroup.ItemIndex=1 then weight_factor := GramtoOunceCounstant;

  // update list to get matrix size from used substances
  SubstanceSelectionForm.UpdateLists;
  arraysize := SubstanceSelectionForm.SubstancesUsedListBox.Items.Count;

  // define volume taking into account radio box setting for units
  // the end input volume is always converted to cubic meters
  // which is the unit used within all calculations ppm = g/m3

  // cubic meter
  Volume := StrtoFloatAnySeparator(VolumeEdit.Text);

  // liter conversion
  if VolumeUnitsRadioGroup.ItemIndex=0 then Volume := Volume / 1000;
  // gallon conversion
  if VolumeUnitsRadioGroup.ItemIndex=1 then Volume := Volume * GaltoLConstant / 1000;

  // correct volume if using concentrated solutions.
  if SolPrepTypeRadioGroup.ItemIndex = 0 then Volume := Volume * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text);
  array_size := SubstanceSelectionForm.SubstancesUsedListBox.Items.Count;

  // define concentration conversion factor array
  SetLength(conc_factor, 16) ;

  // set size of string grid for solutions
  StringGrid2.RowCount := arraysize + 1 ;

  // set values for the concentration factor according to selected units

  // conversion factor for ppm is 1 for all values (no conversion needed)
  if ConcUnitsRadioGroup.ItemIndex=0 then begin
    prev_conc := 'ppm' ;
    for i:= 0 to NumOfElements-1 do conc_factor[i] := 1 ;
  end ;

  // conversion factor for M (mol/L)
  if ConcUnitsRadioGroup.ItemIndex=1 then for i:= 0 to NumOfElements-1 do conc_factor[i] := 1000*molar_mass[i] ;

  // conversion factor for mM (mmol/L)
  if ConcUnitsRadioGroup.ItemIndex=2 then for i:= 0 to NumOfElements-1 do conc_factor[i] := molar_mass[i] ;

  // conversion factor for mN (meq/L)
  if ConcUnitsRadioGroup.ItemIndex=3 then for i:= 0 to NumOfElements-1 do conc_factor[i] := molar_mass[i]/equivalents[i] ;

  Result := nil ;

  SetLength(Result, 16);
  SetLength(all_element_targets, 16);

  for j := 1 to NumOfElements do begin
      // load all element names (this time we don't need to discriminate as
      // we simply calculate for everyone
      all_element_targets[j-1] := StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(j)) as TEdit).Text);
      StringGrid1.Cells[2, j] := '0';
      StringGrid1.Cells[3, j] := '0';
      grossError[j-1] := 0;
      instrumentalError[j-1] := 0;
      elementInSolutionA[j-1] := 0;
      elementInSolutionB[j-1] := 0;
      mixContribution[j-1] := 0;
  end;

  // load the database in order to get the weights and find the resulting ppm values
  for i := 1 to StringGrid2.RowCount - 1 do begin
    DBSubstances.SearchFirst;                 // moves to the first data
    while not DBSubstances.EOF do begin
      nameSubstance := DBSubstances.Name;
      weight := StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX, i]);
      nameToCompare := StringGrid2.Cells[NAME_IDX, i] ;

      if  DBSubstances.isLiquid then all_solids := False;

      If SolPrepTypeRadioGroup.ItemIndex=0 then nameToCompare := Copy(nameToCompare, 5, Length(nameToCompare));

      if nameSubstance = nameToCompare then begin
        for j := 0 to NumOfElements-1 do begin
          if ((1 / weight_factor) * weight * 0.01 * DBSubstances.FieldByName(ElementsVarNames[j]) * DBSubstances.Purity / Volume > 0) then begin

            upper := ((StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX, i])+weight_error)) /(Volume - volume_error) ;
            lower := ((StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX, i])-weight_error)) /(Volume + volume_error) ;

            if (SolPrepTypeRadioGroup.ItemIndex=1) and (all_element_targets[j] <> 0) then
              instrumentalError[j] := ((upper - lower) * (100 / all_element_targets[j])) / 2 + instrumentalError[j];

            if (SolPrepTypeRadioGroup.ItemIndex = 0) and (all_element_targets[j] <> 0) then
              instrumentalError[j] := ((upper - lower) * (100 / all_element_targets[j])) / (2 * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text)) + instrumentalError[j];

            PerSubstanceForm.StringGrid.RowCount := PerSubstanceForm.StringGrid.RowCount + 1 ;
            PerSubstanceForm.StringGrid.Cells[0, PerSubstanceForm.StringGrid.RowCount-1] := (nameSubstance);
            PerSubstanceForm.StringGrid.Cells[1, PerSubstanceForm.StringGrid.RowCount-1] :=(ElementsVarNames[j]);

            if prev_conc = 'ppm' then
              PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount-1] :=(FloattoStr(round2((1 / weight_factor) * weight *0.01 * DBSubstances.FieldByName(ElementsVarNames[j]) * DBSubstances.Purity / Volume, 3)))
            else
              PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount-1] :=(FloattoStrF((1/conc_factor[j])*(1 / weight_factor) * weight *0.01 * double(DBSubstances.FieldByName(ElementsVarNames[j])) * DBSubstances.Purity / Volume, ffExponent, 4, 2));

            Result[j] := Result[j] + StrtoFloatAnySeparator(PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount-1]);

            if (StringGrid2.Cells[NAME_IDX, i][1] = 'A') and (SolPrepTypeRadioGroup.ItemIndex=0) then
              elementInSolutionA[j] := StrtoFloatAnySeparator(PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount-1])+ elementInSolutionA[j] ;

            if (StringGrid2.Cells[NAME_IDX, i][1] = 'B') and (SolPrepTypeRadioGroup.ItemIndex=0) then
              elementInSolutionB[j] := StrtoFloatAnySeparator(PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount-1]) + elementInSolutionB[j] ;

            //ShowMessage( nameSubstance + ' ' + ElementsVarNames[j] + ' ' + FloatToStr(weight * 0.01 * DBSubstances.FieldByName(ElementsVarNames[j]) * DBSubstancesPurity));
            mixContribution[j] := mixContribution[j] + weight * 0.01 * DBSubstances.FieldByName(ElementsVarNames[j]) * DBSubstances.Purity ;
          end;
        end;
        StringGrid2.Cells[COST_IDX,i] := (FloattoStr(round2(weight * DBSubstances.Cost * 0.001 * (1 / weight_factor), 1)));
      end;
      DBSubstances.Next;                                     // use .next here NOT .findnext!
    end;
  end;


  for i := 1 to StringGrid2.RowCount - 1 do totalWeight := totalWeight+StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX, i]);

  // save results in main page as well
  for j := 1 to NumOfElements do begin
    if all_element_targets[j-1] <> 0 then
      grossError[j-1] :=  (Result[j-1] * 100 / all_element_targets[j-1]) - 100 ;

    (FindComponent('RLabel' + IntToStr(j)) as TLabel).Caption := StringGrid1.Cells[1, j];
    StringGrid1.Cells[3, j] := '+/- ' + FloatToStr(Round(instrumentalError[j-1]*10)/10) + '%' ;
    StringGrid1.Cells[2, j] := FloatToStr(Round(grossError[j-1]*10)/10) + '%' ;

    // save the mix composition here
    AnalysisForm.StringGrid.Cells[1,j] := FloatToStr(round2(100*mixContribution[j-1]/totalWeight,3));
    if AnalysisForm.StringGrid.Cells[0,j] = 'K2O' then AnalysisForm.StringGrid.Cells[1,j] := FloatToStr(round2(1.2047*100*mixContribution[j-1]/totalWeight,3));
    if AnalysisForm.StringGrid.Cells[0,j] = 'P2O5' then AnalysisForm.StringGrid.Cells[1,j] := FloatToStr(round2(2.290*100*mixContribution[j-1]/totalWeight,3));
  end;

  if all_solids then InputMixAnalysisButton.Enabled := True;

  for i := 1 to NumOfElements do begin
    for j := 0 to NumOfElements-1 do begin
      if (FindComponent('Label' + IntToStr(i)) as TLabel).Caption = ElementsVarNames[j] then begin
        StringGrid1.Cells[0,i] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption;
        if prev_conc = 'ppm' then begin
          StringGrid1.Cells[1,i] := (FloatToStr(round2(Result[j] + waterquality[i - 1], 3)));
          (FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption := FloatToStr(round2(Result[j] + waterquality[i - 1], 3));
        end ;
        if prev_conc <> 'ppm' then begin
          StringGrid1.Cells[1,i] :=(FloatToStrF((1/conc_factor[j])*(Result[j] + waterquality[i - 1]), ffExponent, 4, 2));
          (FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption := FloatToStrF((1/conc_factor[j])*(Result[j] + waterquality[i - 1]), ffExponent,4, 2);
        end;
      end;
    end;
  end;

  // calculation of EC by empirical model
  if ECModelRadioGroup.ItemIndex=1 then begin
    predicted_ec := 0;
    for i := 1 to NumOfElements do begin
        predicted_ec := conc_factor[i-1]*StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption) * ec_contribution[ECModelRadioGroup.ItemIndex, i - 1] + predicted_ec;
    end;
        predicted_ec := round2(predicted_ec+0.39661671, 3);
  end;

  // Calculation of EC by LMCv2 model
  if ECModelRadioGroup.ItemIndex=0 then begin
    // calculate ionic strength used for conductivity model
    ionic_strength := 0;
    for i := 1 to NumOfElements do ionic_strength := zi[i-1]*zi[i-1]*(StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption) /(1000*molar_mass[i-1])) + ionic_strength;

    predicted_ec := 0;
    for i := 1 to NumOfElements do begin
      predicted_ec := conc_factor[i-1]
                        * (StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption)/(1000*molar_mass[i-1]))
                        * ec_contribution[ECModelRadioGroup.ItemIndex, i - 1]
                        * exp(-0.7025187*sqrt(ionic_strength)*power(zi[i-1],1.5))
                        + predicted_ec;
    end;
    predicted_ec := round2(predicted_ec, 3);
  end;

  PredictedECValuePanel.Caption := 'EC=' + FloattoStr(predicted_ec) + ' mS/cm';

  CopyWeightButton.Enabled := True;

  //determine volume unit for description label

  if VolumeUnitsRadioGroup.ItemIndex=1 then volumeunit := 'gallons';
  if VolumeUnitsRadioGroup.ItemIndex=2 then volumeunit := 'cubic meters';
  if VolumeUnitsRadioGroup.ItemIndex=0 then volumeunit := 'liters';
  AnyObservationLabel.Caption := 'Values calculated for the preparation of ' + VolumeEdit.Text + ' ' + volumeunit;

  // total cost calculation
  test := 0;

  for i := 0 to StringGrid2.RowCount - 2 do begin
    test := StrtoFloatAnySeparator(StringGrid2.Cells[COST_IDX,i+1]) + test;
  end;

  TotalCostLabel.Caption := ('Total Cost is ' + FloattoStr(round2(test, 1)));

  // stock solution analysis
  if (SolPrepTypeRadioGroup.ItemIndex=0) then begin
    for i := 0 to NumOfElements-1 do begin
      //ShowMessage(FloatToStr(elementInSolutionA[i]));
      elementInSolutionA[i] := 100 * elementInSolutionA[i] * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text) / (1000*1000);

      if (ElementsVarNames[i] <> 'P') and (ElementsVarNames[i] <> 'K') then begin
        StockAnalysisForm.StringGrid.Cells[0, i+ 1] := (ElementsVarNames[i]);
        StockAnalysisForm.StringGrid.Cells[1, i+ 1] := (FloattoStr(round2(elementInSolutionA[i], 5)));
      end;

      if ElementsVarNames[i] = 'P' then begin
        StockAnalysisForm.StringGrid.Cells[0, i+ 1] := ('P2O5');
        StockAnalysisForm.StringGrid.Cells[1, i+ 1] := (FloattoStr(round2(elementInSolutionA[i] * 2.2915, 3)));
      end;

      if ElementsVarNames[i] = 'K' then begin
        StockAnalysisForm.StringGrid.Cells[0, i+ 1] := ('K2O');
        StockAnalysisForm.StringGrid.Cells[1, i+ 1] := (FloattoStr(round2(elementInSolutionA[i] * 1.2047, 3)));
      end;
    end;

    for i := 0 to NumOfElements-1 do begin
      elementInSolutionB[i] := 100 * elementInSolutionB[i] * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text) / (1000*1000);

      if (ElementsVarNames[i] <> 'P') and (ElementsVarNames[i] <> 'K') then
        StockAnalysisForm.StringGrid.Cells[2, i+ 1] := (FloattoStr(round2(elementInSolutionB[i], 5)));

      if ElementsVarNames[i] = 'P' then
        StockAnalysisForm.StringGrid.Cells[2, i+ 1] := (FloattoStr(round2(elementInSolutionB[i] * 2.2915, 3)));

      if ElementsVarNames[i] = 'K' then
        StockAnalysisForm.StringGrid.Cells[2, i+ 1] := (FloattoStr(round2(elementInSolutionB[i] * 1.2047, 3)));
    end;
  end;

  // post ratios based on results posted on listboxes above
  RatioForm.SetPostRatios(False);
end;

procedure TMainForm.CopyWeightButtonClick(Sender: TObject);
var
  i:     integer;
  used_string : string ;
begin

  if CalcTypeRadioGroup.ItemIndex=0 then begin
    for i := 1 to StringGrid2.RowCount - 1 do begin
      used_string := StringGrid2.Cells[NAME_IDX,i] ;

      if SolPrepTypeRadioGroup.ItemIndex=0 then delete (used_string,1,4);

      DBSubstancesUsed.SearchByField('Name', used_string, True);

      if SolPrepTypeRadioGroup.ItemIndex=0 then
            DBSubstancesUsed.Weight := StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX,i])/StrtoFloatAnySeparator(ConcentrationFactorEdit.Text)
      else
            DBSubstancesUsed.Weight := StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX,i]);

      DBSubstancesUsed.Update('Name', used_string);
    end;
    ShowMessage('Weights have been successfully copied to Database');
  end;

  if CalcTypeRadioGroup.Itemindex=1 then begin
    for i := 1 to NumOfElements do begin
      (FindComponent('Edit' + IntToStr(i)) as TEdit).Text := (FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption;
    end;
  end;
end;


procedure TMainForm.OKAboutButtonClick(Sender: TObject);
begin
  PageControl.ActivePage := TabSheet1;
end;


procedure TMainForm.StockSolutionAnalysisButtonClick(Sender: TObject);
begin
  StockAnalysisForm.Visible := True;
end;

procedure TMainForm.ExportToCSVButtonClick(Sender: TObject);
var
  i: integer;
begin

  with TStringList.Create do
    try

      Add(AnyObservationLabel.Caption);
      Add(' , , , , ');
      Add('Name, Formula, Amount, Units, Amount, Units, Cost');

      for i := 0 to StringGrid2.RowCount - 1 do begin

        if StringGrid2.Cells[UNIT_IDX,i] = 'oz' then
          Add(StringGrid2.Cells[NAME_IDX,i]    + ',' +
              StringGrid2.Cells[FORMULA_IDX,i] + ',' +
              StringGrid2.Cells[AMOUNT_IDX,i]  + ',' +
              StringGrid2.Cells[UNIT_IDX,i]    + ',' +
              FloatToStr(StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX,i])/16)  + ',' + 'lb'    + ',' +
              StringGrid2.Cells[COST_IDX,i]);

        if StringGrid2.Cells[UNIT_IDX,i] = 'g' then
          Add(StringGrid2.Cells[NAME_IDX,i]    + ',' +
              StringGrid2.Cells[FORMULA_IDX,i] + ',' +
              StringGrid2.Cells[AMOUNT_IDX,i]  + ',' +
              StringGrid2.Cells[UNIT_IDX,i]    + ',' +
              FloatToStr(StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX,i])/1000)   + ',' + 'kg'    + ',' + StringGrid2.Cells[COST_IDX,i]);

        if StringGrid2.Cells[UNIT_IDX,i] = 'mL' then
          Add(StringGrid2.Cells[NAME_IDX,i]    + ',' +
              StringGrid2.Cells[FORMULA_IDX,i] + ',' +
              StringGrid2.Cells[AMOUNT_IDX,i]  + ',' +
              StringGrid2.Cells[UNIT_IDX,i]    + ',' +
              FloatToStr(StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX,i])/1000)   + ',' + 'L'    + ',' + StringGrid2.Cells[COST_IDX,i]);
      end;

      Add(' , , , , ');
      Add('Element, Results(ppm), GE, IE, Water (ppm)');

      for i := 0 to StringGrid1.RowCount - 1 do
        Add(StringGrid1.Cells[0,i] + ',' +
            StringGrid1.Cells[1,i] + ',' +
            StringGrid1.Cells[2,i] + ',' +
            StringGrid1.Cells[3,i] + ',' +
            StringGrid1.Cells[4,i]);

      Add(' , , , ,');
      Add(PredictedECValuePanel.Caption + ' +/- 10%');

      if SaveDialog1.Execute then SaveToFile(SaveDialog1.filename);

    finally
      Free;
    end;
end;

procedure TMainForm.DetailedPerSubstAnalysisButtonClick(Sender: TObject);
begin
  PerSubstanceForm.Visible := True;
end;

procedure TMainForm.ZeroAllTargetsButtonClick(Sender: TObject);
var
  i: integer;
begin
  for i:= 1 to NumOfElements do (FindComponent('Edit' + IntToStr(i)) as TEdit).Text := '0';
end;

procedure TMainForm.PlusButtonClick(Sender: TObject);
var
  i: integer;
  current_weight: double;
begin
  If StringGrid2.RowCount < 2 then exit;

  for i := 1 to StringGrid2.RowCount-1 do begin
    current_weight := StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX, i]);
    StringGrid2.Cells[AMOUNT_IDX, i] := FloatToStr(round2(current_weight*1.05, 4));
  end;

  weightFineTunning;
end;

procedure TMainForm.MinusButtonClick(Sender: TObject);
var
  i: integer;
  current_weight: double;
begin
  If StringGrid2.RowCount < 2 then exit;

  for i := 1 to StringGrid2.RowCount-1 do begin
    current_weight := StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX, i]);
    StringGrid2.Cells[AMOUNT_IDX, i] := FloatToStr(round2(current_weight*0.95, 4));
  end;

  weightFineTunning;
end;

procedure TMainForm.CurrValuesToDefaultButtonClick(Sender: TObject);
begin
  FormulationNameEdit.Text := 'DEFAULT' ;

  if FormulationComboBox.Items.Count = 0 then Exit;

  DBFormulations.Delete('Name', 'DEFAULT');
  FormulationComboBox.Items.Delete(FormulationComboBox.ItemIndex);

  AddFormulationButtonClick(Sender);
end;

procedure TMainForm.InputMixAnalysisButtonClick(Sender: TObject);
begin
  AnalysisForm.visible := True ;
end;


procedure TMainForm.CarryOutCalcButtonClick(Sender: TObject);
var
  i:      integer;
  j:      integer;
  k:      integer;
  n:      integer ;
  varcount: integer;
  Volume: double;
  problem_matrix_left: array of array of double;
  problem_matrix_right: array of double;
  array_size: integer;
  answer: integer;
  arraysize: integer;
  name_array: array of array of string;
  report: DenseSolverLSReport;
  solutions: array of double;
  varnames: array of string;
  temp:   array of string;
  temp2:  array of double;
  vartargetvalue: array of double;
  degree_of_freedom: string;
  Result: array of double;
  test:   double;
  gross_error: array of double;
  ConcTypeArray: array of string;
  volumeunit: string;
  waterquality: array[0..NumOfElements-1] of double;
  instrumental_error: array of double;
  all_element_contributions : array of array of double ;
  all_element_names : array of string;
  all_element_targets : array of double ;
  preloaded_weight: array of double ;
  upper:  double;
  temp1: double ;
  temp3: double ;
  lower:  double;
  weight_error: double;
  volume_error: double;
  weight_factor: double;
  cost:   array of double;
  conc_factor: array of double ;
  predicted_ec: double;
  mass_unit: string;
  ionic_strength: double;
  all_solids: boolean;
  mixContribution: array[0..NumOfElements-1] of double;
  totalWeight: double;
begin

  //deal with null
  replaceNullWithZeroes();

  // clear listbox to get rid of old solutions

  StringGrid1.Clean;
  StringGrid2.Clean;
  StringGrid2.RowCount:= 1;
  StringGrid2.ColWidths[NAME_IDX] := 223;
  StringGrid2.ColWidths[FORMULA_IDX] := 180;
  StringGrid2.ColWidths[AMOUNT_IDX] := 170;
  StringGrid2.ColWidths[COST_IDX] := 110;
  RatioForm.StringGrid.Clean;
  RatioForm.StringGrid.RowCount := 1 ;
  PerSubstanceForm.StringGrid.Clean;
  PerSubstanceForm.StringGrid.RowCount := 1 ;
  StockAnalysisForm.StringGrid.Clean ;

  //initializing variables for mix label calculation
  all_solids := True;
  totalWeight := 0;
  InputMixAnalysisButton.Enabled := False;
  for j:=0 to NumOfElements-1 do mixContribution[j] := 0;

  // define water quality parameters
  for i:= 0 to NumOfElements-1 do waterquality[i] := StrtoFloatAnySeparator((FindComponent('WatterQualityForm.Edit' + IntToStr(i+1)) as TEdit).Text);

  // set instrument precision values
  volume_error := StrtoFloatAnySeparator(InsPrecisionForm.VolumePrecEdit.Text) * 0.001;
  weight_error := StrtoFloatAnySeparator(InsPrecisionForm.WeightPrecEdit.Text);

  // set weight factor (g) or (oz)
  if MassUnitsRadioGroup.ItemIndex=0 then begin
    weight_factor := 1;
    mass_unit := 'g';
  end;

  if MassUnitsRadioGroup.ItemIndex=1 then begin
    weight_factor := GramtoOunceCounstant;
    mass_unit := 'oz';
  end;

  // update list to get matrix size from used substances
  SubstanceSelectionForm.UpdateLists;

  arraysize := SubstanceSelectionForm.SubstancesUsedListBox.Items.Count;

  // define volume taking into account radio box setting for units
  // the end input volume is always converted to cubic meters
  // which is the unit used within all calculations ppm = g/m3

  // cubic meter
  Volume := StrtoFloatAnySeparator(VolumeEdit.Text);

  // liter conversion
  if VolumeUnitsRadioGroup.ItemIndex=0 then
    Volume := Volume / 1000;

  // gallon conversion
  if VolumeUnitsRadioGroup.ItemIndex=1 then
    Volume := Volume * GaltoLConstant / 1000;

  array_size := SubstanceSelectionForm.SubstancesUsedListBox.Items.Count;

  varcount := 0;

  // define concentration conversion factor array

  SetLength(conc_factor, 16) ;

  // set size of string grid for solutions

  StringGrid2.RowCount := arraysize + 1 ;


  // set values for the concentration factor according to selected units


  // conversion factor for ppm is 1 for all values (no conversion needed)
  if ConcUnitsRadioGroup.ItemIndex=0 then begin
    prev_conc := 'ppm' ;
    for i:= 0 to NumOfElements-1 do conc_factor[i] := 1 ;
  end ;

  // conversion factor for M (mol/L)
  if ConcUnitsRadioGroup.ItemIndex=1 then for i:= 0 to NumOfElements-1 do conc_factor[i] := 1000*molar_mass[i] ;

  // conversion factor for mM (mmol/L)
  if ConcUnitsRadioGroup.ItemIndex=2 then for i:= 0 to NumOfElements-1 do conc_factor[i] := molar_mass[i] ;

  // conversion factor for mN (meq/L)
  if ConcUnitsRadioGroup.ItemIndex=3 then for i:= 0 to NumOfElements-1 do conc_factor[i] := molar_mass[i]/equivalents[i] ;

  // This IF statement controls the type of calculation run
  // according to the radio buttons which control it

  // VERY IMPORTANT IF STATEMENT //
  if CalcTypeRadioGroup.itemindex=0 then begin
    // define arrays used to solve the linear equation system
    problem_matrix_left := nil ;
    problem_matrix_right := nil ;
    solutions := nil ;
    name_array := nil ;
    ConcTypeArray := nil ;
    cost := nil ;
    all_element_contributions := nil ;
    all_element_names := nil ;
    all_element_targets := nil ;
    SetLength(preloaded_weight, arraysize) ;
    SetLength(solutions, arraysize);
    SetLength(name_array, arraysize, 3);
    SetLength(ConcTypeArray, arraysize);
    SetLength(cost, arraysize);
    SetLength(IsLiquid, 2, arraysize) ;
    SetLength(all_element_contributions, 16, arraysize);
    SetLength(all_element_names, 16);
    SetLength(all_element_targets, 16);

     // set array to 0
    for i := 0 to arraysize - 1 do for j := 0 to NumOfElements-1 do all_element_contributions[j][i] := 0;

    // choose element to use as degree of freedom
    degree_of_freedom := FreedomForm.ElementComboBox.Items[FreedomForm.ElementComboBox.ItemIndex] ;

    // assign all element names to all_element_names array
    for i := 1 to NumOfElements do begin
      all_element_names[i - 1] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption   ;

      if (all_element_names[i - 1] <> 'Si') then
         all_element_targets[i - 1] := (conc_factor[i-1])*StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text ) ;

      if (all_element_names[i - 1] = 'Si') and (SiSiO2ComboBox.ItemIndex = 0) then
         all_element_targets[i - 1] := (conc_factor[i-1])*StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text ) ;

      if (all_element_names[i - 1] = 'Si') and (SiSiO2ComboBox.ItemIndex = 1) then
         all_element_targets[i - 1] := SiO2toSiConstant * (conc_factor[i-1])*StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text ) ;
    end ;

    // load the database in order to get the weights and find the resulting ppm values
    DBSubstancesUsed.SearchFirst;
    i := 0 ;

    while not DBSubstancesUsed.EOF do begin
      if DBSubstancesUsed.IsLiquid then IsLiquid[0][i] := 1 else IsLiquid[0][i] := 0;
      IsLiquid[1][i] := DBSubstancesUsed.Density ;

      for j := 0 to NumOfElements-1 do begin
        if IsLiquid[0][i] = 0 then preloaded_weight[i] :=  (1 / weight_factor) * DBSubstancesUsed.Weight ;
        if IsLiquid[0][i] = 1 then preloaded_weight[i] :=   DBSubstancesUsed.Weight ;
        if IsLiquid[0][i] = 1 then all_solids := False;
        all_element_contributions[j][i] := 0.01 * DBSubstancesUsed.FieldByName(ElementsVarNames[j]) * DBSubstancesUsed.Purity / Volume;
      end;

      if (preloaded_weight[i] > 0) and (DisablePopUpsCheckBox.Checked = false) then begin
        ShowMessage('You have selected a fixed weight for ' + DBSubstancesUsed.Name + '. The program will find a solution with this constraint but it will add more of this substance if it leads to a better solution');
        if SolPrepTypeRadioGroup.ItemIndex=0 then preloaded_weight[i] := preloaded_weight[i]/StrToInt(ConcentrationFactorEdit.Text);
      end;

      i := i + 1;
      DBSubstancesUsed.Next;// use .next here NOT .findnext!
    end;


    // define variable count, names and intended values
    j := 0;

    varnames := nil ;
    vartargetvalue  := nil ;
    temp := nil ;
    temp2  := nil ;


    for i := 1 to NumOfElements do
      if (StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text) > 0) and ((FindComponent('Label' + IntToStr(i)) as TLabel).Caption <> degree_of_freedom) then begin
        varcount := varcount + 1;

        if j > 0 then for k := 0 to j - 1 do begin
            temp[k]  := varnames[k];
            temp2[k] := vartargetvalue[k];
        end;

        //increase size of arrays to fit new data
        SetLength(varnames, j + 1);
        SetLength(vartargetvalue, j + 1);
        if j > 0 then for k := 0 to j - 1 do begin
            varnames[k] := temp[k];
            vartargetvalue[k] := temp2[k];
        end;

        temp3 := 0 ;

        for n := 0 to arraysize - 1 do temp3 :=  preloaded_weight[n]*all_element_contributions[i- 1][n] + temp3 ;

        varnames[j] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption;

        if (varnames[j] <> 'Si') or (SiSiO2ComboBox.ItemIndex = 0) then
          vartargetvalue[j] := conc_factor[i-1]*StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text) - waterquality[i - 1] - temp3;

        if (varnames[j] = 'Si') and (SiSiO2ComboBox.ItemIndex = 1) then
          vartargetvalue[j] := SiO2toSiConstant * conc_factor[i-1]*StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text) - waterquality[i - 1] - temp3;

        SetLength(temp, j + 1);
        SetLength(temp2, j + 1);

        j := j + 1;
    end;

    // assign element target values
    for i := 1 to NumOfElements do begin
      all_element_targets[i - 1] := conc_factor[i-1]*StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text )  ;
      if (i=13) and (SiSiO2ComboBox.ItemIndex = 1) then
        all_element_targets[i - 1] := SiO2toSiConstant * conc_factor[i-1]*StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text )  ;
    end ;

    // definition of arrays which require varcount
       SetLength(problem_matrix_left, varcount, arraysize);
       SetLength(problem_matrix_right, varcount);

    // set array to 0
    for i := 0 to arraysize - 1 do for j := 0 to varcount - 1 do problem_matrix_left[j][i] := 0;

    // first get names from substances_used database

    i := 0;

    DBSubstancesUsed.SearchFirst;

    while not DBSubstancesUsed.EOF do begin
      name_array[i][0] := DBSubstancesUsed.Name;
      name_array[i][1] := DBSubstancesUsed.Formula;
      name_array[i][2] := DBSubstancesUsed.Source;

      // if conditional for when A+B solutions are needed
      if SolPrepTypeRadioGroup.ItemIndex=0 then begin
        ConcTypeArray[i] := DBSubstancesUsed.ConcType;
        if ConcTypeArray[i] = '0' then begin
          ShowMessage('Substance ' + name_array[i][0] + ' is incompatible with concentrated solutions');
          Exit;
        end;
      end;

      for j := 0 to varcount - 1 do problem_matrix_left[j][i] := 0.01 * DBSubstancesUsed.FieldByName(ElementsVarNames[j]) * DBSubstancesUsed.Purity / Volume;

      cost[i] := DBSubstancesUsed.Cost;
      i := i + 1;
      DBSubstancesUsed.Next;                                     // use .next here NOT .findnext!
    end;


    // right hand sided of the problem matrix (intended concentrations)
    for j := 0 to varcount - 1 do problem_matrix_right[j] := vartargetvalue[j];

    // check that there is at least one value for every element being evaluated
    for i := 0 to varcount - 1 do  begin
      test := 0;

      for j := 0 to arraysize - 1 do test := problem_matrix_left[i][j] + test;

      if test = 0 then begin
        ShowMessage('Error: There must be at least ONE substance containing each element for which a non-zero concentration is desired');
        ShowMessage('No substance is providing ' + varnames[i]);
        Exit;
      end;
    end;

    // solve equations using the MatrixSoleLS function
    RMatrixSolveLS(problem_matrix_left, varcount, arraysize, problem_matrix_right,
      0.0, answer,
      report, solutions);

    // calculate resulting ppm from solution


    SetLength(Result, 16);
    SetLength(gross_error, 16);
    SetLength(instrumental_error, 16);

    for i := 0 to NumOfElements-1 do begin
      test  := 0;
      upper := 0;
      lower := 0;

      for j := 0 to arraysize - 1 do begin
        if (solutions[j] > 0)  then begin
          test  := solutions[j] * all_element_contributions[i][j] +  preloaded_weight[j]*all_element_contributions[i][j] + test;
          upper := (preloaded_weight[j] + solutions[j] + weight_error) * all_element_contributions[i][j] * Volume / (Volume - volume_error) + upper;
          lower := (preloaded_weight[j] + solutions[j] - weight_error) * all_element_contributions[i][j] * Volume / (Volume + volume_error) + lower;
        end;

        if (solutions[j] <= 0) and (preloaded_weight[j] > 0)  then begin
          test  :=  preloaded_weight[j]*all_element_contributions[i][j] + test;
          upper := (preloaded_weight[j]  + weight_error) * all_element_contributions[i][j] * Volume / (Volume - volume_error) + upper;
          lower := (preloaded_weight[j]  - weight_error) * all_element_contributions[i][j] * Volume / (Volume + volume_error) + lower;
        end;
      end;

      Result[i] := test;

      if (SolPrepTypeRadioGroup.ItemIndex=1) and (all_element_targets[i] <> 0) then
        instrumental_error[i] := ((upper - lower) * (100 / all_element_targets[i])) / 2;

      if (SolPrepTypeRadioGroup.ItemIndex=0) and (all_element_targets[i] <> 0) then
        instrumental_error[i] := ((upper - lower) * (100 / all_element_targets[i])) / (2 * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text));

      if all_element_targets[i] <> 0 then gross_error[i] := ((test+waterquality[i]) * 100 / (all_element_targets[i])) - 100;

      if   all_element_targets[i] = 0 then  begin
        instrumental_error[i] := 0 ;
        gross_error[i] := 0 ;
      end ;
    end;

    // warn about values which are not used
    for i := 0 to arraysize - 1 do
      if (solutions[i] <= 0) and (preloaded_weight[i] <= 0) then
         ShowMessage(name_array[i][0] + ' is not used within the final result. Please remove it to obtain a better solution');

    // post results on listbox
    for i := 0 to arraysize - 1 do begin
      if (solutions[i] > 0) then begin
        StringGrid2.Cells[FORMULA_IDX,i+1] := (name_array[i][1]);

        //determine volume unit for description label
        case VolumeUnitsRadioGroup.ItemIndex of
          1: volumeunit := 'gallons';
          2: volumeunit := 'cubic meters';
          0: volumeunit := 'liters';
        end;

        // list additions for "direct addition" calculation type
        if SolPrepTypeRadioGroup.ItemIndex=0 = False then begin
          StringGrid2.Cells[NAME_IDX,i+1] := (name_array[i][0]);
          StringGrid2.Cells[SOURCE_IDX,i+1] := (name_array[i][2]);
          if IsLiquid[0][i] = 0 then  StringGrid2.Cells[AMOUNT_IDX,i+1] := (FloatToStr(round2(solutions[i] * weight_factor+ preloaded_weight[i] * weight_factor, 3)) );
          if IsLiquid[0][i] = 1 then  StringGrid2.Cells[AMOUNT_IDX,i+1] := (FloatToStr(round2(solutions[i] + preloaded_weight[i], 3)) );
          StringGrid2.Cells[COST_IDX,i+1] := (FloatToStr(round2(0.001 * solutions[i] * cost[i]+ 0.001*preloaded_weight[i]* cost[i], 1)));
          AnyObservationLabel.Caption := 'Values calculated for the preparation of ' + VolumeEdit.Text + ' ' + volumeunit;
        end;

        // List additions for A+B calculations
        if SolPrepTypeRadioGroup.ItemIndex=0 then begin
          StringGrid2.Cells[NAME_IDX,i+1] := (ConcTypeArray[i] + ' - ' + name_array[i][0]);
          StringGrid2.Cells[SOURCE_IDX,i+1] := (name_array[i][2]);

          if IsLiquid[0][i] = 0 then StringGrid2.Cells[AMOUNT_IDX,i+1] :=(FloatToStr(round2(solutions[i] * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text) * weight_factor +preloaded_weight[i]* weight_factor*StrtoFloatAnySeparator(ConcentrationFactorEdit.Text), 3)));
          if IsLiquid[0][i] = 1 then StringGrid2.Cells[AMOUNT_IDX,i+1] :=(FloatToStr(round2(solutions[i] * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text) +preloaded_weight[i]*StrtoFloatAnySeparator(ConcentrationFactorEdit.Text), 3)));

          StringGrid2.Cells[COST_IDX,i+1] :=(FloatToStr(round2(0.001 * solutions[i] * cost[i] * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text)+0.001*preloaded_weight[i] * cost[i]*StrtoFloatAnySeparator(ConcentrationFactorEdit.Text), 1)));

          AnyObservationLabel.Caption := 'Values calculated for the preparation of ' +
            VolumeEdit.Text + ' ' + volumeunit + ' of A and ' + VolumeEdit.Text + ' ' +
            volumeunit + ' of B solution. Please use ' +
            FloatToStr(round2(1000 / StrtoFloatAnySeparator(ConcentrationFactorEdit.Text), 3)) +
            'mL of A and B within every Liter of final solution';

        end;

      end;

      if (solutions[i] <= 0) and (preloaded_weight[i] > 0) then begin
        StringGrid2.Cells[FORMULA_IDX,i+1] := (name_array[i][1]);

        //determine volume unit for description label
        case VolumeUnitsRadioGroup.ItemIndex of
          1: volumeunit := 'gallons';
          2: volumeunit := 'cubic meters';
          0: volumeunit := 'liters';
        end;

        // list additions for "direct addition" calculation type

        if SolPrepTypeRadioGroup.ItemIndex=1 then begin
          StringGrid2.Cells[NAME_IDX,i+1] := (name_array[i][0]);
          StringGrid2.Cells[SOURCE_IDX,i+1] := (name_array[i][2]);
          StringGrid2.Cells[AMOUNT_IDX,i+1] := (FloatToStr(round2( preloaded_weight[i], 3)));
          StringGrid2.Cells[COST_IDX,i+1] :=(FloatToStr(round2(0.001*preloaded_weight[i]* cost[i], 1)));
          AnyObservationLabel.Caption := 'Values calculated for the preparation of ' + VolumeEdit.Text + ' ' + volumeunit;
        end;

        // List additions for A+B calculations
        if SolPrepTypeRadioGroup.ItemIndex=0 then begin
          StringGrid2.Cells[NAME_IDX,i+1] :=(ConcTypeArray[i] + ' - ' + name_array[i][0]);
          StringGrid2.Cells[SOURCE_IDX,i+1] := (name_array[i][2]);
          StringGrid2.Cells[AMOUNT_IDX,i+1] :=(FloatToStr(round2(preloaded_weight[i]*StrtoFloatAnySeparator(ConcentrationFactorEdit.Text), 3)));
          StringGrid2.Cells[COST_IDX,i+1] :=(FloatToStr(round2(0.001*preloaded_weight[i] * cost[i]*StrtoFloatAnySeparator(ConcentrationFactorEdit.Text), 1)));
          AnyObservationLabel.Caption := 'Values calculated for the preparation of ' +
            VolumeEdit.Text + ' ' + volumeunit + ' of A and ' + VolumeEdit.Text + ' ' +
            volumeunit + ' of B solution. Please use ' +
            FloatToStr(round2(1000 / StrtoFloatAnySeparator(ConcentrationFactorEdit.Text), 3)) +
            'mL of A and B within every Liter of final solution';
        end;
      end;

        //add units to use
        if IsLiquid[0][i] = 0 then StringGrid2.Cells[UNIT_IDX,i+1] := mass_unit;
        if IsLiquid[0][i] = 1 then StringGrid2.Cells[UNIT_IDX,i+1] := 'mL';

    end;


    for i := 0 to NumOfElements-1 do

    begin

      test := 0;

      StringGrid1.Cells[0,i+1] := all_element_names[i];

      test := waterquality[i];;

      if prev_conc = 'ppm' then
      StringGrid1.Cells[1,i+1] := (FloatToStr(round2((1/conc_factor[i])*(Result[i] + test), 3)));

      if prev_conc <> 'ppm' then
      StringGrid1.Cells[1,i+1] := (FloatToStrF((1/conc_factor[i])*(Result[i] + test), ffExponent, 4, 2));

      StringGrid1.Cells[2,i+1] := (FloatToStr(round2(gross_error[i], 1)) + '%');

      StringGrid1.Cells[3,i+1] :=('+/- ' + FloatToStr(round2(instrumental_error[i], 1)) + '%');

      if prev_conc = 'ppm' then
      (FindComponent('RLabel' + IntToStr(i+1)) as TLabel).Caption := FloattoStr(round2((1/conc_factor[i])*Result[i] + test, 3)) ;

      if prev_conc <> 'ppm' then
      (FindComponent('RLabel' + IntToStr(i+1)) as TLabel).Caption := FloattoStrF((1/conc_factor[i])*Result[i] + test, ffExponent, 4, 2) ;

      if (prev_conc = 'ppm') and (i=12) and (SiSiO2ComboBox.ItemIndex = 1) then
      (FindComponent('RLabel' + IntToStr(i+1)) as TLabel).Caption := FloattoStr(round2((1/SiO2toSiConstant)*(1/conc_factor[i])*Result[i] + test, 3)) ;

      if (prev_conc <> 'ppm') and (i=12) and (SiSiO2ComboBox.ItemIndex = 1) then
      (FindComponent('RLabel' + IntToStr(i+1)) as TLabel).Caption := FloattoStrF((1/SiO2toSiConstant)*(1/conc_factor[i])*Result[i] + test, ffExponent, 4, 2) ;

    end;





    // check magnitude of instrumental and gross error

       // check for popup disabling
    if DisablePopUpsCheckBox.Checked = false then

    begin

    for i := 0 to NumOfElements-1 do

    begin

      if (instrumental_error[i] > 100) then
        ShowMessage('Instrumental error is too high on ' + all_element_names[i] +
          ', prepare more solution volume or a more concentrated solution to reduce this error');

      if (gross_error[i] > 100) then
        ShowMessage('Gross errors on ' + all_element_names[i] +
          ' are too high, probably an adequate solution was NOT found. Please try a different substance combination');

    end;

    end ;

    CopyWeightButton.Enabled := True;

    // calculation of EC by empirical model
    if ECModelRadioGroup.ItemIndex=1 then begin
        predicted_ec := 0;
        for i := 1 to NumOfElements do
            predicted_ec := conc_factor[i-1]*StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption) * ec_contribution[ECModelRadioGroup.ItemIndex, i - 1] + predicted_ec;

        predicted_ec := round2(predicted_ec+0.39661671, 3);
    end;

    // Calculation of EC by LMCv2 model
    if ECModelRadioGroup.ItemIndex=0 then begin
        // calculate ionic strength used for conductivity model
        ionic_strength := 0;
        for i := 1 to NumOfElements do ionic_strength := zi[i-1]*zi[i-1]*(StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption) /(1000*molar_mass[i-1])) + ionic_strength;
        predicted_ec := 0;
        for i := 1 to NumOfElements do
            predicted_ec := conc_factor[i-1]
                            * (StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption)/(1000*molar_mass[i-1]))
                            * ec_contribution[ECModelRadioGroup.ItemIndex, i - 1]
                            * exp(-0.7025187*sqrt(ionic_strength)*power(zi[i-1],1.5))
                            + predicted_ec;

        predicted_ec := round2(predicted_ec, 3);
    end;

    PredictedECValuePanel.Caption := 'EC=' + FloattoStr(predicted_ec) + ' mS/cm';

    // analysis of stock solutions
    if SolPrepTypeRadioGroup.ItemIndex=0 then begin

      //first analyze A solution      23.0  158.5   30.3  284.6  146.2   58.0  28.3

      for i := 0 to NumOfElements-1 do begin
        test := 0;

        for j := 0 to arraysize - 1 do
          if ((solutions[j] > 0) or (preloaded_weight[j] > 0)) and (ConcTypeArray[j] = 'A') then
            test := preloaded_weight[j]*all_element_contributions[i][j]*Volume + solutions[j] * all_element_contributions[i][j] * Volume + test;

        // the 100 is to convert to percentage and the 100,000 to convert cubic meter to mL
        // in order to do the %W/V calculation (g to mL).

        test := test * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text) * 100 / (Volume * 1000000);

        if (all_element_names[i] <> 'P') and (all_element_names[i] <> 'K') then begin
          StockAnalysisForm.StringGrid.Cells[0, i+ 1] := (all_element_names[i]);
          StockAnalysisForm.StringGrid.Cells[1, i+ 1] := (FloattoStr(round2(test, 5)));
        end;

        if all_element_names[i] = 'P' then begin
          StockAnalysisForm.StringGrid.Cells[0, i+ 1] := ('P2O5');
          StockAnalysisForm.StringGrid.Cells[1, i+ 1] := (FloattoStr(round2(test * 2.2915, 3)));
        end;

        if all_element_names[i] = 'K' then  begin
          StockAnalysisForm.StringGrid.Cells[0, i+ 1] := ('K2O');
          StockAnalysisForm.StringGrid.Cells[1, i+ 1] := (FloattoStr(round2(test * 1.2047, 3)));
        end;
      end;

      //now analyze B

      for i := 0 to NumOfElements-1 do begin
        test := 0;

        for j := 0 to arraysize - 1 do
          if ((solutions[j] > 0) or (preloaded_weight[j] > 0)) and (ConcTypeArray[j] = 'B') then
            test :=  preloaded_weight[j]*all_element_contributions[i][j]*Volume + solutions[j] * all_element_contributions[i][j] * Volume + test;

        // the 100 is to convert to percentage and the 100,000 to convert cubic meter to mL
        // in order to do the %W/V calculation (g to mL).

        test := test * StrtoFloatAnySeparator(ConcentrationFactorEdit.Text) * 100 / (Volume * 1000000);

        if (all_element_names[i] <> 'P') and (all_element_names[i] <> 'K') then StockAnalysisForm.StringGrid.Cells[2, i+ 1] := (FloattoStr(round2(test, 5)));
        if all_element_names[i] = 'P' then StockAnalysisForm.StringGrid.Cells[2, i+ 1] :=(FloattoStr(round2(test * 2.2915, 3)));
        if all_element_names[i] = 'K' then StockAnalysisForm.StringGrid.Cells[2, i+ 1] :=(FloattoStr(round2(test * 1.2047, 3)));
      end;

    end;

    // carry out detailed analysis for each substance

    for i := 0 to arraysize - 1 do begin
      for  j := 0 to NumOfElements-1 do begin
        if (all_element_contributions[j][i] > 0) and (solutions[i] > 0) then begin
          PerSubstanceForm.StringGrid.RowCount := PerSubstanceForm.StringGrid.RowCount + 1 ;
          PerSubstanceForm.StringGrid.Cells[0, PerSubstanceForm.StringGrid.RowCount - 1] :=(name_array[i][0]);
          PerSubstanceForm.StringGrid.Cells[1, PerSubstanceForm.StringGrid.RowCount - 1] :=(all_element_names[j]);

          temp3 := solutions[i] * all_element_contributions[j][i]+preloaded_weight[i]*all_element_contributions[j][j] ;

           if prev_conc = 'ppm' then PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount - 1] :=(FloattoStr(round2((1/conc_factor[j])*temp3, 3)))
             else PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount - 1] :=(FloattoStrF((1/conc_factor[j])*temp3, ffExponent, 4, 2));
        end;

        if (all_element_contributions[j][i] > 0) and (solutions[i] <= 0) and (preloaded_weight[i] > 0) then begin
          PerSubstanceForm.StringGrid.RowCount := PerSubstanceForm.StringGrid.RowCount + 1 ;
          PerSubstanceForm.StringGrid.Cells[0, PerSubstanceForm.StringGrid.RowCount - 1] :=(name_array[i][0]);
          PerSubstanceForm.StringGrid.Cells[1, PerSubstanceForm.StringGrid.RowCount - 1] :=(all_element_names[j]);
          temp3 := preloaded_weight[i]*all_element_contributions[j][i] ;

          if prev_conc = 'ppm' then PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount - 1] :=(FloattoStr(round2((1/conc_factor[j])*temp3, 3)))
            else PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount - 1] :=(FloattoStrF((1/conc_factor[j])*temp3, ffExponent, 4, 2));
        end;
      end;
    end;


    // check for basic compatibility problems of stock solutions
    if  SolPrepTypeRadioGroup.ItemIndex=0 then begin

      if (StrtoFloatAnySeparator(StockAnalysisForm.StringGrid.Cells[1, 6]) > 0) and (StrtoFloatAnySeparator(StockAnalysisForm.StringGrid.Cells[1, 7]) > 0)  then
       ShowMessage('Your stock solutions have not been properly designed. Currently there is calcium and sulfate within the same solution (a big problem). Please do NOT carry out this preparation');

      if (StrtoFloatAnySeparator(StockAnalysisForm.StringGrid.Cells[2, 6]) > 0) and (StrtoFloatAnySeparator(StockAnalysisForm.StringGrid.Cells[2, 7]) > 0)  then
       ShowMessage('Your stock solutions have not been properly designed. Currently there is calcium and sulfate within the same solution (a big problem). Please do NOT carry out this preparation');

      temp1 :=  0 ;
      for i := 1 to StockAnalysisForm.StringGrid.RowCount - 1 do temp1 := StrtoFloatAnySeparator( StockAnalysisForm.StringGrid.Cells[1, i]) + temp1 ;

      if temp1 > 30 then ShowMessage('Your A solution might be too concentrated, please make sure you run solubility tests before preparing any large batches') ;

      temp1 :=  0 ;
      for i := 1 to StockAnalysisForm.StringGrid.RowCount - 1 do temp1 := StrtoFloatAnySeparator( StockAnalysisForm.StringGrid.Cells[1, i]) + temp1 ;

      if temp1 > 30 then ShowMessage('Your B solution might be too concentrated, please make sure you run solubility tests before preparing any large batches') ;
    end ;

    // END OF IMPORTANT IF STATEMENT
  end;
  // END OF IMPORTANT IF STATEMENT

  {
      From here we will be calulating concentrations from the custom masses input for
      each of the salts added to the substances_used database (the ones on the ListBox2 of
      the salt selection form).
  }


  // SECOND IMPORTANT IF STATEMENT
  if CalcTypeRadioGroup.Itemindex=1 then begin
    varnames := nil ;
    Result := nil ;
    name_array := nil ;

    SetLength(varnames, 16);
    SetLength(Result, 16);
    SetLength(name_array, arraysize, 2);
    SetLength(IsLiquid, 2, arraysize) ;
    SetLength(all_element_contributions, 16, arraysize);

    for j := 1 to NumOfElements do varnames[j - 1] := (FindComponent('Label' + IntToStr(j)) as TLabel).Caption;

    // initialize the counter
    i := 0;

    // load the database in order to get the weights and find the resulting ppm values
    DBSubstancesUsed.SearchFirst;

    while not DBSubstancesUsed.EOF do begin
      name_array[i][0] := DBSubstancesUsed.Name;
      name_array[i][1] := DBSubstancesUsed.Formula;

      if DBSubstancesUsed.IsLiquid then IsLiquid[0][i] := 1 else IsLiquid[0][i] := 0;
      IsLiquid[1][i] := DBSubstancesUsed.Density;

      for j := 0 to NumOfElements-1 do begin
        if IsLiquid[0][i] = 1 then all_solids := False;
        all_element_contributions[j][i] := 0.01 * DBSubstancesUsed.FieldByName(ElementsVarNames[j]) * DBSubstancesUsed.Purity / Volume;
      end;

      if IsLiquid[0][i] = 0 then StringGrid2.Cells[UNIT_IDX,i+1] := mass_unit;
      if IsLiquid[0][i] = 1 then StringGrid2.Cells[UNIT_IDX,i+1] := 'mL';

      for j := 0 to NumOfElements-1 do begin

        // ppm values are very easily calculated using all the information
        // within the DB
        Result[j] := (1 / weight_factor) * DBSubstancesUsed.Weight * 0.01 * DBSubstancesUsed.FieldByName(ElementsVarNames[j]) * DBSubstancesUsed.Purity / Volume + Result[j];

        if ((1 / weight_factor) * DBSubstancesUsed.Weight * 0.01 * DBSubstancesUsed.FieldByName(ElementsVarNames[j]) * DBSubstancesUsed.Purity / Volume > 0) then begin
          PerSubstanceForm.StringGrid.RowCount := PerSubstanceForm.StringGrid.RowCount + 1 ;
          PerSubstanceForm.StringGrid.Cells[0, PerSubstanceForm.StringGrid.RowCount-1] := (name_array[i][1]);
          PerSubstanceForm.StringGrid.Cells[1, PerSubstanceForm.StringGrid.RowCount-1] :=(varnames[j]);

          if prev_conc = 'ppm' then PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount-1] :=(
            FloattoStr(round2((1 / weight_factor) * DBSubstancesUsed.Weight *
            0.01 * DBSubstancesUsed.FieldByName(ElementsVarNames[j]) * DBSubstancesUsed.Purity / Volume, 3)));

          if prev_conc <> 'ppm' then PerSubstanceForm.StringGrid.Cells[2, PerSubstanceForm.StringGrid.RowCount-1] :=(
            FloattoStrF(double((1/conc_factor[j])*(1 / weight_factor) * DBSubstancesUsed.Weight *
            0.01 * DBSubstancesUsed.FieldByName(ElementsVarNames[j]) * DBSubstancesUsed.Purity / Volume), ffExponent, 4, 2));
        end;
      end;

      StringGrid2.RowCount := i+2 ;

      StringGrid2.Cells[NAME_IDX,i+1] := (name_array[i][0]);
      StringGrid2.Cells[FORMULA_IDX,i+1] := (name_array[i][1]);
      StringGrid2.Cells[COST_IDX,i+1] := (FloattoStr(round2(DBSubstancesUsed.Weight * DBSubstancesUsed.Cost * 0.001 *(1 / weight_factor), 1)));
      StringGrid2.Cells[AMOUNT_IDX,i+1] := FloattoStr(DBSubstancesUsed.Weight);

      i := i + 1;
      DBSubstancesUsed.Next;                                     // use .next here NOT .findnext!
    end;


    for i := 1 to NumOfElements do for j := 0 to NumOfElements-1 do begin
      if (FindComponent('Label' + IntToStr(i)) as TLabel).Caption = varnames[j] then begin
        StringGrid1.Cells[0,i] := (FindComponent('Label' + IntToStr(i)) as TLabel).Caption;

        if prev_conc = 'ppm' then begin
          StringGrid1.Cells[1,i] := (FloatToStr(round2(Result[j] + waterquality[i - 1], 3)));
          (FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption := FloatToStr(round2(Result[j] + waterquality[i - 1], 3));
          end ;

        if prev_conc <> 'ppm' then begin
          StringGrid1.Cells[1,i] :=(FloatToStrF((1/conc_factor[j])*(Result[j] + waterquality[i - 1]), ffExponent, 4, 2));
          (FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption := FloatToStrF((1/conc_factor[j])*(Result[j] + waterquality[i - 1]), ffExponent,4, 2);
        end;
      end;
    end;



    // calculation of EC by empirical model
    if ECModelRadioGroup.ItemIndex=1 then begin
      predicted_ec := 0;
      for i := 1 to NumOfElements do predicted_ec := conc_factor[i-1]*StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption) * ec_contribution[ECModelRadioGroup.ItemIndex, i - 1] + predicted_ec;
      predicted_ec := round2(predicted_ec+0.39661671, 3);
    end;

    // Calculation of EC by LMCv2 model
    if ECModelRadioGroup.ItemIndex=0 then begin
      // calculate ionic strength used for conductivity model
      ionic_strength := 0;
      for i := 1 to NumOfElements do ionic_strength := zi[i-1]*zi[i-1]*(StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption) /(1000*molar_mass[i-1])) + ionic_strength;

      predicted_ec := 0;
      for i := 1 to NumOfElements do predicted_ec := conc_factor[i-1]
                            * (StrtoFloatAnySeparator((FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption)/(1000*molar_mass[i-1]))
                            * ec_contribution[ECModelRadioGroup.ItemIndex, i - 1]
                            * exp(-0.7025187*sqrt(ionic_strength)*power(zi[i-1],1.5))
                            + predicted_ec;

      predicted_ec := round2(predicted_ec, 3);
    end;

    PredictedECValuePanel.Caption := 'EC=' + FloattoStr(predicted_ec) + ' mS/cm';

    CopyWeightButton.Enabled := True;

    //determine volume unit for description label

    if VolumeUnitsRadioGroup.ItemIndex=1 then volumeunit := 'gallons';
    if VolumeUnitsRadioGroup.ItemIndex=2 then volumeunit := 'cubic meters';
    if VolumeUnitsRadioGroup.ItemIndex=0 then volumeunit := 'liters';

    AnyObservationLabel.Caption := 'Values calculated for the preparation of ' + VolumeEdit.Text + ' ' + volumeunit;
  end;
  // END OF SECOND IMPORTANT IF STATEMENT

  //check and assign any empty elements in StringGrid
  for i := 0 to StringGrid2.RowCount - 2 do
    if (StringGrid2.Cells[NAME_IDX,i+1]) = '' then begin
      StringGrid2.Cells[NAME_IDX,i+1] := name_array[i][0] ;
      StringGrid2.Cells[FORMULA_IDX,i+1] := name_array[i][1] ;
      StringGrid2.Cells[AMOUNT_IDX,i+1] := '0' ;
      StringGrid2.Cells[COST_IDX,i+1] := '0' ;
    end;


  // total cost and mix calculation
  test := 0;

  for i := 1 to StringGrid2.RowCount - 1 do begin
    test := StrtoFloatAnySeparator(StringGrid2.Cells[COST_IDX,i]) + test;
    totalWeight := totalWeight + StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX,i]);
    for j:= 0 to NumOfElements-1 do mixContribution[j] := mixContribution[j] + StrtoFloatAnySeparator(StringGrid2.Cells[AMOUNT_IDX,i])*all_element_contributions[j][i-1]*Volume;
  end;

  for j := 1 to NumOfElements do begin
     AnalysisForm.StringGrid.Cells[1,j] := FloatToStr(round2(100*mixContribution[j-1]/totalWeight,3));
     if AnalysisForm.StringGrid.Cells[0,j] = 'K2O' then AnalysisForm.StringGrid.Cells[1,j] := FloatToStr(round2(1.2047*100*mixContribution[j-1]/totalWeight,3));
     if AnalysisForm.StringGrid.Cells[0,j] = 'P2O5' then AnalysisForm.StringGrid.Cells[1,j] := FloatToStr(round2(2.290*100*mixContribution[j-1]/totalWeight,3));
  end;

  if all_solids then InputMixAnalysisButton.Enabled := True;
  TotalCostLabel.Caption := ('Total Cost is ' + FloattoStr(round2(test, 1)));


  // post ratios based on results posted on listboxes above
  RatioForm.SetPostRatios(True);

  // enable or disable stock solution analysis button
  if SolPrepTypeRadioGroup.ItemIndex=0 then StockSolutionAnalysisButton.Enabled := True else  StockSolutionAnalysisButton.Enabled := False;

  // set water quality values
  for j := 1 to NumOfElements do StringGrid1.Cells[4,j] := FloatToStr(waterquality[j-1]);

  if DisablePopUpsCheckBox.Checked = false then ShowMessage('Calculation carried out successfully :o)');

end;



procedure TMainForm.AddFormulationButtonClick(Sender: TObject);
begin
  if FormulationNameEdit.Text = 'Input Formulation Name Here' then begin
    ShowMessage('Please input a name within the name input field') ;
    Exit;
  end;

  DBFormulations.Name := FormulationNameEdit.Text;
  DBFormulations.N_NO3 := StrtoFloatAnySeparator(Edit1.Text);
  DBFormulations.N_NH4 := StrtoFloatAnySeparator(Edit2.Text);
  DBFormulations.P := StrtoFloatAnySeparator(Edit3.Text);
  DBFormulations.K := StrtoFloatAnySeparator(Edit4.Text);
  DBFormulations.Mg := StrtoFloatAnySeparator(Edit5.Text);
  DBFormulations.Ca := StrtoFloatAnySeparator(Edit6.Text);
  DBFormulations.S  := StrtoFloatAnySeparator(Edit7.Text);
  DBFormulations.Fe := StrtoFloatAnySeparator(Edit8.Text);
  DBFormulations.Mn := StrtoFloatAnySeparator(Edit9.Text);
  DBFormulations.Zn := StrtoFloatAnySeparator(Edit10.Text);
  DBFormulations.B  := StrtoFloatAnySeparator(Edit11.Text);
  DBFormulations.Cu := StrtoFloatAnySeparator(Edit12.Text);
  DBFormulations.Si := StrtoFloatAnySeparator(Edit13.Text);
  DBFormulations.Mo := StrtoFloatAnySeparator(Edit14.Text);
  DBFormulations.Na := StrtoFloatAnySeparator(Edit15.Text);
  DBFormulations.Cl := StrtoFloatAnySeparator(Edit16.Text);

  case ConcUnitsRadioGroup.ItemIndex of
    0: DBFormulations.Units := 'ppm';
    1: DBFormulations.Units := 'M';
    2: DBFormulations.Units := 'mM';
    3: DBFormulations.Units := 'mN';
  end;

  DBFormulations.Insert;

  if FormulationNameEdit.Text <> 'DEFAULT' then
    ShowMessage('Formulation named ' + FormulationNameEdit.Text + ' has been saved to the Database');

  MainForm.UpdateComboBox;

  DeleteForulationButton.Enabled := True;

end;

procedure TMainForm.AddFormulationButtonResize(Sender: TObject);
begin

end;



procedure TMainForm.DeleteForulationButtonClick(Sender: TObject);
begin

  if FormulationComboBox.Text = 'Select formulation from DB' then begin
    ShowMessage('Please select a formulation to delete from the drop down menu') ;
    Exit;
  end;

  if FormulationComboBox.Items.Count = 0 then Exit;

  DBFormulations.Delete('Name', FormulationComboBox.Items[FormulationComboBox.ItemIndex]);
  FormulationComboBox.Items.Delete(FormulationComboBox.ItemIndex);

  if FormulationComboBox.Items.Count = 0 then begin
    FormulationComboBox.Text  := 'Select formulation from DB';
    DeleteForulationButton.Enabled := False;
  end;

end;

procedure TMainForm.SubstanceAnalysisButtonClick(Sender: TObject);
begin
  CommercialNutrientForm.SubstancesComboBox.Items.Clear;
  DBSubstances.SearchFirst;

  while not DBSubstances.EOF do
  begin
    CommercialNutrientForm.SubstancesComboBox.Items.Add(DBSubstances.Name);
    DBSubstances.Next;                                     // use .next here NOT .findnext!
  end;

  CommercialNutrientForm.SubstancesComboBox.Sorted := true ;
  CommercialNutrientForm.Visible := True;
end;

procedure TMainForm.SetWQParamsButtonClick(Sender: TObject);
begin
  WatterQualityForm.Visible := True;
  WatterQualityForm.UpdateComboBox;

  if WatterQualityForm.SelectWQDataComboBox.Items.Count = 0 then begin
    WatterQualityForm.SelectWQDataComboBox.Text  := 'Select Water Quality Data From DB';
    WatterQualityForm.RemoveFromDBButton.Enabled := False;
  end;
end;

procedure TMainForm.SetIPValuesButtonClick(Sender: TObject);
begin
  InsPrecisionForm.Visible := True;
end;


procedure TMainForm.FormulationComboBoxSelect(Sender: TObject);
var
  Units : string ;
begin
  if DBFormulations.SearchByField('NAME',FormulationComboBox.Items[FormulationComboBox.ItemIndex], True) then begin
    Units := DBFormulations.UNITS;
    if Units = 'ppm' then ConcUnitsRadioGroup.ItemIndex := 0;
    if Units = 'M' then ConcUnitsRadioGroup.ItemIndex := 1;
    if Units = 'mM' then ConcUnitsRadioGroup.ItemIndex := 2;
    if Units = 'mN' then ConcUnitsRadioGroup.ItemIndex := 3;
    FormulationNameEdit.Text := DBFormulations.Name;
    Edit1.Text  := FloatToStr(DBFormulations.N_NO3);
    Edit2.Text := FloatToStr(DBFormulations.N_NH4);
    Edit3.Text  := FloatToStr(DBFormulations.P);
    Edit4.Text  := FloatToStr(DBFormulations.K);
    Edit5.Text  := FloatToStr(DBFormulations.Mg);
    Edit6.Text  := FloatToStr(DBFormulations.Ca);
    Edit7.Text  := FloatToStr(DBFormulations.S);
    Edit8.Text  := FloatToStr(DBFormulations.Fe);
    Edit9.Text := FloatToStr(DBFormulations.Mn);
    Edit10.Text  := FloatToStr(DBFormulations.Zn);
    Edit11.Text  := FloatToStr(DBFormulations.B);
    Edit12.Text := FloatToStr(DBFormulations.Cu);
    Edit13.Text := FloatToStr(DBFormulations.Si);
    Edit14.Text := FloatToStr(DBFormulations.Mo);
    Edit15.Text := FloatToStr(DBFormulations.Na);
    Edit16.Text := FloatToStr(DBFormulations.Cl);
  end;
end;


procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
    j: integer;
begin
    //save program variable states on exit
    for j := 1 to NumOfElements do DBsettings.SaveSettingsValue('Main', 'MainForm.Edit' + IntToStr(j), (FindComponent('Edit' + IntToStr(j)) as TEdit).Text);
    for j := 1 to NumOfElements do DBsettings.SaveSettingsValue('Main', 'MainForm.RLabel' + IntToStr(j), (FindComponent('RLabel' + IntToStr(j)) as TLabel).Caption);
//    for j := 1 to 30 do DBsettings.SaveSettingsValue('Main', 'MainForm.Label' + IntToStr(j), (FindComponent('Label' + IntToStr(j)) as TLabel).Caption);
//    for j := 1 to 15 do DBsettings.SaveSettingsValue('Main', 'MainForm.RadioButton' + IntToStr(j), BoolToStr((FindComponent('RadioButton' + IntToStr(j)) as TRadioButton).Checked));

    DBsettings.SaveSettingsValue('Main', 'version', VERSION);
    DBsettings.SaveSettingsValue('Main', 'prev_conc', prev_conc);
    DBsettings.SaveSettingsValue('Main', 'MainForm.ConcentrationFactorLabel', VolumeLabel.Caption);
    DBsettings.SaveSettingsValue('Main', 'MainForm.AnyObservationLabel', AnyObservationLabel.Caption);
    DBsettings.SaveSettingsValue('Main', 'MainForm.TotalCostLabel', TotalCostLabel.Caption);
    DBsettings.SaveSettingsValue('Main', 'MainForm.PredictedECValuePanel', PredictedECValuePanel.Caption);
    DBsettings.SaveSettingsValue('Main', 'MainForm.DisablePopUpsCheckBox', BoolToStr(DisablePopUpsCheckBox.Checked));
    DBsettings.SaveSettingsValue('Main', 'MainForm.SmallWindowCheckBox', BoolToStr(SmallWindowCheckBox.Checked));
    DBsettings.SaveSettingsValue('Main', 'SubstanceSelectionForm.SummaryPopupsCheckBox', BoolToStr(SubstanceSelectionForm.SummaryPopupsCheckBox.checked));
    DBsettings.SaveSettingsValue('Main', 'MainForm.FormulationNameEdit', FormulationNameEdit.Text);
    DBsettings.SaveSettingsValue('Main', 'MainForm.VolumeEdit', VolumeEdit.Text);
    DBsettings.SaveSettingsValue('Main', 'MainForm.ConcentrationFactorEdit', ConcentrationFactorEdit.Text);

    DBsettings.SaveSettingsValue('Main', 'MainForm.SiSiO2ComboBox', IntToStr(SiSiO2ComboBox.ItemIndex));

    SaveStringGridToDBSettings(ComparisonForm.StringGrid, 'hb_comparison');
    SaveStringGridToDBSettings(StockAnalysisForm.StringGrid, 'hb_stockanalysis');
    SaveStringGridToDBSettings(PerSubstanceForm.StringGrid, 'hb_persubstance');
    SaveStringGridToDBSettings(RatioForm.StringGrid, 'hb_ratios');
    SaveStringGridToDBSettings(StringGrid1, 'hb_ppm_results');
    SaveStringGridToDBSettings(StringGrid2, 'hb_results');

    if ComparisonForm.StringGrid.ColCount = 1 then  DeleteFile('hb_comparison.csv');
end;

procedure TMainForm.LoadValues;
var
    j: integer;
begin
    //load program variables
    // if the setting files are from an old version ignore them and stop loading
    if DBsettings.LoadSettingsValue('Main', 'version', VERSION) <> VERSION then exit;

    for j := 1 to NumOfElements do (FindComponent('Edit' + IntToStr(j)) as TEdit).Text := DBsettings.LoadSettingsValue('Main', 'MainForm.Edit' + IntToStr(j), (FindComponent('Edit' + IntToStr(j)) as TEdit).Text);
    for j := 1 to NumOfElements do (FindComponent('RLabel' + IntToStr(j)) as TLabel).Caption := DBsettings.LoadSettingsValue('Main', 'MainForm.RLabel' + IntToStr(j), '0');
//    for j := 1 to 30 do (FindComponent('Label' + IntToStr(j)) as TLabel).Caption := DBsettings.LoadSettingsValue('Main', 'MainForm.Label' + IntToStr(j), (FindComponent('Label' + IntToStr(j)) as TLabel).Caption);

    prev_conc := DBsettings.LoadSettingsValue('Main', 'prev_conc', prev_conc);
//    for j := 1 to 15 do (FindComponent('RadioButton' + IntToStr(j)) as TRadioButton).Checked := StrToBool(DBsettings.LoadSettingsValue('Main', 'MainForm.RadioButton' + IntToStr(j), BoolToStr((FindComponent('RadioButton' + IntToStr(j)) as TRadioButton).Checked)));

    VolumeLabel.Caption := DBsettings.LoadSettingsValue('Main', 'MainForm.ConcentrationFactorLabel', VolumeLabel.Caption);
    AnyObservationLabel.Caption := DBsettings.LoadSettingsValue('Main', 'MainForm.AnyObservationLabel', AnyObservationLabel.Caption);
    TotalCostLabel.Caption := DBsettings.LoadSettingsValue('Main', 'MainForm.TotalCostLabel', TotalCostLabel.Caption);
    PredictedECValuePanel.Caption := DBsettings.LoadSettingsValue('Main', 'MainForm.PredictedECValuePanel', PredictedECValuePanel.Caption);
    DisablePopUpsCheckBox.Checked := StrToBool(DBsettings.LoadSettingsValue('Main', 'MainForm.DisablePopUpsCheckBox', BoolToStr(DisablePopUpsCheckBox.Checked)));
    SmallWindowCheckBox.Checked := StrToBool(DBsettings.LoadSettingsValue('Main', 'MainForm.SmallWindowCheckBox', BoolToStr(SmallWindowCheckBox.Checked)));
    SubstanceSelectionForm.SummaryPopupsCheckBox.checked := StrToBool(DBsettings.LoadSettingsValue('Main', 'SubstanceSelectionForm.SummaryPopupsCheckBox', BoolToStr(SubstanceSelectionForm.SummaryPopupsCheckBox.checked)));
    FormulationNameEdit.Text := DBsettings.LoadSettingsValue('Main', 'MainForm.FormulationNameEdit', FormulationNameEdit.Text);
    VolumeEdit.Text := DBsettings.LoadSettingsValue('Main', 'MainForm.VolumeEdit', VolumeEdit.Text);
    ConcentrationFactorEdit.Text := DBsettings.LoadSettingsValue('Main', 'MainForm.ConcentrationFactorEdit', ConcentrationFactorEdit.Text);

    SiSiO2ComboBox.ItemIndex := StrToInt(DBsettings.LoadSettingsValue('Main', 'MainForm.SiSiO2ComboBox', IntToStr(SiSiO2ComboBox.ItemIndex)));

    LoadToStringGridFromDBSettings(ComparisonForm.StringGrid, 'hb_comparison');
    LoadToStringGridFromDBSettings(StockAnalysisForm.StringGrid, 'hb_stockanalysis');
    LoadToStringGridFromDBSettings(PerSubstanceForm.StringGrid, 'hb_persubstance');
    LoadToStringGridFromDBSettings(RatioForm.StringGrid, 'hb_ratios');
    LoadToStringGridFromDBSettings(StringGrid1, 'hb_ppm_results');
    LoadToStringGridFromDBSettings(StringGrid2, 'hb_results');

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  StringGrid1.ShowHint:=True;
  StringGrid1.OnShowHint:=@GridShowHint;
end;

procedure TMainForm.GridShowHint(Sender: TObject; HintInfo: PHintInfo);
var
  col: integer = -1;
  row: integer = -1;
  grid: TStringGrid absolute Sender;
begin
  grid.MouseToCell(HintInfo^.CursorPos.X, HintInfo^.CursorPos.Y, col, row);
  if col = 1 then HintInfo^.HintStr:='Final ppm of solution';
  if col = 2 then HintInfo^.HintStr:='Gross Error';
  if col = 3 then HintInfo^.HintStr:='Instrumental Error';
  if col = 4 then HintInfo^.HintStr:='Source water ppm contribution';
  HintInfo^.HideTimeout:=5000; // long-lasting hint
end;


procedure TMainForm.FormWindowStateChange(Sender: TObject);
begin

  If WindowState = wsMaximized then
  begin
  WindowState := wsNormal ;
  ShowMessage('Maximizing is currently not supported due to limitations of the window resizing Lazarus implementations') ;
  end;

end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  StringGrid2.CopyToClipboard(true);
  StringGrid2.CopyToClipboard ;
end;


procedure TMainForm.CleanResults;
var
  i: integer ;
begin
  StringGrid1.Clean ;
  StringGrid2.Clean ;
  for i := 1 to NumOfElements do (FindComponent('RLabel' + IntToStr(i)) as TLabel).Caption := '0' ;
end;

procedure TMainForm.ConcUnitsRadioGroupSetTexts(ConcLabelCaption, UnitsLabelCaption, SGCells, PerSubstanceFormSGCells, RatioFormSGCells: string);
begin
  ConcLabel.Caption := ConcLabelCaption;
  UnitsLabel.Caption := UnitsLabelCaption;
  StringGrid1.Cells[1,0] := SGCells;
  PerSubstanceForm.StringGrid.Cells[2, 0] := PerSubstanceFormSGCells;
  RatioForm.StringGrid.Cells[1, 0] := RatioFormSGCells;
end;

procedure TMainForm.ConcUnitsRadioGroupClick(Sender: TObject);
var
  i: integer ;
  prev_value : double ;
begin
  case ConcUnitsRadioGroup.ItemIndex of
    0: ConcUnitsRadioGroupSetTexts('Conc. (ppm)', '(ppm)', 'Result (ppm)', 'Contribution (ppm)', 'Ratio (ppm: ppm)');
    1: ConcUnitsRadioGroupSetTexts('Conc. (mol/L)', '(mol/L)', 'Result (mol/L)', 'Contribution (mol/L)', 'Ratio (mol/L: mol/L)');
    2: ConcUnitsRadioGroupSetTexts('Conc. (mmol/L)', '(mmol/L)', 'Result (mmol/L)', 'Contribution (mmol/L)', 'Ratio (mmol/L: mmol/L)');
    3: ConcUnitsRadioGroupSetTexts('Conc. (meq/L)', '(meq/L)', 'Result (meq/L)', 'Contribution (meq/L)', 'Ratio (meq/L: meq/L)');
  end;

  for i := 1 to NumOfElements do begin
    prev_value := StrtoFloatAnySeparator((FindComponent('Edit' + IntToStr(i)) as TEdit).Text)  ;
    if ConcUnitsRadioGroup.ItemIndex=0 then begin
       if prev_conc = 'mol/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value*molar_mass[i-1]*1000, ffGeneral, 4, 2);
       if prev_conc = 'mmol/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value*molar_mass[i-1], ffGeneral, 4, 2);
       if prev_conc = 'meq/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value*molar_mass[i-1]/equivalents[i-1], ffGeneral, 4, 2);
    end;
    if ConcUnitsRadioGroup.ItemIndex=1 then begin
       if prev_conc = 'ppm' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF((prev_value/molar_mass[i-1])/1000, ffExponent, 4, 2);
       if prev_conc = 'mmol/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value/1000, ffExponent, 4, 2);
       if prev_conc = 'meq/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(0.001*prev_value/equivalents[i-1], ffExponent, 4, 2);
    end;
    if ConcUnitsRadioGroup.ItemIndex=2 then begin
       if prev_conc = 'ppm' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value/molar_mass[i-1], ffExponent, 4, 2);
       if prev_conc = 'mol/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value*1000, ffExponent, 4, 2);
       if prev_conc = 'meq/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value/equivalents[i-1], ffExponent, 4, 2);
    end;
    if ConcUnitsRadioGroup.ItemIndex=3 then begin
       if prev_conc = 'ppm' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value*equivalents[i-1]/molar_mass[i-1], ffExponent, 4, 2);
       if prev_conc = 'mmol/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value*equivalents[i-1], ffExponent, 4, 2);
       if prev_conc = 'mol/L' then (FindComponent('Edit' + IntToStr(i)) as TEdit).Text  := FloatToStrF(prev_value*equivalents[i-1]*1000, ffExponent, 4, 2);
    end;
  end;

  case ConcUnitsRadioGroup.ItemIndex of
    0: prev_conc := 'ppm';
    1: prev_conc := 'mol/L';
    2: prev_conc := 'mmol/L';
    3: prev_conc := 'meq/L';
  end;

  cleanresults ;

end;

procedure TMainForm.VolumeUnitsRadioGroupDblClick(Sender: TObject);
begin
  cleanresults;
end;

procedure TMainForm.CalcTypeRadioGroupChangeBounds(Sender: TObject);
var
   i: integer;
begin
  if CalcTypeRadioGroup.Itemindex=0 then
     CopyWeightButton.Caption := 'Copy Weight Results to DB'
  else
     CopyWeightButton.Caption := 'Copy ppm results to formulation';

  CopyWeightButton.Enabled   := False;
  StockSolutionAnalysisButton.Enabled   := False;

  for i := 1 to NumOfElements do begin
      if CalcTypeRadioGroup.Itemindex=0 then begin
        (FindComponent('Edit' + IntToStr(i)) as TEdit).Enabled := True;
         Panel2.Enabled := True;
      end else begin
        (FindComponent('Edit' + IntToStr(i)) as TEdit).Enabled := False;
        SolPrepTypeRadioGroup.ItemIndex:=1;
        Panel2.Enabled := False;
      end;
  end;
  cleanresults;
end;


procedure TMainForm.SolPrepTypeRadioGroupClick(Sender: TObject);
begin
  if SolPrepTypeRadioGroup.ItemIndex=0 then begin
    VolumeLabel.Caption := 'Stock solution volume';
    ConcentrationFactorEdit.Enabled  := True;
  end else begin
    VolumeLabel.Caption := 'Volume';
    ConcentrationFactorEdit.Enabled  := False;
  end;
  cleanresults;
end;



procedure TMainForm.MassUnitsRadioGroupClick(Sender: TObject);
begin
  if MassUnitsRadioGroup.ItemIndex=0 then begin
    StringGrid2.Cells[AMOUNT_IDX,0]  := 'Mass (g)';
  end else begin
    StringGrid2.Cells[AMOUNT_IDX,0]  := 'Mass (oz)';
  end;
  cleanresults;
end;


procedure TMainForm.StringGrid2EditButtonClick(Sender: TObject);
begin
  if StringGrid2.Cells[SOURCE_IDX,StringGrid2.Row] <> '' then OpenURL(StringGrid2.Cells[SOURCE_IDX,StringGrid2.Row]);
end;

procedure TMainForm.StringGrid2EditingDone(Sender: TObject);
begin
  weightFineTunning;
end;


procedure TMainForm.ToggleBox1Change(Sender: TObject);
begin
  DatasetNameForm.Visible := true;
end;


initialization
  {$I hb_main.lrs}

end.

