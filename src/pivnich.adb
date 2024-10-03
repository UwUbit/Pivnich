with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Pivnich is

   function Encrypt_Decrypt (Plaintext : String; Key : Character) return String is
      Cipher : String (Plaintext'Range);
   begin
      for I in Plaintext'Range loop
         Cipher(I) := Character'Val(Character'Pos(Plaintext(I)) xor Character'Pos(Key));
      end loop;
      return Cipher;
   end Encrypt_Decrypt;

   Key : Character := 'K';

   function Get_User_Input return Unbounded_String is
      Input : Unbounded_String;
   begin
      Put("Enter a message to encrypt: ");
      Get_Line(Input);
      return Input;
   end Get_User_Input;

begin
   declare
      Plaintext : Unbounded_String := Get_User_Input;
   begin
      Put_Line("Original message: " & To_String(Plaintext));

      declare
         Encrypted_Text : constant String := Encrypt_Decrypt(To_String(Plaintext), Key);
      begin
         Put_Line("Encrypted message: " & Encrypted_Text);

         declare
            Input_Encrypted_Text : Unbounded_String := Get_User_Input;
         begin
            declare
               Decrypted_Text : constant String := Encrypt_Decrypt(To_String(Input_Encrypted_Text), Key);
            begin
               Put_Line("Decrypted message: " & Decrypted_Text);
            end;
         end;
      end;
   end;

end Pivnich;