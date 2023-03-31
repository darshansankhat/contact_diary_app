import 'dart:io';

void main()
{
  int? a,b;

  print("Enter The A & B Value");

  try
  {
    a=int.parse(stdin.readLineSync()!);
    b=int.parse(stdin.readLineSync()!);

    print(a/b);
  }
  catch(e
  )
  {
    print("Entar The Valid no");
  }

}