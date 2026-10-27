with Ada.Text_IO; use Ada.Text_IO;
with Test_Cases;

procedure Drakon_Ada_Test is
begin
   Put_Line ("Simple_Loop");
   Test_Cases.Simple_Loop;

   Put_Line ("Simple_Loop_Negate");
   Test_Cases.Simple_Loop_Negate;

   Put_Line ("For_Loop");
   Test_Cases.For_Loop;

   Put_Line ("For_Loop_When");
   Test_Cases.For_Loop_When;

   Put_Line ("For_Loop_Nested_When");
   Test_Cases.For_Loop_Nested_When;

   Put_Line ("Named_Loop");
   Test_Cases.Named_Loop;

   Put_Line ("Select_Char");
   Test_Cases.Select_Char ('A');
   Test_Cases.Select_Char ('B');
   Test_Cases.Select_Char ('C');

   Put_Line ("Select_Combined");
   Test_Cases.Select_Combined ('Y');

   Put_Line ("Declare_Block");
   Test_Cases.Declare_Block;

   Put_Line ("Declare_Block_Nested");
   Test_Cases.Declare_Block_Nested;

   Put_Line ("Declare_Block_Named_Nested");
   Test_Cases.Declare_Block_Named_Nested;
end Drakon_Ada_Test;
