#!/bin/bash

# Comment in for Debug Info
# set -x 

# A running number of the project
bug_id=X
# The repository from which to curl, must match the url from Github
repository=uuu/vvv
# The commit in which the problem was found, according to the authors
commit=xxx

target_directory=../../../data
# Whether or not to remove the History
# If true, after moving to the specified commit the .git will be deleted to make the dataset smallet
remove_history=true

###                              ###
# From Here on, it's autopilot     #
###                              ###

echo "creating ${target_directory}/${bug_id}"
mkdir "${target_directory}/"
mkdir "${target_directory}/${bug_id}"
mkdir "${target_directory}/${bug_id}/buggy"
cd "${target_directory}/${bug_id}/buggy"

echo "cloning git@github.com:${repository}.git"
git clone "git@github.com:${repository}.git" .

echo "git reset --hard ${commit}" | sh
# Kick out Git History for smaller Dataset
if [ "$remove_history" = true ]; 
then rm -rf .git;
else echo "Keeping Git History for ${repository}"; 
fi

exit 0