{

Sercan TEK
www.sercanca.com
2016/09

Tekerlek yuvarlanma dairesi = [(inch türünden jant çapı*25,4)+(lastik genişliği*yanak yüksekliği*2)]*Pi sayısı
Tekerleğe aktarılan devir = (motor devri(rpm)/son dişli oranı/hangi vitesdeysek o dişlinin oranı/1000)
Hız = Tekerlek yuvarlanma dairesi x tekerleğe aktarılan devir x 60


}






unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Menus, lclintf, math ;

type

  { TForm1 }

  TForm1 = class(TForm)
    log: TLabel;
    Panel5: TPanel;
    rpm_saat: TScrollBar;
    taban: TEdit;
    orangeri: TEdit;
    oransondisli: TEdit;
    Timer1: TTimer;
    yanak: TEdit;
    jant: TEdit;
    rpm: TEdit;
    oran1: TEdit;
    oran2: TEdit;
    oran3: TEdit;
    oran4: TEdit;
    oran5: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    sonuc1: TLabel;
    Label21: TLabel;
    sonuc2: TLabel;
    Label24: TLabel;
    sonuc3: TLabel;
    Label26: TLabel;
    sonuc4: TLabel;
    Label28: TLabel;
    sonuc5: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    sonucgeri: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure oran1KeyPress(Sender: TObject; var Key: char);
    procedure rpmChange(Sender: TObject);
    procedure rpm_saatScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure tabanChange(Sender: TObject);
    procedure tabanKeyPress(Sender: TObject; var Key: char);
    procedure hesapla;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.hesapla;
var
  tekerlek_cevresi : double;
  tekerlek_Devri_1 : double;
  tekerlek_Devri_2 : double;
  tekerlek_Devri_3 : double;
  tekerlek_Devri_4 : double;
  tekerlek_Devri_5 : double;
  tekerlek_Devri_geri : double;

begin

 if ((taban.Text='') or (yanak.Text='') or (jant.Text='')  or
    (rpm.Text='')   or (oran1.Text='') or (oran2.Text='') or
    (oran3.Text='') or (oran4.Text='') or (oran4.Text='') or
    (orangeri.Text='') or (oransondisli.Text='')) then
    begin
      log.Caption:=' --> Değerler Boş Geçilemez.';
      sonuc1.caption := '';
      sonuc2.caption := '';
      sonuc3.caption := '';
      sonuc4.caption := '';
      sonuc5.caption := '';
      sonucgeri.caption := '';
      exit;
    end;


 if ((strtoint(taban.Text)<=54) or (strtoint(yanak.Text)<=9) or
    (strtoint(jant.Text)<=9)   or (strtoint(rpm.Text)<=249) or
    (strtofloat(oransondisli.Text)<=0)or
    (strtofloat(oran1.Text)<=0)  or (strtofloat(oran2.Text)<=0)or
    (strtofloat(oran3.Text)<=0)  or (strtofloat(oran4.Text)<=0)or
    (strtofloat(oran5.Text)<=0)  or (strtofloat(orangeri.Text)<=0)) then

  begin
      log.Caption:=' --> Değerler Yanlış Girildi.';
      sonuc1.caption := '';
      sonuc2.caption := '';
      sonuc3.caption := '';
      sonuc4.caption := '';
      sonuc5.caption := '';
      sonucgeri.caption := '';
      exit;
  end;



  // Tekerlek yuvarlanma dairesi = [(inch türünden jant çapı*25,4)+(lastik genişliği*yanak yüksekliği*2)]*Pi sayısı
  tekerlek_cevresi := (RoundTo(((strtoint(jant.Text)*25.4)+(strtoint(taban.Text)*(strtoint(yanak.Text)/100)*2))*3.14,0))/1000;
  //  Tekerleğe aktarılan devir = (motor devri(rpm)/son dişli oranı/hangi vitesdeysek o dişlinin oranı/1000)
  tekerlek_Devri_1 := (strtoint(rpm.Text)/strtofloat(oransondisli.Text)/strtofloat(oran1.Text)/1000);
  tekerlek_Devri_2 := (strtoint(rpm.Text)/strtofloat(oransondisli.Text)/strtofloat(oran2.Text)/1000);
  tekerlek_Devri_3 := (strtoint(rpm.Text)/strtofloat(oransondisli.Text)/strtofloat(oran3.Text)/1000);
  tekerlek_Devri_4 := (strtoint(rpm.Text)/strtofloat(oransondisli.Text)/strtofloat(oran4.Text)/1000);
  tekerlek_Devri_5 := (strtoint(rpm.Text)/strtofloat(oransondisli.Text)/strtofloat(oran5.Text)/1000);
  tekerlek_Devri_geri := (strtoint(rpm.Text)/strtofloat(oransondisli.Text)/strtofloat(orangeri.Text)/1000);
  // Hız = Tekerlek yuvarlanma dairesi x tekerleğe aktarılan devir x 60
  sonuc1.caption := floattostr(RoundTo(tekerlek_cevresi*tekerlek_Devri_1*60,0))+ ' Km/h';
  sonuc2.caption := floattostr(RoundTo(tekerlek_cevresi*tekerlek_Devri_2*60,0))+ ' Km/h';
  sonuc3.caption := floattostr(RoundTo(tekerlek_cevresi*tekerlek_Devri_3*60,0))+ ' Km/h';
  sonuc4.caption := floattostr(RoundTo(tekerlek_cevresi*tekerlek_Devri_4*60,0))+ ' Km/h';
  sonuc5.caption := floattostr(RoundTo(tekerlek_cevresi*tekerlek_Devri_5*60,0))+ ' Km/h';
  sonucgeri.caption := floattostr(RoundTo(tekerlek_cevresi*tekerlek_Devri_geri*60,0))+ ' Km/h';


  log.Caption:='';

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  hesapla;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin

  Showmessage('Fiat Uno 70S için Kullanım Klavuzuna Göre Değerler Yüklenecektir.');
  taban.text := '155';
  yanak.text := '70';
  jant.text  := '13';
  rpm.Text:='6000';
  rpm_Saat.Position:=6000;
  oran1.text:='3,909';
  oran2.Text:='2,238';
  oran3.text:='1,469';
  oran4.text:='1,029';
  oran5.text:='0,875';
  orangeri.Text:='3,909';
  oransondisli.Text:='3,562';
  hesapla;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  OpenURL('www.sercanca.com');
  showmessage('Devir bilgisine göre Aracın Hızını Hesaplar. www.sercanca.com');
end;

procedure TForm1.oran1KeyPress(Sender: TObject; var Key: char);
begin
    if not (key in ['0'..'9',',',#8]) then
  begin
    Key:=#0;
    Beep;
  end;
end;

procedure TForm1.rpmChange(Sender: TObject);
var
  deger:integer;
begin
  if (rpm.Text<>'') then
  begin
   deger:=strtoint(rpm.Text);
   rpm_Saat.Position:=deger div 1000;
   hesapla;
  end;
end;

procedure TForm1.rpm_saatScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  rpm.Text:=inttostr(1000*rpm_saat.position);
  hesapla;
end;

procedure TForm1.tabanChange(Sender: TObject);
begin
  hesapla;
end;

procedure TForm1.tabanKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9',#8]) then
  begin
    Key:=#0;
    Beep;
  end;
end;

end.

