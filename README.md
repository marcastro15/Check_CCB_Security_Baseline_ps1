# Check_CCB_Security_Baseline_ps1
CCB Security Control Board Devices - Cyber Security Assessment

Introduction
------------
Conducting Cyber Security assessment from network devices, systems, mobile, and end-point devices are laborious work and require several well-trained personnel. All these devices are assigned to personnel with expertice in certain devices -- they are called "System Administrators". Before making deploying systems or applications to the network environment of the company, they must have CCB (Change Control Board) process with security configuration settings in mind.The security configurations must be approved and reviewed by security personnel. During security audit, cybersecurity assessors run scripts on specific machine to conduct spot check to ensure the process was followed. For this program, we'll write it in powershell where everyone could see the code, not executable *.exe file. That way, everyone could review the code that there are no malicious or embedded code. As a cybersecuirty assesor portion of my tasks, we audit several department throughout the country. One task we do is run some scripts either in linux or windows for spot check tomake sure Change Control Board (CCB) is enforced. For this project,w e're targetting Windows environment. 

Features
--------

Required Knowledge
------------------
- Powershell
- Windows Administration (Privileged Access)
- Installed Windows Devices

Installation
------------
1. Modify policy security settings. Run the command below:
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass


Future Work
-----------
