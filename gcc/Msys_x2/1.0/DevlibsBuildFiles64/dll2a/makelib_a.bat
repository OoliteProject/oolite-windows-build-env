impdef %1.dll >%1.def
dlltool --dllname %1.dll --def %1.def --output-lib %1.a
