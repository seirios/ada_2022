with Ada.Text_IO; use Ada.Text_IO;
with Test_Cases;

procedure Drakon_Ada_Test is
begin
   Put_Line ("While_Loop");
   Test_Cases.While_Loop;

   Put_Line ("While_Loop_Negate");
   Test_Cases.While_Loop_Negate;

   Put_Line ("Select_Char");
   Test_Cases.Select_Char ('A');
   Test_Cases.Select_Char ('B');
   Test_Cases.Select_Char ('C');
end Drakon_Ada_Test;
