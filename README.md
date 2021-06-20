# Check_CCB_Security_Baseline_ps1
CCB Security Control Board Devices - Cyber Security Assessment (CONTROL, PROTECT, MONITOR)
GOAL: Uphold Baseline Configuration Security

Introduction
------------
Conducting Cybersecurity assessment from network devices, systems, mobile, and end-point devices are laborious work and require several well-trained personnel. All these devices are assigned to personnel with expertice in certain devices -- they are called "System Administrators". Before making deploying systems or applications to the network environment of the company, they must have CCB (Change Control Board) process with security configuration settings in mind.The security configurations must be approved and reviewed by security personnel. During security audit, cybersecurity assessors run scripts on specific machine to conduct spot check to ensure the process was followed. For this program, we'll write it in powershell where everyone could see the code, not executable *.exe file. That way, everyone could review the code that there are no malicious or embedded code. As a cybersecuirty assesor portion of my tasks, we audit several department throughout the country. The department includes Defense Industrail Base (DIB). DIBs are vendors or contractors that house government data. One task we do is run some scripts either in linux or windows for spot check tomake sure Change Control Board (CCB) is enforced. For this project,w e're targetting Windows environment. Note that the powershell script features are derived from NIST SP 800-171A contents and description.The basic tenet of this NIST standard is Control, Protect, and Monitor - we'll conduct some cyber assessment verification here.

Features
--------
During the Cybersecurity Assessment Process, there are basics to perform spot check if the vendors are telling the truth, not just presenting what you need to see. The following features are essential to conduct independent cybersecurity check of the vendors. You don't want to do this manually, but create a script for the vendor to run. It is preferably scripts for everyone to see to ensure codes have no malicious intent. 
1. Check Installed Devices
2. Check MFA
3. Check the OS the last time it was updated.
4. Check the storage devices to make sure it's encrypted
5. Get hot fix - Note: Don't update vendors computer. Just check its latest update it complies with security policy in place.
6. Check logs, retention, turn on
7. Check Password security settings

Required Knowledge
------------------
- Powershell
- Windows Administration (Privileged Access)
- Installed Windows Devices

Installation
------------
1. Modify policy security settings. Run the command below:
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
2. Install the following module: Install-Module -Name MSOnline
3. Confirm the installation: Get-Module -ListAvailable MSOnline

Running the program (powershell)
--------------------------------
.\CCB_Baseline_Config_Security.ps1
or
F5 if you're using "Windows Powershell ISE"

Future Work
-----------
NIST 800-171A framework may continue to evolve to different versions, so it's necessary to continue to update the scripts. Luckly, it does not change often. This program only probes local group. It could be expanded to check for domain group and Active Directory and the 365 cloud services. Cybersecurity Assessment is vital to control, protect, and monitor government's data housed in the vendors' facility. Government data means the diagrams and documents to construct products for DoD that do not have classification.

