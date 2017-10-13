#!/bin/bash

# _______           _        _______  _______  ______   _        _______
# (  ____ \|\     /|( (    /|(  ____ \(  ____ \(  ___ \ ( \      (  ____ \
# | (    \/| )   ( ||  \  ( || (    \/| (    \/| (   ) )| (      | (    \/
# | (__    | |   | ||   \ | || |      | (__    | (__/ / | |      | (__
# |  __)   | |   | || (\ \) || |      |  __)   |  __ (  | |      |  __)
# | (      | |   | || | \   || |      | (      | (  \ \ | |      | (
# | )      | (___) || )  \  || (____/\| (____/\| )___) )| (____/\| (____/\
# |/       (_______)|/    )_)(_______/(_______/|/ \___/ (_______/(_______/

# Written by: @Funilrys, Nissar Chababy <contact at funilrys dot com>
# GitHub : https://github.com/funilrys/funceble

################################ Contributors ##################################
# - @xxcriticxx - https://git.io/v7Ci7
#       - Implementation of nslookup check
#           Source: https://git.io/v7CiA
################################################################################

###############################  Text Format ###################################
# Red Color
red=$(tput setaf 1)

# White Color
white=$(tput setaf 7)

# Cyan Color
cyan=$(tput setaf 6)

# Magenta Color
magenta=$(tput setaf 5)

# Bold
bold=$(tput bold)

# Disable formating
normal=$(tput sgr0)
################################################################################
################################## Outputs #####################################
# We get the current dir we're working on
currentDir=${PWD}'/'

# Output of log
logOutput='output/logs/install.log'

# New output directory
outputDir="outputDir='${currentDir}output/'"

# Funilrys
funilrys="funilrys"
################################################################################
############################## Default Values ##################################
# The filename of the script
script='funceble'

# The filename of the tool
tool='tool'

# Script online version file
onlineScript="https://raw.githubusercontent.com/${funilrys}/${script}/master/${script}"

# Tool online version file
onlineTool="https://raw.githubusercontent.com/${funilrys}/${script}/master/${tool}"

# Directory structure file name
directoriesStructureName=dir-structure

# Dump of the needed directories
directoriesStructure=${currentDir}${directoriesStructureName}

# dir-structure online version
directoriesStructureLink="https://raw.githubusercontent.com/${funilrys}/${script}/master/${directoriesStructureName}"

# Quiet mode
quiet=false

# Default type
executionType='installation'

# Default seconds before timeout
secondsBeforeTimeout=1

# Default travis final commit message
travisResultsCommitMessage='Funceble Test - Results'

# Default travis autosave commit message
travisAutoSaveCommitMessage='Funceble Test - Autosave'

# Minimum of minutes before we start commiting to upstream under travis
travisAutoSaveMinutes=15

# Enable the usage of the stable version of Funceble
stableVersion=false

# Enable the usage of the developement version of Funceble
devVersion=true

# Version number
versionNumber='dev-1.4.0+46'
################################################################################
# We log the date
date > ${logOutput}

################################# Delete/Uninstall #############################
# This part is the brain of the uninstallation logic
#
# @CalledBy Arguments Handle section
################################################################################
uninstall()
{
    # We ask for confirmation
    read -e -p "Do you really want to uninstall everything ? [Y/N] " uninstallConfirmation
    
    # We log and show message
    printf "Deletion of funceble" &&  printf "Deletion of funceble" >> ${logOutput}
    
    # We filter the confirmation
    case "${uninstallConfirmation}" in
        y|Y)
            # We delete everything
            cd "$(dirname $(echo ${currentDir}))"
            rm -fR ${currentDir} && printf "  ${cyan}✔${normal}\n\n"
            
            # We thank the user for using funceble
            printf "${bold}${green}Thank you for having used Funceble!!${normal}\n\n"
            printf "${bold}${green}You're not satisfied of Funceble?\nPlease let me know there: https://git.io/v7kAE ${normal}\n\n"
            exit 0
        ;;
        n|N|*)
            # We log and show on screen that we didn't delete anything
            printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
            printf "\n\n${bold}${green}Thank you for keeping funceble!!${normal}\n\n"
            exit 0
        ;;
    esac
}

