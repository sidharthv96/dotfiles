local iterFn, dirObj = hs.fs.dir(hs.fs.currentDir().."/Modules")
   if iterFn then
      for file in iterFn, dirObj do
         tbl = hs.fnutils.split(file, ".lua")
         if tbl[2] then
            print("Loading module "..tbl[1])
            require("Modules/"..tbl[1])
         end
      end
   else
      print(string.format("The following error occurred: %s", dirObj))
   end