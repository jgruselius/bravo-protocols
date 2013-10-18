@echo on
cd "C:\VWorks Workspace\"
git rev-parse --abbrev-ref HEAD > C:\Users\Administrator\Desktop\VERSION.txt
echo. >> C:\Users\Administrator\Desktop\VERSION.txt
git rev-parse HEAD >> C:\Users\Administrator\Desktop\VERSION.txt
