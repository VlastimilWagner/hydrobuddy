unit hb_constants;

{$mode FPC}

interface

uses
  Classes, SysUtils;

const
  NumOfElements = 16;

  VERSION: string = '1.101';

  molar_mass: array[0..NumOfElements-1] of double =
    ( 14.007,
      14.007,
      30.974,
      39.098,
      24.305,
      40.078,
      32.066,
      55.845,
      54.938,
      65.409,
      10.811,
      63.546,
      28.086,
      95.94,
      22.990,
      35.453);

  equivalents: array[0..NumOfElements-1] of integer =
     ( 1,
       1,
       3,
       1,
       2,
       2,
       2,
       2,
       2,
       2,
       1,
       2,
       2,
       2,
       1,
       1);

  zi : array[0..NumOfElements-1] of double =
    ( 1,
      1,
      1,
      1,
      2,
      2,
      2,
      2,
      2,
      2,
      1,
      2,
      2,
      2,
      1,
      1);

  ec_contribution: array[0..1,0..NumOfElements-1] of double =
    ((
     71.46,
     73.5,
     57,
     73,
     106,
     119,
     160,
     108.0,
     0,
     0,
     0,
     0,
     0,
     76.35,
     50.01,
     0
     ),(
     0.403791,
     -0.308967,
     0.142525,
     -0.110791,
     -0.358782,
     -0.283549,
     0.276118,
     0,
     0,
     0,
     0,
     0,
     0,
     0,
     0,
     0));

  ElementsVarNames : array[0..NumOfElements-1] of string =
     ('N_NO3','N_NH4','P','K','Mg','Ca','S','Fe','Mn','Zn','B','Cu','Si','Mo','Na','Cl');

  P2O5toPConstant: double = 0.4364;
  K2OtoKConstant: double = 0.8301;
  SiO2toSiConstant: double = 0.4684;
  GaltoLConstant: double = 3.78541178;
  GramtoOunceCounstant: double = 0.0352739619;

implementation

end.

