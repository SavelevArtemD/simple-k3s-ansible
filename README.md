# Simple setup k3s

## Description  
Quite simple setup k3s with only one master node, without any specific configurations. Just for
learning or tests.  

Based on this [repo](https://github.com/k3s-io/k3s-ansible/tree/ef8d3a19491b9c0c863caa3f1c305f5e733e4e09)

## Versions:    
- servers: ubuntu 18.04 (just because I have .iso downloaded and didn't want to download smth else)
- ansible: 4.2.0
- k3s: v1.17.5+k3s1
- helm: v3.6.3

## Requirements 
I used two virtual machines, just to be a litle bit closer to bare metal installation. 
You can use whatever you want, but make shure that you can connect via ssh and have sudo pass.


## How to use
So clone repo, generate ssh keys for your servers and put private key files into the `certs` folder
or to your `.ssh` folder.   

Then update the `learn-jenkins/ansible/inventory/hosts.ini` with your information (Yep, you can specify
as many nodes as you want)      

If you don't want to install packages locally, you may to execute commands from docker container:   
- `docker build -t ansible-k3s .`   
- `docker run -v $(pwd):/infrastructure -ti ansible-k3s bash`   
- `cd ansible`   
- `ansible-playbook up_k3s.yml --ansible_become_password=<your_sudo_pass>`   

Finally, you have to copy kubeconfig file, it lies on master machine by the following pass `~/.kube/config`     

Then you may deploy simple flask app for tests: 
- configure you kubectl to use new kubeconfig
- go to the `helm/simple-flask-app`
- run: `helm install .`
