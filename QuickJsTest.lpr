program QuickJsTest;

{$I mormot.defines.inc}


uses
  {$I mormot.uses.inc}
  SysUtils,
  Classes,
  mormot.core.base,
  mormot.lib.static,
  mormot.lib.quickjs;


var
  {$IF DECLARED(heaptrc)}
  HeaptraceFile: String;
  {$ENDIF}

  rt: JSRuntime;
  ctx: JSContext;
begin

  {$IF DECLARED(heaptrc)}
  HeaptraceFile := ExtractFileDir(ParamStr(0)) + PathDelim + 'heaptrace.log';
  if FileExists(HeaptraceFile) then DeleteFile(HeaptraceFile);
  SetHeapTraceOutput(HeaptraceFile);
  {$ENDIF}

  rt := JS_NewRuntime;
  ctx := rt.New;
  try
    writeln(ctx.EvalGlobal('var d = new Date();'));
    writeln('Press any KEY to exit');
    readln;
  finally
    ctx.Done;
    rt.Done;
  end;
end.
