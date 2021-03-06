#!/usr/bin/env bash

__scriptpath=$(cd "$(dirname "$0")"; pwd -P)
__log_path="$__scriptpath/artifacts/log"

# Use Arcade script to initialize dotnet cli only
source ./eng/common/tools.sh
InitializeDotNetCli true

export __DOTNET_CMD="$_InitializeDotNetCli/dotnet"
__SDK_PATH="$DOTNET_INSTALL_DIR/sdk/$_ReadGlobalVersion"

export RepoRoot="$__scriptpath/"

$__DOTNET_CMD $__SDK_PATH/MSBuild.dll $__scriptpath/src/convert_to_src.proj /bl:"$__log_path/convert_to_src.binlog" $@
