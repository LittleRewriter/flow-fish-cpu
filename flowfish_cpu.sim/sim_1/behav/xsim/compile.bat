@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : compile.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for compiling the simulation design source files
REM
<<<<<<< HEAD
REM Generated by Vivado on Tue Aug 30 20:33:25 +0800 2022
=======
REM Generated by Vivado on Tue Aug 30 20:35:07 +0800 2022
>>>>>>> 291d69893d9381f227c60606a4cccb60712baff4
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: compile.bat
REM
REM ****************************************************************************
echo "xvlog --incr --relax -prj openmips_min_spoc_tb_vlog.prj"
call xvlog  --incr --relax -prj openmips_min_spoc_tb_vlog.prj -log xvlog.log
call type xvlog.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
