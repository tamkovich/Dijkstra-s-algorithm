Type
  TMatrSmez = array[1..10,1..10]of integer;
  
Var
  n:integer;

// ввод
Procedure Vvod(Var mas:TMatrSmez; filename:string);
Var
  f:textfile;
  i,j:integer;
Begin
  assignfile(f,filename); reset(f);
  read(f,n);
  For i:=1 to N do
    For j:=1 to N do
      read(f,mas[i,j]);
  closefile(f);
End;

// вывод
Procedure Vivod(mas:TMatrSmez);
Var
  i,j:integer;
begin
  For i:=1 to N do
  begin
    For j:=1 to N do
    begin
      write(mas[i,j]:4);
    end;
    writeln;
  end;
end;

Procedure AlgDeik(mas:TMatrSmez; start:integer);
Var
  i,j,mini,x:integer;
  visited:array[1..10]of boolean;
  used_by_pin:array[1..10,1..10]of byte;
  c,b:array[1..10]of integer;
  flag:boolean;
Begin
  For i:=1 to n do
  begin
    For j:=1 to n do
      if mas[i,j]>0 then
        used_by_pin[i,j]:=1
      else
        used_by_pin[i,j]:=0;  
    visited[i]:=False;
    b[i]:=mas[start,i];
    c[i]:=0;
  end;
  x:=start;
  visited[x]:=True;
  flag:=True;
  while flag do
  begin
    for j:=1 to n do   // делаем минимумы
      if (mas[x,j]>0)and(used_by_pin[x,j]=1)and((c[j]=0)or(b[j]=0)or(b[j]>(b[x]+mas[x,j]))) then
      begin
        c[j]:=x;
        b[j]:=b[x]+mas[x,j];
        used_by_pin[x,j]:=0;
        used_by_pin[j,x]:=0;
      end;
    for j:=1 to n do   // находим минимумы
    begin
      if not visited[j] and(b[j]>0)then
        if flag then
        begin
          mini:=j;
          flag:=False;
        end
        else
        if b[j]<b[mini] then
          mini:=j;       
    end;
    if not flag then
    begin
      if not visited[mini] then
      begin
        visited[mini]:=True;         
        x:=mini;
      end;
      flag:=True;
    end
    else
      flag:=False;
  end;
  For i:=1 to n do
    write(b[i],' ');
  writeln;
  For i:=1 to n do
    if c[i]<>0 then
    begin
      write('[',i,']');
      x:=c[i];
      while x>0 do
      begin
        write('~[',x,']');
        x:=c[x];
      end;
      writeln;
    end;
End;

Var
  MatrSmez:TMatrSmez;
  start:integer;
 
Begin
  Vvod(MatrSmez,'input.txt');
  Vivod(MatrSmez);
  writeln('От какой вершины найти кратчайшие пути?');
  read(start);
  AlgDeik(MatrSmez,start);
End.