#! /bin/bash

read -p "What network to setup NAT/Host-only adapter(1/2): " network_variable

echo "
Install a Debian in CLI mode"

if [ $network_variable == 1 ]
  then
    echo "
    + Virtualbox -> VM -> Settings -> Network -> Adapter 1 -> Advanced -> Port Forwarding -> Add(+) -> name(ssh), protocol(TCP), host ip(127.0.0.1), host port(any free e.g. 5679), guest ip(10.0.2.15), guest port(22) -> Press OK
    + To SSH from host use - ssh -p 5679 127.0.0.1"
  else
    
