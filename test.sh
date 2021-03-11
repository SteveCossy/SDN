# Check whether all existing hosts can ping each other
# Syntax pinghosts.sh <nbr of hosts>
# Started by Steve Cosgrove, 11 March 2021

TARGET="1 packets transmitted, 1 received, 0% packet loss, time 0ms"
BRIDGE=br0
HOSTLAST=$1
RANGE=1..$HOSTLAST

echo
echo Ports on $BRIDGE:
sudo ovs-vsctl list-ports $BRIDGE
echo

for ((HOSTSRC=1;HOSTSRC<=$HOSTLAST;HOSTSRC++))
# for HOSTSRC in $(eval echo {$RANGE})

do
	echo host$HOSTSRC 

done

echo