################################## Usage #######################################
# Help function
#
# @CalledBy main, Arguments Handle Section
################################################################################
usage()
{
    echo "Usage: ${0} [ -OPTION1 | --OPTION1 ] [ -OPTION2 | --OPTION2 ] [...]"
    echo ""
    echo "       {[ -i|--installation ]} || {[ -p|--production ]} || {[ -u|--update ]}"
    echo "                                      {[ --del ]}"
    echo ""
    echo "  --autosave-minutes                         Replace the  minimum of minutes before we start commiting to upstream under travis. Current value: ${magenta}${travisAutoSaveMinutes}${normal} (${red}${bold}Must be before ${cyan}-u${normal} ${red}${bold}or ${cyan}-i${normal})"
    echo "  --clean                    -c              Clean all files under output (${red}${bold}Must be before ${cyan}-u${normal} ${red}${bold}or ${cyan}-i${normal})"
    echo "  --commit-autosave-message                  Replace the default autosave commit message. Current value: ${magenta}${travisAutoSaveCommitMessage}${normal} (${red}${bold}Must be before ${cyan}-u${normal} ${red}${bold}or ${cyan}-i${normal})"
    echo "  --commit-results-message                   Replace the default results (final) commit message. Current value: ${magenta}${travisResultsCommitMessage}${normal} (${red}${bold}Must be before ${cyan}-u${normal} ${red}${bold}or ${cyan}-i${normal})"
    echo "  --del                                      Uninstall funceble and all its components"
    echo "  --dev                                      Activate the download of the developement version of Funceble. Current value: ${magenta}${devVersion}${normal} (${red}${bold}Must be before ${cyan}-u${normal})"
    echo "  --directory-structure                      Generate the directory and files that are needed and which does not exist in the current directory (${red}${bold}Must be before ${cyan}-u${normal} ${red}${bold}or ${cyan}-i${normal})"
    echo "  --help                                     Print this screen"
    echo "  --installation             -i              Execute the installation script"
    echo "  --iana                                     Update 'iana-domains-db'"
    echo "  --production               -p              Prepare the repository for production"
    echo "  --stable                                   Activate the download of the stable version of Funceble. Current value: ${magenta}${stableVersion}${normal} (${red}${bold}Must be before ${cyan}-u${normal})"
    echo "  --timeout                  -t              Set the default timeout in seconds (${red}${bold}Must be before ${cyan}-u${normal} ${red}${bold}or ${cyan}-i${normal})"
    echo "  --update                   -u              Update the script"
    echo "  --version                  -v              Show the current version of Funceble"
    echo ""
}

################################## Script Exist ################################
# We check if the script exist
#
# @CalledBy installation
################################################################################
scriptExist()
{
    local fileToInstall="${1}"
    
    # We log && print message
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf 'Script exist' && printf 'Script exist' >> ${logOutput}
    fi
    if [[ -f "${fileToInstall}" ]]
    then
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${cyan}✔${normal}\n" && printf "  ✔\n" >> ${logOutput}
        fi
    else
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
            echo "The file ${fileToInstall} is not found"
        fi
        exit 1
    fi
}

############################### Script Readable ################################
# We check if the script is readable
#
# @CalledBy installation
################################################################################
scriptReadable()
{
    local fileToInstall="${1}"
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "Script readable" && printf "Script readable" >> ${logOutput}
    fi
    
    if [[ -r "${fileToInstall}" ]]
    then
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${cyan}✔${normal}\n" && printf "  ✔\n" >> ${logOutput}
        fi
    else
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
            echo "Impossible to read ${fileToInstall}" >> ${logOutput}
        fi
        exit 1
    fi
}

############################# Script Executable ################################
# We check if the script is executable
#
# @CalledBy installation
################################################################################
scriptExecutable()
{
    local fileToInstall="${1}"
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "Script executable" && printf "Script executable" >> ${logOutput}
    fi
    
    if [[ -x "${fileToInstall}" ]]
    then
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${cyan}✔${normal}\n" && printf "  ✔\n" >> ${logOutput}
        fi
    else
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
            echo "Please make sure that ${fileToInstall} is executable. You can execute 'chmod +x ${fileToInstall}' to make it executable" >> ${logOutput}
        fi
        exit 1
    fi
}

