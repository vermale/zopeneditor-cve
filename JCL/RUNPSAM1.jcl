//ZDEPSM1 JOB ,NOTIFY=&SYSUID,
// MSGCLASS=H,MSGLEVEL=(1,1),REGION=0M,COND=(4,LT)
//*
//****************************************************************
//* LICENSED MATERIALS - PROPERTY OF IBM
//* "RESTRICTED MATERIALS OF IBM"
//* (C) COPYRIGHT IBM CORPORATION 2019. ALL RIGHTS RESERVED
//* US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,
//* OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE
//* CONTRACT WITH IBM CORPORATION
//*****************************************************************
//*
//* THE FOLLOWING SYMBOLICS NEED TO BE UPDATED WITH THE COBOL
//* COMPILER LIBRARY AND YOUR TSO USER ID.
//*
//*****************************************************************
//    SET CMPLLIB='IBMZ.V5R2M0.SIBMZCMP'  *PLI COMPILER LIBRARY
//    SET LINKLIB='CEE.SCEELKED'          *LINK LIBRARY
//    SET HLQ='IBMUSER'                   *TSO USER ID
//    SET SPACE1='SYSALLDA,SPACE=(CYL,(1,1))' *SPACE ALLOCATION
//*
//*************************
//* CLEAN UP
//*************************
//DELETE   EXEC PGM=IEFBR14
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//DD1      DD DSN=&HLQ..SAMPLE.PLI.CUSTRPT,
//            DISP=(MOD,DELETE,DELETE),UNIT=SYSDA,SPACE=(CYL,(0))
//*
//*************************
//* COMPILE PSAM2
//*************************
//CMPPSAM2 EXEC PGM=IBMZPLI,PARM='LIST,MAP,RULES(LAXIF)'
//STEPLIB DD DISP=SHR,DSN=&CMPLLIB
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD UNIT=&SPACE1
//SYSLIB   DD DISP=SHR,DSN=&HLQ..SAMPLE.PLINC
//SYSLIN   DD DISP=OLD,DSN=&HLQ..SAMPLE.PLIOBJ(PSAM2)
//SYSIN    DD DISP=SHR,DSN=&HLQ..SAMPLE.PLI(PSAM2)
//*
//*************************
//* COMPILE PSAM1
//*************************
//CMPPSAM1 EXEC PGM=IBMZPLI,PARM='LIST,MAP,RULES(LAXIF)'
//STEPLIB DD DISP=SHR,DSN=&CMPLLIB
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD UNIT=&SPACE1
//SYSLIB   DD DISP=SHR,DSN=&HLQ..SAMPLE.PLINC
//SYSLIN   DD DISP=OLD,DSN=&HLQ..SAMPLE.PLIOBJ(PSAM1)
//SYSIN    DD DISP=SHR,DSN=&HLQ..SAMPLE.PLI(PSAM1)
//*
//*************************
//* LINK PSAM1
//*************************
//LNKPSAM1 EXEC PGM=IEWL,REGION=0M
//SYSLIB   DD DISP=SHR,DSN=&LINKLIB
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSLMOD  DD DISP=SHR,DSN=&HLQ..SAMPLE.PLILOAD
//SYSUT1   DD UNIT=&SPACE1
//INOBJ    DD DISP=SHR,DSN=&HLQ..SAMPLE.PLIOBJ
//SYSLIN   DD *
    INCLUDE INOBJ(PSAM2)
    INCLUDE INOBJ(PSAM1)
    NAME PSAM1(R)
//*
//*************************
//* RUN PSAM1
//*************************
//RUNPSAM1 EXEC PGM=PSAM1
//STEPLIB DD DISP=SHR,DSN=&HLQ..SAMPLE.PLILOAD
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//CUSTFILE DD DISP=SHR,DSN=&HLQ..SAMPLE.PLI.CUSTFILE
//TRANFILE DD DISP=SHR,DSN=&HLQ..SAMPLE.PLI.TRANFILE
//CUSTRPT  DD DSN=&HLQ..SAMPLE.PLI.CUSTRPT,
//    DISP=(NEW,CATLG),UNIT=SYSDA,SPACE=(TRK,(10,10),RLSE),
//    DSORG=PS,RECFM=FB,LRECL=133,BLKSIZE=0
//SYSIN    DD DUMMY
//*

