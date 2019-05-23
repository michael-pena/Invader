#!/bin/bash

GREEN='\033[01;32m' #Green text
NC='\e[0m' #No Color

defaultport=80

echo -e "$GREEN        MMMM               MMMM                  MMM               MMM $NC"
echo -e "$GREEN        MMMM               MMMM                  MMM               MMM $NC"
echo -e "$GREEN           MMM         MMM                 MMM      MMM         MMM      MMM $NC"
echo -e "$GREEN           MMM         MMM                 MMM      MMM         MMM      MMM $NC"
echo -e "$GREEN        MMMMMMMMMMMMMMMMMMMMMMM            MMM   MMMMMMMMMMMMMMMMMMMMM   MMM $NC"
echo -e "$GREEN        MMMMMMMMMMMMMMMMMMMMMMM            MMM   MMMMMMMMMMMMMMMMMMMMM   MMM $NC"
echo -e "$GREEN      MMMMMM   MMMMMMMMM   MMMMMMM         MMMMMMMMM   MMMMMMMMM   MMMMMMMMM $NC"
echo -e "$GREEN      MMMMMM   MMMMMMMMM   MMMMMMM         MMMMMMMMM   MMMMMMMMM   MMMMMMMMM $NC"
echo -e "$GREEN   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM $NC"
echo -e "$GREEN   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM     MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM $NC"
echo -e "$GREEN   MMM   MMMMMMMMMMMMMMMMMMMMMMM   MMM        MMMMMMMMMMMMMMMMMMMMMMMMMMM $NC"
echo -e "$GREEN   MMM   MMMMMMMMMMMMMMMMMMMMMMM   MMM        MMMMMMMMMMMMMMMMMMMMMMMMMMM $NC"
echo -e "$GREEN   MMM   MMMM               MMMM   MMM           MMM               MMM $NC"
echo -e "$GREEN   MMM   MMMM               MMMM   MMM           MMM               MMM $NC"
echo -e "$GREEN            MMMMMMM   MMMMMMM                 MMM                     MMM $NC"
echo -e "$GREEN            MMMMMMM   MMMMMMM                 MMM                     MMM $NC"
echo ""

echo -e "$GREEN             ██╗███╗   ██╗██╗   ██╗ █████╗ ██████╗ ███████╗██████╗ $NC"
echo -e "$GREEN             ██║████╗  ██║██║   ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗ $NC"
echo -e "$GREEN             ██║██╔██╗ ██║██║   ██║███████║██║  ██║█████╗  ██████╔╝ $NC"
echo -e "$GREEN             ██║██║╚██╗██║╚██╗ ██╔╝██╔══██║██║  ██║██╔══╝  ██╔══██╗ $NC"
echo -e "$GREEN             ██║██║ ╚████║ ╚████╔╝ ██║  ██║██████╔╝███████╗██║  ██║ $NC"
echo -e "$GREEN             ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝ $NC"
echo ""


  echo -e "$GREEN|*-------------------------------------------------------------------------*|$NC"
	echo -e "$GREEN|        Intelligence Gathering + Vulnerability Analysis + Documenter       |$NC"
	echo -e "$GREEN|                                                                           |$NC"
	echo -e "$GREEN|  Modules: Whois, Whatweb, dnsenum, lbd, dmitry, nmap, wafw00f, dirbuster  |$NC"
	echo -e "$GREEN|                          nikto, uniscan, Wapiti                           |$NC"
	echo -e "$GREEN|                                                                           |$NC"
	echo -e "$GREEN| Author: michael-pena                       Github:github.com/michael-pena |$NC"
	echo -e "$GREEN|*-------------------------------------------------------------------------*|$NC"

echo "Enter a target url. <EX: google.com>"
read target #reads user input for targeted website

TOOL_NAME="Whois"

mkdir -p ${target}_invader_report #makes the directory to store the report in
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

### info gathering phase ###


#### whois lookup ####
echo -e "----------------------------=[Running Whois]=------------------------ \n\n"
whois $target | tee $write_Dir #calls the whois command with arguement and writes ouput to file

### dig ###

TOOL_NAME="Whatweb"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