############################### Command Exist ##################################
# Check if a command exist
#
# @CalledBy awkInstalled, whoisInstalled, sedInstalled, sha512sumInstalled,
#           curlInstalled
################################################################################
commandexist()
{
    local commandToCheck="${1}"
    
    if hash ${commandToCheck} 2>/dev/null
    then
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${cyan}✔${normal}\n" && printf "  ✔\n" >> ${logOutput}
        fi
        
    else
        if [[ ${quiet} == false ]]
        then
            # We log && print message
            printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
            echo "Please make sure that ${red}${commandToCheck}${normal} is installed in your system."
        fi
        exit 1
    fi
}

############################# awk Installed ####################################
# We check if awk is installed
#
# @CalledBy installation
################################################################################
awkInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "\n${bold}awk${normal} installed" && printf "awk installed" >> ${logOutput}
    fi
    
    commandexist 'awk'
}

############################## curl Installed ##################################
# We check if curl is installed
#
# @CalledBy installation
################################################################################
curlInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}curl${normal} installed" && printf "curl installed" >> ${logOutput}
    fi
    
    commandexist 'curl'
}

############################## date Installed ##################################
# We check if date is installed
#
# @CalledBy installation
################################################################################
dateInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}date${normal} installed" && printf "date installed" >> ${logOutput}
    fi
    
    commandexist 'date'
}


############################## echo Installed ###################################
# We check if echo is installed
#
# @CalledBy installation
################################################################################
echoInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}echo${normal} installed" && printf "echo installed" >> ${logOutput}
    fi
    
    commandexist 'echo'
}

############################## expect Installed ################################
# We check if expect is installed
#
# @CalledBy installation
################################################################################
expectInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}expect${normal} installed" && printf "expect installed" >> ${logOutput}
    fi
    
    commandexist 'expect'
}

############################### head Installed #################################
# We check if head is installed
#
# @CalledBy installation
################################################################################
headInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}head${normal} installed" && printf "head installed" >> ${logOutput}
    fi
    
    commandexist 'head'
}

############################### nslookup Installed ################################
# We check if nslookup is installed
#
# @CalledBy installation
################################################################################
nslookupInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}nslookup${normal} installed" && printf "nslookup installed" >> ${logOutput}
    fi
    
    commandexist 'nslookup'
    
}

################################# sed Installed ################################
# We check if sed is installed
#
# @CalledBy installation
################################################################################
sedInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}sed${normal} installed" && printf "sed installed" >> ${logOutput}
    fi
    
    commandexist 'sed'
}

############################## sha512sum Installed #############################
# We check if sha512sum is installed
#
# @CalledBy installation
################################################################################
sha512sumInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}sha512sum${normal} installed" && printf "sha512sum installed" >> ${logOutput}
    fi
    
    commandexist 'sha512sum'
}

################################ tail Installed #################################
# We check if tail is installed
#
# @CalledBy installation
################################################################################
tailInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}tail${normal} installed" && printf "tail installed" >> ${logOutput}
    fi
    
    commandexist 'tail'
}

############################### touch Installed #################################
# We check if touch is installed
#
# @CalledBy installation
################################################################################
touchInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}touch${normal} installed" && printf "touch installed" >> ${logOutput}
    fi
    
    commandexist 'touch'
}

################################# tr Installed #################################
# We check if tr is installed
#
# @CalledBy installation
################################################################################
trInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}tr${normal} installed" && printf "tr installed" >> ${logOutput}
    fi
    
    commandexist 'tr'
}

############################### whois Installed ################################
# We check if whois is installed
#
# @CalledBy installation
################################################################################
whoisInstalled()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "${bold}whois${normal} installed" && printf "whois installed" >> ${logOutput}
    fi
    
    commandexist 'whois'
    
}

