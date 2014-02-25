## VWorks file repository for SciLifeLab

### Description
This repository contains files for *VWorks Automation Control* used to control the *Agilent NGS Workstation*. These protocols and supporting files are neccessary to run the automated laboratory protocols used at the Genomics platform at Science for Life Laboratory in Stockholm.

The repository is a way to backup, track versions and share these protocols through a easily accessible resource. The repo is maintained by [Joel Gruselius](mailto:joel.gruselius@scilifelab.se).

#### Versions
There are two main branches of the repository:
- *master* &mdash; contains all files including protocols under development
- *production* &mdash; only maintains validated protocols.

### Installation
Clone the desired branch of the repository and place the files and folders of the resulting <code>bravo-protocols/</code> into <code>VWorks Workspace/</code>. Note that for many protocols the appropriate device files are required under <code>VWorks Workspace/Device Files/</code>. Also, the associated labware and liquid class entries are required in the Windows registry.

### License
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Also see the [LICENSE](https://github.com/jgruselius/bravo-protocols/blob/master/LICENSE) file.

### Contact
Joel Gruselius ([joel.gruselius@scilifelab.se](mailto:joel.gruselius@scilifelab.se))<br />
Science for Life Laboratory, Stockholm ([details](https://addy.co/joelg))<br />
