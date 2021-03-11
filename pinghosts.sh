# Check whether all existing hosts can ping each other
# Syntax pinghosts.sh <nbr of hosts>
# Started by Steve Cosgrove, 11 March 2021

TARGET="1 packets transmitted, 1 received, 0% packet loss, time 0ms"
BRIDGE=br0
HOSTLAST=$1

echo
echo Ports on $BRIDGE:
sudo ovs-vsctl list-ports $BRIDGE
echo

echo -n "   To host:"
for ((HOSTSRC=1;HOSTSRC<=$HOSTLAST;HOSTSRC++))
do
	echo -n "  $HOSTSRC "
done
echo

for ((HOSTSRC=1;HOSTSRC<=$HOSTLAST;HOSTSRC++))
do
	echo -n From host$HOSTSRC:

	for ((HOSTDST=1;HOSTDST<=$HOSTLAST;HOSTDST++))
	do
		RESULT="`as_ns host$HOSTSRC ping -c 1 -w 1 192.168.0.$HOSTDST | grep packets`"
#		ping: -c count  -w wait time

		if [ "$TARGET" = "$RESULT" ]
		then
#			echo -n $HOSTDST "yes "
			echo -n " yes"
		else
			echo -n " no "
		fi
	done
	echo

done

echo