################################## Text Format #################################
# Only for production.
# This part is used to fix changes to text format section
#
# @CalledBy scriptsWorkDir
################################################################################
textFormat()
{
    if [[ "${executionType}" == 'production' ]]
    then
        # We list the variable we have to change
        variableToCatch=('red=.*' 'white=.*' 'cyan=.*' 'magenta=.*' 'bold=.*' 'normal=.*')
        # We list the replacement we have to do
        changeWith=('red=$(tput setaf 1)' 'white=$(tput setaf 7)' 'cyan=$(tput setaf 6)' 'magenta=$(tput setaf 5)' 'bold=$(tput bold)' 'normal=$(tput sgr0)')
        
        for i in ${!variableToCatch[*]}
        do
            # We get the color
            regexColor="${variableToCatch[${i}]}"
            
            # We get the replacement
            replaceBy="${changeWith[${i}]}"
            
            # We apply changes
            sed -i "s|${regexColor}|${replaceBy}|g" ${fileToInstall}
        done
    fi
}

##################################### Status ###################################
# Only for production.
# This part is used to fix changes to status section
#
# @CalledBy scriptsWorkDir
################################################################################
status()
{
    if [[ "${executionType}" == 'production' ]]
    then
        # We list the variable we have to change
        variableToCatch=('validStatus=.*' 'invalidStatus=.*' 'errorStatus=.*' 'secondsBeforeTimeout=[0-9].*')
        # We list the replacement we have to do
        changeWith=('validStatus="ACTIVE"' 'invalidStatus="INVALID"' 'errorStatus="INACTIVE"' "secondsBeforeTimeout=${secondsBeforeTimeout}")
        
        for i in ${!variableToCatch[*]}
        do
            # We get the color
            regexStatus="${variableToCatch[${i}]}"
            
            # We get the replacement
            replaceBy="${changeWith[${i}]}"
            
            # We apply changes
            sed -i "s|${regexStatus}|${replaceBy}|g" ${fileToInstall}
        done
    fi
}

################################## Clean Output ###################################
# Clean all generated files
#
# @CalledBy Arguments Handle section
################################################################################
cleanOutput(){
    # We set the directory we need to clean
    local output=${currentDir}output/
    
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "Cleaning generated files"
    fi
    
    # Search and delete everything except .gitignore and .keep
    find ${output} ! -name '.gitignore' ! -name '.keep' -type f -exec rm {} \;
    
    # Only for dev: We delete temporary files
    find ${currentDir} -name '*~' -type f -exec rm {} \;
    
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "  ${cyan}✔${normal}\n"
    fi
}

########################## Get list of directory to create #####################
# This generate the file which is gonna be distribute in order to auto-create
# directory
#
# @CalledBy scriptsWorkDir
################################################################################
getListOfDirectoryToCreate(){
    local outputDirectory=output/
    
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "Generation of dir-structure" && printf "Generation of dir-structure" >> ${logOutput}
    fi
    
    # We start with the list of directories
    printf "Directories\n\n" > ${directoriesStructure}
    
    # We find all directory and append them into ${directoriesStructure}
    find ${outputDirectory} -type d >> ${directoriesStructure}
    
    # We start with the list of files
    printf "\nFiles\n\n" >> ${directoriesStructure}
    
    # We loop throug the list of file
    while IFS='' read -r -d '' filename
    do
        # We set the file to exclude
        regex='.*install.log'
        
        sha512OfFile=($(sha512sum ${filename}))
        
        if [[ ! ${filename} =~ ${regex} ]]
        then
            # We save the file path + it's content in oneline format.
            echo "${filename} @@ $(cat ${filename} | tr '\n' '$') @@ ${sha512OfFile[0]}" >> ${directoriesStructure}
        else
            # We continue to the next item
            continue
        fi
    done < <(find ${outputDirectory} -type f -print0)
    
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "  ${cyan}✔${normal}\n\n" && printf "  ✔\n\n" >> ${logOutput}
    fi
}