#### whatweb: Website Fingerprinter: web discovery vulnerability analysis: runs cms scans, etc  ####
echo -e "\n\n----------------------------=[Running whatweb]=------------------------ \n\n"
whatweb -v $target | tee -a $write_Dir


### dnsmap Passive DNS network mapper Online DNS recon and search service ###
TOOL_NAME="dnsmap"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

echo -e "\n\n----------------------------=[Running dnsmap]=------------------------ \n\n"
dnsmap $target | tee -a $write_Dir

### dnsrecon - DNS Enumeration Script ###
TOOL_NAME="dnsrecon"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

### dnsmap Passive DNS network mapper Online DNS recon and search service ###
echo -e "\n\n----------------------------=[Running dnsmap]=------------------------ \n\n"
dnsrecon -d $target | tee -a $write_Dir


### dnstracer - Determines where a given DNS server gets its information from, and follows the chain of DNS servers   ex: dnstracer www.mavetju.org ###
### http://www.mavetju.org/unix/dnstracer.php ###

TOOL_NAME="dnsenum"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

#### gets dnsenum #####
echo -e "\n\n----------------------------=[Running dnsenum]=------------------------\n\n"
dnsenum $target | tee -a $write_Dir


TOOL_NAME="lbd"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

#### load balancing detector ####
echo -e "\n\n----------------------------=[Running load balance detector]=------------------------\n\n"
lbd $target | tee -a $write_Dir

TOOL_NAME="dmitry"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

#### Dmitry: (Deepmagic info gathering tool gathers: subdomains email addresses uptime info, tcp port scan )#####
echo -e "\n\n----------------------------=[Running Dmitry]=------------------------\n\n"
dmitry -nse $target | tee -a $write_Dir

TOOL_NAME="nmap"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"


#### nmap scan ####
echo -e "\n\n----------------------------=[Running Nmap Scan]=------------------------\n\n"
echo -e "\n\n Enter the args for Nmap scan type."
read scan_options #gets the options for the nmap scan
nmap $scan_options $target | tee -a $write_Dir #appends the output to file

### fimap - python tool find,audit , exploit and even google automatically for local and remote file inclusion bugs in webapps.  if its not php doesnt work###


TOOL_NAME="wafw00f"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

#### Wafw00f: checks web application firewall #####
echo -e "\n\n----------------------------=[Running wafw00f]=------------------------\n\n"
wafw00f -v $target | tee -a $write_Dir

TOOL_NAME="dirbuster"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

### runs directory buster ###
echo -e "\n\n----------------------------=[Running dirb]=------------------------\n\n"
dirb http://$target | tee -a $write_Dir #The tool will search for cgi-bin directories and hidden web objects using a dictionary file.

### vuln scanners ###

TOOL_NAME="nikto"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

### runs nikto scan web vulnerability scanner####
echo -e "\n\n----------------------------=[Running Nikto Scan]=------------------------\n\n"
nikto -h $target | tee -a $write_Dir


### runs uniscan: checks for rfi and lfu and rce takes a long time###
echo -e "\n\n----------------------------=[Running Uniscan]=------------------------\n\n"
uniscan -u http://$url -qweds | tee -a $write_Dir

echo -e "\n\n----------------------------=[Running Vega]=------------------------\n\n"

TOOL_NAME="wapiti"
write_Dir="${target}_invader_report/${TOOL_NAME}-report.txt"

echo -e "\n\n----------------------------=[Running Wapiti]=------------------------\n\n"
wapiti http://example.org -u -n 5 -b domain -v 2 -f html -o autoscan_report/wapiti-html | tee -a autoscan_report/wapiti-report.txt



# !!! FUTURE ADDITIONS !!!
#paros
#grabber -web app scanner
#msf - wmap
#Vulnerability Scanners
#Oscanner oravle assessment framework
#Arachnid
#GosLismero
#Skipfish
#Vega
#w3af
#Wapiti
#webscarab
#webshag
#websploit
#openVAS
#Run The Harvester
##hping3 to determine IDS
#httprecon, ID Serve
#recon-ng
#searchsploit
#CRAWLERS: httprint, httrack, webcopier pro,
#VULN SCANNING HPwebinspect, Nessus
#Session hijacking: burp suite, Firesheep jhijack
#Web server logs: Webalizer, AWStats
