@echo off
cd "C:\Program Files\Git\bin\"
bash.exe -c "git.exe --git-dir=C:/VWorks\ Workspace/.git/ --work-tree=C:/VWorks\ Workspace/ rev-parse --abbrev-ref HEAD && echo -n ':' && git.exe --git-dir=C:/VWorks\ Workspace/.git/ --work-tree=C:/VWorks\ Workspace/ rev-parse HEAD" > C:\Users\AAS\Desktop\VERSION.txt