########################## Create directories and files ########################
# This create the directories and files based on getListOfDirectoryToCreate()
# outputs
#
# @CalledBy Arguments Handle section
################################################################################
createDirectoriesAndFile(){
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "Creation of non existant files and directories" && printf "Creation of non existant files and directories" >> ${logOutput}
    fi
    
    if [[ ! -f ${directoriesStructure} ]]
    then
        
        # We check internet connection
        # If no internet connections are possible, we stop this script and
        # return a message error
        wget -q --tries=10 --timeout=20 --spider http://google.com
        
        if [[ $? != 0 ]]; then
            # We log && print message
            printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
            echo "Impossible to get ${directoriesStructure}. Please report issue." >> ${logOutput}
            exit 1
        else
            if [[ ${stableVersion} == true ]]
            then
                # We save the online script into the existing one
                curl -s ${directoriesStructureLink} -o "${directoriesStructure}"
            elif [[ ${devVersion} == true ]]
            then
                # We save the online script into the existing one
                curl -s ${directoriesStructureLink/master/dev} -o "${directoriesStructure}"
            fi
            # We log && print message
            printf "  ${cyan}✔${normal}\n\n" && printf "  ✔\n" >> ${logOutput}
        fi
    fi
    # We loop through ${directoriesStructure}
    while read toCreate
    do
        case ${toCreate} in
            'Directories'|'Files'|'')
                # We exclude the following
                continue
            ;;
            *@@*)
                # We set the regex to match in order to get all needed informations
                regex='(.*[a-z]\/{1,5}.*)\s(@@\s(.*))\s(@@\s(.*))'
                
                if [[ ${toCreate} =~ ${regex} ]]
                then
                    if [[ ! -f ${currentDir}${BASH_REMATCH[1]} ]]
                    then
                        local replaceWith='keep'
                        
                        if [[ -d ${currentDir}.git ]]
                        then
                            if [[ $(git remote show origin | grep funceble) == '' ]]
                            then
                                # If the file doesn't exist we create it and put it's
                                # content in multiline format
                                printf ${BASH_REMATCH[3]//$/\\n} > ${currentDir}${BASH_REMATCH[1]/gitignore/${replaceWith}}
                                
                            else
                                # If the file doesn't exist we create it and put it's
                                # content in multiline format
                                printf ${BASH_REMATCH[3]//$/\\n} > ${currentDir}${BASH_REMATCH[1]}
                            fi
                        else
                            # If the file doesn't exist we create it and put it's
                            # content in multiline format
                            printf ${BASH_REMATCH[3]//$/\\n} > ${currentDir}${BASH_REMATCH[1]/gitignore/${replaceWith}}
                        fi
                    else
                        # We get the sha512sum of the current file
                        local sha512OfCurrentFile=($(sha512sum ${currentDir}${BASH_REMATCH[1]}))
                        
                        if [[ ${sha512OfCurrentFile[1]} != ${BASH_REMATCH[5]} ]]
                        then
                            # If sha512sum are not the same we replace the content of the file
                            rm -f ${currentDir}${BASH_REMATCH[1]}
                            printf ${BASH_REMATCH[3]//$/\\n} > ${currentDir}${BASH_REMATCH[1]}
                        fi
                        
                        continue
                    fi
                fi
            ;;
            *)
                if [[ ! -d ${toCreate} ]]
                then
                    # If the diretory doesn't exist, we create it
                    mkdir ${currentDir}${toCreate}
                fi
            ;;
        esac
    done < ${directoriesStructure}
    
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "  ${cyan}✔${normal}\n\n" && printf "  ✔\n\n" >> ${logOutput}
    fi
}

################################# Update IANA ##################################
# Update iana-domains-db
#
# @CalledBy installation
################################################################################
updateIANA()
{
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "Update of iana-domains-db" && printf "Update of iana-domains-db" >> ${logOutput}
    fi
    # We set the url where we get the needed informations
    local ianaURL="https://www.iana.org/domains/root/db"
    
    # Temporary file
    local curlIANA=/var/tmp/${funilrys}-iana
    
    # We delete old temporary files
    rm funilrys* &> /dev/null
    
    # We get a copy of the page
    curl -s ${ianaURL} -o ${curlIANA}
    
    while read -r line
    do
        # We get the valid domains extensions
        regex="(\/domains\/root\/db\/)(.*)(\.html)"
        
        if [[ "${line}" =~ ${regex} ]]
        then
            # We put it into a temporary file
            echo "${BASH_REMATCH[2]}" >> ${funilrys}_iana
        fi
    done < "${curlIANA}"
    
    # We move the generated file
    mv ${funilrys}_iana iana-domains-db
    
    
    if [[ ${quiet} == false ]]
    then
        # We log && print message
        printf "  ${cyan}✔${normal}\n" && printf "  ✔\n" >> ${logOutput}
    fi
    
}

############################## Script Work Dir #################################
# We install the working directory into the script
#
# @CalledBy installation
################################################################################

scriptsWorkDir()
{
    local fileToInstall="${1}"
    if [[ ${quiet} == false ]]
    then
        if [[ "${executionType}" == 'installation' ]]
        then
            # We log && print message
            printf "\nInstallation of working directory" &&  printf "Installation of working directory" >> ${logOutput}
        elif [[ "${executionType}" == 'production' ]]
        then
            # We log && print message
            printf "\nDefault timeout: ${secondsBeforeTimeout} seconds" &&  printf "Default timeout: ${secondsBeforeTimeout} seconds" >> ${logOutput}
            printf "\nInstallation of default variables for production" &&  printf "Installation of default working directory for production" >> ${logOutput}
        fi
    fi
    
    regex="outputDir='.*\/output\/'"
    if [[ $(cat ${fileToInstall}) =~ ${regex} ]]
    then
        # We replace with the current working
        # directory an we print message
        if [[ "${executionType}" == 'production' ]]
        then
            outputDir="outputDir='%%currentDir%%/output/'"
        fi
        
        # We replace the commit message
        regexFinalCommitMessage="travisResultsCommitMessage=.*"
        replaceWithFinalCommitMessage="travisResultsCommitMessage='${travisResultsCommitMessage}'"
        regexAutoSaveCommitMessage="travisAutoSaveCommitMessage=.*"
        replaceWithAutoSaveCommitMessage="travisAutoSaveCommitMessage='${travisAutoSaveCommitMessage}'"
        
        # We replace the travisAutoSaveMinutes
        # Minimum of minutes before we start commiting to upstream under travis
        regexAutoSaveMinutes="travisAutoSaveMinutes=.*"
        replaceWithAutoSaveMinutes="travisAutoSaveMinutes=${travisAutoSaveMinutes}"
        
        sed -i "s|${regex}|${outputDir}|g" ${fileToInstall}
        sed -i "s|${regexAutoSaveCommitMessage}|${replaceWithAutoSaveCommitMessage}|g" ${fileToInstall}
        sed -i "s|${regexFinalCommitMessage}|${replaceWithFinalCommitMessage}|g" ${fileToInstall}
        sed -i "s|${regexAutoSaveMinutes}|${replaceWithAutoSaveMinutes}|g" ${fileToInstall}
        
        if [[ ${quiet} == false ]]
        then
            printf "  ${cyan}✔${normal}\n \n" && printf "  ✔\n" >> ${logOutput}
        fi
        
        # We run some important scripts
        textFormat
        status
        
        if [[ ${quiet} == false ]]
        then
            if [[ "${executionType}" == 'installation' ]]
            then
                
                if [[ $(git remote show origin | grep funceble) == '' || ! -d ${currentDir}.git  ]]
                then
                    # We delete all .gitignore
                    find "${currentDir}output" -name '.gitignore' -type f -exec rm {} \;
                fi
                
                local regexSkip='\[funceble\sskip\]|\[ci\sskip\]'
                if [[ $(git log 2> /dev/null | head -12 | tail -2 | head -1) =~ ${regexSkip} ]]
                then
                    cleanOutput
                fi
                
                updateIANA
                createDirectoriesAndFile
                
                echo "${bold}${cyan}The installation was successfully completed!${normal}"
                echo "You can now use the script with '${bold}./${script} [-OPTIONS]${normal}' or learn how to use it with '${green}${bold}./${script} --help${normal}'"
                printf '\n'
            elif [[ "${executionType}" == 'production' ]]
            then
                cleanOutput
                updateIANA
                getListOfDirectoryToCreate
                
                echo "${bold}${cyan}The production logic was successfully completed!${normal}"
                echo "You can now distribute this repository."
                printf '\n'
            fi
        fi
        
    else
        if [[ ${quiet} == false ]]
        then
            if [[ "${executionType}" == 'installation' ]]
            then
                # We log && print message
                printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
                echo "Impossible to finalize installation."
            elif [[ "${executionType}" == 'production' ]]
            then
                printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
                echo "Impossible to finalize the poduction preparation."
            fi
        fi
        exit 1
    fi
}

############################### Installation ###################################
# This part is the brain of the installation system
#
# @CalledBy Arguments Handle section, update
################################################################################
installation()
{
    local fileToInstall="${1}"
    
    # We check the script
    scriptExist "${fileToInstall}"
    scriptReadable "${fileToInstall}"
    scriptExecutable "${fileToInstall}"
    
    # We check dependencies
    awkInstalled
    curlInstalled
    dateInstalled
    echoInstalled
    expectInstalled
    headInstalled
    nslookupInstalled
    sedInstalled
    sha512sumInstalled
    tailInstalled
    touchInstalled
    trInstalled
    whoisInstalled
    
    # We finalize installation
    scriptsWorkDir "${fileToInstall}"
}

################################ checkVersion ##################################
# This part is where we check the version
#
# @CalledBy update
################################################################################
checkVersion()
{
    # We get the type
    type="${1}"
    
    if [[ "${type}" == 'get' ]]
    then
        # We download the script
        downloadScript
        
        # We secretly execute a silent installation in the downloaded
        # script
        quiet=true
        installation "${funilrys}"
        quiet=false
    fi
    
    local downloadedFiles="${funilrys} ${funilrys}.tool"
    
    for downloadedFile in $(echo ${downloadedFiles})
    do
        if [[ ${downloadedFile} == ${funilrys} ]]
        then
            if [[ -f ${currentDir}${script} ]]
            then
                currentVersion=$(sha512sum ${currentDir}${script}|cut -d ' ' -f1)
            else
                currentVersion='1'
            fi
        elif [[ ${downloadedFile} =~ ${tool}  ]]
        then
            if [[ -f ${currentDir}${tool} ]]
            then
                currentVersion=$(sha512sum ${currentDir}${tool}|cut -d ' ' -f1)
            else
                currentVersion='2'
            fi
        fi
        
        if [[ -f ${currentDir}${downloadedFile} ]]
        then
            # We get the sha512sum of the downloaded script
            local copiedVersion=$(sha512sum ${currentDir}${downloadedFile}|cut -d ' ' -f1)
        else
            local copiedVersion=''
        fi
        
        # We compare the versions
        if [[ ${copiedVersion} == '' || ${currentVersion} == ${copiedVersion} ]]
        then
            # If the same == no need to update
            update=false
        else
            curlInstalled
            # If they are not the same == we need to update
            update=true
            return 1
        fi
    done
}

################################## Download Script #############################
# We download the script
#
# @CalledBy update
################################################################################
downloadScript()
{
    # We log && print message
    printf "\nDownload of the script" &&  printf "Download of the script" >> ${logOutput}
    
    # We check internet connection
    # If no internet connections are possible, we stop this script and
    # return a message error
    wget -q --tries=10 --timeout=20 --spider http://google.com
    
    if [[ $? != 0 ]]; then
        # We log && print message
        printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
        echo "Impossible to update ${currentDir}${script}. Please report issue." >> ${logOutput}
        exit 1
    else
        if [[ ${stableVersion} == true ]]
        then
            # We save the online script into a temporary file
            curl -s ${onlineScript} -o "${funilrys}"
            
            # We save the online tool script into a temporary file
            curl -s ${onlineTool/master/dev} -o "${funilrys}.tool"
            
            chmod +x ${funilrys}*
            
            # We log && print message
            printf "  ${cyan}✔${normal}\n\n" && printf "  ✔\n" >> ${logOutput}
            
            return 1
        elif [[ ${devVersion} == true ]]
        then
            # We save the online script into the existing one
            curl -s ${onlineScript/master/dev} -o "${funilrys}"
            
            # We save the online tool script into a temporary file
            curl -s ${onlineTool/master/dev} -o "${funilrys}.tool"
            
            chmod +x ${funilrys}*
            
            # We log && print message
            printf "  ${cyan}✔${normal}\n\n" && printf "  ✔\n" >> ${logOutput}
            
            return 1
        fi
    fi
}

################################## Update ######################################
# This part is the brain of update
#
# @CalledBy Arguments Handle section
################################################################################
update()
{
    if [[ -d ${currentDir}.git && $(git remote show origin | grep funceble) != '' ]]
    then
        if [[ ${stableVersion} == true ]]
        then
            git checkout master
            git pull
        elif [[ ${devVersion} == true ]]
        then
            git checkout dev
            git pull
        fi
    else
        # We get the online version and compare versions
        checkVersion 'get'
        
        if [[ ${update} == true || ! -f ${currentDir}${script} ]]
        then
            # We only need to execute if the versions are not the same
            
            mv ${funilrys} ${currentDir}${script}
            mv ${funilrys}.tool ${currentDir}${tool}
            
            
            # We install the new script
            ${currentDir}${tool} -q -i
            
            # We log && print message
            printf "Checking Version" &&  printf "Checking Version" >> ${logOutput}
            
            # We check the version of the newly downloaded script
            checkVersion
            
            if [[ ${update} == false ]]
            then
                # If we don't need to update, here's the end
                # We log && print message
                printf "  ${cyan}✔${normal}\n\n" && printf "  ✔\n" >> ${logOutput}
                echo "${bold}${cyan}The update was successfully completed!${normal}"
                printf '\n'
            else
                # We log && print message
                printf "  ${red}✘${normal}\n" && printf "  ✘\n" >> ${logOutput}
                echo "Impossible to update ${currentDir}${script}. Please report issue." >> ${logOutput}
                exit 1
            fi
        else
            # We log && print message
            printf "No need to update.\n" &&  printf "No need to update." >> ${logOutput}
            rm ${funilrys}*
        fi
    fi
}

############################### Arguments Handle ###############################
# We use this part to get arguments from command line.updateIANA
#
# @Requiredby All
################################################################################
while [ "$#" -gt 0 ]; do
    case "$1" in
        # We catch if we have to clean all generated files
        -c|--clean)
            cleanOutput
            shift 1
        ;;
        # We catch if we have to change the default final commit message
        --commit-results-message)
            travisResultsCommitMessage=${2}
            shift 2
        ;;
        # We catch if we have to change the default autosave commit message
        --commit-autosave-message)
            travisAutoSaveCommitMessage=${2}
            shift 2
        ;;
        # We catch if we have to uninstall everything
        --del)
            uninstall
            shift 1
        ;;
        # We catch if we have to get the dev version of funceble
        --dev)
            devVersion=true
            stableVersion=false
            shift 1
        ;;
        # We catch if we have to show usage()
        -h|--help)
            usage
            shift 1
        ;;
        # We catch if we have to install only the script
        -i|--install)
            installation "${currentDir}${script}"
            shift 1
        ;;
        # We catch if we need to update the `iana-domains-db` file
        --iana)
            updateIANA
            shift 1
        ;;
        
        # We catch if we need to check the output structure
        --directory-structure)
            createDirectoriesAndFile
            shift 1
        ;;
        
        # We catch if we have to prepare the repository for production
        -p|--production)
            executionType='production'
            installation "${currentDir}${script}"
            shift 1
        ;;
        
        # We catch if we need to get the stable version of funceble
        --stable)
            stableVersion=true
            devVersion=false
            shift 1
        ;;
        
        # We catch the default timeout we have to set
        -t|--timeout)
            secondsBeforeTimeout="${2}"
            shift 2
        ;;
        # We catch the  Minimum of minutes before we start commiting to upstream
        # under travis
        --autosave-minutes)
            travisAutoSaveMinutes="${2}"
            shift 2
        ;;
        # We catch if we have to update the script
        -u|--update)
            update
            shift 1
        ;;
        # We catch if we have to quiet the script
        -q|--quiet)
            quiet=true
            shift 1
        ;;
        # We catch if we have to show the version number
        -v|--version)
            echo "Current Version: ${versionNumber}"
            exit 1
        ;;
        -*)
            echo "Unknown option: $1" >&2
            exit 1
        ;;
        *)
            usage
            shift 1
        ;;
    esac
done
