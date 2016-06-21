@echo off
cd "C:\Program Files\Git\bin\"
sh.exe -c "git --git-dir=C:/VWorks\ Workspace/.git/ --work-tree=C:/VWorks\ Workspace/ rev-parse --abbrev-ref HEAD && echo -n ':' && git --git-dir=C:/VWorks\ Workspace/.git/ --work-tree=C:/VWorks\ Workspace/ rev-parse HEAD" > C:\Users\Administrator\Desktop\VERSION.txt
