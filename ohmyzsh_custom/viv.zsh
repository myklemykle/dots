#
# M1 brew location:
#
# TODO: fix how PATH is handled ... local custom should mostly be here
#export PATH="${PATH}:/opt/homebrew/bin"
#
# aliases for managing all my websites:
. ~/Sites/aliases.zsh

# local openocd installation for RP2040 debugging with picoprobe:
export OPENOCD_HOME="$HOME/Documents/Pocket Integrator/openocd"
export OPENOCD_BIN="$OPENOCD_HOME/src/openocd"
export OPENOCD_SCRIPT="$OPENOCD_HOME/tcl"
export OPENOCD_CMD="adapter speed 5000"
export OPENOCD_IF="interface/cmsis-dap.cfg"
export OPENOCD_TARGET="rp2040.cfg"
alias openocd='printenv | grep OPENOCD_ ; $OPENOCD_BIN -c "$OPENOCD_CMD" -s $OPENOCD_SCRIPT -f $OPENOCD_IF -f target/$OPENOCD_TARGET'

# PICO SDK location ... since i get this from the pico-arduino package,
# this patch changes with every rev of that pkg.  Not ideal.
export PICO_SDK_PATH=$HOME/Library/Arduino15/packages/rp2040/hardware/rp2040/3.3.0/pico-sdk
