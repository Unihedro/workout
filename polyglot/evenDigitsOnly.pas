function evenDigitsOnly(n: integer): boolean;
var r:boolean=true;
begin
  while n>0 do begin
    if (n mod 2) = 1 then r:=false;
    n:=trunc(n/10);
    end;
    evenDigitsOnly:=r
end;
