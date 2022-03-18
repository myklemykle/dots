##
# utils for the ugly NEAR unit conversions one must figure out ...
#
# Near to Yoctonear:
n2y () {
	echo "$1 * (10 ^ 24)" | bc
}
# Yoctonear to Near:
y2n () {
	echo "scale=24; $1 / (10 ^ 24)" | bc
}
# Gas to TGas
g2t () { 
	echo "scale=24; $1 / (10^12)" | bc
}
t2g () {
	echo "$1 * (10^12)" | bc
}
