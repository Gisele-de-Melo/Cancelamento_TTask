//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Threading;

type
  TForm1 = class(TForm)
    StartButton: TButton;
    CancelButton: TButton;
    StatusLabel: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
  private
    { Private declarations }
    Task: ITask;
    procedure UpdateStatus(const Msg: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.StartButtonClick(Sender: TObject);
begin
  UpdateStatus('Tarefa iniciada...');

  Task := TTask.Run(
    procedure
    var
      I: Integer;
    begin
      for I := 1 to 100 do
      begin

        //verifica se o status da task está cancelado e cancela a execução
        if TTask.CurrentTask.Status = TTaskStatus.Canceled then
        begin

          TThread.Synchronize(nil,
            procedure
            begin
              UpdateStatus('Tarefa cancelada!');
            end);
          Exit;
        end;

        Sleep(50); // Simula uma operação demorada

        TThread.Synchronize(nil,
          procedure
          begin
            UpdateStatus('Progresso: ' + I.ToString + '%');
          end);
      end;

      TThread.Synchronize(nil,
        procedure
        begin
          UpdateStatus('Tarefa concluída!');
        end);
    end);
end;

procedure TForm1.CancelButtonClick(Sender: TObject);
begin
  if Assigned(Task) then //Verifica se a task está atribuída
    Task.Cancel; //Cancela a Task
end;

procedure TForm1.UpdateStatus(const Msg: string);
begin
  StatusLabel.Caption := Msg;
end;

end.
