# SYN Flood Scenario attacker container
This is the container used by the syn flood scenario in krkn that creates the syn traffic against the target service. Krkn manages to deploy the number of pods specified by the user respecting, when available, the node affinity specified.
This container expects the following environment variables:


|Variable Name | Description| Default |
|-------------| -----------|---------|
|TARGET       | The target ip address or hostname||
|DURATION     | The SYN flood attack duration in seconds||
|PACKET_SIZE  | The SYN TCP packet size in bytes|120|
|WINDOW_SIZE  | The TCP window size | 64|

To more detailed information about this settings please visit the [hping3 documentation](https://github.com/NullHypothesis/hping3).