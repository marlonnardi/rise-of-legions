{******************************************************************************}
{                                                                              }
{ Winsock2 Service GUIDs API interface Unit for Object Pascal                  }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: svcguid.h, released June 2000. The original Pascal     }
{ code is: SvcGuid.pas, released December 2000. The initial developer of the   }
{ Pascal code is Marcel van Brakel (brakelm att chello dott nl).               }
{                                                                              }
{ Portions created by Marcel van Brakel are Copyright (C) 1999-2001            }
{ Marcel van Brakel. All Rights Reserved.                                      }
{                                                                              }
{ Obtained through: Joint Endeavour of Delphi Innovators (Project JEDI)        }
{                                                                              }
{ You may retrieve the latest version of this file at the Project JEDI         }
{ APILIB home page, located at http://jedi-apilib.sourceforge.net              }
{                                                                              }
{ The contents of this file are used with permission, subject to the Mozilla   }
{ Public License Version 1.1 (the "License"); you may not use this file except }
{ in compliance with the License. You may obtain a copy of the License at      }
{ http://www.mozilla.org/MPL/MPL-1.1.html                                      }
{                                                                              }
{ Software distributed under the License is distributed on an "AS IS" basis,   }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for }
{ the specific language governing rights and limitations under the License.    }
{                                                                              }
{ Alternatively, the contents of this file may be used under the terms of the  }
{ GNU Lesser General Public License (the  "LGPL License"), in which case the   }
{ provisions of the LGPL License are applicable instead of those above.        }
{ If you wish to allow use of your version of this file only under the terms   }
{ of the LGPL License and not to allow others to use your version of this file }
{ under the MPL, indicate your decision by deleting  the provisions above and  }
{ replace  them with the notice and other provisions required by the LGPL      }
{ License.  If you do not delete the provisions above, a recipient may use     }
{ your version of this file under either the MPL or the LGPL License.          }
{                                                                              }
{ For more information about the LGPL: http://www.gnu.org/copyleft/lesser.html }
{                                                                              }
{******************************************************************************}

// $Id: JwaSvcGuid.pas,v 1.6 2005/09/03 14:27:48 marquardt Exp $

unit JwaSvcGuid;

{$WEAKPACKAGEUNIT}

{$HPPEMIT ''}
{$HPPEMIT '#include "svguid.h"'}
{$HPPEMIT ''}

{$I jediapilib.inc}

interface

uses
  {$IFDEF USE_DELPHI_TYPES}
  Windows;
  {$ELSE}
  JwaWindows;
  {$ENDIF USE_DELPHI_TYPES}

//  Defines GUIDs for well-known services including:
//
//      HOSTNAME
//      RFC 1060 (Assigned Numbers) from IANA (All TCP/IP Services)
//      NetWare services

//
// HOSTNAME--special GUID which refers to the name of a host as opposed
// to any particular service on that host.
//

const
  SVCID_HOSTNAME: TGUID = '{0002a800-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_HOSTNAME}

//
// GUIDs for dealing with AF_INET address spaces alone. These are
// intended to be used when fetching hostent or servent information
// from such a provider. These are not general-purpose types and
// should be used only when the intent is getting at down-level
// information.
//

  SVCID_INET_HOSTADDRBYINETSTRING: TGUID = '{0002a801-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_INET_HOSTADDRBYINETSTRING}
  SVCID_INET_SERVICEBYNAME: TGUID = '{0002a802-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_INET_SERVICEBYNAME}
  SVCID_INET_HOSTADDRBYNAME: TGUID = '{0002a803-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_INET_HOSTADDRBYNAME}

//
// Macros for defining and testing TCP and UDP GUIDs from a well-known
// port.
//

function SVCID_TCP_RR(Port, RR: Word): TGUID;
{$EXTERNALSYM SVCID_TCP_RR}

function SVCID_TCP(Port: Word): TGUID;
{$EXTERNALSYM SVCID_TCP}

function SVCID_DNS(RecordType: Word): TGUID;
{$EXTERNALSYM SVCID_DNS}

function IS_SVCID_DNS(const Guid: TGUID): Boolean;
{$EXTERNALSYM IS_SVCID_DNS}

function IS_SVCID_TCP(const Guid: TGUID): Boolean;
{$EXTERNALSYM IS_SVCID_TCP}

function PORT_FROM_SVCID_TCP(const Guid: TGUID): Word;
{$EXTERNALSYM PORT_FROM_SVCID_TCP}

function RR_FROM_SVCID(const Guid: TGUID): Word;
{$EXTERNALSYM RR_FROM_SVCID}

procedure SET_TCP_SVCID_RR(var Guid: TGUID; _Port, _RR: Word);
{$EXTERNALSYM SET_TCP_SVCID_RR}

procedure SET_TCP_SVCID(var Guid: TGUID; Port: Word);
{$EXTERNALSYM SET_TCP_SVCID}

function SVCID_UDP_RR(Port, RR: Word): TGUID;
{$EXTERNALSYM SVCID_UDP_RR}

function SVCID_UDP(Port: Word): TGUID;
{$EXTERNALSYM SVCID_UDP}

function IS_SVCID_UDP(const Guid: TGUID): Boolean;
{$EXTERNALSYM IS_SVCID_UDP}

function PORT_FROM_SVCID_UDP(const Guid: TGUID): WORD;
{$EXTERNALSYM PORT_FROM_SVCID_UDP}

procedure SET_UDP_SVCID_RR(var Guid: TGUID; Port, RR: WORD);
{$EXTERNALSYM SET_UDP_SVCID_RR}

procedure SET_UDP_SVCID(var Guid: TGUID; Port: WORD);
{$EXTERNALSYM SET_UDP_SVCID}

//
// Macros for defining and testing Netware (SAP) services based on the
// SAP ID.
//

function SVCID_NETWARE(SapId: WORD): TGUID;
{$EXTERNALSYM SVCID_NETWARE}

function IS_SVCID_NETWARE(const Guid: TGUID): Boolean;
{$EXTERNALSYM IS_SVCID_NETWARE}

function SAPID_FROM_SVCID_NETWARE(const Guid: TGUID): WORD;
{$EXTERNALSYM SAPID_FROM_SVCID_NETWARE}

procedure SET_NETWARE_SVCID(var Guid: TGUID; SapId: WORD);
{$EXTERNALSYM SET_NETWARE_SVCID}

//
// RFC 1060 services as defined by the IANA
// GUID block = 0009xxxx-0000-0000-C0000-000000000046
//

const
  SVCID_ECHO_TCP: TGUID = '{00090007-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ECHO_TCP}
  SVCID_DISCARD_TCP: TGUID = '{00090009-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DISCARD_TCP}
  SVCID_SYSTAT_TCP: TGUID = '{0009000B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SYSTAT_TCP}
  SVCID_DAYTIME_TCP: TGUID = '{0009000D-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DAYTIME_TCP}
  SVCID_NETSTAT_TCP: TGUID = '{0009000F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NETSTAT_TCP}
  SVCID_QOTD_TCP: TGUID = '{00090011-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_QOTD_TCP}
  SVCID_CHARGEN_TCP: TGUID = '{00090013-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_CHARGEN_TCP}
  SVCID_FTP_DATA_TCP: TGUID = '{00090014-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_FTP_DATA_TCP}
  SVCID_FTP_TCP: TGUID = '{00090015-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_FTP_TCP}
  SVCID_TELNET_TCP: TGUID = '{00090017-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TELNET_TCP}
  SVCID_SMTP_TCP: TGUID = '{00090019-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SMTP_TCP}
  SVCID_TIME_TCP: TGUID = '{00090025-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TIME_TCP}
  SVCID_NAME_TCP: TGUID = '{0009002A-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NAME_TCP}
  SVCID_WHOIS_TCP: TGUID = '{0009002B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_WHOIS_TCP}
  SVCID_DOMAIN_TCP: TGUID = '{00090035-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DOMAIN_TCP}
  SVCID_NAMESERVER_TCP: TGUID = '{00090035-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NAMESERVER_TCP}
  SVCID_MTP_TCP: TGUID = '{00090039-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_MTP_TCP}
  SVCID_RJE_TCP: TGUID = '{0009004D-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RJE_TCP}
  SVCID_FINGER_TCP: TGUID = '{0009004F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_FINGER_TCP}
  SVCID_LINK_TCP: TGUID = '{00090057-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_LINK_TCP}
  SVCID_SUPDUP_TCP: TGUID = '{0009005F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SUPDUP_TCP}
  SVCID_HOSTNAMES_TCP: TGUID = '{00090065-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_HOSTNAMES_TCP}
  SVCID_ISO_TSAP_TCP: TGUID = '{00090066-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ISO_TSAP_TCP}
  SVCID_DICTIONARY_TCP: TGUID = '{00090067-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DICTIONARY_TCP}
  SVCID_X400_TCP: TGUID = '{00090067-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_X400_TCP}
  SVCID_X400_SND_TCP: TGUID = '{00090068-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_X400_SND_TCP}
  SVCID_CSNET_NS_TCP: TGUID = '{00090069-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_CSNET_NS_TCP}
  SVCID_POP_TCP: TGUID = '{0009006D-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_POP_TCP}
  SVCID_POP2_TCP: TGUID = '{0009006D-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_POP2_TCP}
  SVCID_POP3_TCP: TGUID = '{0009006E-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_POP3_TCP}
  SVCID_PORTMAP_TCP: TGUID = '{0009006F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PORTMAP_TCP}
  SVCID_SUNRPC_TCP: TGUID = '{0009006F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SUNRPC_TCP}
  SVCID_AUTH_TCP: TGUID = '{00090071-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_AUTH_TCP}
  SVCID_SFTP_TCP: TGUID = '{00090073-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SFTP_TCP}
  SVCID_PATH_TCP: TGUID = '{00090075-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PATH_TCP}
  SVCID_UUCP_PATH_TCP: TGUID = '{00090075-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_UUCP_PATH_TCP}
  SVCID_NNTP_TCP: TGUID = '{00090077-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NNTP_TCP}
  SVCID_NBSESSION_TCP: TGUID = '{0009008B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NBSESSION_TCP}
  SVCID_NEWS_TCP: TGUID = '{00090090-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NEWS_TCP}
  SVCID_TCPREPO_TCP: TGUID = '{0009009E-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TCPREPO_TCP}
  SVCID_PRINT_SRV_TCP: TGUID = '{000900AA-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PRINT_SRV_TCP}
  SVCID_VMNET_TCP: TGUID = '{000900AF-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_VMNET_TCP}
  SVCID_VMNET0_TCP: TGUID = '{00090190-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_VMNET0_TCP}
  SVCID_EXEC_TCP: TGUID = '{00090200-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_EXEC_TCP}
  SVCID_LOGIN_TCP: TGUID = '{00090201-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_LOGIN_TCP}
  SVCID_SHELL_TCP: TGUID = '{00090202-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SHELL_TCP}
  SVCID_PRINTER_TCP: TGUID = '{00090203-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PRINTER_TCP}
  SVCID_EFS_TCP: TGUID = '{00090208-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_EFS_TCP}
  SVCID_TEMPO_TCP: TGUID = '{0009020E-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TEMPO_TCP}
  SVCID_COURIER_TCP: TGUID = '{00090212-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_COURIER_TCP}
  SVCID_CONFERENCE_TCP: TGUID = '{00090213-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_CONFERENCE_TCP}
  SVCID_NETNEWS_TCP: TGUID = '{00090214-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NETNEWS_TCP}
  SVCID_UUCP_TCP: TGUID = '{0009021C-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_UUCP_TCP}
  SVCID_KLOGIN_TCP: TGUID = '{0009021F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KLOGIN_TCP}
  SVCID_KSHELL_TCP: TGUID = '{00090220-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KSHELL_TCP}
  SVCID_REMOTEFS_TCP: TGUID = '{0009022C-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_REMOTEFS_TCP}
  SVCID_GARCON_TCP: TGUID = '{00090258-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_GARCON_TCP}
  SVCID_MAITRD_TCP: TGUID = '{00090259-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_MAITRD_TCP}
  SVCID_BUSBOY_TCP: TGUID = '{0009025A-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_BUSBOY_TCP}
  SVCID_KERBEROS_TCP: TGUID = '{000902EE-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KERBEROS_TCP}
  SVCID_KERBEROS_MASTER_TCP: TGUID = '{000902EF-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KERBEROS_MASTER_TCP}
  SVCID_KRB_PROP_TCP: TGUID = '{000902F2-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KRB_PROP_TCP}
  SVCID_ERLOGIN_TCP: TGUID = '{00090378-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ERLOGIN_TCP}
  SVCID_KPOP_TCP: TGUID = '{00090455-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KPOP_TCP}
  SVCID_INGRESLOCK_TCP: TGUID = '{000905F4-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_INGRESLOCK_TCP}
  SVCID_KNETD_TCP: TGUID = '{00090805-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KNETD_TCP}
  SVCID_EKLOGIN_TCP: TGUID = '{00090839-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_EKLOGIN_TCP}
  SVCID_RMT_TCP: TGUID = '{000915B3-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RMT_TCP}
  SVCID_MTB_TCP: TGUID = '{000915B4-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_MTB_TCP}
  SVCID_MAN_TCP: TGUID = '{0009253F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_MAN_TCP}
  SVCID_W_TCP: TGUID = '{00092540-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_W_TCP}
  SVCID_MANTST_TCP: TGUID = '{00092541-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_MANTST_TCP}
  SVCID_BNEWS_TCP: TGUID = '{00092710-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_BNEWS_TCP}
  SVCID_QUEUE_TCP: TGUID = '{00092711-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_QUEUE_TCP}
  SVCID_POKER_TCP: TGUID = '{00092712-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_POKER_TCP}
  SVCID_GATEWAY_TCP: TGUID = '{00092713-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_GATEWAY_TCP}
  SVCID_REMP_TCP: TGUID = '{00092714-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_REMP_TCP}
  SVCID_QMASTER_TCP: TGUID = '{0009271C-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_QMASTER_TCP}

  SVCID_ECHO_UDP: TGUID = '{000A0007-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ECHO_UDP}
  SVCID_DISCARD_UDP: TGUID = '{000A0009-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DISCARD_UDP}
  SVCID_DAYTIME_UDP: TGUID = '{000A000D-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DAYTIME_UDP}
  SVCID_QOTD_UDP: TGUID = '{000A0011-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_QOTD_UDP}
  SVCID_CHARGEN_UDP: TGUID = '{000A0013-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_CHARGEN_UDP}
  SVCID_TIME_UDP: TGUID = '{000A0025-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TIME_UDP}
  SVCID_RLP_UDP: TGUID = '{000A0027-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RLP_UDP}
  SVCID_NAME_UDP: TGUID = '{000A002A-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NAME_UDP}
  SVCID_DOMAIN_UDP: TGUID = '{000A0035-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DOMAIN_UDP}
  SVCID_NAMESERVER_UDP: TGUID = '{000A0035-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NAMESERVER_UDP}
  SVCID_BOOTP_UDP: TGUID = '{000A0043-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_BOOTP_UDP}
  SVCID_TFTP_UDP: TGUID = '{000A0045-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TFTP_UDP}
  SVCID_PORTMAP_UDP: TGUID = '{000A006F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PORTMAP_UDP}
  SVCID_SUNRPC_UDP: TGUID = '{000A006F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SUNRPC_UDP}
  SVCID_NTP_UDP: TGUID = '{000A007B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NTP_UDP}
  SVCID_NBNAME_UDP: TGUID = '{000A0089-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NBNAME_UDP}
  SVCID_NBDATAGRAM_UDP: TGUID = '{000A008A-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NBDATAGRAM_UDP}
  SVCID_SGMP_UDP: TGUID = '{000A0099-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SGMP_UDP}
  SVCID_SNMP_UDP: TGUID = '{000A00A1-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SNMP_UDP}
  SVCID_SNMP_TRAP_UDP: TGUID = '{000A00A2-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SNMP_TRAP_UDP}
  SVCID_LOAD_UDP: TGUID = '{000A013B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_LOAD_UDP}
  SVCID_SYTEK_UDP: TGUID = '{000A01F4-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SYTEK_UDP}
  SVCID_BIFF_UDP: TGUID = '{000A0200-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_BIFF_UDP}
  SVCID_WHO_UDP: TGUID = '{000A0201-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_WHO_UDP}
  SVCID_SYSLOG_UDP: TGUID = '{000A0202-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SYSLOG_UDP}
  SVCID_TALK_UDP: TGUID = '{000A0205-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TALK_UDP}
  SVCID_NTALK_UDP: TGUID = '{000A0206-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NTALK_UDP}
  SVCID_ROUTE_UDP: TGUID = '{000A0208-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ROUTE_UDP}
  SVCID_TIMED_UDP: TGUID = '{000A020D-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TIMED_UDP}
  SVCID_RVD_CONTROL_UDP: TGUID = '{000A0213-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RVD_CONTROL_UDP}
  SVCID_NETWALL_UDP: TGUID = '{000A0215-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NETWALL_UDP}
  SVCID_NEW_RWHO_UDP: TGUID = '{000A0226-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NEW_RWHO_UDP}
  SVCID_RMONITOR_UDP: TGUID = '{000A0230-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RMONITOR_UDP}
  SVCID_MONITOR_UDP: TGUID = '{000A0231-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_MONITOR_UDP}
  SVCID_ACCTMASTER_UDP: TGUID = '{000A02BC-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCTMASTER_UDP}
  SVCID_ACCTSLAVE_UDP: TGUID = '{000A02BD-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCTSLAVE_UDP}
  SVCID_ACCT_UDP: TGUID = '{000A02BE-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCT_UDP}
  SVCID_ACCTLOGIN_UDP: TGUID = '{000A02BF-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCTLOGIN_UDP}
  SVCID_ACCTPRINTER_UDP: TGUID = '{000A02C0-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCTPRINTER_UDP}
  SVCID_ELCSD_UDP: TGUID = '{000A02C0-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ELCSD_UDP}
  SVCID_ACCTINFO_UDP: TGUID = '{000A02C1-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCTINFO_UDP}
  SVCID_ACCTSLAVE2_UDP: TGUID = '{000A02C2-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCTSLAVE2_UDP}
  SVCID_ACCTDISK_UDP: TGUID = '{000A02C3-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ACCTDISK_UDP}
  SVCID_KERBEROS_UDP: TGUID = '{000A02EE-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KERBEROS_UDP}
  SVCID_KERBEROS_MASTER_UDP: TGUID = '{000A02EF-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_KERBEROS_MASTER_UDP}
  SVCID_PASSWD_SERVER_UDP: TGUID = '{000A02F0-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PASSWD_SERVER_UDP}
  SVCID_USERREG_SERVER_UDP: TGUID = '{000A02F1-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_USERREG_SERVER_UDP}
  SVCID_PHONE_UDP: TGUID = '{000A048F-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PHONE_UDP}
  SVCID_MAZE_UDP: TGUID = '{000A0682-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_MAZE_UDP}
  SVCID_NFS_UDP: TGUID = '{000A0801-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NFS_UDP}
  SVCID_RSCS0_UDP: TGUID = '{000A2710-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS0_UDP}
  SVCID_RSCS1_UDP: TGUID = '{000A2711-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS1_UDP}
  SVCID_RSCS2_UDP: TGUID = '{000A2712-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS2_UDP}
  SVCID_RSCS3_UDP: TGUID = '{000A2713-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS3_UDP}
  SVCID_RSCS4_UDP: TGUID = '{000A2714-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS4_UDP}
  SVCID_RSCS5_UDP: TGUID = '{000A2715-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS5_UDP}
  SVCID_RSCS6_UDP: TGUID = '{000A2716-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS6_UDP}
  SVCID_RSCS7_UDP: TGUID = '{000A2717-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS7_UDP}
  SVCID_RSCS8_UDP: TGUID = '{000A2718-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS8_UDP}
  SVCID_RSCS9_UDP: TGUID = '{000A2719-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCS9_UDP}
  SVCID_RSCSA_UDP: TGUID = '{000A271A-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCSA_UDP}
  SVCID_RSCSB_UDP: TGUID = '{000A271B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_RSCSB_UDP}
  SVCID_QMASTER_UDP: TGUID = '{000A271C-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_QMASTER_UDP}

//
// NetWare services
// GUID block = 000axxxx-0000-0000-C0000-000000000046
//

  SVCID_PRINT_QUEUE: TGUID = '{000B0003-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PRINT_QUEUE}
  SVCID_FILE_SERVER: TGUID = '{000B0004-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_FILE_SERVER}
  SVCID_JOB_SERVER: TGUID = '{000B0005-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_JOB_SERVER}
  SVCID_GATEWAY: TGUID = '{000B0006-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_GATEWAY}
  SVCID_PRINT_SERVER: TGUID = '{000B0007-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_PRINT_SERVER}
  SVCID_ARCHIVE_QUEUE: TGUID = '{000B0008-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ARCHIVE_QUEUE}
  SVCID_ARCHIVE_SERVER: TGUID = '{000B0009-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ARCHIVE_SERVER}
  SVCID_JOB_QUEUE: TGUID = '{000B000A-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_JOB_QUEUE}
  SVCID_ADMINISTRATION: TGUID = '{000B000B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ADMINISTRATION}
  SVCID_NAS_SNA_GATEWAY: TGUID = '{000B0021-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NAS_SNA_GATEWAY}
  SVCID_REMOTE_BRIDGE_SERVER: TGUID = '{000B0024-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_REMOTE_BRIDGE_SERVER}
  SVCID_TIME_SYNCHRONIZATION_SERVER: TGUID = '{000B002D-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_TIME_SYNCHRONIZATION_SERVER}
  SVCID_ARCHIVE_SERVER_DYNAMIC_SAP: TGUID = '{000B002E-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ARCHIVE_SERVER_DYNAMIC_SAP}
  SVCID_ADVERTISING_PRINT_SERVER: TGUID = '{000B0047-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_ADVERTISING_PRINT_SERVER}
  SVCID_BTRIEVE_VAP: TGUID = '{000B004B-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_BTRIEVE_VAP}
  SVCID_DIRECTORY_SERVER: TGUID = '{000B0278-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_DIRECTORY_SERVER}
  SVCID_NETWARE_386: TGUID = '{000B0107-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_NETWARE_386}
  SVCID_HP_PRINT_SERVER: TGUID = '{000B030C-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_HP_PRINT_SERVER}
  SVCID_SNA_SERVER: TGUID = '{000B0444-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SNA_SERVER}
  SVCID_SAA_SERVER: TGUID = '{000B0130-0000-0000-C000-000000000046}';
  {$EXTERNALSYM SVCID_SAA_SERVER}
//
// DNS services by record type
// GUID block = 00090035-0000-xxxx-C0000-000000000046
//

  SVCID_DNS_TYPE_A: TGUID = '{00090035-0000-0001-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_A}
  SVCID_DNS_TYPE_NS: TGUID = '{00090035-0000-0002-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_NS}
  SVCID_DNS_TYPE_MD: TGUID = '{00090035-0000-0003-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_MD}
  SVCID_DNS_TYPE_MF: TGUID = '{00090035-0000-0004-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_MF}
  SVCID_DNS_TYPE_CNAME: TGUID = '{00090035-0000-0005-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_CNAME}
  SVCID_DNS_TYPE_SOA: TGUID = '{00090035-0000-0006-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_SOA}
  SVCID_DNS_TYPE_MB: TGUID = '{00090035-0000-0007-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_MB}
  SVCID_DNS_TYPE_MG: TGUID = '{00090035-0000-0008-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_MG}
  SVCID_DNS_TYPE_MR: TGUID = '{00090035-0000-0009-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_MR}
  SVCID_DNS_TYPE_NULL: TGUID = '{00090035-0000-000A-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_NULL}
  SVCID_DNS_TYPE_WKS: TGUID = '{00090035-0000-000B-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_WKS}
  SVCID_DNS_TYPE_PTR: TGUID = '{00090035-0000-000C-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_PTR}
  SVCID_DNS_TYPE_HINFO: TGUID = '{00090035-0000-000D-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_HINFO}
  SVCID_DNS_TYPE_MINFO: TGUID = '{00090035-0000-000E-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_MINFO}
  SVCID_DNS_TYPE_MX: TGUID = '{00090035-0000-000F-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_MX}
  SVCID_DNS_TYPE_TEXT: TGUID = '{00090035-0000-0010-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_TEXT}
  SVCID_DNS_TYPE_RP: TGUID = '{00090035-0000-0011-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_RP}
  SVCID_DNS_TYPE_AFSDB: TGUID = '{00090035-0000-0012-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_AFSDB}
  SVCID_DNS_TYPE_X25: TGUID = '{00090035-0000-0013-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_X25}
  SVCID_DNS_TYPE_ISDN: TGUID = '{00090035-0000-0014-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_ISDN}
  SVCID_DNS_TYPE_RT: TGUID = '{00090035-0000-0015-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_RT}
  SVCID_DNS_TYPE_NSAP: TGUID = '{00090035-0000-0016-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_NSAP}
  SVCID_DNS_TYPE_NSAPPTR: TGUID = '{00090035-0000-0017-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_NSAPPTR}
  SVCID_DNS_TYPE_SIG: TGUID = '{00090035-0000-0018-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_SIG}
  SVCID_DNS_TYPE_KEY: TGUID = '{00090035-0000-0019-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_KEY}
  SVCID_DNS_TYPE_PX: TGUID = '{00090035-0000-001A-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_PX}
  SVCID_DNS_TYPE_GPOS: TGUID = '{00090035-0000-001B-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_GPOS}
  SVCID_DNS_TYPE_AAAA: TGUID = '{00090035-0000-001C-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_AAAA}
  SVCID_DNS_TYPE_LOC: TGUID = '{00090035-0000-001D-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_LOC}
  SVCID_DNS_TYPE_NXT: TGUID = '{00090035-0000-001E-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_NXT}
  SVCID_DNS_TYPE_SRV: TGUID = '{00090035-0000-0021-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_SRV}
  SVCID_DNS_TYPE_ATMA: TGUID = '{00090035-0000-0022-C000-000000000046}';
  {$EXTERNALSYM SVCID_DNS_TYPE_ATMA}

implementation

function SVCID_TCP_RR(Port, RR: Word): TGUID;
begin
  Result.D1 := ($0009 shl 16) or Port;
  Result.D2 := $0;
  Result.D3 := RR;
  Result.D4[0] := $C0;
  Result.D4[1] := $00;
  Result.D4[2] := $00;
  Result.D4[3] := $00;
  Result.D4[4] := $00;
  Result.D4[5] := $00;
  Result.D4[6] := $00;
  Result.D4[7] := $46;
end;

function SVCID_TCP(Port: Word): TGUID;
begin
  Result := SVCID_TCP_RR(Port, 0)
end;

function SVCID_DNS(RecordType: Word): TGUID;
begin
  Result := SVCID_TCP_RR(53, RecordType);
end;

function IS_SVCID_DNS(const Guid: TGUID): Boolean;
begin
  Result := (Guid.D1 = $00090035) and (Guid.D2 = $0) and
    (Guid.D4[0] = $C0) and (Guid.D4[1] = $00) and (Guid.D4[2] = $00) and
    (Guid.D4[3] = $00) and (Guid.D4[4] = $00) and (Guid.D4[5] = $00) and
    (Guid.D4[6] = $00) and (Guid.D4[7] = $46);
end;

function IS_SVCID_TCP(const Guid: TGUID): Boolean;
begin
  Result :=
   ((Guid.D1 and DWORD($FFFF0000)) = $00090000) and (Guid.D2 = $0) and
    (Guid.D4[0] = $C0) and (Guid.D4[1] = $00) and (Guid.D4[2] = $00) and
    (Guid.D4[3] = $00) and (Guid.D4[4] = $00) and (Guid.D4[5] = $00) and
    (Guid.D4[6] = $00) and (Guid.D4[7] = $46);
end;

function PORT_FROM_SVCID_TCP(const Guid: TGUID): Word;
begin
  Result := WORD(Guid.D1 and $FFFF);
end;

function RR_FROM_SVCID(const Guid: TGUID): Word;
begin
  Result := Guid.D3;
end;

procedure SET_TCP_SVCID_RR(var Guid: TGUID; _Port, _RR: Word);
begin
  Guid.D1 := ($0009 shl 16) or _Port;
  Guid.D2 := $0;
  Guid.D3 := _RR;
  Guid.D4[0] := $C0;
  Guid.D4[1] := $00;
  Guid.D4[2] := $00;
  Guid.D4[3] := $00;
  Guid.D4[4] := $00;
  Guid.D4[5] := $00;
  Guid.D4[6] := $00;
  Guid.D4[7] := $46;
end;

procedure SET_TCP_SVCID(var Guid: TGUID; Port: Word);
begin
  SET_TCP_SVCID_RR(Guid, Port, 0);
end;

function SVCID_UDP_RR(Port, RR: Word): TGUID;
begin
  Result.D1 := ($000A shl 16) or Port;
  Result.D2 := $0;
  Result.D3 := RR;
  Result.D4[0] := $C0;
  Result.D4[1] := $00;
  Result.D4[2] := $00;
  Result.D4[3] := $00;
  Result.D4[4] := $00;
  Result.D4[5] := $00;
  Result.D4[6] := $00;
  Result.D4[7] := $46;
end;

function SVCID_UDP(Port: Word): TGUID;
begin
  Result := SVCID_UDP_RR(Port, 0);
end;

function IS_SVCID_UDP(const Guid: TGUID): Boolean;
begin
  Result := (Guid.D1 and DWORD($FFFF0000) = $000A0000) and (Guid.D2 = $0) and
    (Guid.D4[0] = $C0) and (Guid.D4[1] = $00) and (Guid.D4[2] = $00) and
    (Guid.D4[3] = $00) and (Guid.D4[4] = $00) and (Guid.D4[5] = $00) and
    (Guid.D4[6] = $00) and (Guid.D4[7] = $46);
end;

function PORT_FROM_SVCID_UDP(const Guid: TGUID): WORD;
begin
  Result := WORD(Guid.D1 and $FFFF);
end;

procedure SET_UDP_SVCID_RR(var Guid: TGUID; Port, RR: WORD);
begin
  Guid.D1 := ($000A shl 16) or Port;
  Guid.D2 := $0;
  Guid.D3 := RR;
  Guid.D4[0] := $C0;
  Guid.D4[1] := $00;
  Guid.D4[2] := $00;
  Guid.D4[3] := $00;
  Guid.D4[4] := $00;
  Guid.D4[5] := $00;
  Guid.D4[6] := $00;
  Guid.D4[7] := $46;
end;

procedure SET_UDP_SVCID(var Guid: TGUID; Port: WORD);
begin
  SET_UDP_SVCID_RR(Guid, Port, 0);
end;

function SVCID_NETWARE(SapId: WORD): TGUID;
begin
  Result.D1 := ($000B shl 16) or SapId;
  Result.D2 := $0;
  Result.D3 := $0;
  Result.D4[0] := $C0;
  Result.D4[1] := $00;
  Result.D4[2] := $00;
  Result.D4[3] := $00;
  Result.D4[4] := $00;
  Result.D4[5] := $00;
  Result.D4[6] := $00;
  Result.D4[7] := $46;
end;

function IS_SVCID_NETWARE(const Guid: TGUID): Boolean;
begin
  Result := (Guid.D1 and DWORD($FFFF0000) = $000B0000) and (Guid.D2 = $0) and
    (Guid.D4[0] = $C0) and (Guid.D4[1] = $00) and (Guid.D4[2] = $00) and
    (Guid.D4[3] = $00) and (Guid.D4[4] = $00) and (Guid.D4[5] = $00) and
    (Guid.D4[6] = $00) and (Guid.D4[7] = $46);
end;

function SAPID_FROM_SVCID_NETWARE(const Guid: TGUID): WORD;
begin
  Result := WORD(Guid.D1 and $FFFF);
end;

procedure SET_NETWARE_SVCID(var Guid: TGUID; SapId: WORD);
begin
  Guid.D1 := ($000B shl 16) or SapId;
  Guid.D2 := $0;
  Guid.D3 := $0;
  Guid.D4[0] := $C0;
  Guid.D4[1] := $00;
  Guid.D4[2] := $00;
  Guid.D4[3] := $00;
  Guid.D4[4] := $00;
  Guid.D4[5] := $00;
  Guid.D4[6] := $00;
  Guid.D4[7] := $46;
end;

end.
