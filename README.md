## VWorks file repository for SciLifeLab

### Description
This repository contains files for *VWorks Automation Control* used to control the *Agilent NGS Workstation*. These protocols and supporting files are neccessary to run the automated laboratory protocols used at the Genomics platform at Science for Life Laboratory in Stockholm.

The repository provides means to backup, track versions and share these protocols through a easily accessible resource. The repo is maintained by [Joel Gruselius](mailto:joel.gruselius@scilifelab.se).

#### Versions
Previosly there was a `master` and a `production` branch, the first containing all protocols including things in development and the latter was supposed to only hold validated protocols. This has changed so that the main three branches correspond to the different configurations of the robots which makes more sense:
- *marvin* &mdash; This is an Agilent NGS Workstation Option B setup (Bravo + BenchCel + MiniHub) and also contains many in-development protocols.
- *bender* &mdash; This is a custom configuration consisting of the Option B plus the following equipment (only some protocols utilize these and must be modified if to be run on a standard Option B setup):
	- BenchBot robot arm
	- Xpeel
	- Centrifuge
	- tRobot thermal cycler
	- PlateLoc sealer
- *hal* &mdash; This system is a standalone Bravo (Option A but with things moved around a little bit).

### Installation
Clone the desired branch of the repository and place the files and folders of the resulting `bravo-protocols/` into `VWorks Workspace/`. Note that for many protocols the appropriate device files are required under `VWorks Workspace/Device Files/`. Also, the associated labware and liquid class entries are required in the Windows registry.

### License
The protocols and files in this repo have all been created at the National Genomics Infrastructure Stockholm and can be used according to the license below, with the exception of files in folders where a separate LICENSE file indicates something else.

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

The full license can also be found in the file [LICENSE](https://github.com/jgruselius/bravo-protocols/blob/bender/LICENSE) and must included when redistributing the software.

*VWorks Automation Control*, *Bravo* and other things relating to the *Agilent NGS Workstation* are trademarks owned by Agilent Technologies, Inc. (Santa Clara, CA 95052-8058, US).

### Contact
Joel Gruselius ([joel.gruselius@scilifelab.se](mailto:joel.gruselius@scilifelab.se))<br />
[NGI Stockholm](https://www.scilifelab.se/facilities/ngi-stockholm/) at SciLifeLab<br />
